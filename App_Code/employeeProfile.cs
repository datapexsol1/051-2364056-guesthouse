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
    public static bool employeSignin(string username,string password)
    {
        ctownDataContext Database = new ctownDataContext();
        int count = (from x in Database.employees
                     where x.username == username && x.password==password && x.login_type=="Employe"   //for checking already existance of client
                     select x).Count();
        if (count == 0)
        {
            return false; 
        }
        else
        {
            return true;
        }
    }

}