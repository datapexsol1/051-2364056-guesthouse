using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for branchClass
/// </summary>
public class branchClass
{
    public branchClass()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static bool addbranch(branch b)
    {
        ctownDataContext db = new ctownDataContext();
        int count = (from x in db.GetTable<branch>()
                     where x.name == b.name || x.brachno == b.brachno
                     select new {
                         x.Id }).Count();
        if (count == 0)
        {
            db.branches.InsertOnSubmit(b);
            db.SubmitChanges();
            return true;

        }
        else
        {
            return false;
        }


    }
    public static IQueryable<branch> getBrachesinfo()
    {
        ctownDataContext db = new ctownDataContext();
        IQueryable<branch> branches= (from b in db.GetTable<branch>()
                           select b);
        return branches;
                
    }
}