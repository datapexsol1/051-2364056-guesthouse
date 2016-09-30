using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeupdateevent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string eventid = Request.QueryString["id"].ToString();
        updatehiddenid.Value = eventid;
    }

    protected void eventsubmit_Click(object sender, EventArgs e)
    {
        int id = int.Parse(updatehiddenid.Value);//int.Parse(Request.Form["updatehiddenid"].ToString());
        event_calender ev = new event_calender();
        ev.event_name =  Request.Form["eventname"].ToString();
        ev.event_description =  Request.Form["eventdesc"].ToString();
        ev.event_start_date =  DateTime.Parse(Request.Form["eventstartdate"].ToString());
        ev.event_end_date = DateTime.Parse(Request.Form["eventenddate"].ToString());
        ev.event_color = Request.Form["eventcolor"].ToString();
        events.updateEvent(ev,id);
    }
}