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
        ogb.seen = "no";
        ctownDataContext db = new ctownDataContext();
        int count = (from x in db.GetTable<online_guest_booking>()
                     where  x.guest_cnic_passport == ogb.guest_cnic_passport &&
                     x.check_in_date == ogb.check_in_date && x.check_out_date == ogb.check_out_date && x.no_of_room==ogb.no_of_room
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
    public static bool temporaryBooking(online_guest_booking ogb)
    {
        try
        {
            ogb.seen = "no";
            ctownDataContext db = new ctownDataContext();
            int count = (from x in db.GetTable<online_guest_booking>()
                         where x.guest_cnic_passport == ogb.guest_cnic_passport &&
                         x.check_in_date == ogb.check_in_date && x.check_out_date == ogb.check_out_date && x.no_of_room == ogb.no_of_room
                         select new
                         {
                             x.Id
                         }).Count();
            if (count == 0)
            {
                db.online_guest_bookings.InsertOnSubmit(ogb);
                db.SubmitChanges();
                //  return true;

            }
            else
            {
                return false;
            }

            string roomstring = ogb.no_of_room;
            string[] roomstobook = roomstring.Split(',');
            foreach (string rm in roomstobook)
            {
                room r = (from x in db.rooms
                          where x.room_no == rm
                          select x).First();
                r.temporarybooked = "yes";
                r.availbilty = "no";
               // db.rooms.InsertOnSubmit(r);
                db.SubmitChanges();
            }
            return true;
        }
        catch (Exception ex)
        {
            return false; 
        }
        

    }
    public static void updateTemorarybookingRoom(online_guest_booking ogb)
    {
        ctownDataContext db = new ctownDataContext();
        online_guest_booking checkrooms = (from x in db.online_guest_bookings
                         where ogb.Id == x.Id
                         select x).First();
        if (checkrooms.no_of_room == ogb.no_of_room)
        {
            checkrooms.check_in_date = ogb.check_in_date;
            checkrooms.check_out_date = ogb.check_out_date;
            checkrooms.guest_name = ogb.guest_name;
            checkrooms.guest_phone = ogb.guest_phone;
            checkrooms.no_of_guest = ogb.no_of_guest;
            checkrooms.no_of_room = ogb.no_of_room;
            checkrooms.guest_email = ogb.guest_email;
            checkrooms.Comments = ogb.Comments;
            checkrooms.referance_by_name = ogb.referance_by_name;
            checkrooms.referance_by_contact = ogb.referance_by_contact;
            checkrooms.guest_cnic_passport = ogb.guest_cnic_passport;
            checkrooms.room_rent = ogb.room_rent;
            checkrooms.Id = ogb.Id;
            db.SubmitChanges();
        }
        else
        {
           
            List<string> roomtocanel = checkrooms.no_of_room.Split(',').ToList();
            string[] newrooms = ogb.no_of_room.Split(',');
            foreach(string n in newrooms)
            {
                foreach(string o in roomtocanel)
                {
                    if (n == o)
                    {
                        roomtocanel.Remove(o);
                        break;
                    }
                }
            }

            bookingRoomClass.Cancel_booking_Room(roomtocanel);
            if (ogb.check_in_date != null && ogb.check_out_date != null)
            {
                checkrooms.check_in_date = ogb.check_in_date;
                checkrooms.check_out_date = ogb.check_out_date;
            }
            checkrooms.guest_name = ogb.guest_name;
            checkrooms.guest_phone = ogb.guest_phone;
            checkrooms.no_of_guest = ogb.no_of_guest;
            checkrooms.no_of_room = ogb.no_of_room;
            checkrooms.guest_email = ogb.guest_email;
            checkrooms.Comments = ogb.Comments;
            checkrooms.referance_by_name = ogb.referance_by_name;
            checkrooms.referance_by_contact = ogb.referance_by_contact;
            checkrooms.guest_cnic_passport = ogb.guest_cnic_passport;
            checkrooms.room_rent = ogb.room_rent;
            checkrooms.Id = ogb.Id;
            db.SubmitChanges();
        }
    }

    public static online_guest_booking getTemporaryBookingRoom(string roomno)
    {
        online_guest_booking findbookingroom = new online_guest_booking();
        ctownDataContext db = new ctownDataContext();
        var bookings = from x in db.online_guest_bookings
                       select x; 
        foreach(var x in bookings)
        {
            string[] splitroomnos = x.no_of_room.Split(',');
            foreach(string room in splitroomnos)
            {
                if (room == roomno)
                {

                    return x; 

                }
            }
        }
        return findbookingroom;
    }
}