using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bookingclass
/// </summary>
public class bookingclass
{
    public bookingclass()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static bookingRoomAttr[] getBookingDetail(int bid)
    {
        ctownDataContext db = new ctownDataContext();
        var result = from x in db.bookings
                       join rbooking in db.booking_Rooms on x.Id equals rbooking.bookingId
                       where x.Id == bid
                       select new
                       {
                           booking_Room=rbooking,
                           booking=x
                       };
        bookingRoomAttr[] data = new bookingRoomAttr[result.Count()];
        int i = 0;
        foreach(var x in result)
        {
            data[i] = new bookingRoomAttr();
            data[i].b_id = x.booking.Id;
            data[i].b_guestid = x.booking.guest_id;
            data[i].b_employeid = x.booking.employee_id;
            data[i].b_check_in_date = x.booking.check_in_date;
            if (x.booking.check_out_date != null)
            {
                data[i].b_check_out_date = x.booking.check_out_date.Value;
            }
            data[i].b_branch_id = x.booking.branch_id;
            data[i].b_guest_reg_card_arr_date = x.booking.guest_reg_card_arr_date;
            data[i].b_no_pax = x.booking.no_of_pax;
            data[i].r_id = x.booking_Room.id;
            data[i].r_roomid = x.booking_Room.roomid;
            data[i].r_rent = x.booking_Room.booking_rent;
            data[i].r_checkout = x.booking_Room.checkout;
            data[i].r_bid = x.booking_Room.bookingId;
            i++;
        }
        return data;
    }
}