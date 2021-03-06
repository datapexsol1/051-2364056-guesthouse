﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeerooms : System.Web.UI.Page
{
    string msg, type;
    protected void Page_Load(object sender, EventArgs e)

    {

       
        
        if (Session["loginId"] == null)
        {
            Response.Redirect("employelogin.aspx");
        }
        else if(!IsPostBack)
        {
            IQueryable<room> rm = roomsclass.getAllRooms(employeeProfile.getEmployeBranch(Session["loginName"].ToString()));

            string[] roomNo = new string[rm.Count() + 1];
            roomNo[0] = "Select";
            int i = 1;
            foreach (var x in rm)
            {

                roomNo[i] = x.room_no;
                i++;
            }
          
        }
        else
        {
            if (Request.Form["__EVENTTARGET"] == "mybtn")
            {
                int bid=int.Parse(hbid.Value);
                string roomno = hroomno.Value;
                string[] room_array = roomno.Split(',');
                string newroomno = Request.Form["roomselected"].ToString();
                string newrent = Request.Form["newroomrent"].ToString();

                ctownDataContext db = new ctownDataContext();
                room oldroom = (from r in db.rooms
                              where r.room_no == roomno
                              select r).First();
                booking_Room b = (from x in db.booking_Rooms
                                  where x.bookingId == bid && x.roomid == oldroom.Id
                                  select x).First();
                room newroom = (from r in db.rooms
                              where r.room_no == newroomno
                              select r).First();


                b.roomid = newroom.Id;
                b.booking_rent = newrent;
                oldroom.availbilty = "yes";
                newroom.availbilty = "no";
                db.SubmitChanges();


                ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "showupdatediv('updateroomavalibilty');", true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('Success','Room is Shifted Succesfully');</script>");
            }else if (Request.Form["__EVENTTARGET"] == "broomshift")
            {
                int bid = int.Parse(hbid.Value);
                string roomno = hroomno.Value;
                string[] room_array = roomno.Split(',');
                string newroomno = Request.Form["newroom"].ToString();
                string newrent = Request.Form["newrent"].ToString();
                string oldroomno = Request.Form["oldroom"].ToString();
                string oldrent = Request.Form["oldrent"].ToString();
                ctownDataContext db = new ctownDataContext();
                int oldroomid = (from x in db.rooms
                                 where x.room_no == oldroomno
                                 select x.Id).First();
                int newroomid = (from x in db.rooms
                                 where x.room_no ==newroomno
                                 select x.Id).First();
                var booking_rooms = (from x in db.booking_Rooms
                                  where (x.roomid ==oldroomid && x.checkout==null) ||( x.roomid == newroomid && x.checkout == null)
                                  select x);
                foreach(booking_Room x in booking_rooms)
                {
                    if (x.roomid == oldroomid) {
                        x.roomid = newroomid;
                        x.booking_rent = newrent;
                        db.SubmitChanges();
                    }
                    else if (x.roomid == newroomid)
                    {
                        x.roomid = oldroomid;
                        x.booking_rent = oldrent;
                        db.SubmitChanges();
                    }
                }

            }
            
        }
       

       
    }
    protected void updateTempbooking_click(object sender, EventArgs e)
    {
       
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), " activaTab('roomavalibilty');", true);
    }
   
   
   
    


    }