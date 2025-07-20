using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace Verster_40723380_Assignment2
{
    public partial class NewBooking : System.Web.UI.Page
    {
        public SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DogsDB.mdf;Integrated Security=True");
        public DataSet ds;
        public SqlDataAdapter adapter;
        public SqlCommand command;
        public DataTable dt;
        public SqlDataReader reader;



        protected void Page_Load(object sender, EventArgs e)
        {
            

            if(Page.IsPostBack==false)
            {
                //Focus on 1st input
                txtName.Focus();

                //Focus calander on today's date
                Calendar.SelectedDate = DateTime.Today;

                //Fill treatment droplist with possible treatments
                try
                {
                    conn.Open();

                    command = new SqlCommand(@"SELECT DISTINCT Treatment FROM DogsTB", conn);

                    reader = command.ExecuteReader();


                    while (reader.Read())
                    {
                        dropListTreatment.Items.Add(reader.GetValue(0).ToString());
                    }

                    conn.Close();
                }
                catch (SqlException ex)
                {
                    lblError.Text = ex.Message; //Error regarding treatment list fill
                }
            }

        }

        //Create random ID that is unique
        public void GenerateID()
        {
            
            conn.Open();
            command = new SqlCommand($"SELECT ID from DogsTB", conn);
            reader = command.ExecuteReader();

            bool unique = false;
            while (!unique)
            {
                Random rand = new Random();
                Session["ID"] = rand.Next(1000, 10000); //Random ID

                while (reader.Read())
                {
                    if (Session["ID"].ToString() == reader.GetValue(0).ToString())
                    {
                        lblError.Text = "SAME";
                        break;
                    }
                    else
                    {
                        unique = true;
                    }
                }

            }
            conn.Close();
        }

        protected void rbMale_CheckedChanged(object sender, EventArgs e)
        {
            Session["Gender"] = "Male"; //Save gender to session
        }

        protected void rbFemale_CheckedChanged(object sender, EventArgs e)
        {
            Session["Gender"] = "Female";//Save gender to session
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
 
            if(Session["Gender"] != null)
            {
                if (dropListTreatment.SelectedIndex !=-1)
                {
                    if(txtTel.Text!="")
                    {
                        //Save seleted date to variable
                        DateTime Booking_Date = Calendar.SelectedDate;
                        //Check if date is not in past
                        if (DateTime.Today <= Booking_Date)
                        {
                            //Generate unique random ID
                            GenerateID();
                            try
                            {
                                conn.Open();
                                command = new SqlCommand($"INSERT INTO DogsTB VALUES('{Convert.ToInt32(Session["ID"])}','{txtName.Text}','{txtBreed.Text}','{Session["Gender"]}', '{dropListTreatment.SelectedValue}','{Booking_Date}','{txtTel.Text}')", conn);
                                adapter = new SqlDataAdapter();
                                adapter.InsertCommand = command;
                                adapter.InsertCommand.ExecuteNonQuery();

                                conn.Close();
                                lblError.Text = "Success";



                                //Save query to Cookie
                                HttpCookie _queryCookie = Request.Cookies["Query"];
                                _queryCookie["QueryType"] = "ADDED: ";
                                _queryCookie["QueryID"] = Session["ID"].ToString();
                                _queryCookie["QueryName"] = txtName.Text;
                                _queryCookie["QueryTreatment"] = dropListTreatment.SelectedValue;
                                _queryCookie["QueryDate"] = Booking_Date.ToShortDateString();

                                Response.Cookies.Add(_queryCookie);

                                //Reset Page to empty state
                                txtName.Text = "";
                                txtBreed.Text = "";
                                txtTel.Text = "";
                                dropListTreatment.SelectedIndex= -1;
                                rbFemale.Checked = false;
                                rbMale.Checked = false;
                                Calendar.SelectedDate = DateTime.Today;

                            }
                            catch (SqlException ex)
                            {
                                lblError.Text = ex.Message; //Error message
                            }
                        }
                        else
                        {
                            //Error message if date is in past
                            lblError.Text = "Can not select data in the past";
                        }
                       
                    }
                    else
                    {
                        lblError.Text = "Please insert your telephone-number"; //Error message regarding treatment
                    }

                }
                else
                {
                    lblError_treatment.Text = "Please select treatment"; //Error message regarding treatment
                }
            }
            else
            {
                lblError_Gender.Text = "Please select gender"; //Error message regarding gender
            }
        }
    }
}