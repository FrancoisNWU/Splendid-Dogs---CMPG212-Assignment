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
    public partial class DeleteBooking : System.Web.UI.Page
    {
        public SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DogsDB.mdf;Integrated Security=True");
        public DataSet ds;
        public SqlDataAdapter adapter;
        public SqlCommand command;
        public DataTable dt;
        public SqlDataReader reader;

        protected void Page_Load(object sender, EventArgs e)
        {
            DropListID.Focus();
            if (Page.IsPostBack==false)
            {
                ListID();
                DataBase();
            }        
        }

        //Method display database on gridview
        public void DataBase()
        {
            try
            {
                command = new SqlCommand(@"SELECT * FROM DogsTB", conn);
                adapter = new SqlDataAdapter();
                ds = new DataSet();
                adapter.SelectCommand = command;
                adapter.Fill(ds);
                GridView.DataSource = ds;
                GridView.DataBind();
            }
            catch (SqlException ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        //Method fill DropDownList with IDs
        public void ListID()
        {
            try
            {
                conn.Open();

                command = new SqlCommand(@"SELECT ID FROM DogsTB", conn);

                reader = command.ExecuteReader();


                while (reader.Read())
                {
                    DropListID.Items.Add(reader.GetValue(0).ToString());
                }

                conn.Close();
            }
            catch (SqlException ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            //Check that ID is selected
            if(DropListID.SelectedIndex>0)
            {
                string selectedID = DropListID.SelectedItem.Value.ToString();

                try
                {
                    conn.Open();

                    //Save values for cookies
                    SqlCommand command_Read = new SqlCommand(@"SELECT * FROM DogsTB WHERE ID= " + int.Parse(selectedID) + "", conn);
                    reader = command_Read.ExecuteReader();

                    while (reader.Read())
                    {
                        Session["Name"] = reader.GetValue(1).ToString();
                        Session["Treatment"] = reader.GetValue(4).ToString();
                        Session["Date"] = reader.GetValue(5).ToString();
                    }
                    reader.Close();

                    //Delete Selected Data
                    command = new SqlCommand(@"DELETE FROM DogsTB WHERE  ID= " + int.Parse(selectedID) + " ", conn);
                    adapter = new SqlDataAdapter();
                    adapter.DeleteCommand = command;
                    adapter.DeleteCommand.ExecuteNonQuery();

                    conn.Close();

                    lblMessage.Text = "Successfully deleted booking";


                    //Save query to Cookie
                    HttpCookie _queryCookie = Request.Cookies["Query"];
                    _queryCookie["QueryType"] = "DELETED: ";
                    _queryCookie["QueryID"] = selectedID.ToString();
                    _queryCookie["QueryName"] = Session["Name"].ToString();
                    _queryCookie["QueryTreatment"] = Session["Treatment"].ToString();
                    _queryCookie["QueryDate"] = Session["Date"].ToString();

                    Response.Cookies.Add(_queryCookie);

                }
                catch (SqlException ex)
                {
                    lblMessage.Text = ex.Message;
                }

                ListID();
                DataBase();
                lstDisplay.Items.Clear();


            }
            else
            {
                lblMessage.Text = "Please select a booking ID";
            }


        }

        protected void DropListID_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Display selected ID's data in listbox
            try
            {
                lstDisplay.Items.Clear();

                conn.Open();

                command = new SqlCommand($"SELECT * from DogsTB WHERE ID = '"+int.Parse(DropListID.SelectedItem.Value)+"'", conn);
                reader = command.ExecuteReader();


                while (reader.Read())
                {
                    if (reader.GetValue(0).ToString() == DropListID.SelectedItem.Value.ToString())
                    {
                        lstDisplay.Items.Add("Delete Booking: ");
                        lstDisplay.Items.Add(" ");
                        lstDisplay.Items.Add("ID: "+ reader.GetValue(0).ToString());
                        lstDisplay.Items.Add("Name: " + reader.GetValue(1).ToString());
                        lstDisplay.Items.Add("Breed: " + reader.GetValue(2).ToString());
                        lstDisplay.Items.Add("Gender: " + reader.GetValue(3).ToString());
                        lstDisplay.Items.Add("Treatment: " + reader.GetValue(4).ToString());
                        lstDisplay.Items.Add("Date: " + (DateTime.Parse(reader.GetValue(5).ToString()).ToShortDateString()));
                        lstDisplay.Items.Add("Tel. : " + reader.GetValue(6).ToString());
                    }
                }

                conn.Close();
            }
            catch (SqlException ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

    }
}