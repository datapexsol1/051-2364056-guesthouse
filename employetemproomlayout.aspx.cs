using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeroomlayout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginId"] == null)
        {
            Response.Redirect("employelogin.aspx");
        }
    }



    protected void savebtn_Click(object sender, EventArgs e)
    {
        online_guest_booking b = new online_guest_booking();
        b.branch_id = employeeProfile.getEmployeBranch(int.Parse(Session["loginId"].ToString()));
        b.check_in_date = DateTime.Parse(Request.Form["checkindate"].ToString());
        b.check_out_date = DateTime.Parse(Request.Form["checkoutdate"].ToString());
        b.no_of_guest = int.Parse(Request.Form["noofguest"].ToString());
        b.request_time = DateTime.Now;
        b.guest_name = Request.Form["gname"].ToString();
        b.guest_cnic_passport = Request.Form["cnicno"].ToString();
        b.guest_phone = Request.Form["gphone"].ToString();
        b.no_of_room = Request.Form["roomnonew"].ToString();//SelectRoom
        b.referance_by_name = Request.Form["referanceby"].ToString();
        b.referance_by_contact = Request.Form["referancephone"].ToString();
        b.Comments = Request.Form["comments"].ToString();
        b.room_rent = Request.Form["roomrent"].ToString();
        b.guest_email = Request.Form["gemail"].ToString();
        b.cancel_booking = "no";
        b.room_type = "nOT noon";//ondemand
        onlineguestbooking.temporaryBooking(b);
    }
}
   

  