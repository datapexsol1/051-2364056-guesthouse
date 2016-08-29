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
    public static int getEmployeBranch(string username)
    {
        ctownDataContext db = new ctownDataContext();

        int bid = (from x in db.GetTable<employee>()
                   join b in db.branches on x.branch_id equals b.Id
                   where x.username == username
                   select b.Id).First();
        return bid;
    }

}