using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmployeeInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminLogin"] == null)
        {
            Response.Redirect("adminlogin.aspx");
        }
        else if (!IsPostBack)
        {
            branch.Items.Clear();
            IQueryable<branch> br = admingraphclass.getAllbranches();
            branch.Items.Add("Select Branch");
            foreach (branch b in br)
            {
                branch.Items.Add(b.name);
            }
        }
    }
   public void sranchSelected_Indexchange(object sender,EventArgs e)
    {

       
    }
}