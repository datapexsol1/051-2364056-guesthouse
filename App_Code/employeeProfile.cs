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
    public static void addemployesalary(employesalary es)
    {
        ctownDataContext db = new ctownDataContext();
        int check = (from x in db.employesalaries
                     where x.employe_id == es.employe_id && x.payment_date.Month == es.payment_date.Month
                     select x).Count();
        if (check == 0)
        {
            db.employesalaries.InsertOnSubmit(es);
            db.SubmitChanges();
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
    public static string employeSignin(string username,string password)
    {
        ctownDataContext Database = new ctownDataContext();
       string emp = (from x in Database.employees
                     where x.username == username && x.password == password && x.login_type == "Employe"   //for checking already existance of client
                     select x.username).First();
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
    public static employee getSelectedEmployeeInfo(int empid, int branchid)
    {
        ctownDataContext db = new ctownDataContext();

        employee emp = (from x in db.GetTable<employee>()

                        where x.Id == empid && x.branch_id == branchid
                        select x).First();
        return emp;
    }
    public static int getEmployeBranch(string username)
    {
        ctownDataContext db = new ctownDataContext();

        int bid = (from x in db.GetTable<employee>()
                   join b in db.branches on x.branch_id equals b.Id
                   where x.username == username
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
    public static int getEmployeid(string username)
    {
        ctownDataContext db = new ctownDataContext();

        int bid = (from x in db.GetTable<employee>()
                   
                   where x.username == username
                   select x.Id).First();
        return bid;
    }
    public static bool checklatestDate(int employeid)
    {
        ctownDataContext db = new ctownDataContext();

        employesalary ex = (from x in db.employees
                            join y in db.employesalaries on x.Id equals y.employe_id
                            orderby y.payment_date descending
                            where x.Id == employeid
                            select y).First();
        if (ex.payment_date.Month == DateTime.Now.Month)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public static List<employee> getunpaidemploye(int branchId)
    {
        ctownDataContext db = new ctownDataContext();
        List<employee> emp = db.employees.Where(a => !db.employesalaries.Select(b => b.employe_id).Contains(a.Id)).ToList();//get first e
        List<employee> emp1 = new List<employee>();
        foreach (employee ee in emp)
        {
            if (ee.branch_id == branchId)
            {
                emp1.Add(ee);
            }
        }
        int empcount = emp1.Count();

        List<employee> employe = (from x in db.employees
                                  where x.branch_id == branchId
                                  select x).ToList();

        List<employee> ex = new List<employee>();//(IQueryable<employee>)null;
        foreach (employee e in employe)
        {
            if (emp1.Contains(e) == false)
            {
                bool x = checklatestDate(e.Id);
                if (x == false)
                {
                    ex.Add(e);
                    // ex.Concat((List<employee>)e).ToList();
                }
            }
        }
        if (ex != null)
        {
            return ex.Concat(emp1).ToList();
        }
        else
        {
            return emp1;
        }
    }
    public static void updateEmployeeInfo(employee emp, int val, int branchid)
    {
        ctownDataContext db = new ctownDataContext();
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
        }
    }
    public static int getEmployeeId(string name)
    {
        ctownDataContext db = new ctownDataContext();

        int id = (from x in db.employees
                  where x.name == name
                  select x.Id).First();
        return id;

    }
    public static int getEmployeeIdSalaryID(int id)
    {
        ctownDataContext db = new ctownDataContext();

        int Id = (from x in db.employesalaries
                  where x.employe_id == id && x.payment_date.Month == DateTime.Now.Month
                  select x.Id).First();

        return Id;



    }
    public static employesalary getInfo(int salaryId)
    {
        ctownDataContext db = db = new ctownDataContext();
        employesalary ra = (from x in db.employesalaries

                            where x.Id == salaryId
                            select x).First();


        return ra;
    }
    public static employee getEmpInfo(int id)
    {
        ctownDataContext db = db = new ctownDataContext();
        employee ra = (from x in db.employees

                       where x.Id == id
                       select x).First();


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