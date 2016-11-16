using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminguestregistration : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminLogin"] == null)
        {
            Response.Redirect("adminlogin.aspx");
        }
        string value = Request.QueryString["id"].ToString();
        selectedrooms.Text = value;

        // Save_Click(sender, e);

    
}

protected void Save_Click(object sender, EventArgs e)
{
    int employID = int.Parse(Session["loginId"].ToString());
    guest g = new guest();
    if (Request.Form["guestType"].ToString() == "pakistani")
    {
        g.reg_no = Request.Form["regno"];
        g.guest_name = Request.Form["gname"];
        g.cnic = Request.Form["cnicno"];
        g.date_of_birth = DateTime.Parse(Request.Form["dob"]);
        g.company_name = Request.Form["cname"];
        g.complete__address = Request.Form["sawat "];
        g.profession = Request.Form["proffesion"];
        g.designation = Request.Form["designation"];
        g.permanent_address = Request.Form["paddress"];
        g.office_phone = Request.Form["poffice"];
        g.residence = Request.Form["presidence"];
        g.mobile = Request.Form["pcell"];
        /* g.f_passport_no = null;
         g.f_nationality = null;
         g.place_of_issue = null;
         g.f_passport_issue_date = null;
         g.f_visa_number = null;
         g.f_visa_valid_upto = null;
         g.f_purpose_of_vist = null;
         g.f_coming_from = null;
         g.f_going_to = null;
         g.departure_date = null;
         g.flight_no = null;*/
        g.guest_type = "local";
        ShowMessage("Information has been saved successfully ! ", MessageType.Success);

    }
    else if (Request.Form["guestType"].ToString() == "foriegner")
    {
        g.reg_no = Request.Form["fregno"];
        g.guest_name = Request.Form["fgname"];
        g.cnic = Request.Form["fcnicno"];
        g.date_of_birth = DateTime.Parse(Request.Form["fdob"]);
        g.company_name = Request.Form["fcaddress"];
        g.complete__address = Request.Form["sawat "];
        g.profession = Request.Form["fproffesion"];
        g.designation = Request.Form["fdesignation"];
        g.permanent_address = Request.Form["fpaddress"];//*
        g.office_phone = Request.Form["fpoffice"];
        g.residence = Request.Form["fpresidence"];
        g.mobile = Request.Form["fpcell"];
        g.f_passport_no = Request.Form["fpassno"];
        g.f_nationality = Request.Form["nationality"];
        g.place_of_issue = Request.Form["placeofissue"];
        g.f_passport_issue_date = DateTime.Parse(Request.Form["fdateofissue"]);
        g.f_visa_number = Request.Form["visano"];
        g.f_visa_valid_upto = DateTime.Parse(Request.Form["validupto"]);
        g.f_purpose_of_vist = Request.Form["visit"];
        g.f_coming_from = Request.Form["fcfrom"];
        g.f_going_to = Request.Form["fgoto"];
        //   DateTime dt = DateTime.Parse(Request.Form["fdeparture"] + Request.Form["fdtime"]);
        // g.departure_date = dt;
        g.flight_no = Request.Form["fflightno"];
        g.guest_type = "forigner";
        ShowMessage("Information has been saved successfully ! ", MessageType.Success);


    }
    else
    {
        ShowMessage("Invalid Information ! ", MessageType.Warning);

    }


    //***************************************************roombooking code *********************************

    // arrival date: arrivaldate     atime
    // departure date :departure     dtime
    // flight no :flightno
    // ******************************************
    // farrivaldate
    // fatime

    booking b = new booking();
    b.branch_id = int.Parse(Request.Form["branch"].ToString());
    b.check_in_date = DateTime.Now;
    //  b.room_id = roomsclass.getRoomID(Request.Form["rno"].ToString(), int.Parse(Request.Form["branch"].ToString()));
    b.employee_id = employeeProfile.getEmployeid("kk");//get employe username from sessions
    g.employee_id = employID;
    b.guest_id = gusetRegistrationClass.insertGuestinfo(g);//will insert guest data to db and return the id of the guest
    b.check_out_date = null;
    //   b.booking_rent = Request.Form["rrent"].ToString();
    b.guest_reg_card_arr_date = "111";
    b.no_of_pax = Request.Form["noofpax"].ToString();
    //  gusetRegistrationClass.bookRoom(b);
    int bid = gusetRegistrationClass.roomBooking(b);
    if (bid != 0)
    {
        string[] roomsbooked = selectedrooms.Text.Split(',');
        booking_Room[] r = new booking_Room[roomsbooked.Length];

        for (int i = 0; i < roomsbooked.Length; i++)
        {
            r[i] = new booking_Room();
            r[i].roomid = roomsclass.getRoomID(roomsbooked[i], int.Parse(Request.Form["branch"].ToString()));
            r[i].booking_rent = Request.Form["rrent"].ToString();
            r[i].checkout = null;
            r[i].bookingId = bid;//.Parse(Request.Form["branch"].ToString());

        }

        gusetRegistrationClass.bookRooms(r);
    }


}
}