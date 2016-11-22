using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for roomsclass
/// </summary>
public class roomsclass
{
    public roomsclass()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static bool updateRoom(room rm, int bid)
    {
        ctownDataContext db = new ctownDataContext();
        var ra = (from x in db.rooms
                  where x.branch_id == bid && x.room_no == rm.room_no
                  select x).First();

        ra.room_no = rm.room_no;
        ra.room_type = rm.room_type;
        ra.minimum_room_rent = rm.minimum_room_rent;
        ra.maximum_room_rent = rm.maximum_room_rent;
        ra.room_size = rm.room_size;

        int check = (from y in db.rooms
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
    public static room getroom(int bid)
    {
        ctownDataContext db = new ctownDataContext();
        room r = (from x in db.rooms
                        orderby x.Id descending
                        where x.branch_id == bid
                        select x).First();
        return r;

    }
    public static room getRoomInfo(string selectRoomNo, int branchID)
    {
        ctownDataContext db = new ctownDataContext();
        room getInfo = (from x in db.rooms
                        where x.room_no == selectRoomNo && x.branch_id == branchID
                        select x).First();
        return getInfo;
    }
    public  static bool Addroom(room r)
    {
        ctownDataContext db = new ctownDataContext();
        int count = (from x in db.rooms
                     where x.branch_id == r.branch_id && x.room_no==r.room_no     //for checking already existance of client
                     select x).Count();
        if (count == 0)
        {
            db.rooms.InsertOnSubmit(r);
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch (ChangeConflictException e)
            {
                //report error, log error whatever...
                return false;
            }
            
        }
        else
        {
            return false;
        }

        
    }
    public  static IQueryable<room> getAvailableRooms(int bid)
    {
        ctownDataContext db = new ctownDataContext();
        IQueryable<room> rom = from r in db.rooms
                 
                   where r.availbilty=="yes" && r.branch_id==bid
                   select r;
        return rom;
    }
    public static int getAvailableRoomNos(int bid)
    {
        ctownDataContext db = new ctownDataContext();
        int num = (from r in db.rooms

                               where r.availbilty == "yes" && r.branch_id == bid
                               select r).Count();
        return num;
    }
    public static IQueryable<room> getBookedROoms(int bid)
    {
        ctownDataContext db = new ctownDataContext();
        IQueryable<room> rom = from r in db.rooms

                               where r.availbilty == "no" && r.branch_id == bid
                               select r;
        return rom;
    }
    public static IQueryable<room> getAllRooms(int bid)
    {
        ctownDataContext db = new ctownDataContext();
        IQueryable<room> rom = from r in db.rooms

                               where  r.branch_id == bid
                               select r;
        return rom;
    }
   

    public static int getRoomID(string roomno,int bid)
    {
        ctownDataContext db = new ctownDataContext();
        int romid = (from r in db.GetTable<room>()
                     where r.room_no == roomno && r.branch_id==bid
                     select r.Id).First();
                    
        return romid;
    }
    public static string getRoomNo(int rid, int bid)
    {
        ctownDataContext db = new ctownDataContext();
        string romid = (from r in db.GetTable<room>()
                     where r.Id == rid && r.branch_id == bid
                     select r.room_no).First();

        return romid;
    }
    public static string checkroomAvalbilty(int rid, int bid)
    {
        ctownDataContext db = new ctownDataContext();
        string availbity = (from r in db.GetTable<room>()
                        where r.Id == rid && r.branch_id == bid
                        select r.availbilty).First();

        return availbity;
    }
}