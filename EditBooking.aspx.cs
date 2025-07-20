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
    public partial class EditBooking : System.Web.UI.Page
    {
        public SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DogsDB.mdf;Integrated Security=True");
        public DataSet ds;
        public SqlDataAdapter adapter;
        public SqlCommand command;
        public DataTable dt;
        public SqlDataReader reader;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                //Focus on list when page open
                DropListID.Focus();
                ListID();

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
                lblError_Display.Text = ex.Message;
            }
        }

        //Method display data in listbox
        public void DisplayData()
        {
            if(DropListID.SelectedIndex!=0)
            {
                try
                {
                    lstDisplay.Items.Clear();
                    lblError_Display.Text = "";
                    lblError.Text = "";

                    conn.Open();

                    command = new SqlCommand($"SELECT * from DogsTB WHERE ID = '" + int.Parse(DropListID.SelectedItem.Value) + "'", conn);
                    reader = command.ExecuteReader();


                    while (reader.Read())
                    {

                        if (reader.GetValue(0).ToString() == DropListID.SelectedItem.Value.ToString())
                        {
                            lstDisplay.Items.Add("Edit Booking: ");
                            lstDisplay.Items.Add(" ");
                            lstDisplay.Items.Add("ID: " + reader.GetValue(0).ToString());
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
                    lblError_Display.Text = ex.Message;
                }
            }
            else
            {
                lblError_Display.Text = "Please select an ID";
            }
           
        }



        protected void DropListIDs_SelectedIndexChanged(object sender, EventArgs e)
        {
            DisplayData();//Update listbox display

            //If valid ID is selected: User can use input controls
            if(DropListID.SelectedIndex!=0)
            {
                dropListColumn.Enabled = true;
            }
            else
            {
                //If user select first input: Empty listbox and data disable input
                dropListColumn.SelectedIndex = 0;
                dropListColumn.Enabled = false;
                lstDisplay.Items.Clear();
                txtInput.Visible = false;
                dropListTreatment.Visible = false;
            }
            
        }

        protected void dropListColumn_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Detect selected Column chosen by user
            //Change label to selected column name
            //Save SQL string according to culumn in session
            //Make update button and input textbox visable if a column in selected
            switch(dropListColumn.SelectedIndex)
            {
                case 0:

                    btnUpdate.Enabled = false;
                    break;
                case 1:
                    lblColumn.Text = "Name Column:";
                    Session["Column"] = @"UPDATE DogsTB SET  Name = @Input WHERE ID = @ID  ";
                    dropListTreatment.Visible = false;
                    btnUpdate.Enabled = true;
                    txtInput.Visible = true;
                    break;
                case 2:
                    lblColumn.Text = "Breed Column:";
                    Session["Column"] = @"UPDATE DogsTB SET  Breed = @Input WHERE ID = @ID  ";
                    dropListTreatment.Visible = false;
                    btnUpdate.Enabled = true;
                    txtInput.Visible = true;
                    break;
                case 3:
                    lblColumn.Text = "Gender Column:";
                    Session["Column"] = @"UPDATE DogsTB SET  Gender = @Input WHERE ID = @ID  ";
                    dropListTreatment.Visible = false;
                    btnUpdate.Enabled = true;
                    txtInput.Visible = true;
                    break;
                case 4:
                    lblColumn.Text = "Treatment Column:";
                    Session["Column"] = @"UPDATE DogsTB SET  Treatment = @Input WHERE ID = @ID  ";
                    txtInput.Visible = false;
                    dropListTreatment.Visible = true;
                    btnUpdate.Enabled = true;
                    break;
                case 5:
                    lblColumn.Text = "Date Column:";
                    dropListTreatment.Visible = false;
                    Session["Column"] = @"UPDATE DogsTB SET  Date = @Input WHERE ID = @ID  ";
                    txtInput.Visible = true;
                    btnUpdate.Enabled = true;
                    break;
                case 6:
                    lblColumn.Text = "Telephone Column:";
                    dropListTreatment.Visible = false;
                    Session["Column"] = @"UPDATE DogsTB SET  Telephone = @Input WHERE ID = @ID  ";
                    txtInput.Visible = true;
                    btnUpdate.Enabled = true;
                    break;
                default:
                    lblColumn.Text = "Unselected Column:";
                    Session["SQL"] = null;
                    dropListTreatment.Visible = false;
                    btnUpdate.Enabled = false;
                    break;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            DateTime test;

            //Input validation before executing update
            if (dropListColumn.SelectedValue.ToString() == "Gender" && (txtInput.Text != "Male" && txtInput.Text != "Female"))
            {
                lblError.Text = "Please enter Male or Female";
                txtInput.Text = "";
            }
            else if (dropListColumn.SelectedValue.ToString() == "Date" && !(DateTime.TryParse(txtInput.Text, out test)))
            {

                lblError.Text = "Please enter the date eg. 2023/05/06";
                txtInput.Text = "";
            }
            else if (dropListColumn.SelectedValue.ToString() == "Telephone" && !(txtInput.Text.Length == 10 && txtInput.Text.Substring(0, 1) == "0"))
            {
                lblError.Text = "Please enter valid telephone number";
                txtInput.Text = "";
            }
            else
            {
                //Update database according to input
                try
                {
                    conn.Open();


                    command = new SqlCommand(Session["Column"].ToString(), conn);

                    //Get data from textbox or dropdownlist
                    if (dropListColumn.SelectedIndex == 4)
                    {
                        command.Parameters.AddWithValue("@Input", dropListTreatment.SelectedValue.ToString());
                    }
                    else
                    {
                        command.Parameters.AddWithValue("@Input", txtInput.Text);
                    }

                    command.Parameters.AddWithValue("@ID", int.Parse(DropListID.SelectedItem.Value));

                    command.ExecuteNonQuery();

                    conn.Close();

                    //Reset input-state for next possible data user want to change
                    string selectedID = DropListID.SelectedItem.Value;
                    lblError.Text = "Updated Successfully";
                    btnUpdate.Enabled = false;
                    txtInput.Text = "";
                    txtInput.Visible = false;
                    dropListColumn.SelectedIndex = 0;
                    dropListColumn.Enabled = false;
                    dropListTreatment.Visible = false;
                    DropListID.SelectedIndex = 0;



                    //Update display
                    DisplayData();


                    //Datareader save data in Session to use for cookies
                    conn.Open();
                    SqlCommand command_Read = new SqlCommand(@"SELECT * FROM DogsTB WHERE ID= " + int.Parse(selectedID) + "", conn);
                    reader = command_Read.ExecuteReader();

                    while (reader.Read())
                    {
                        Session["Name"] = reader.GetValue(1).ToString();
                        Session["Date"] = reader.GetValue(5).ToString();
                    }
                    reader.Close();

                    conn.Close();

                    //Save query to Cookie
                    HttpCookie _queryCookie = Request.Cookies["Query"];
                    _queryCookie["QueryType"] = "UPDATED: ";
                    _queryCookie["QueryID"] = selectedID.ToString();
                    _queryCookie["QueryName"] = Session["Name"].ToString();
                    _queryCookie["QueryTreatment"] = dropListTreatment.SelectedValue;
                    _queryCookie["QueryDate"] = Session["Date"].ToString();

                    Response.Cookies.Add(_queryCookie);
                }
                catch (SqlException ex)
                {
                    lblError.Text = ex.Message;
                }
            }

        }

    }
}