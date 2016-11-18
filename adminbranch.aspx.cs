using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminbranch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void savebranch_click(object sender,EventArgs e)
    {
        branch b = new branch();
        b.brachno = Request.Form["bno"].ToString();
        b.name = Request.Form["bname"].ToString();
        b.city = Request.Form["bcity"].ToString();
        b.country = Request.Form["bcountry"].ToString();
        b.address = Request.Form["badress"].ToString();
        b.employee_id = 13;
        if (branchClass.addbranch(b) == true)
        {
            //display succes msg
        }else
        {
            // display error
        }
    }
}