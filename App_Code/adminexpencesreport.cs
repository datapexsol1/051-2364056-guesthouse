using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for adminexpencesreport
/// </summary>
public class adminexpencesreport
{
    public adminexpencesreport()
    {
        //,jkjkjk
        // TODO: Add constructor logic here
        //
    }
    public static empbillandsalclass getexpenditures(string branch, string employeusername, DateTime date) {
        ////bills+salary
        int bid = 0;
        int empid = 0;
        if (branch != "")
        {
           bid= branchClass.getBranchID(branch);
        }
        if (employeusername != "")
        {
           empid = employeeProfile.getEmployeid(employeusername);
        }
        
        ctownDataContext db = new ctownDataContext();
        if(branch!="" && employeusername!="")
        {
              IQueryable<bill> bills = from x in db.bills
               where x.BranchId == bid && x.Date.Month == date.Month && x.employee_id==empid
               select x;

            IQueryable<employesalary> salary= from y in db.employees
                         join sal in db.employesalaries on y.Id equals sal.employe_id
                         where y.branch_id == bid && sal.payment_date.Month == date.Month && sal.employe_id == empid
                         select sal;
            empbillandsalclass em = new empbillandsalclass();
            em.bills = bills;
            em.salary = salary;

            return em;

        }else if(branch!="" && employeusername=="")
        {

            IQueryable<bill> bills = from x in db.bills
                                     where x.BranchId == bid && x.Date.Month == date.Month
                                     select x;

            IQueryable<employesalary> salary = from y in db.employees
                                               join sal in db.employesalaries on y.Id equals sal.employe_id
                                               where y.branch_id == bid && sal.payment_date.Month == date.Month
                                               select sal;
            empbillandsalclass em = new empbillandsalclass();
            em.bills = bills;
            em.salary = salary;

            return em;
        }
        else if (branch == "" && employeusername == "")
        {

            IQueryable<bill> bills = from x in db.bills
                                     where x.Date.Month == date.Month
                                     select x;

            IQueryable<employesalary> salary = from y in db.employees
                                               join sal in db.employesalaries on y.Id equals sal.employe_id
                                               where sal.payment_date.Month==date.Month
                                               select sal;
            empbillandsalclass em = new empbillandsalclass();
            em.bills = bills;
            em.salary = salary;

            return em;
        }else
        {
            IQueryable<bill> bills = from x in db.bills
                                     where x.Date.Month == date.Month && x.employee_id==empid
                                     select x;

            IQueryable<employesalary> salary = from y in db.employees
                                               join sal in db.employesalaries on y.Id equals sal.employe_id
                                               where sal.payment_date.Month == date.Month && sal.employe_id == empid
                                               select sal;
            empbillandsalclass em = new empbillandsalclass();
            em.bills = bills;
            em.salary = salary;

            return em;
        }


    }
}