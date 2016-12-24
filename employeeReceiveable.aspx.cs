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
        else
        {
            if (Request.Form["__EVENTTARGET"] == "mybtn")
            {
                //check amount as welll ;
                //then display msg 
                int amount;
                if (int.TryParse(pamount.Value, out amount))
                {
                    if (guestpayment.addrecieable(int.Parse(pid.Value), pamount.Value, ptype.Value, checkno.Value) == true)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('Success','Receivable added Succefully');</script>");
                    }else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('Error','Amount you are trying to input is greater then then the amount remaning');</script>");
                    }
                   
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('Error','Please Enter Valid amount');</script>");
                }
            }
        }
    }
    protected void paybtn_click(object sender, EventArgs e)
    {
        
    }
    
}