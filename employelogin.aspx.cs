using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employelogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void login_Click(object sender, EventArgs e)
    {
        //should change to session 
        int branchid = employeeProfile.getEmployeBranch("kk");
        string name = Request.Form["username"];
        string password = Request.Form["password"];


        string emp = employeeProfile.employeSignin(name, password);
        int id = employeeProfile.getEmpID(name,password, branchid);

        if (emp != "" || emp != null)
        {
            Session["loginId"] = id;
            Response.Redirect("employeindex.aspx");
            
        }
        else
        {
            Response.Write("yournotlogin");
        }
    }
  
}
