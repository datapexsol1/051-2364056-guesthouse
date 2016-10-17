using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for admingraphclass
/// </summary>
public static class admingraphclass
{
    //public admingraphclass()
    //{
    //    //
    //    // TODO: Add constructor logic here
    //    //
    //}
    public static int[] getTotalExpendeture()
    {
        ctownDataContext db = new ctownDataContext();
        var ex_bill = from x in db.bills
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




    public static int[] getTotalweeklybranchexpenditure(string branchnAME, string date)
    {
        ctownDataContext db = new ctownDataContext();

        int[] list = new int[7];
        if (branchnAME == "")
        {
            var ex_bill = from x in db.bills
                          select x;
            if (date == "")
            {
                foreach (var p in ex_bill)
                {
                    if (CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(p.Date, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday) == CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(DateTime.Now, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday))
                    {
                        if (p.Date.ToString("ddd") == "Mon")
                        {
                            list[0] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Tue")
                        {
                            list[1] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Wed")
                        {
                            list[2] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Thu")
                        {
                            list[3] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Fri")
                        {
                            list[4] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Sat")
                        {
                            list[5] += p.BillAmount;
                        }
                        else
                        {
                            list[6] += p.BillAmount;
                        }
                    }
                }

                var emp_salary = from x in db.employesalaries
                                 select x;
                foreach (var p in emp_salary)
                {

                    if (CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(p.payment_date, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday) == CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(DateTime.Now, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday))
                    {
                        if (p.payment_date.ToString("ddd") == "Mon")
                        {
                            list[0] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Tue")
                        {
                            list[1] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Wed")
                        {
                            list[2] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Thu")
                        {
                            list[3] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Fri")
                        {
                            list[4] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Sat")
                        {
                            list[5] += int.Parse(p.amount);
                        }
                        else
                        {
                            list[6] += int.Parse(p.amount);
                        }
                    }
                }
            }
            else
            {
                foreach (var p in ex_bill)
                {
                    if (CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(p.Date, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday) == CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(DateTime.Parse(date), CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday))
                    {
                        if (p.Date.ToString("ddd") == "Mon")
                        {
                            list[0] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Tue")
                        {
                            list[1] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Wed")
                        {
                            list[2] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Thu")
                        {
                            list[3] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Fri")
                        {
                            list[4] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Sat")
                        {
                            list[5] += p.BillAmount;
                        }
                        else
                        {
                            list[6] += p.BillAmount;
                        }
                    }
                }

                var emp_salary = from x in db.employesalaries
                                 select x;
                foreach (var p in emp_salary)
                {

                    if (CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(p.payment_date, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday) == CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(DateTime.Parse(date), CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday))
                    {
                        if (p.payment_date.ToString("ddd") == "Mon")
                        {
                            list[0] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Tue")
                        {
                            list[1] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Wed")
                        {
                            list[2] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Thu")
                        {
                            list[3] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Fri")
                        {
                            list[4] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Sat")
                        {
                            list[5] += int.Parse(p.amount);
                        }
                        else
                        {
                            list[6] += int.Parse(p.amount);
                        }
                    }
                }
            }
        }


        else {
            int brancid = branchClass.getBranchID(branchnAME);
            var ex_bill = from x in db.bills
                          where x.BranchId==brancid
                          select x;
            if (date == "")
            {
                foreach (var p in ex_bill)
                {
                    if (CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(p.Date, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday) == CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(DateTime.Now, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday))
                    {
                        if (p.Date.ToString("ddd") == "Mon")
                        {
                            list[0] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Tue")
                        {
                            list[1] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Wed")
                        {
                            list[2] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Thu")
                        {
                            list[3] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Fri")
                        {
                            list[4] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Sat")
                        {
                            list[5] += p.BillAmount;
                        }
                        else
                        {
                            list[6] += p.BillAmount;
                        }
                    }
                }

                var emp_salary = from x in db.employees
                    
                                  join es in db.employesalaries on x.Id equals es.employe_id
                                 where x.branch_id== brancid
                                 select es;
                foreach (var p in emp_salary)
                {

                    if (CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(p.payment_date, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday) == CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(DateTime.Now, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday))
                    {
                        if (p.payment_date.ToString("ddd") == "Mon")
                        {
                            list[0] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Tue")
                        {
                            list[1] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Wed")
                        {
                            list[2] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Thu")
                        {
                            list[3] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Fri")
                        {
                            list[4] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Sat")
                        {
                            list[5] += int.Parse(p.amount);
                        }
                        else
                        {
                            list[6] += int.Parse(p.amount);
                        }
                    }
                }
            }
            else
            {
                foreach (var p in ex_bill)
                {
                    if (CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(p.Date, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday) == CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(DateTime.Parse(date), CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday))
                    {
                        if (p.Date.ToString("ddd") == "Mon")
                        {
                            list[0] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Tue")
                        {
                            list[1] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Wed")
                        {
                            list[2] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Thu")
                        {
                            list[3] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Fri")
                        {
                            list[4] += p.BillAmount;
                        }
                        else if (p.Date.ToString("ddd") == "Sat")
                        {
                            list[5] += p.BillAmount;
                        }
                        else
                        {
                            list[6] += p.BillAmount;
                        }
                    }
                }

                var emp_salary = from x in db.employees

                                 join es in db.employesalaries on x.Id equals es.employe_id
                                 where x.branch_id == brancid
                                 select es;
                foreach (var p in emp_salary)
                {

                    if (CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(p.payment_date, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday) == CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(DateTime.Parse(date), CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday))
                    {
                        if (p.payment_date.ToString("ddd") == "Mon")
                        {
                            list[0] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Tue")
                        {
                            list[1] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Wed")
                        {
                            list[2] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Thu")
                        {
                            list[3] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Fri")
                        {
                            list[4] += int.Parse(p.amount);
                        }
                        else if (p.payment_date.ToString("ddd") == "Sat")
                        {
                            list[5] += int.Parse(p.amount);
                        }
                        else
                        {
                            list[6] += int.Parse(p.amount);
                        }
                    }
                }
            }
        }
        return list;

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
        IQueryable<total_payment> b = (from x in db.bookings
                                       join tp in db.total_payments on x.Id equals tp.booking_id
                                       where x.branch_id == branc_id
                                       select tp);
        return b;

    }


    public static Dictionary<string, int> getbranc_all_monthlyincome(string branc, string dateof)
    {

        ctownDataContext db = new ctownDataContext();
        Dictionary<string, int> mydic = new Dictionary<string, int>();

        if (branc == "")
        {
            //where branc is null and date null
            if (dateof == "")
            {


                //agar khali hy to aj ka date ka month lay total payments
                //int branc_id = branchClass.getBranchID(branc);
                IQueryable<total_payment> b = from x in db.bookings
                                              join tp in db.total_payments on x.Id equals tp.booking_id
                                              where tp.paymentdate.Month ==DateTime.Now.Month
                                              select tp;
                foreach (total_payment x in b)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.paymentdate.ToShortDateString(), int.Parse(x.paid_amount));
                    }
                    else
                    {
                        foreach (var w in mydic)
                        {
                            if (w.Key == x.paymentdate.ToShortDateString())
                            {
                                string nkey = w.Key;
                                int nvalu = w.Value + int.Parse(x.paid_amount);
                                mydic.Remove(nkey);
                                mydic.Add(nkey, nvalu);
                            }
                            else
                            {
                                mydic.Add(x.paymentdate.ToShortDateString(), int.Parse(x.paid_amount));
                            }
                        }

                    }
                }
            }
            else
            {

                    //agar khali hy to aj ka date ka month lay 
                    //int branc_id = branchClass.getBranchID(branc);
                    IQueryable<total_payment> b = (from x in db.bookings
                                                   join tp in db.total_payments on x.Id equals tp.booking_id
                                                   where tp.paymentdate.Month == DateTime.Parse(dateof).Month
                                                   select tp);
                    foreach (total_payment x in b)
                    {
                        if (mydic.Count() == 0)
                        {
                            mydic.Add(x.paymentdate.ToShortDateString(), int.Parse(x.paid_amount));
                        }
                        else
                        {
                            foreach (var w in mydic)
                            {
                                if (w.Key == x.paymentdate.ToShortDateString())
                                {
                                    string nkey = w.Key;
                                    int nvalu = w.Value + int.Parse(x.paid_amount);
                                    mydic.Remove(nkey);
                                    mydic.Add(nkey, nvalu);
                                }
                                else
                                {
                                    mydic.Add(x.paymentdate.ToShortDateString(), int.Parse(x.paid_amount));
                                }
                            }

                        }
                    }
                
            }
        }
        else
        {
            int branc_id = branchClass.getBranchID(branc);

            if (dateof == "")
            {
                IQueryable<total_payment> b = (from x in db.bookings
                                               join tp in db.total_payments on x.Id equals tp.booking_id
                                               where x.branch_id == branc_id && tp.paymentdate.Month== DateTime.Now.Month
                                               select tp);
                foreach (total_payment x in b)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.paymentdate.ToShortDateString(), int.Parse(x.paid_amount));
                    }
                    else
                    {
                        foreach (var w in mydic)
                        {
                            if (w.Key == x.paymentdate.ToShortDateString())
                            {
                                string nkey = w.Key;
                                int nvalu = w.Value + int.Parse(x.paid_amount);
                                mydic.Remove(nkey);
                                mydic.Add(nkey, nvalu);
                            }
                            else
                            {
                                mydic.Add(x.paymentdate.ToShortDateString(), int.Parse(x.paid_amount));
                            }
                        }

                    }
                }
            }else
            {
                IQueryable<total_payment> b = (from x in db.bookings
                                               join tp in db.total_payments on x.Id equals tp.booking_id
                                               where x.branch_id == branc_id && tp.paymentdate.Month==DateTime.Parse(dateof).Month
                                               select tp);
                foreach (total_payment x in b)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.paymentdate.ToShortDateString(), int.Parse(x.paid_amount));
                    }
                    else
                    {
                        foreach (var w in mydic)
                        {
                            if (w.Key == x.paymentdate.ToShortDateString())
                            {
                                string nkey = w.Key;
                                int nvalu = w.Value + int.Parse(x.paid_amount);
                                mydic.Remove(nkey);
                                mydic.Add(nkey, nvalu);
                            }
                            else
                            {
                                mydic.Add(x.paymentdate.ToShortDateString(), int.Parse(x.paid_amount));
                            }
                        }

                    }
                }
            }
           
        }
        return mydic;

    }

    //yearly income


    public static Dictionary<string, int> getbranc_all_yearlyincome(string branc, string dateof)
    {

        ctownDataContext db = new ctownDataContext();
        Dictionary<string, int> mydic = new Dictionary<string, int>();

        if (branc == "")
        {
            //where branc is null and date null
            if (dateof == "")
            {


                //agar khali hy to aj ka date ka month lay total payments
                //int branc_id = branchClass.getBranchID(branc);
                IQueryable<total_payment> b = from x in db.bookings
                                              join tp in db.total_payments on x.Id equals tp.booking_id
                                              where tp.paymentdate.Year == DateTime.Now.Year
                                              select tp;
                foreach (total_payment x in b)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.paymentdate.ToShortDateString(), int.Parse(x.paid_amount));
                    }
                    else
                    {
                        foreach (var w in mydic)
                        {
                            if (w.Key == x.paymentdate.ToShortDateString())
                            {
                                string nkey = w.Key;
                                int nvalu = w.Value + int.Parse(x.paid_amount);
                                mydic.Remove(nkey);
                                mydic.Add(nkey, nvalu);
                            }
                            else
                            {
                                mydic.Add(x.paymentdate.ToShortDateString(), int.Parse(x.paid_amount));
                            }
                        }

                    }
                }
            }
            else
            {

                //agar khali hy to aj ka date ka month lay 
                //int branc_id = branchClass.getBranchID(branc);
                IQueryable<total_payment> b = (from x in db.bookings
                                               join tp in db.total_payments on x.Id equals tp.booking_id
                                               where tp.paymentdate.Year == DateTime.Parse(dateof).Year
                                               select tp);
                foreach (total_payment x in b)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.paymentdate.ToShortDateString(), int.Parse(x.paid_amount));
                    }
                    else
                    {
                        foreach (var w in mydic)
                        {
                            if (w.Key == x.paymentdate.ToShortDateString())
                            {
                                string nkey = w.Key;
                                int nvalu = w.Value + int.Parse(x.paid_amount);
                                mydic.Remove(nkey);
                                mydic.Add(nkey, nvalu);
                            }
                            else
                            {
                                mydic.Add(x.paymentdate.ToShortDateString(), int.Parse(x.paid_amount));
                            }
                        }

                    }
                }

            }
        }
        else
        {
            int branc_id = branchClass.getBranchID(branc);

            if (dateof == "")
            {
                IQueryable<total_payment> b = (from x in db.bookings
                                               join tp in db.total_payments on x.Id equals tp.booking_id
                                               where x.branch_id == branc_id && tp.paymentdate.Year == DateTime.Now.Year
                                               select tp);
                foreach (total_payment x in b)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.paymentdate.ToShortDateString(), int.Parse(x.paid_amount));
                    }
                    else
                    {
                        foreach (var w in mydic)
                        {
                            if (w.Key == x.paymentdate.ToShortDateString())
                            {
                                string nkey = w.Key;
                                int nvalu = w.Value + int.Parse(x.paid_amount);
                                mydic.Remove(nkey);
                                mydic.Add(nkey, nvalu);
                            }
                            else
                            {
                                mydic.Add(x.paymentdate.ToShortDateString(), int.Parse(x.paid_amount));
                            }
                        }

                    }
                }
            }
            else
            {
                IQueryable<total_payment> b = (from x in db.bookings
                                               join tp in db.total_payments on x.Id equals tp.booking_id
                                               where x.branch_id == branc_id && tp.paymentdate.Year == DateTime.Parse(dateof).Year
                                               select tp);
                foreach (total_payment x in b)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.paymentdate.ToShortDateString(), int.Parse(x.paid_amount));
                    }
                    else
                    {
                        foreach (var w in mydic)
                        {
                            if (w.Key == x.paymentdate.ToShortDateString())
                            {
                                string nkey = w.Key;
                                int nvalu = w.Value + int.Parse(x.paid_amount);
                                mydic.Remove(nkey);
                                mydic.Add(nkey, nvalu);
                            }
                            else
                            {
                                mydic.Add(x.paymentdate.ToShortDateString(), int.Parse(x.paid_amount));
                            }
                        }

                    }
                }
            }

        }
        return mydic;

    }
    //start of yearly expenditure
    public static Dictionary<string, int> getbranc_all_yearlyexpenditure(string branc, string dateof)
    {
        //bills+sallary = expenditure
        ctownDataContext db = new ctownDataContext();
        Dictionary<string, int> mydic = new Dictionary<string, int>();
        // if bill is null date is null 
        if (branc == "")
        {

            if (dateof == "")
            {



                IQueryable<bill> b = (from x in db.bills
                                      where x.Date.Year == DateTime.Now.Year
                                      select x);
                foreach (bill x in b)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.Date.ToShortDateString(), x.BillAmount);
                    }
                    else
                    {

                        string str = x.Date.ToShortDateString();
                        bool checkexistance = false;
                        string checkedkey = "";
                        int checkedvalue = 0;
                        foreach (var w in mydic.ToList())
                        {
                            if (w.Key == x.Date.ToShortDateString())
                            {
                                checkexistance = true;
                                checkedkey = w.Key;
                                checkedvalue = w.Value;
                                break;
                            }
                            else
                            {

                                checkexistance = false;
                            }
                        }

                        if (checkexistance == true)
                        {
                            string nkey = checkedkey;
                            int nvalu = checkedvalue + x.BillAmount;
                            mydic.Remove(nkey);
                            mydic.Add(nkey, nvalu);
                        }
                        else
                        {
                            mydic.Add(x.Date.ToShortDateString(), x.BillAmount);
                        }

                    }
                }
                //emp salry withoutdate and branch
                IQueryable<employesalary> emp = (from x in db.employesalaries
                                                 where x.payment_date.Year == DateTime.Now.Year
                                                 select x);
                foreach (employesalary x in emp)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.payment_date.ToShortDateString(), int.Parse(x.amount));
                    }
                    else
                    {
                        string str = x.payment_date.ToShortDateString();
                        bool checkexistance = false;
                        string checkedkey = "";
                        int checkedvalue = 0;
                        foreach (var w in mydic.ToList())
                        {
                            if (w.Key == str)
                            {

                                checkexistance = true;
                                checkedkey = w.Key;
                                checkedvalue = w.Value;
                                break;
                            }
                            else
                            {

                                checkexistance = false;
                            }
                        }
                        if (checkexistance == true)
                        {
                            string nkey = checkedkey;
                            int nvalu = checkedvalue + int.Parse(x.amount);
                            mydic.Remove(nkey);
                            mydic.Add(nkey, nvalu);
                        }
                        else
                        {
                            mydic.Add(x.payment_date.ToShortDateString(), int.Parse(x.amount));
                        }

                    }
                }
            }
            else       // bill and salary without branc with bill
            {
                //agar khali hy to aj ka date ka month lay 
                //int branc_id = branchClass.getBranchID(branc);
                IQueryable<bill> b = (from x in db.bills
                                      where x.Date.Year == DateTime.Parse(dateof).Year
                                      select x);
                foreach (bill x in b)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.Date.ToShortDateString(), x.BillAmount);
                    }
                    else
                    {
                        string str = x.Date.ToShortDateString();
                        bool checkexistance = false;
                        string checkedkey = "";
                        int checkedvalue = 0;
                        foreach (var w in mydic.ToList())
                        {
                            if (w.Key == x.Date.ToShortDateString())
                            {
                                checkexistance = true;
                                checkedkey = w.Key;
                                checkedvalue = w.Value;
                                break;
                            }
                            else
                            {

                                checkexistance = false;
                            }
                        }

                        if (checkexistance == true)
                        {
                            string nkey = checkedkey;
                            int nvalu = checkedvalue + x.BillAmount;
                            mydic.Remove(nkey);
                            mydic.Add(nkey, nvalu);
                        }
                        else
                        {
                            mydic.Add(x.Date.ToShortDateString(), x.BillAmount);
                        }

                    }
                }
                //emp salry withdate and withoutbranch
                IQueryable<employesalary> emp = (from x in db.employesalaries
                                                 where x.payment_date.Year == DateTime.Parse(dateof).Year
                                                 select x);
                foreach (employesalary x in emp)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.payment_date.ToShortDateString(), int.Parse(x.amount));
                    }
                    else
                    {

                        string str = x.payment_date.ToShortDateString();
                        bool checkexistance = false;
                        string checkedkey = "";
                        int checkedvalue = 0;
                        foreach (var w in mydic.ToList())
                        {
                            if (w.Key == str)
                            {
                                checkexistance = true;
                                checkedkey = w.Key;
                                checkedvalue = w.Value;
                                break;
                            }
                            else
                            {

                                checkexistance = false;
                            }
                        }
                        if (checkexistance == true)
                        {
                            string nkey = checkedkey;
                            int nvalu = checkedvalue + int.Parse(x.amount);
                            mydic.Remove(nkey);
                            mydic.Add(nkey, nvalu);
                        }
                        else
                        {
                            mydic.Add(x.payment_date.ToShortDateString(), int.Parse(x.amount));
                        }

                    }
                }

            }
        }
        //with brach
        else
        {
            int branc_id = branchClass.getBranchID(branc);
            //with branch and date null 
            if (dateof == "")
            {
                //bills 

                IQueryable<bill> b = (from x in db.bills
                                      where x.Date.Year == DateTime.Now.Year && x.BranchId == branc_id
                                      select x);
                foreach (bill x in b)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.Date.ToShortDateString(), x.BillAmount);
                    }
                    else
                    {

                        string str = x.Date.ToShortDateString();
                        bool checkexistance = false;
                        string checkedkey = "";
                        int checkedvalue = 0;
                        foreach (var w in mydic.ToList())
                        {
                            if (w.Key == x.Date.ToShortDateString())
                            {

                                checkexistance = true;
                                checkedkey = w.Key;
                                checkedvalue = w.Value;
                                break;
                            }
                            else
                            {

                                checkexistance = false;
                            }
                        }

                        if (checkexistance == true)
                        {
                            string nkey = checkedkey;
                            int nvalu = checkedvalue + x.BillAmount;
                            mydic.Remove(nkey);
                            mydic.Add(nkey, nvalu);
                        }
                        else
                        {
                            mydic.Add(x.Date.ToShortDateString(), x.BillAmount);
                        }

                    }
                }
                //emp salry withoutdate and withbranch
                IQueryable<employesalary> emp = (from x in db.employees
                                                 join es in db.employesalaries on x.Id equals es.employe_id
                                                 where es.payment_date.Year == DateTime.Now.Year && x.branch_id == branc_id
                                                 select es);
                foreach (employesalary x in emp)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.payment_date.ToShortDateString(), int.Parse(x.amount));
                    }
                    else
                    {
                        string str = x.payment_date.ToShortDateString();
                        bool checkexistance = false;
                        string checkedkey = "";
                        int checkedvalue = 0;
                        foreach (var w in mydic.ToList())
                        {
                            if (w.Key == str)
                            {

                                checkexistance = true;
                                checkedkey = w.Key;
                                checkedvalue = w.Value;
                                break;
                            }
                            else
                            {

                                checkexistance = false;
                            }
                        }
                        if (checkexistance == true)
                        {
                            string nkey = checkedkey;
                            int nvalu = checkedvalue + int.Parse(x.amount);
                            mydic.Remove(nkey);
                            mydic.Add(nkey, nvalu);
                        }
                        else
                        {
                            mydic.Add(x.payment_date.ToShortDateString(), int.Parse(x.amount));
                        }

                    }
                }
            }
            // with branch and with date 
            else       // bill and salary without branc with bill
            {
                //agar khali hy to aj ka date ka month lay 
                //int branc_id = branchClass.getBranchID(branc);
                IQueryable<bill> b = (from x in db.bills
                                      where x.Date.Year == DateTime.Parse(dateof).Year && x.BranchId == branc_id
                                      select x);
                foreach (bill x in b)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.Date.ToShortDateString(), x.BillAmount);
                    }
                    else
                    {

                        string str = x.Date.ToShortDateString();
                        bool checkexistance = false;
                        string checkedkey = "";
                        int checkedvalue = 0;
                        foreach (var w in mydic.ToList())
                        {
                            if (w.Key == x.Date.ToShortDateString())
                            {

                                checkexistance = true;
                                checkedkey = w.Key;
                                checkedvalue = w.Value;
                                break;
                            }
                            else
                            {

                                checkexistance = false;
                            }
                        }

                        if (checkexistance == true)
                        {
                            string nkey = checkedkey;
                            int nvalu = checkedvalue + x.BillAmount;
                            mydic.Remove(nkey);
                            mydic.Add(nkey, nvalu);
                        }
                        else
                        {
                            mydic.Add(x.Date.ToShortDateString(), x.BillAmount);
                        }

                    }
                }
                //emp salry withdate and withtbranch
                IQueryable<employesalary> emp = (from x in db.employees
                                                 join es in db.employesalaries on x.Id equals es.employe_id
                                                 where es.payment_date.Year == DateTime.Parse(dateof).Year && x.branch_id == branc_id
                                                 select es);
                foreach (employesalary x in emp)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.payment_date.ToShortDateString(), int.Parse(x.amount));
                    }
                    else
                    {
                        string str = x.payment_date.ToShortDateString();
                        bool checkexistance = false;
                        string checkedkey = "";
                        int checkedvalue = 0;
                        foreach (var w in mydic.ToList())
                        {
                            if (w.Key == str)
                            {

                                checkexistance = true;
                                checkedkey = w.Key;
                                checkedvalue = w.Value;
                                break;
                            }
                            else
                            {

                                checkexistance = false;
                            }
                        }
                        if (checkexistance == true)
                        {
                            string nkey = checkedkey;
                            int nvalu = checkedvalue + int.Parse(x.amount);
                            mydic.Remove(nkey);
                            mydic.Add(nkey, nvalu);
                        }
                        else
                        {
                            mydic.Add(x.payment_date.ToShortDateString(), int.Parse(x.amount));
                        }


                    }
                }

            }
        }
        return mydic;


    }
    //end of yearly expenditure
    public static Dictionary<string, int> getbranc_all_monthlyexpenditure(string branc, string dateof)
    {
        //bills+sallary = expenditure
        ctownDataContext db = new ctownDataContext();
        Dictionary<string, int> mydic = new Dictionary<string, int>();
        // if bill is null date is null 
        if (branc == "")
        {

            if (dateof == "")
            {


               
                IQueryable<bill> b = (from x in db.bills
                                      where x.Date.Month == DateTime.Now.Month
                                      select x);
                foreach (bill x in b)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.Date.ToShortDateString(), x.BillAmount);
                    }
                    else
                    {
                      
                        string str = x.Date.ToShortDateString();
                        bool checkexistance = false;
                        string checkedkey = "";
                        int checkedvalue = 0;
                        foreach (var w in mydic.ToList())
                        {
                            if (w.Key == x.Date.ToShortDateString())
                            {
                                checkexistance = true;
                                checkedkey = w.Key;
                                checkedvalue = w.Value;
                                break;
                            }
                            else
                            {
                               
                                checkexistance = false;
                            }
                        }

                        if (checkexistance == true)
                        {
                            string nkey = checkedkey;
                            int nvalu = checkedvalue + x.BillAmount;
                            mydic.Remove(nkey);
                            mydic.Add(nkey, nvalu);
                        }
                        else
                        {
                            mydic.Add(x.Date.ToShortDateString(), x.BillAmount);
                        }

                    }
                }
                //emp salry withoutdate and branch
                IQueryable<employesalary> emp = (from x in db.employesalaries
                                                 where x.payment_date.Month == DateTime.Now.Month
                                                 select x);
                foreach (employesalary x in emp)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.payment_date.ToShortDateString(), int.Parse(x.amount));
                    }
                    else
                    {
                        string str = x.payment_date.ToShortDateString();
                        bool checkexistance = false;
                        string checkedkey = "";
                        int checkedvalue = 0;
                        foreach (var w in mydic.ToList())
                        {
                            if (w.Key == str)
                            {
                              
                                checkexistance = true;
                                checkedkey = w.Key;
                                checkedvalue = w.Value;
                                break;
                            }
                            else
                            {
                               
                                checkexistance = false;
                            }
                        }
                        if (checkexistance == true)
                        {
                            string nkey = checkedkey;
                            int nvalu = checkedvalue + int.Parse(x.amount);
                            mydic.Remove(nkey);
                           mydic.Add(nkey, nvalu);
                        }
                        else
                        {
                          mydic.Add(x.payment_date.ToShortDateString(), int.Parse(x.amount));
                        }

                    }
                }
            }
            else       // bill and salary without branc with bill
            {
                //agar khali hy to aj ka date ka month lay 
                //int branc_id = branchClass.getBranchID(branc);
                IQueryable<bill> b = (from x in db.bills
                                      where x.Date.Month == DateTime.Parse(dateof).Month
                                      select x);
                foreach (bill x in b)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.Date.ToShortDateString(), x.BillAmount);
                    }
                    else
                    {
                        string str = x.Date.ToShortDateString();
                        bool checkexistance = false;
                        string checkedkey = "";
                        int checkedvalue = 0;
                        foreach (var w in mydic.ToList())
                        {
                            if (w.Key == x.Date.ToShortDateString())
                            {
                                checkexistance = true;
                                checkedkey = w.Key;
                                checkedvalue = w.Value;
                                break;
                            }
                            else
                            {
                             
                                checkexistance = false;
                            }
                        }

                        if (checkexistance == true)
                        {
                            string nkey = checkedkey;
                            int nvalu = checkedvalue + x.BillAmount;
                            mydic.Remove(nkey);
                            mydic.Add(nkey, nvalu);
                        }
                        else
                        {
                            mydic.Add(x.Date.ToShortDateString(), x.BillAmount);
                        }

                    }
                }
                //emp salry withdate and withoutbranch
                IQueryable<employesalary> emp = (from x in db.employesalaries
                                                 where x.payment_date.Month == DateTime.Parse(dateof).Month
                                                 select x);
                foreach (employesalary x in emp)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.payment_date.ToShortDateString(), int.Parse(x.amount));
                    }
                    else
                    {
                       
                        string str = x.payment_date.ToShortDateString();
                        bool checkexistance = false;
                        string checkedkey = "";
                        int checkedvalue = 0;
                        foreach (var w in mydic.ToList())
                        {
                            if (w.Key == str)
                            {
                                checkexistance = true;
                                checkedkey = w.Key;
                                checkedvalue = w.Value;
                                break;
                            }
                            else
                            {
                               
                                checkexistance = false;
                            }
                        }
                        if (checkexistance == true)
                        {
                            string nkey = checkedkey;
                            int nvalu = checkedvalue + int.Parse(x.amount);
                            mydic.Remove(nkey);
                            mydic.Add(nkey, nvalu);
                        }
                        else
                        {
                            mydic.Add(x.payment_date.ToShortDateString(), int.Parse(x.amount));
                        }

                    }
                }

            }
        }
        //with brach
        else
        {
            int branc_id = branchClass.getBranchID(branc);
            //with branch and date null 
            if (dateof == "")
            {
                //bills 
                
                IQueryable<bill> b = (from x in db.bills
                                      where x.Date.Month == DateTime.Now.Month && x.BranchId==branc_id
                                      select x);
                foreach (bill x in b)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.Date.ToShortDateString(), x.BillAmount);
                    }
                    else
                    {
                       
                        string str = x.Date.ToShortDateString();
                        bool checkexistance = false;
                        string checkedkey = "";
                        int checkedvalue = 0;
                        foreach (var w in mydic.ToList())
                        {
                            if (w.Key == x.Date.ToShortDateString())
                            {
                             
                                checkexistance = true;
                                checkedkey = w.Key;
                                checkedvalue = w.Value;
                                break;
                            }
                            else
                            {
                               
                                checkexistance = false;
                            }
                        }

                        if (checkexistance == true)
                        {
                            string nkey = checkedkey;
                            int nvalu = checkedvalue + x.BillAmount;
                            mydic.Remove(nkey);
                            mydic.Add(nkey, nvalu);
                        }
                        else
                        {
                            mydic.Add(x.Date.ToShortDateString(), x.BillAmount);
                        }

                    }
                }
                //emp salry withoutdate and withbranch
                IQueryable<employesalary> emp = (from x in db.employees
                                                 join es in db.employesalaries on x.Id equals es.employe_id 
                                                 where es.payment_date.Month == DateTime.Now.Month && x.branch_id==branc_id
                                                 select es);
                foreach (employesalary x in emp)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.payment_date.ToShortDateString(), int.Parse(x.amount));
                    }
                    else
                    {
                        string str = x.payment_date.ToShortDateString();
                        bool checkexistance = false;
                        string checkedkey = "";
                        int checkedvalue = 0;
                        foreach (var w in mydic.ToList())
                        {
                            if (w.Key == str)
                            {
                               
                                checkexistance = true;
                                checkedkey = w.Key;
                                checkedvalue = w.Value;
                                break;
                            }
                            else
                            {
                                
                                checkexistance = false;
                            }
                        }
                        if (checkexistance == true)
                        {
                            string nkey = checkedkey;
                            int nvalu = checkedvalue + int.Parse(x.amount);
                            mydic.Remove(nkey);
                            mydic.Add(nkey, nvalu);
                        }
                        else
                        {
                            mydic.Add(x.payment_date.ToShortDateString(), int.Parse(x.amount));
                        }

                    }
                }
            }
            // with branch and with date 
            else       // bill and salary without branc with bill
            {
                //agar khali hy to aj ka date ka month lay 
                //int branc_id = branchClass.getBranchID(branc);
                IQueryable<bill> b = (from x in db.bills
                                      where x.Date.Month == DateTime.Parse(dateof).Month && x.BranchId==branc_id
                                      select x);
                foreach (bill x in b)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.Date.ToShortDateString(), x.BillAmount);
                    }
                    else
                    {

                        string str = x.Date.ToShortDateString();
                        bool checkexistance = false;
                        string checkedkey = "";
                        int checkedvalue = 0;
                        foreach (var w in mydic.ToList())
                        {
                            if (w.Key == x.Date.ToShortDateString())
                            {
                               
                                checkexistance = true;
                                checkedkey = w.Key;
                                checkedvalue = w.Value;
                                break;
                            }
                            else
                            {
                             
                                checkexistance = false;
                            }
                        }

                        if (checkexistance == true)
                        {
                            string nkey = checkedkey;
                            int nvalu = checkedvalue + x.BillAmount;
                            mydic.Remove(nkey);
                            mydic.Add(nkey, nvalu);
                        }
                        else
                        {
                            mydic.Add(x.Date.ToShortDateString(), x.BillAmount);
                        }

                    }
                }
                //emp salry withdate and withtbranch
                IQueryable<employesalary> emp = (from x in db.employees
                                                 join es in db.employesalaries on x.Id equals es.employe_id
                                                 where es.payment_date.Month == DateTime.Parse(dateof).Month && x.branch_id == branc_id
                                                 select es);
                foreach (employesalary x in emp)
                {
                    if (mydic.Count() == 0)
                    {
                        mydic.Add(x.payment_date.ToShortDateString(), int.Parse(x.amount));
                    }
                    else
                    {
                        string str = x.payment_date.ToShortDateString();
                        bool checkexistance = false;
                        string checkedkey = "";
                        int checkedvalue = 0;
                        foreach (var w in mydic.ToList())
                        {
                            if (w.Key == str)
                            {
                               
                                checkexistance = true;
                                checkedkey = w.Key;
                                checkedvalue = w.Value;
                                break;
                            }
                            else
                            {
                                
                                checkexistance = false;
                            }
                        }
                        if (checkexistance == true)
                        {
                            string nkey = checkedkey;
                            int nvalu = checkedvalue + int.Parse(x.amount);
                            mydic.Remove(nkey);
                            mydic.Add(nkey, nvalu);
                        }
                        else
                        {
                            mydic.Add(x.payment_date.ToShortDateString(), int.Parse(x.amount));
                        }


                    }
                }

            }
        }
        return mydic;

        
    }


    public static IQueryable<total_payment> getallbranchweeklyincome()
    {

        ctownDataContext db = new ctownDataContext();
        IQueryable<total_payment> b = (from x in db.bookings
                                       join tp in db.total_payments on x.Id equals tp.booking_id
                                       select tp);
        return b;

    }



   
    public static string ToJson<T>(this T obj)
    {
        MemoryStream stream = new MemoryStream();
        try
        {
            DataContractJsonSerializer jsSerializer = new DataContractJsonSerializer(typeof(T));
            jsSerializer.WriteObject(stream, obj);

            return Encoding.UTF8.GetString(stream.ToArray());
        }
        finally
        {
            stream.Close();
            stream.Dispose();
        }
    }

}