using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void logout_click(object sender, EventArgs e)
    {
        Session["adminLogin"] = null;
        Response.Redirect("adminlogin.aspx");

    }
}
