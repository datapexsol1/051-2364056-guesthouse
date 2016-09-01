using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for gusetRegistrationClass
/// </summary>
public class gusetRegistrationClass
{
    public gusetRegistrationClass()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static void guestRoomBooking(booking b)
    {
        ctownDataContext db = new ctownDataContext();


        db.bookings.InsertOnSubmit(b);
        db.SubmitChanges();




    }
    // after inserting guest data this function will return id of the guest
    public static int insertGuestinfo(guest g)
    {
        
        ctownDataContext db = new ctownDataContext();
        db.guests.InsertOnSubmit(g);
        db.SubmitChanges();
        int guestid = (from x in db.guests
                      where x.cnic == g.cnic || x.f_passport_no==g.f_passport_no
                      select x.Id).First();

        return guestid;



    }
    public static bool bookRoom(booking g)
    {

        ctownDataContext db = new ctownDataContext();
        int roomid = g.room_id;
        var rm = (from x in db.rooms
                    where x.Id == roomid
                    select x).First();
        rm.availbilty = "false";
        try
        {
            db.SubmitChanges();
        }
        catch (Exception e)
        {
            return false;
        }

        db.bookings.InsertOnSubmit(g);
        try
        {
            db.SubmitChanges();
            return true;
        }
        catch (Exception e)
        {
            return false;
        }
            



    }
    public static bool CheckGhustExistance(string cnic,string passporno)
    {
        //return false when record does not exist
        ctownDataContext db = new ctownDataContext();
        var result= (from gust in db.GetTable<guest>()

                                   where gust.cnic == cnic || gust.f_passport_no==passporno
                                   select gust);
        int count = result.Count();
        if (count == 0)
        {
          
                return false;
        
        }
        else
        {
            return true;
        }

    }
    public static guestBookingAttributes[] getlocalClientData()
    {
        ctownDataContext db = new ctownDataContext();
        var result = (from b in db.bookings
                      join g in db.guests on b.guest_id equals g.Id
                      join r in db.rooms on b.room_id equals r.Id
                      where g.guest_type == "local"
                      select new
                      {
                          booking = b, guest = g,r.room_no
                      });
        guestBookingAttributes[] bookingguestdata = new guestBookingAttributes[result.Count()];
        int i = 0;
       foreach(var x in result)
        {
            bookingguestdata[i] = new guestBookingAttributes();
            bookingguestdata[i].b_checkinDate=x.booking.check_in_date;
            if (x.booking.check_out_date != null)
            {
                bookingguestdata[i].b_checkoutdate = x.booking.check_out_date.Value;
            }
           
            bookingguestdata[i].b_roomno=x.room_no;
            bookingguestdata[i].b_no_pax=x.booking.no_of_pax;
            bookingguestdata[i].g_reg_no=x.guest.reg_no ;
            bookingguestdata[i].g_guest_name = x.guest.guest_name;
            bookingguestdata[i].g_cnic = x.guest.cnic;
            bookingguestdata[i]. g_date_of_birth = x.guest.date_of_birth;
            bookingguestdata[i].g_company_name = x.guest.company_name;
            bookingguestdata[i].g_complete__address = x.guest.complete__address;
            bookingguestdata[i].g_profession = x.guest.profession;
            bookingguestdata[i].g_designation = x.guest.designation;
            bookingguestdata[i].g_permanent_address = x.guest.permanent_address;
            bookingguestdata[i].g_office_phone = x.guest.office_phone;
            bookingguestdata[i].g_residence = x.guest.residence;
            bookingguestdata[i].g_mobile = x.guest.mobile;

            //   DateTime dt = DateTime_Parse(Request_Form["fdeparture"] + Request_Form["fdtime"]);
            if (x.guest.departure_date != null)
            {
                bookingguestdata[i].g_departure_date = x.guest.departure_date.Value;
            }
            bookingguestdata[i].g_flight_no = x.guest.flight_no;
            bookingguestdata[i].g_guest_type = x.guest.guest_type;
            if (x.guest.image != null)
            {
                bookingguestdata[i].image = x.guest.image.ToArray();
            }
            i++;
        }
        return bookingguestdata;
       
    }
    public static guestBookingAttributes[] getforignerClientData()
    {
        ctownDataContext db = new ctownDataContext();
        var result = (from b in db.bookings
                      join g in db.guests on b.guest_id equals g.Id
                      join r in db.rooms on b.room_id equals r.Id
                      where g.guest_type == "forigner"
                      select new
                      {
                          booking = b,
                          guest = g,
                          r.room_no
                      });
        guestBookingAttributes[] bookingguestdata = new guestBookingAttributes[result.Count()];
        int i = 0;
        foreach (var x in result)
        {
            bookingguestdata[i].b_checkinDate = x.booking.check_in_date;

            bookingguestdata[i].b_checkoutdate = x.booking.check_out_date.Value;


            bookingguestdata[i].b_roomno = x.room_no;
            bookingguestdata[i].b_no_pax = x.booking.no_of_pax;
            bookingguestdata[i].g_reg_no = x.guest.reg_no;
            bookingguestdata[i].g_guest_name = x.guest.guest_name;
            bookingguestdata[i].g_cnic = x.guest.cnic;
            bookingguestdata[i].g_date_of_birth = x.guest.date_of_birth;
            bookingguestdata[i].g_company_name = x.guest.company_name;
            bookingguestdata[i].g_complete__address = x.guest.complete__address;
            bookingguestdata[i].g_profession = x.guest.profession;
            bookingguestdata[i].g_designation = x.guest.designation;
            bookingguestdata[i].g_permanent_address = x.guest.permanent_address;
            bookingguestdata[i].g_office_phone = x.guest.office_phone;
            bookingguestdata[i].g_residence = x.guest.residence;
            bookingguestdata[i].g_mobile = x.guest.mobile;
            bookingguestdata[i].g_f_passport_no = x.guest.f_passport_no;
            bookingguestdata[i].g_f_nationality = x.guest.f_nationality;
            bookingguestdata[i].g_place_of_issue = x.guest.place_of_issue;
            bookingguestdata[i].g_f_passport_issue_date = x.guest.f_passport_issue_date.Value;
            bookingguestdata[i].g_f_visa_number = x.guest.f_visa_number;
            bookingguestdata[i].g_f_visa_valid_upto = x.guest.f_visa_valid_upto.Value;
            bookingguestdata[i].g_f_purpose_of_vist = x.guest.f_purpose_of_vist;
            bookingguestdata[i].g_f_coming_from = x.guest.f_coming_from;
            bookingguestdata[i].g_f_going_to = x.guest.f_going_to;
    bookingguestdata[i].g_departure_date = x.guest.departure_date.Value;
            bookingguestdata[i].g_flight_no = x.guest.flight_no;
            bookingguestdata[i].g_guest_type = x.guest.guest_type;
            bookingguestdata[i].image = x.guest.image.ToArray();
            i++;
        }
        return bookingguestdata;

    }


}