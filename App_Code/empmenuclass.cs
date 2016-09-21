using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for empmenuclass
/// </summary>
public class empmenuclass
{
    public empmenuclass()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static void addMenuItem(room_service_menu r)
    {
        try
        {
            ctownDataContext db = new ctownDataContext();
            db.room_service_menus.InsertOnSubmit(r);
            db.SubmitChanges(); 
        }catch(Exception ex)
        {

        }
    }
    public static IQueryable<room_service_menu> getMenuItem()
    {
       
            ctownDataContext db = new ctownDataContext();
            IQueryable<room_service_menu> rsm = (from x in db.room_service_menus
                                                 orderby x.type descending
                                                 select x);
            return rsm;
    }
}