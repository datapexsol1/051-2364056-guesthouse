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

    public static bill setbill()
    {
        ctownDataContext db = new ctownDataContext();
        var ra = (from x in db.bills
                 
                  select x).First();
        return ra;
    }
    public static bool Addbill(bill b)
    {
        bool return_ = false;
        ctownDataContext db = new ctownDataContext();
        int count = (from x in db.bills
                     where x.Id == b.Id && x.Date == b.Date && x.BillType == b.BillType   //for checking already existance
                     select x).Count();
        if (count == 0)
        {

            try
            {
                db.bills.InsertOnSubmit(b);
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



    public static IQueryable<bill> getBranchbills(int bid)
    {
        ctownDataContext db = new ctownDataContext();
        IQueryable<bill> bil = from b in db.bills
                               where b.BranchId == bid
                               select b;
        return bil;
    }




    public static bool updateBills(bill b, int branchID)
    {

        ctownDataContext db = new ctownDataContext();
        var ra = (from x in db.bills
                  where x.BranchId == branchID && x.BillType == b.BillType && x.Date == b.Date
                  select x).First();

        ra.BillAmount = b.BillAmount;
        // ra.BillType = b.BillType;
        //ra.Date = b.Date;
        int check = (from y in db.bills
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

    public static IQueryable<bill> getAllbills(int bid)
    {
        ctownDataContext db = new ctownDataContext();
        IQueryable<bill> bil = from b in db.bills
                               where b.BranchId == bid
                               select b;
        return bil;
    }
    public static IQueryable<bill> getAllBills(int bid)
    {
        ctownDataContext db = db = new ctownDataContext();
        IQueryable<bill> ra = from x in db.bills
                                  //  join r in db.rooms on new { X1 = x.room_id, X2 = bid } equals new { X1 = r.Id, X2 = r.branch_id }   //and in linq 
                              where x.BranchId == bid
                              select x;
        return ra;
    }
    public static int retrieveBillItem(string val, DateTime date, int branchId)
    {

        ctownDataContext db = db = new ctownDataContext();
        int billid = (from b in db.GetTable<bill>()
                      where b.BillType == val && b.Date == date && b.BranchId == branchId
                      select b.Id).First();

        return billid;

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
    public static List<bill> getBillItem(string val, int branchId)
    {

        ctownDataContext db = db = new ctownDataContext();

        List<bill> billid = (from b in db.GetTable<bill>()
                             where b.BranchId == branchId && b.BillType == val
                             select b).ToList();
        List<bill> selectedbills = new List<bill>();
        foreach (bill x in billid)
        {
            TimeSpan subtractdate = (DateTime.Now.Subtract(x.Date));
            int days = subtractdate.Days;
            if (days == 0)
            {
                //bill b = (bill)x;
                selectedbills.Add(x);
            }
        }
        return selectedbills;

    }

    public static bool isBillPaid(string billType, int bid)
    {
        ctownDataContext db = db = new ctownDataContext();
        int billPaid = (from x in db.bills
                        where x.Date.Month == DateTime.Now.Month && x.BillType == billType && x.BranchId == bid
                        select x).Count();
        if (billPaid >= 1)
        {
            return false;
        }
        else
        {
            return true;
        }

    }
    public static bill latestcheckHouseRentYear(int bid)
    {
     //   abamount
        ctownDataContext db = db = new ctownDataContext();
        int check = (from x in db.bills            
                  where x.BranchId == bid && x.BillType == "House Rent"
                  select x).Count();
        if (check >= 1)
        {
            bill b = (from x in db.bills
                      orderby x.Date descending
                      where x.BranchId == bid && x.BillType == "House Rent"
                      select x).First();

            return b;
        }
        else
        {
            return null;
        }
        
  

    }
    public static bill oldestcheckHouseRentYear(int bid)
    {
        //   abamount
        ctownDataContext db = db = new ctownDataContext();
        bill b = new bill();
        try
        {
            b = (from x in db.bills
                      orderby x.Date ascending
                      where x.BranchId == bid && x.BillType == "House Rent"
                      select x).First();
            return b;
        }
        catch
        {
            return null;
        }
        
    }
    
}