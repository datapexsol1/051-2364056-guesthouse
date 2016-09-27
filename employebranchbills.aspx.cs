using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employebranchbills : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

   

    protected void Button1_Click(object sender, EventArgs e)
    {
        bill b = new bill();
       b.BranchId= employeeProfile.getEmployeBranch("kk");//get from session
        b.BillAmount = Convert.ToInt32(Request.Form["abamount"]);
        b.BillType = abtype.Value.ToString();
       
        b.Date = Convert.ToDateTime(Request.Form["abdate"]);
        billclass.Addbill(b);
    }
}