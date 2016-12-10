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
}