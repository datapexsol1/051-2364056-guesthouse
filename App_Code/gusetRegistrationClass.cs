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
   

}