using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for guestservice_class
/// </summary>
public class guestservice_class
{
    public guestservice_class()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static IQueryable<guest_service> getAllService(int bid)
    {
        ctownDataContext db = new ctownDataContext();
        IQueryable<guest_service> gs =( from b in db.guest_services
                                       where b.branch_id == bid
                                       select b).Distinct();
        return gs;
    }
    public static IQueryable<guest_service> getRoomNo(int bid, string type)
    {
        ctownDataContext db = new ctownDataContext();
        IQueryable<guest_service> gs = from b in db.guest_services
                                       where b.branch_id == bid && b.type == type
                                       select b;
        return gs;
    }
    public static bool addService(guest_service b)
    {
        bool return_ = false;
        ctownDataContext db = new ctownDataContext();
        int count = (from x in db.guest_services
                     where x.Id == b.Id && x.type == b.type && x.date_time == b.date_time   //for checking already existance
                     select x).Count();
        if (count == 0)
        {

            try
            {
                db.guest_services.InsertOnSubmit(b);
                db.SubmitChanges();
                return_ = true;
            }
            catch (ChangeConflictException e)
            {
                return_ = false;
            }

        }
        return return_;
    }
    public static booking_Room getBooking(string roomNo, int bid)
    {
        ctownDataContext db = new ctownDataContext();
        int roomId = (from x in db.rooms
                      where x.room_no == roomNo && x.branch_id==bid
                      select x.Id).First();
        booking_Room bookingRoomInfo = (from x in db.booking_Rooms
                                             join r in db.rooms on new { X1 = x.roomid, X2 = bid } equals new { X1 = r.Id, X2 = r.branch_id }

                                      //  join r in db.rooms on x.roomid equals r.Id  
                                        orderby x.roomid descending
                                where x.checkout==null  && r.room_no==roomNo && r.branch_id == bid
                                select x).First();

        return bookingRoomInfo;
    }
    public static List<guest_service> getDate(int bid, string type, string roomno)
    {
        ctownDataContext db = new ctownDataContext();
        List<guest_service> gs = (from b in db.guest_services
                                  where b.branch_id == bid && b.type == type && b.room_no == roomno
                                  select b).ToList();

        List<guest_service> selectedDates = new List<guest_service>();
        foreach (guest_service x in gs)
        {

            DateTime d1 = DateTime.Parse(x.date_time.ToShortTimeString());
            DateTime d2 = DateTime.Parse(DateTime.Now.ToShortTimeString());
            // DateTime.Subtract(DateTime);
            double d3 = d2.Subtract(d1).TotalMinutes;

            if (d3 <= 30)
            {
                selectedDates.Add(x);
            }


        }
        return selectedDates;
    }
    public static guest_service getInfoForUpdate(int bid, string type, string roomno, DateTime date,int bookingId)
    {
        ctownDataContext db = new ctownDataContext();
        guest_service gs = (from b in db.guest_services
                                  where b.branch_id == bid && b.type == type && b.room_no == roomno && b.booking_id==bookingId
                                  select b).First();
        return gs;
    }
    public static bool updateService(guest_service gs,DateTime d,int bookid)
    {
        ctownDataContext db = new ctownDataContext();
        var ugs = (from b in db.guest_services
                            where b.branch_id == gs.branch_id && b.type == gs.type && b.room_no == gs.room_no && b.booking_id ==bookid
                            select b).First();
        ugs.item_cost = gs.item_cost;
        ugs.item_quantity = gs.item_quantity;
        ugs.description = gs.description;


        int check = (from y in db.guest_services
                     where y.Id == ugs.Id
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
    public static List<guestresvices_attributeclass> getlaundryandcarrent(int bid, string roomno)//booking id
    {

        ctownDataContext db = new ctownDataContext();
        var result = from g in db.guests
                     join b in db.bookings on g.Id equals b.guest_id

                     join br in db.booking_Rooms on b.Id equals br.bookingId
                     join r in db.rooms on br.roomid equals r.Id
                     join roomservice in db.guest_services on b.Id equals roomservice.booking_id
                     where b.Id==bid && r.room_no==roomno
                     select new
                     {
                         guest = g,
                         room = r,
                         guest_service= roomservice

                     };
        List<guestresvices_attributeclass> ls = new List<guestresvices_attributeclass>();
        foreach(var x in result)
        {
            guestresvices_attributeclass temp = new guestresvices_attributeclass();
            temp.g = x.guest;
            temp.r = x.room;
            temp.gs = x.guest_service;
            ls.Add(temp);
        }
        return ls;

        
    }
}