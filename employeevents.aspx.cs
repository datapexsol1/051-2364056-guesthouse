using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeevents : System.Web.UI.Page
{
    bool IsPageRefresh ;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void eventsubmit_Click(object sender, EventArgs e)
    {
        
        //if (IsPageRefresh==true)
        //{
            event_calender ev = new event_calender();
            ev.event_name = eventname.Value;
            ev.event_description = eventdesc.Value;
            ev.event_start_date = DateTime.Parse(eventstartdate.Value);// DateTime.Parse(Request.Form["eventstartdate"].ToString());
            ev.event_end_date = DateTime.Parse(eventenddate.Value);//Request.Form["eventenddate"].ToString());
            ev.event_color = eventcolor.Value;
           bool check = events.addEvent(ev);
        
        //  ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);

    }
}