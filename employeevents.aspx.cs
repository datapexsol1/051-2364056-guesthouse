using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeevents : System.Web.UI.Page
{
    string msg, type;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginId"] == null)
        {
            Response.Redirect("employelogin.aspx");
        }
    }
    protected void eventsubmit_Click(object sender, EventArgs e)
    {
        try {
            int branchID = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
            int employID = int.Parse(Session["loginId"].ToString());
            event_calender ev = new event_calender();
            ev.event_name = eventname.Value;
            ev.event_description = eventdesc.Value;
            ev.event_start_date = DateTime.ParseExact(Request.Form["eventstartdate"], "dd-MM-yyyy", CultureInfo.InvariantCulture); //DateTime.Parse(Request.Form["eventstartdate"]);//eventstartdate.Value);// DateTime.Parse(Request.Form["eventstartdate"].ToString());
            ev.event_end_date = DateTime.ParseExact(Request.Form["eventenddate"], "dd-MM-yyyy", CultureInfo.InvariantCulture);//DateTime.Parse(Request.Form["eventenddate"]);//.Value);//Request.Form["eventenddate"].ToString());
            ev.event_color = eventcolor.Value;
            ev.employee_id = employID;
            bool check = events.addEvent(ev);

            if (check == true)
            {
                msg = "Success fully added the event ! ";
                type = "Success";
                //   Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('Success','Successfully updated information');</script>");
                admin_notification_class.addnotification(employID, branchID, DateTime.Now, admin_notification_class.TableNames.event_calender.ToString(), employID, admin_notification_class.CommandType.Add.ToString());
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS", "setTimeout(function() { window.location.replace('employeevents.aspx') }, 4500);", true);

            }
            else
            {
                msg = "There is some error in adding the information";
                type = "Error";
                // Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('Error','Successfully updated information');</script>");

            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");
            //  ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);
        }catch(Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + "Error" + "','" + ex.Message + "');</script>");

        }
    }
  
}