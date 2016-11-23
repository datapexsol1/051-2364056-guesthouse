using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for menuservice
/// </summary>
public class menuservice
{
    public menuservice()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static int getId(int bid, string type, string item)
    {
        ctownDataContext db = db = new ctownDataContext();
        int id = (from x in db.room_service_menus
                  where x.bid == bid && x.type == type && x.item_name == item
                  select x.Id).First();
        return id;
    }

    public static bool updateMenu(room_service_menu r, int bid, int id)
    {
        ctownDataContext db = db = new ctownDataContext();
        var ra = (from x in db.room_service_menus
                  where x.bid == bid && x.Id == id
                  select x).First();
        ra.type = r.type;
        ra.item_name = r.item_name;
        ra.price = r.price;
        ra.quantity = r.quantity;
        int check = (from y in db.room_service_menus
                     where y.Id == ra.Id
                     select y).Count();
        if (check == 1)
        {
            db.SubmitChanges();
            return true;
        }
        else
        {
            return false;
        }
    }
    public static IQueryable<room_service_menu> getMenuItem(string type, int bid)
    {
        ctownDataContext db = db = new ctownDataContext();
        IQueryable<room_service_menu> rs = from x in db.room_service_menus
                                           where x.bid == bid && x.type == type
                                           select x;
        return rs;
    }
    public static IQueryable<room_service_menu> getMenuInfo(string type, int bid, string item)
    {
        ctownDataContext db = db = new ctownDataContext();
        IQueryable<room_service_menu> rs = from x in db.room_service_menus
                                           where x.bid == bid && x.type == type && x.item_name == item
                                           select x;
        return rs;
    }
}