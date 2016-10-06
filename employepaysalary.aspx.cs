using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employepaysalary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       

    }
    protected void savebtnclick(object sender, EventArgs e)
    {
        if (tbpaidvalue.Value != null && tbpaidvalue.Value != "")
        {
            //int id=int.Parse(Request.QueryString["id"]);
            employesalary es = new employesalary();
            es.employe_id = int.Parse(tbid.Value);
            es.payment_date = DateTime.Now;
            //string str = "paidamount" + id;
            es.amount = tbpaidvalue.Value;//Request.Form[str].ToString();
            employeeProfile.addemployesalary(es);
        }
        else
        {

        }
    }
}