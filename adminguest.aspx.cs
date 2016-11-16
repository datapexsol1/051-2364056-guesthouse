using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminguest : System.Web.UI.Page
{
    string msg, type;
    bool check;
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
}