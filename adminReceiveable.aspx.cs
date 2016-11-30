using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminReceiveable : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminLogin"] == null)
        {
            Response.Redirect("adminlogin.aspx");
        }
        else if (!IsPostBack)
        {
            brid.Items.Clear();
            IQueryable<branch> br = admingraphclass.getAllbranches();
            brid.Items.Add("Select Branch");
            foreach (branch x in br)
            {
                brid.Items.Add(x.name);
            }
        }
    }
    //protected void bridindexchange(object sender, EventArgs e)
    //{
    //}
    protected void paybtn_click(object sender, EventArgs e)
    {
        guestpayment.addrecieable(int.Parse(Hidden1.Value), Request.Form["totalPaymentId"], "cash", "");
    }
}