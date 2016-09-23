﻿using System;
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


}