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
    public static IQueryable<Branch_asset> getAllBranchAssets(int bid)
    {
        ctownDataContext db = db = new ctownDataContext();
        IQueryable<Branch_asset> ra = from x in db.Branch_assets
                                  //  join r in db.rooms on new { X1 = x.room_id, X2 = bid } equals new { X1 = r.Id, X2 = r.branch_id }   //and in linq 
                                    where x.bid == bid
                                    select x;
        return ra;
    }
}