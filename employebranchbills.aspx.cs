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
        b.BillAmount = Convert.ToInt32(Request.Form["abamount"]);
        var a = abtype.Value.ToString();
        if(a=="1")
        {
            b.BillType = "Electricity";
        }
       else if (a == "2")
        {
            b.BillType = "Gas";
        }

        if (a == "3")
        {
            b.BillType = "water";
        }

        b.Date = Convert.ToDateTime(Request.Form["abdate"]);
        billclass.Addbill(b);
    }
}