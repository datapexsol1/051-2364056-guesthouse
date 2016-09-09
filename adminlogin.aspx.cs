using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }

    protected void login_Click(object sender, EventArgs e)
    {
        string name = Request.Form["username"];
        string password = Request.Form["password"];
 
      
            bool result = adminProfile.adminAuthentication(name, password);
            if (result==true)
            {
                   Response.Redirect("AdminIndex.aspx");
        }
        else
            {
                Response.Write("notlogedin");
            }
        }
    
}