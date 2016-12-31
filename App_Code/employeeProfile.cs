using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for employeeProfile
/// </summary>
public class employeeProfile
{
    public employeeProfile()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static List<employepaymentrecivableAttributes> getGuestInfo(int bid)
    {
        ctownDataContext db = new ctownDataContext();
        var g = from x in db.guests
                              join y in db.bookings on x.Id equals y.guest_id
                              join z in db.booking_Rooms on y.Id equals z.bookingId
                              join r in db.rooms on z.roomid equals r.Id
                              where y.branch_id == bid
                              select new
                              {
                                  guest = x,
                                  booking = y,
                                  booking_Room = z,
                                  room = r
                                  
                              };
        List<employepaymentrecivableAttributes> guestinfo = new List<employepaymentrecivableAttributes>();
        foreach (var x in g)
        {
            employepaymentrecivableAttributes temp = new employepaymentrecivableAttributes();
            temp.b = x.booking;
            temp.br = x.booking_Room;
            temp.g = x.guest;
            temp.r = x.room;
            guestinfo.Add(temp);
        }
            return guestinfo;
    }
    public static bool addemployesalary(employesalary es)
    {
       
            ctownDataContext db = new ctownDataContext();
            
            int count = (from x in db.employesalaries
                      where x.employe_id == es.employe_id && x.payment_date.Month == es.payment_date.Month && x.payment_date.Year == es.payment_date.Year
                         select x).Count();
            if (count == 0)
            {
                db.employesalaries.InsertOnSubmit(es);
                db.SubmitChanges();
                return true;
            }
            else
            {
                employesalary record= (from x in db.employesalaries
                             where x.employe_id == es.employe_id && x.payment_date.Month == es.payment_date.Month &&x.payment_date.Year==es.payment_date.Year
                             select x).First();
                record.payment_date = es.payment_date;
                record.paidby = es.paidby;
                record.amount = (int.Parse(es.amount)+int.Parse(record.amount)).ToString();
                if (int.Parse(record.amount) <= record.amount_Topay)
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
   
    public static bool checkUsername(int username)
    {
        ctownDataContext Database = new ctownDataContext();
        int count = (from x in Database.employees
                     where x.username == username.ToString()     //for checking already existance of client
                     select x).Count();
        if (count == 0)
        {
            return true;
        }
        else
        {
            return false;
        }

    }
    public static bool employeSignUp(employee emp)
    {
        ctownDataContext Database = new ctownDataContext();
        int count = (from x in Database.employees
                     where x.username == emp.username     //for checking already existance of client
                     select x).Count();
        if (count == 0)
        {
            if (emp.image != null)
            {
                
            }
            Database.employees.InsertOnSubmit(emp);
            try
            {
                Database.SubmitChanges();
                return true;
            }
            catch (ChangeConflictException e)
            {
                return false;
                //report error, log error whatever...
            }
        }
        else
        {
            return false; 
        }
    }
    public static int employeSignin(string username,string password)
    {
        int emp = 0;
        ctownDataContext Database = new ctownDataContext();
        emp = (from x in Database.employees
                     where x.username == username && x.password == password && x.login_type == "Employe"   //for checking already existance of client
                     select x).Count();
        if (emp == 1)
        {
            return emp;
        }
        return emp;
        
        
            
        
        
           
        
    }
    public static employee getAdminInfo(string username)
    {
        ctownDataContext db = new ctownDataContext();

        employee emp = (from x in db.employees

                                   where x.username == username && x.login_type == "Admin"
                       select x).First();
        return emp;

    }
    public static IQueryable<employee> getAllEmployee(int branchId)
    {
        ctownDataContext db = new ctownDataContext();

        IQueryable<employee> emp = from x in db.GetTable<employee>()

                                   where x.branch_id == branchId
                                   select x;
        return emp;

    }
    //for advance salary 
    public static List<employee> getEmployenextmonthsalarydetail(int branchId)
    {
        List<employesalarypay> employeadvace = null;
        ctownDataContext db = new ctownDataContext();

        List<employee> emp = (from x in db.GetTable<employee>()

                              where x.branch_id == branchId
                              select x).ToList();
  //      foreach(employee e in emp)
  //      {
  //          //salary detail of employe whos advance salary is not paid or not completely paid
  //          int recordfound= (from esal in db.employesalaries
  //where esal.payment_date.Month == DateTime.Now.Month && int.Parse(esal.amount)<e.salary && esal.employe_id == e.Id
  //                   select esal);
  //          if (recordfound > 1) {
  //                  employeadvace.Add(new employesalarypay(e,)
  //              }
  //      }

        
        return emp;


    }
    public static IQueryable<employee> getAllEmployeeUserName(int branchId)
    {
        ctownDataContext db = new ctownDataContext();

        IQueryable<employee> emp = from x in db.GetTable<employee>()

                                   where x.branch_id == branchId && x.login_type != "Admin"
                                   select x;
        return emp;

    }
    public static IQueryable<employee> getAllEmployee(string branchname)
    {
        ctownDataContext db = new ctownDataContext();

        IQueryable<employee> emp = from y in db.branches
                                  join  x in db.employees on y.Id equals x.branch_id

                                   where y.name == branchname
                                   select x;
        return emp;

    }
    public static IQueryable<employee> getAllEmployee()
    {
        ctownDataContext db = new ctownDataContext();

        IQueryable<employee> emp = from x in db.GetTable<employee>()
                                   where x.login_type!="admin"
                                   select x;
        return emp;

    }
    public static IQueryable<employee> getAllEmployee_allbranch(int branchId)
    {
        ctownDataContext db = new ctownDataContext();
        if (branchId == 0)
        {
            IQueryable<employee> emp = from x in db.GetTable<employee>()
                                       where x.login_type != "admin"
                                       select x;
            return emp;
        }
        else
        {
            IQueryable<employee> emp = from x in db.GetTable<employee>()

                                       where x.branch_id == branchId
                                       select x;
            return emp;
        }
        

    }
    public static employee getSelectedEmployeeInfo(int empid, int branchid)
    {
        ctownDataContext db = new ctownDataContext();

        employee emp = (from x in db.GetTable<employee>()

                        where x.Id == empid && x.branch_id == branchid
                        select x).First();
        return emp;
    }
    //public static employee getUserEmployeeInfo(string username)
    //{
    //    ctownDataContext db = new ctownDataContext();

    //    employee emp = (from x in db.GetTable<employee>()

    //                    where x.username == username
    //                    select x).First();
    //    return emp;
    //}
    public static int getEmployeBranch(string username)
    {
        try
        {
            ctownDataContext db = new ctownDataContext();

            int bid = (from x in db.GetTable<employee>()
                       join b in db.branches on x.branch_id equals b.Id
                       where x.username == username
                       select b.Id).First();
            return bid;
        }
        catch (Exception ex)
        {
            return 0;
        }
        
    }
    public static int getEmployeBranch(int employe_id)
    {
        ctownDataContext db = new ctownDataContext();

        int bid = (from x in db.GetTable<employee>()
                   join b in db.branches on x.branch_id equals b.Id
                   where x.Id == employe_id
                   select b.Id).First();
        return bid;
    }
    public static string getEmployeBranchname(string username)
    {
        ctownDataContext db = new ctownDataContext();

        string bname = (from x in db.GetTable<employee>()
                   join b in db.branches on x.branch_id equals b.Id
                   where x.username == username
                   select b.name).First();
        return bname;
    }
    public static string getEmployeBranchname(int id)
    {
        ctownDataContext db = new ctownDataContext();

        string bname = (from x in db.GetTable<employee>()
                        join b in db.branches on x.branch_id equals b.Id
                        where x.Id == id
                        select b.name).First();
        return bname;
    }
    public static int getEmployeid(string username)
    {
        ctownDataContext db = new ctownDataContext();

        int bid = (from x in db.GetTable<employee>()
                   
                   where x.username == username
                   select x.Id).First();
        return bid;
    }
    public static bool checklatestDate(int employeid,ref int amountopay)
    {
        ctownDataContext db = new ctownDataContext();

        var ex = (from x in db.employees
                  join y in db.employesalaries on x.Id equals y.employe_id
                  orderby y.payment_date descending
                  where x.Id == employeid
                  select y 
                  ).First();

       
        if (ex.payment_date.Month == (DateTime.Now.Month-1))
        {
            if (ex.amount_Topay > int.Parse(ex.amount))
            {
                amountopay = ex.amount_Topay - int.Parse(ex.amount);
                return false;//also return false when salry paid is less then the salary .
            }else if (ex.amount_Topay == int.Parse(ex.amount))
            {
                amountopay = 0;
                return true;
            }
            else
            {
                amountopay = 0;
                return true;
            }
        }
        else
        {
            if (ex.payment_date.Month == DateTime.Now.Month)
            {
                return true;
            }
            else
            {
                amountopay = 0;
                return false;//not payed of this month 
            }
        }
    }
    public static List<employesalarypay> getunpaidemploye(int branchId)
    {
        ctownDataContext db = new ctownDataContext();
        List<employee> emp = db.employees.Where(a => !db.employesalaries.Select(b => b.employe_id).Contains(a.Id)).ToList();//get first payment
        List<employee> emp1 = new List<employee>();
        List<employesalarypay> employesalary = new List<employesalarypay>();
        foreach (employee ee in emp)
        {
            if (ee.branch_id == branchId)
            {
                DateTime jd =DateTime.Parse( ee.dateofjoining.ToString());
                if(jd.Month==DateTime.Now.Month && jd.Year == DateTime.Now.Year)
                {
                    ///do not add it
                }else
                {
                    var timespan = DateTimeSpan.CompareDates(jd, DateTime.Now);


                    if (timespan.Months == 0 || timespan.Months == 1)
                    {
                        DateTime newdate;
                        if (jd.Month == 12)
                        {
                            newdate = new DateTime(jd.Year + 1, 1, 1);//month 12 the year will b change
                        }
                        else
                        {
                            newdate = new DateTime(jd.Year, jd.Month + 1, 1);// else increment i month
                        }

                        var timespan_nextmonth = DateTimeSpan.CompareDates(new DateTime(jd.Year,jd.Month,jd.Day), newdate);
                        if (timespan_nextmonth.Months == 1)
                        {
                            emp1.Add(ee);//add employe whoes first payment and in this branch
                            employesalarypay p = new employesalarypay();
                            p.emp = ee;
                            
                            p.amount_topay = ee.salary;

                            employesalary.Add(p);
                        }
                        else
                        {
                            emp1.Add(ee);//add employe whoes first payment and in this branch
                            employesalarypay p = new employesalarypay();
                            p.emp = ee;
                            int perdaysalary = ee.salary / 30;
                            p.amount_topay = timespan_nextmonth.Days * perdaysalary;

                            employesalary.Add(p);
                        }
                    }
                    else
                    {
                        DateTime newdate=DateTime.Now;
                        

                        var timespan_nextmonth = DateTimeSpan.CompareDates(new DateTime(jd.Year, jd.Month, jd.Day), new DateTime(newdate.Year,newdate.Month,1));
                        emp1.Add(ee);//add employe whoes first payment and in this branch
                        employesalarypay p = new employesalarypay();
                        p.emp = ee;
                        int perdaysalary = ee.salary / 30;
                        if (timespan_nextmonth.Days == 0)
                        {
                            p.amount_topay = ee.salary * timespan_nextmonth.Months;
                        }
                        else
                        {
                            int sumofdays = timespan_nextmonth.Days * perdaysalary;
                            p.amount_topay = (ee.salary * timespan_nextmonth.Months) + sumofdays;
                        }
                        employesalary.Add(p);
                    }
                }
               
            }
        }
        int empcount = emp1.Count();

        List<employee> employe = (from x in db.employees
                                  where x.branch_id == branchId
                                  select x).ToList();//all employe of this branch 

        List<employee> ex = new List<employee>();//(IQueryable<employee>)null;
        foreach (employee e in employe)
        {
            if (emp1.Contains(e) == false)
            {
                int amounttopay = 0;
                bool x = checklatestDate(e.Id,ref amounttopay);//byreferance
                if (x == false)
                {
                    ex.Add(e);
                    employesalarypay p = new employesalarypay();
                    p.emp = e;
                    if (amounttopay == 0)
                    {
                        p.amount_topay = e.salary;
                    }
                    else
                    {
                        p.amount_topay = amounttopay;
                    }
                    employesalary.Add(p);
                    // ex.Concat((List<employee>)e).ToList();
                }
            }
        }
        //if (ex != null)
        //{
        //    return ex.Concat(emp1).ToList();
        //}
        //else
        //{
        //    return emp1;
        //}
        return employesalary;
    }
    public static bool updateEmployeeInfo(employee emp, int val, int branchid)
    {
        ctownDataContext db = new ctownDataContext();
        try {
            var ra = (from x in db.employees
                      where x.Id == val && x.branch_id == branchid
                      select x).First();
            ra.name = emp.name;
            ra.email = emp.email;
            ra.employee_no = emp.employee_no;
            ra.cnic = emp.cnic;
            ra.designation = emp.designation;
            ra.dateofjoining = emp.dateofjoining;
            ra.address = emp.address;
            ra.salary = emp.salary;
            if (emp.image != null)
            {
                ra.image = emp.image;
            }

            int check = (from y in db.employees
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
        catch
        {
            return false;
        }
        
    }
    public static bool updateProfile(employee emp, int adminID)
    {
        ctownDataContext db = new ctownDataContext();
        try
        {
            var ra = (from x in db.employees
                      where x.login_type == "Admin" && x.Id == adminID
                      select x).First();
            ra.name = emp.name;
            ra.email = emp.email;
            ra.password = emp.password;
            if (emp.image != null)
            {
                ra.image = emp.image;
            }

            int check = (from y in db.employees
                         where y.login_type == "Admin" && y.Id == adminID
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
        catch
        {
            return false;
        }
    }
    public static int getEmployeeId(string username)
    {
        ctownDataContext db = new ctownDataContext();

        int id = (from x in db.employees
                  where x.username == username
                  select x.Id).First();
        return id;

    }
    public static int getEmployeeIDbyusername(string name)
    {
        ctownDataContext db = new ctownDataContext();

        int id = (from x in db.employees
                  where x.username == name
                  select x.Id).First();
        return id;

    }
    public static int getEmployeeIdfromusername(string uname)
    {
        ctownDataContext db = new ctownDataContext();

        int id = (from x in db.employees
                  where x.username == uname
                  select x.Id).First();
        return id;

    }
    public static int getEmployeeIdSalaryID(int id)
    {
        try
        {
            ctownDataContext db = new ctownDataContext();

            int Id = (from x in db.employesalaries
                      where x.employe_id == id && x.payment_date.Month == DateTime.Now.Month
                      select x.Id).First();

            return Id;
        }
        catch (Exception ex)
        {
            return 0;
        }



    }
   
    public static IQueryable<employesalary> getInfo(int eId)
    {
        try
        {
            ctownDataContext db = db = new ctownDataContext();
            IQueryable<employesalary> ra = (from x in db.employesalaries

                                            where x.employe_id == eId
                                            select x);


            return ra;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    public static bool updateemployesalary(int sId,int amount)
    {
        try
        {
            ctownDataContext db = db = new ctownDataContext();
            employesalary ra = (from x in db.employesalaries

                                            where x.Id == sId
                                            select x).First();
            ra.amount = amount.ToString();
            db.SubmitChanges();

            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
    public static IQueryable<employesalary> getlastsalary(int eId)
    {
        try
        {
            ctownDataContext db = db = new ctownDataContext();
            IQueryable<employesalary> ra = (from x in db.employesalaries

                                            where x.employe_id == eId && x.payment_paid_date==DateTime.Now
                                            select x);


            return ra;
        }
        catch (Exception ex)
        {
            return null;
        }
    }
    public static employee getEmpInfo(int id)
    {
        ctownDataContext db = db = new ctownDataContext();
        employee ra = (from x in db.employees

                       where x.Id == id
                       select x).First();


        return ra;
    }
    public static string getEmpusername(int id)
    {
        ctownDataContext db = db = new ctownDataContext();
       string ra = (from x in db.employees

                       where x.Id == id
                       select x.username).First();


        return ra;
    }
    public static employesalary retrieveSalaryInfo(int id)
    {
        ctownDataContext db = db = new ctownDataContext();
        employesalary ra = (from x in db.employesalaries

                            where x.Id == id
                            select x).First();


        return ra;
    }
    public static bool updateEmployeeSalary(employesalary emp, int id)
    {
        ctownDataContext db = new ctownDataContext();
        var ra = (from x in db.employesalaries
                  where x.Id == id
                  select x).First();
        ra.amount = emp.amount;
        ra.payment_date = emp.payment_date;

        int check = (from y in db.employesalaries
                     where y.Id == ra.Id
                     select y).Count();

        db.SubmitChanges();
        return true;


    }

    public static int getEmpID(string name, string pass, int branch_id)
    {
        ctownDataContext db = new ctownDataContext();

        int bid = (from x in db.GetTable<employee>()

                   where x.username == name && x.password == pass && x.branch_id == branch_id && x.login_type == "Employe"
                   select x.Id).First();
        return bid;
    }

}