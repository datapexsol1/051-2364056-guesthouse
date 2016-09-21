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
    public static bool addMenuItem(room_service_menu r)
    {
        try
        {
            
            ctownDataContext db = new ctownDataContext();
            int count = (from x in db.room_service_menus
                         where r.item_name == x.item_name && r.price == x.price
                         select x).Count();
            if (count == 0)
            {
                db.room_service_menus.InsertOnSubmit(r);
                db.SubmitChanges();
                return true;
            }else
            {
                return false;
            }
        }catch(Exception ex)
        {
            return false;
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