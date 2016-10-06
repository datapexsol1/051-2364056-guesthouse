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
        ra.image = emp.image;
        int check = (from y in db.employees
                     where y.Id == ra.Id
                     select y).Count();
        if (check == 1)
        {
            db.SubmitChanges();
        }
    }

}