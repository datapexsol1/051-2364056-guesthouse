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
}