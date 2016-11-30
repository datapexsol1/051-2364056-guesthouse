using System;
using System.Collections.Generic;
using System.Globalization;
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
    string msg, type;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginId"] == null)
        {
            Response.Redirect("employelogin.aspx");
        }
        else if (!IsPostBack)
        {

        }
    }
    
    protected void eventsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            int branchID = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
            int employID = int.Parse(Session["loginId"].ToString());
            int id = int.Parse(updatehiddenid.Value);//int.Parse(Request.Form["updatehiddenid"].ToString());
            event_calender ev = new event_calender();
            ev.event_name = Request.Form["eventname"].ToString();
            ev.event_description = Request.Form["eventdesc"].ToString();
            ev.event_start_date = DateTime.ParseExact(Request.Form["eventstartdate"], "dd-MM-yyyy", CultureInfo.InvariantCulture); ;//DateTime.Parse(Request.Form["eventstartdate"].ToString());
            ev.event_end_date = DateTime.ParseExact(Request.Form["eventenddate"], "dd-MM-yyyy", CultureInfo.InvariantCulture); ;// DateTime.Parse(Request.Form["eventenddate"].ToString());
            ev.event_color = Request.Form["eventcolor"].ToString();
            ev.employee_id = employID;
            bool check = events.updateEvent(ev, id);
            if (check == true)
            {
                admin_notification_class.addnotification(employID, branchID, DateTime.Now, admin_notification_class.TableNames.event_calender.ToString(), employID, admin_notification_class.CommandType.Update.ToString());
                msg = "Successfully updated the information";
                type = "Success";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS", "setTimeout(function() { window.location.replace('employeevents.aspx') }, 4500);", true);

            }
            else
            {
                msg = "There is some error";
                type = "Error";
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");


        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + "Error" + "','" + ex.Message + "');</script>");

        }
    }
}