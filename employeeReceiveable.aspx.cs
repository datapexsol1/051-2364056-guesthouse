using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeeReceiveable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null)
        {
            Response.Redirect("employelogin.aspx");
        }
        else if (IsPostBack)
        {
          //  totalPaymentId.Value = Request.QueryString["id"];
        }
    }
    protected void paybtn_click(object sender, EventArgs e)
    {
        guestpayment.addrecieable(int.Parse(Hidden1.Value), Request.Form["totalPaymentId"],"cash","");
    }
    
}