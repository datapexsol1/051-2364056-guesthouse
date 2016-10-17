using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for admingraphclass
/// </summary>
public class admingraphclass
{
    public admingraphclass()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static int[] getTotalExpendeture()
    {
        ctownDataContext db = new ctownDataContext();
        var ex_bill= from x in db.bills
                 select x;
        int[] monthlyvalue = new int[12];
        foreach (var b in ex_bill)
        {
            DateTime date = b.Date;
            string month = date.ToString("MMMM");
            if (month == "January")
            {
                monthlyvalue[0] += b.BillAmount;
            }
            else if (month == "February")
            {
                monthlyvalue[1] += b.BillAmount;
            }
            else if (month == "March")
            {
                monthlyvalue[2] += b.BillAmount;
            }
            else if (month == "April")
            {
                monthlyvalue[3] += b.BillAmount;
            }
            else if (month == "May")
            {
                monthlyvalue[4] += b.BillAmount;
            }
            else if (month == "June")
            {
                monthlyvalue[5] += b.BillAmount;
            }
            else if (month == "July")
            {
                monthlyvalue[6] += b.BillAmount;
            }
            else if (month == "August")
            {
                monthlyvalue[7] += b.BillAmount;
            }
            else if (month == "September")
            {
                monthlyvalue[8] += b.BillAmount;
            }
            else if (month == "October")
            {
                monthlyvalue[9] += b.BillAmount;
            }
            else if (month == "November")
            {
                monthlyvalue[10] += b.BillAmount;
            }
            else if (month == "December")
            {
                monthlyvalue[11] += b.BillAmount;
            }
        }

        var emp_salary = from x in db.employesalaries
                         select x;
        foreach (var b in emp_salary)
        {
            DateTime date = b.payment_date;
            string month = date.ToString("MMMM");
            if (month == "January")
            {
                monthlyvalue[0] += int.Parse(b.amount);
            }
            else if (month == "February")
            {
                monthlyvalue[1] += int.Parse(b.amount);
            }
            else if (month == "March")
            {
                monthlyvalue[2] += int.Parse(b.amount);
            }
            else if (month == "April")
            {
                monthlyvalue[3] += int.Parse(b.amount);
            }
            else if (month == "May")
            {
                monthlyvalue[4] += int.Parse(b.amount);
            }
            else if (month == "June")
            {
                monthlyvalue[5] += int.Parse(b.amount);
            }
            else if (month == "July")
            {
                monthlyvalue[6] += int.Parse(b.amount);
            }
            else if (month == "August")
            {
                monthlyvalue[7] += int.Parse(b.amount);
            }
            else if (month == "September")
            {
                monthlyvalue[8] += int.Parse(b.amount);
            }
            else if (month == "October")
            {
                monthlyvalue[9] += int.Parse(b.amount);
            }
            else if (month == "November")
            {
                monthlyvalue[10] += int.Parse(b.amount);
            }
            else if (month == "December")
            {
                monthlyvalue[11] += int.Parse(b.amount);
            }
        }

            return monthlyvalue;

    }
    public static int[] getTotalIncome()
    {
        ctownDataContext db = new ctownDataContext();
        var roombill = from x in db.total_payments
                       select x;
        int[] monthlyvalue = new int[12];
        foreach (var b in roombill)
        {
            DateTime date = b.paymentdate;
            string month = date.ToString("MMMM");
            if (month == "January")
            {
                monthlyvalue[0] += int.Parse(b.paid_amount);
            }
            else if (month == "February")
            {
                monthlyvalue[1] +=int.Parse( b.paid_amount);
            }
            else if (month == "March")
            {
                monthlyvalue[2] += int.Parse(b.paid_amount);
            }
            else if (month == "April")
            {
                monthlyvalue[3] += int.Parse(b.paid_amount);
            }
            else if (month == "May")
            {
                monthlyvalue[4] += int.Parse(b.paid_amount);
            }
            else if (month == "June")
            {
                monthlyvalue[5] += int.Parse(b.paid_amount);
            }
            else if (month == "July")
            {
                monthlyvalue[6] += int.Parse(b.paid_amount);
            }
            else if (month == "August")
            {
                monthlyvalue[7] += int.Parse(b.paid_amount);
            }
            else if (month == "September")
            {
                monthlyvalue[8] += int.Parse(b.paid_amount);
            }
            else if (month == "October")
            {
                monthlyvalue[9] += int.Parse(b.paid_amount);
            }
            else if (month == "November")
            {
                monthlyvalue[10] += int.Parse(b.paid_amount);
            }
            else if (month == "December")
            {
                monthlyvalue[11] += int.Parse(b.paid_amount);
            }
        }

       
        return monthlyvalue;

    }
    public static IQueryable<branch> getAllbranches()
    {
        ctownDataContext db = new ctownDataContext();
        IQueryable<branch> b = (from x in db.branches
                          select x);
        return b;

    }
    public static IQueryable<total_payment> getbranchweeklyincome(string branc)
    {
       
        ctownDataContext db = new ctownDataContext();
        int branc_id = branchClass.getBranchID(branc);
        IQueryable < total_payment > b = (from x in db.bookings
                                          join tp in db.total_payments on x.Id equals tp.booking_id
                                          where x.branch_id ==branc_id
                                select tp);
        return b;

    }

}