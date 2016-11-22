using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for roomassets
/// </summary>
public class roomassetclass
{
  
    public roomassetclass()
    {
       
    }
    public static int getRoomId(string rno)
    {
        ctownDataContext db = db = new ctownDataContext();
        int id = (from x in db.rooms
                     where x.room_no == rno
                     select x.Id).First();
        return id;
    }
    public static bool addinventry(room_asset r)
    {
        try
        {
             ctownDataContext db= db = new ctownDataContext(); 
            int count = (from x in db.room_assets
                         where x.room_id == r.room_id && x.label == r.label
                         select x).Count();
            if (count == 0)
            {
                db.room_assets.InsertOnSubmit(r);
                db.SubmitChanges();
                return true;
            }
            else
            {
                return false;
            }

        }
        catch (Exception ex)
        {
            return false;
        }
    }
    public static bool updateInventory(room_asset r ,int inventryid )
    {
        ctownDataContext db =  new ctownDataContext();
        var ra = (from x in db.room_assets
                                    where x.id ==inventryid
                                    select x).First();
        ra.label = r.label;
        ra.description = r.description;
        ra.total_item = r.total_item;
        int check = (from y in db.room_assets
                     where y.id == inventryid
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
    public static IQueryable<room_asset> getinventry( int roomid)
    {
        ctownDataContext db = db = new ctownDataContext();
        IQueryable<room_asset> ra = from x in db.room_assets
                                    where x.room_id == roomid
                                    select x;
        return ra;
    }
    public static room_asset getRoomAssetsInfo(int roomid, string inventory)
    {
        ctownDataContext db = db = new ctownDataContext();
        room_asset ra = (from x in db.room_assets
                                    where x.room_id == roomid && x.label == inventory
                                    select x).First();
        return ra;
    }
    public static IQueryable<room_asset> getAllRoomAssets(int bid,int roomid)
    {
        ctownDataContext db = db = new ctownDataContext();
        IQueryable<room_asset> ra = from x in db.room_assets
                                    join r in db.rooms on new { X1 = x.room_id, X2 = bid } equals new { X1 = r.Id, X2 = r.branch_id }   //and in linq 
                                    where x.room_id == roomid
                                    select x;
            return ra;
    }
}
