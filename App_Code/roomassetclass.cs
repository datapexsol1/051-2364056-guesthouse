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
