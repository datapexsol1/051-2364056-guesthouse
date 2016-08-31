using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for guestBookingAttributes
/// </summary>
public class guestBookingAttributes
{
    public DateTime b_checkinDate;
    public DateTime b_checkoutdate;
    public string b_roomno;
    public string b_no_pax;
    public string g_reg_no ;
    public string g_guest_name;
    public string g_cnic;
    public DateTime g_date_of_birth;
    public string g_company_name;
    public string g_complete__address;
    public string g_profession;
    public string g_designation;
    public string g_permanent_address;
    public string g_office_phone;
    public string g_residence;
    public string g_mobile;
    public string g_f_passport_no;
    public string g_f_nationality;
    public string g_place_of_issue; 
    public DateTime g_f_passport_issue_date;
    public string g_f_visa_number;
    public DateTime g_f_visa_valid_upto;
    public string g_f_purpose_of_vist;
    public string g_f_coming_from;
    public string g_f_going_to;
    //   DateTime dt = DateTime_Parse(Request_Form["fdeparture"] + Request_Form["fdtime"]);
    public DateTime g_departure_date;
    public string g_flight_no;
    public string g_guest_type;
    public byte[]  image;
    public guestBookingAttributes()
    {
      
    }
}