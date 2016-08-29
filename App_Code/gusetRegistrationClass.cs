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
    public static void RoomBooking(guest g, booking b)
    {
        ctownDataContext db = new ctownDataContext();
        db.guests.InsertOnSubmit(g);
        db.SubmitChanges();


    }
    public static bool CheckGhustExistance(string cnicorpassport)
    {
        //return false when record does not exist
        ctownDataContext db = new ctownDataContext();
        var result= (from gust in db.GetTable<guest>()

                                   where gust.cnic == cnicorpassport || gust.f_passport_no==cnicorpassport
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