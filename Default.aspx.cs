using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Verster_40723380_Assignment2
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if(Page.IsPostBack==false)
            {
                //create Cookie and save it for 30 days
                HttpCookie _queryCookie = new HttpCookie("Query");
                Response.Cookies.Add(_queryCookie);
                _queryCookie.Expires = DateTime.Now.AddDays(30);


                //Display Latest exectuted query using cookies
                lstDisplay.Items.Clear();
                HttpCookie _queryCookie1 = Request.Cookies["Query"];
                if (_queryCookie1 != null)
                {
                    lstDisplay.Items.Add(_queryCookie1["QueryType"]);
                    lstDisplay.Items.Add("ID: "+ _queryCookie1["QueryID"]);
                    lstDisplay.Items.Add("Name: " + _queryCookie1["QueryName"]);
                    lstDisplay.Items.Add("Treatment: " + _queryCookie1["QueryTreatment"]);
                    lstDisplay.Items.Add("Booking Date: " + _queryCookie1["QueryDate"]);
                }

            }
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //Open Search Bookin page
            Response.Redirect("SearchBooking.aspx");
        }


        protected void dropListChange_SelectedIndexChanged(object sender, EventArgs e)
        {

            //Open edit or delete page
            if(dropListChange.SelectedIndex==1)
            {
                Response.Redirect("EditBooking.aspx");
            }

            if (dropListChange.SelectedIndex == 2)
            {
                Response.Redirect("DeleteBooking.aspx");
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            //Open New booking PAge
            Response.Redirect("NewBooking.aspx");
        }
    }
}