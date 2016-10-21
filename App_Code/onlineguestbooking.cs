using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for onlineguestbooking
/// </summary>
public class onlineguestbooking
{
    public onlineguestbooking()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static bool register_guest_booking(online_guest_booking ogb)
    {
        ctownDataContext db = new ctownDataContext();
        int count = (from x in db.GetTable<online_guest_booking>()
                     where x.guest_name == ogb.guest_name || x.guest_cnic_passport == ogb.guest_cnic_passport || 
                     x.check_in_date == ogb.check_in_date && x.check_out_date == ogb.check_out_date && x.request_time ==ogb.request_time
                     select new
                     {
                         x.Id
                     }).Count();
        if (count == 0)
        {
            db.online_guest_bookings.InsertOnSubmit(ogb);
            db.SubmitChanges();
            return true;

        }
        else
        {
            return false;
        }

    }
}