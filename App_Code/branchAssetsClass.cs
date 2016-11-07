using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for branchAssetsClass
/// </summary>
public class branchAssetsClass
{
    public branchAssetsClass()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static bool addinventry(Branch_asset b)
    {
        try
        {
            ctownDataContext db = db = new ctownDataContext();
            int count = (from x in db.Branch_assets
                         where x.bid == b.bid && x.title == b.title
                         select x).Count();
            if (count == 0)
            {
                db.Branch_assets.InsertOnSubmit(b);
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
    public static int getBranchAssetsId(int id, string val)
    {
        ctownDataContext db = new ctownDataContext();
        int assetsId = (from b in db.GetTable<Branch_asset>()
                        where b.bid == id && b.title == val
                        select b.id).First();

        return assetsId;
    }
    public static IQueryable<Branch_asset> getAllBranchAssets(int bid)
    {
        ctownDataContext db = db = new ctownDataContext();
        IQueryable<Branch_asset> ra = from x in db.Branch_assets
                                  //  join r in db.rooms on new { X1 = x.room_id, X2 = bid } equals new { X1 = r.Id, X2 = r.branch_id }   //and in linq 
                                    where x.bid == bid
                                    select x;
        return ra;
    }
    public static Branch_asset getBranchAssets(int bid, string val)
    {
        ctownDataContext db = db = new ctownDataContext();
        Branch_asset ra = (from x in db.Branch_assets
                               //  join r in db.rooms on new { X1 = x.room_id, X2 = bid } equals new { X1 = r.Id, X2 = r.branch_id }   //and in linq 
                           where x.bid == bid && x.title==val
                           select x).First();
        return ra;
    }
    public static bool updateBranchAssets(Branch_asset r, int id)
    {
        ctownDataContext db = new ctownDataContext();
        var ra = (from x in db.Branch_assets
                  where x.id == id
                  select x).First();
        ra.title = r.title;
        ra.description = r.description;
        ra.no_item = r.no_item;
        int count = (from x in db.Branch_assets
                     where x.id ==id 
                     select x).Count();
        if (count == 1)
        {


            db.SubmitChanges();
            return true;
        }
        else
        {
            return false;
        }
        
    }
}