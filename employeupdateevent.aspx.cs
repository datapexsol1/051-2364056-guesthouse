using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeupdateevent : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginId"] == null)
        {
            Response.Redirect("employelogin.aspx");
        }
    } 

    protected void eventsubmit_Click(object sender, EventArgs e)
    {
        int employID = int.Parse(Session["loginId"].ToString());
        int id = int.Parse(updatehiddenid.Value);//int.Parse(Request.Form["updatehiddenid"].ToString());
        event_calender ev = new event_calender();
        ev.event_name =  Request.Form["eventname"].ToString();
        ev.event_description =  Request.Form["eventdesc"].ToString();
        ev.event_start_date =  DateTime.Parse(Request.Form["eventstartdate"].ToString());
        ev.event_end_date = DateTime.Parse(Request.Form["eventenddate"].ToString());
        ev.event_color = Request.Form["eventcolor"].ToString();
        ev.employee_id = employID;
        bool check = events.updateEvent(ev,id);
        if (check == true)
        {
            ShowMessage("Successfully updated information", MessageType.Success);
            Response.Redirect("employeindex.aspx");
        }
    }
}