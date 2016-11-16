using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminbranch : System.Web.UI.Page
{
    string msg, type;
    bool check;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminLogin"] == null)
        {
            Response.Redirect("adminlogin.aspx");
        }
        
    }
    protected void savebranch_click(object sender,EventArgs e)
    {
        branch b = new branch();
        b.brachno = Request.Form["bno"].ToString();
        b.name = Request.Form["bname"].ToString();
        b.city = Request.Form["bcity"].ToString();
        b.country = Request.Form["bcountry"].ToString();
        b.address = Request.Form["badress"].ToString();
        b.employee_id = employeeProfile.getEmployeeId(Session["adminLogin"].ToString());
        if (branchClass.addbranch(b) == true)
        {
            msg = "Successfully stored the information";
            type = "Success";
            //show succesful msg
        }
        else
        {
            msg = "There is some error";
            type = "Error";
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");

    }
}