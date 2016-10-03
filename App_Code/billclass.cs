using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for billclass
/// </summary>
public class billclass
{
    public billclass()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static bill getBills(int id, DateTime date, string type, int branchID)
    {

        ctownDataContext db = db = new ctownDataContext();
        bill b = (from x in db.bills
                      //  join r in db.rooms on new { X1 = x.room_id, X2 = bid } equals new { X1 = r.Id, X2 = r.branch_id }   //and in linq 
                  where x.Id == id && x.Date == date && x.BillType == type && x.BranchId == branchID
                  select x).First();
        return b;
    }

    public static bool Addbill(bill b)
    {
        ctownDataContext db = new ctownDataContext();
        int count = (from x in db.bills 
                     where x.Id == b.Id     //for checking already existance
                     select x).Count();
        if (count == 0)
        {
            db.bills.InsertOnSubmit(b);
            try
            {
                db.SubmitChanges();
            }
            catch (ChangeConflictException e)
            {
                //report error, log error whatever...
            }
            return true;
        }
        else
        {
            return true;
        }






    }



    public static IQueryable<bill> getAllbills(int pid)
    {
        ctownDataContext db = new ctownDataContext();
        IQueryable<bill> bil = from b in db.bills
                             select b;
        return bil;
    }




    public static void updateBills(bill b, int billid)
    {

        ctownDataContext db = new ctownDataContext();
        var ra = (from x in db.bills
                  where x.Id == billid
                  select x).First();
       
        ra.BillAmount = b.BillAmount;
        ra.BillType = b.BillType;
        ra.Date = b.Date;
   //     int check = (from y in db.bills
    //                 where y.Id == ra.Id
     //                select y).Count();
     //   if (check == 0)
     //   {
            db.SubmitChanges();
        //}
    }
    public static IQueryable<bill> getAllBills( int bid)
    {
        ctownDataContext db = db = new ctownDataContext();
        IQueryable<bill> ra = from x in db.bills
                                  //  join r in db.rooms on new { X1 = x.room_id, X2 = bid } equals new { X1 = r.Id, X2 = r.branch_id }   //and in linq 
                             where x.BranchId == bid
                              select x;
        return ra;
    }
    public static IQueryable<DateTime> getBillItem(string val ,int branchId)
    {
       
        ctownDataContext db = db = new ctownDataContext();
        IQueryable<DateTime> billid = from b in db.GetTable<bill>()
                      where b.BillType == val && b.BranchId==branchId
                      select b.Date  ;

        return billid;

    }
    public static int retrieveBillItem(string val, int branchId)
    {

        ctownDataContext db = db = new ctownDataContext();
        int billid = (from b in db.GetTable<bill>()
                                      where b.BillType == val && b.BranchId == branchId
                                      select b.Id).First();

        return billid;

    }
    public static IQueryable<bill> getBillDInfo()
    {

        ctownDataContext db = db = new ctownDataContext();
        IQueryable<bill> ra = from x in db.bills
                                  //where x.Id == id
                              select x;
        return ra;

    }

}