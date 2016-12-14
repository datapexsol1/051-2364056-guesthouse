using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bookingRoomClass
/// </summary>
public class bookingRoomClass
{
    public bookingRoomClass()
    {
       
    }
    public static void booking_Room(booking_Room[] rooms)
    {
        ctownDataContext db = new ctownDataContext();
        foreach(booking_Room b in rooms)
        {
            db.booking_Rooms.InsertOnSubmit(b);
            db.SubmitChanges();
        }
    }
    public static void Cancel_booking_Room(List<string> cb)
    {
        ctownDataContext db = new ctownDataContext();
        foreach (string c in cb)
        {
            room cancelroom = (from x in db.rooms
                               where x.room_no == c
                               select x).First();
            cancelroom.temporarybooked = "no";
            cancelroom.availbilty = "yes";
            db.SubmitChanges();
        }
    }
   
    public static int getbookingid(string roomno)
    {

        ctownDataContext db = new ctownDataContext();
        int orders = (from x in db.booking_Rooms
                      join room in db.rooms on x.roomid equals room.Id
                      join bookingid in db.bookings on x.bookingId equals bookingid.Id
                      where room.room_no == roomno
                      select bookingid.Id).First();
                     

        return orders;
    }
    public static bool checkBookingRoomcheckout(int bookingid)
    {
        ctownDataContext db = new ctownDataContext();

        int totalrooms = (from x in db.booking_Rooms
                          where x.bookingId == bookingid
                          select x).Count();

        int Checkoutroom= (from x in db.booking_Rooms
                 join r in db.rooms on x.roomid equals r.Id
                 where x.bookingId == bookingid && r.availbilty=="yes"
                 select x).Count();
        if (totalrooms==Checkoutroom)
        {
            return true;

        }
        else
        {
            return false;
        }
    }
    public static List<bookingroomdetailclass> Getbookingandroomdetail(int branch)
    {
        ctownDataContext db = new ctownDataContext();
        var result = from x in db.bookings
                     join w in db.guests on x.guest_id equals w.Id
                     join y in db.booking_Rooms on x.Id equals y.bookingId
                     join z in db.rooms on y.roomid equals z.Id
                     where x.branch_id==branch && x.check_out_date==null
                     select new
                     {
                         booking = x,
                         booking_Room = y,
                         room = z,
                         guest=w
                     };
        List<bookingroomdetailclass> brattribute = new List<bookingroomdetailclass>();
        foreach (var res in result)
        {

            string cnisorpass;
            if (res.guest.cnic == null)
            {
                cnisorpass = res.guest.f_passport_no;
            }else
            {
                cnisorpass = res.guest.cnic;
            }
            brattribute.Add(new bookingroomdetailclass()
                {


                     b_checkinDate=res.booking.check_in_date,
                     b_roomno=res.room.room_no,
                     b_no_pax=res.booking.no_of_pax,
                     g_reg_no=res.guest.reg_no,
                     g_guest_name=res.guest.guest_name,
                     g_cnic_orpassport = cnisorpass,
                     g_date_of_birth=res.guest.date_of_birth,
                     g_f_nationality=res.guest.f_nationality,
                     booking_id=res.booking.Id,
                     booking_rent=res.booking_Room.booking_rent,
                     phone=res.guest.mobile
                });

        }
        return brattribute; 
    }
 }