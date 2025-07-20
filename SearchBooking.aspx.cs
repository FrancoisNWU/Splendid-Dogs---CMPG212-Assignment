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
    public partial class SearchBooking : System.Web.UI.Page
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
                DataBase();
                fillList();
            }
            lblError.Text = "";
        }

        //Fill DropDownList with Treatments
        public void fillList()
        {
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
                lblError.Text = ex.Message;
            }
        }

        protected void rbMale_CheckedChanged(object sender, EventArgs e)
        {
            //Show all Male dogs
            try
            {
                command = new SqlCommand(@"SELECT * FROM DogsTB WHERE Gender = 'Male' ", conn);
                adapter = new SqlDataAdapter();
                ds = new DataSet();
                adapter.SelectCommand = command;
                adapter.Fill(ds);
                GridView.DataSource = ds;
                GridView.DataBind();
            }
            catch (SqlException ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void rbFemale_CheckedChanged(object sender, EventArgs e)
        {
            //Show all Female dogs
            try
            {
                command = new SqlCommand(@"SELECT * FROM DogsTB WHERE Gender = 'Female' ", conn);
                adapter = new SqlDataAdapter();
                ds = new DataSet();
                adapter.SelectCommand = command;
                adapter.Fill(ds);
                GridView.DataSource = ds;
                GridView.DataBind();
            }
            catch (SqlException ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void dropListTreatment_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Display data according to selected treatment 
            try
            {
                command = new SqlCommand(@"SELECT * FROM DogsTB WHERE Treatment LIKE '"+dropListTreatment.SelectedItem.ToString()+"' ", conn);
                adapter = new SqlDataAdapter();
                ds = new DataSet();
                adapter.SelectCommand = command;
                adapter.Fill(ds);
                GridView.DataSource = ds;
                GridView.DataBind();
            }
            catch (SqlException ex)
            {
                lblError.Text = ex.Message;
            }
        }


        protected void btnFilterIDs_Click(object sender, EventArgs e)
        {
            //Display data according to selected ID
            if(txtID.Text!="")
            {
                try
                {
                    command = new SqlCommand(@"SELECT * FROM DogsTB WHERE ID LIKE '" + int.Parse(txtID.Text) + "%' ", conn);
                    adapter = new SqlDataAdapter();
                    ds = new DataSet();
                    adapter.SelectCommand = command;
                    adapter.Fill(ds);
                    GridView.DataSource = ds;
                    GridView.DataBind();
                }
                catch (SqlException ex)
                {
                    lblError.Text = ex.Message;
                }
            }
            else
            {
                DataBase();
            }

        }

        protected void bntFilterNames_Click(object sender, EventArgs e)
        {
            //Display data according to text (name) input
            if(txtName.Text!="")
            {
                try
                {
                    command = new SqlCommand(@"SELECT * FROM DogsTB WHERE Name LIKE '%" + txtName.Text + "%' ", conn);
                    adapter = new SqlDataAdapter();
                    ds = new DataSet();
                    adapter.SelectCommand = command;
                    adapter.Fill(ds);
                    GridView.DataSource = ds;
                    GridView.DataBind();
                }
                catch (SqlException ex)
                {
                     lblError.Text = ex.Message;
                }
            }
            else
            {
                DataBase();
            }

        }
    }
}