﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeevents : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
    bool IsPageRefresh ;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {

            //ShowMessage("Successfully updated information", MessageType.Success);
        }
            
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
        if (check == true)
        {
            ShowMessage("Successfully updated information", MessageType.Success);
        }
        else
        {
            ShowMessage("Error", MessageType.Warning);
        }
        //  ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);

    }
    //protected void delete_CLick(object sender, EventArgs e)
    //{
       
    //    //   int id = int.Parse((sender as Control).ID.ToString());// int.Parse(Request.Form["id"].ToString());
    //    //do something with roomId

    //}
}