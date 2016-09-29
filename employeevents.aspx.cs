using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeevents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void eventsubmit_Click(object sender, EventArgs e)
    {
        event_calender ev = new event_calender();
        ev.event_name = eventname.Value;
        ev.event_description = eventdesc.Value;
        ev.event_start_date = DateTime.Parse(Request.Form["eventstartdate"].ToString());
        ev.event_end_date = DateTime.Parse(Request.Form["eventenddate"].ToString());
        events.addEvent(ev);
    }
}