using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeguestregistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        guest g = new guest();
        g.reg_no = "123";
        g.guest_name = "kaleem ";
            g.cnic = "37101-18713479-1";
        g.date_of_birth = DateTime.Now;
        g.company_name = "datapexsol";
        g.complete__address = "sawat ";
        g.profession = "xyz";
        g.designation = "xyz";
        g.permanent_address = "xyz";
        g.office_phone = "123123";
        g.residence = "123123";
        g.mobile= "123123";
             g.f_passport_no = "";
        g.f_nationality = "";
        g.f_passport_issue_date = null;
        g.f_visa_number = "";
        g.f_visa_valid_upto = null;
        g.f_purpose_of_visist = "";
        g.f_coming_from = "";
        g.f_going_to = "";
        //***************************************************roombooking code *********************************
        booking b = new booking();
        b.branch_id ="";
        b.check_in_date = DateTime.Now;
        b.room_id = "1";
        b.employee_id = "1";
        b.guest_id = "1";
        b.check_out_date = null;
        b.booking_rent = "20000";
        b.departure_date = null;
        b.departure_time = null;
        b.flight_no = null;
        b.branch_id = "1";
        b.guest_reg_card_arr_date = "111";
        b.no_of_pax = "2";


        gusetRegistrationClass.RoomBooking(g,b);

    }
    protected void registerRooms(object sender,EventArgs e)
    {
       
    }
}