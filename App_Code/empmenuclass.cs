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
        {//add branch id in rom service menu
            
            ctownDataContext db = new ctownDataContext();
            int count = (from x in db.room_service_menus
                         join orderitem in db.room_service_menus on x.bid equals orderitem.bid
                         where r.item_name == x.item_name && r.price == x.price && r.bid==x.bid
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
    public static IQueryable<room_service_menu> getMenuItem(int bid)
    {
       
            ctownDataContext db = new ctownDataContext();
            IQueryable<room_service_menu> rsm = (from x in db.room_service_menus
                                                 where x.bid==bid
                                                 orderby x.type descending
                                                 select x);
            return rsm;
    }
    public static bool placeOrder(placed_order p)
    {

        ctownDataContext db = new ctownDataContext();
        db.placed_orders.InsertOnSubmit(p);
        db.SubmitChanges();
        return true;
    }


    public static orderdetail_attr[] getOrderPLaced(int bid,string  roomno)
    {

        ctownDataContext db = new ctownDataContext();
        var orders = from x in db.placed_orders
                     join orderdetail in db.room_service_menus on x.item_id equals orderdetail.Id
                     where x.booking_id == bid && x.room_no==roomno
                     select new
                     {
                         placed_order = x,
                         room_service_menu = orderdetail
                     };
        orderdetail_attr[] order_detail = new orderdetail_attr[orders.Count()];
        int i = 0;
        foreach (var od in orders)
        {
            order_detail[i] = new orderdetail_attr();
            order_detail[i].order = od.placed_order;
            order_detail[i].rs_orde_menu = od.room_service_menu;
            i++;

        }
        return order_detail;
    }


    public static orderdetail_attr[] getRoomorders(string roomno, int bid)
    {
      int rid= roomsclass.getRoomID(roomno,bid);
        ctownDataContext db = new ctownDataContext();
        var orders = from x in db.bookings
                    join orderdetail in db.placed_orders on x.Id equals orderdetail.booking_id
                     join items in db.room_service_menus on orderdetail.item_id equals items.Id
                     join broom in db.booking_Rooms on x.Id equals broom.bookingId
                     orderby x.Id descending
                    where broom.roomid == rid && x.branch_id==bid && broom.checkout==null
                    select new
                    {
                        placed_order = orderdetail,
                        room_service_menu = items
                    };
       
        orderdetail_attr[] order_detail = new orderdetail_attr[orders.Count()];
        int i = 0;
        foreach (var od in orders)
        {
            order_detail[i] = new orderdetail_attr();
            order_detail[i].order = od.placed_order;
            order_detail[i].rs_orde_menu = od.room_service_menu;
            i++;

        }
        return order_detail;
    }

    public static orderdetail_attr[] getAllrecentItems(int bid)
    {
       // int rid = roomsclass.getRoomID(roomno, bid);
        ctownDataContext db = new ctownDataContext();
        var orders = from x in db.bookings
                     join orderdetail in db.placed_orders on x.Id equals orderdetail.booking_id
                     join items in db.room_service_menus on orderdetail.item_id equals items.Id
                     join broom in db.booking_Rooms on x.Id equals broom.bookingId
                     where x.branch_id == bid
                     select new
                     {
                         placed_order = orderdetail,
                         room_service_menu = items
                     };
        int numberofitems = 0;
        foreach (var od in orders)
        {
            if (ordercanelation_maxtime(od.placed_order.date) == true)
            {
                numberofitems++;
            }

        }



        orderdetail_attr[] order_detail = new orderdetail_attr[numberofitems];
        int i = 0;
        foreach (var od in orders)
        {
            if (ordercanelation_maxtime(od.placed_order.date) == true)
            {                
                order_detail[i] = new orderdetail_attr();
                order_detail[i].order = od.placed_order;
                order_detail[i].rs_orde_menu = od.room_service_menu;
                i++;
            }

        }
        return order_detail;
    }
    public static bool deleteplacedorders(int[] orderid)
    {
        bool check;
        ctownDataContext db = new ctownDataContext();
        foreach(int x in orderid)
        {
            placed_order item = (from o in db.placed_orders
                       where o.Id == x
                       select o).First();
            db.placed_orders.DeleteOnSubmit(item);
            db.SubmitChanges();
            check = true;
        }
        return true;
    }

    public static bool ordercanelation_maxtime(DateTime ordertime)
    {
        DateTime c_time = DateTime.Now;
        int differance =Convert.ToInt16(c_time.Subtract(ordertime).TotalMinutes);
        if (differance <= 200)
        {
            return true;
            
        }
        else
        {
            return false;
        }
    }

}