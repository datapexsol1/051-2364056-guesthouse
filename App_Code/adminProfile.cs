using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for adminProfile
/// </summary>
public class adminProfile
{
    public adminProfile()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    public static int adminAuthentication(string uname, string password)
    {

        int returnid = 0;
        try
        {
            ctownDataContext Database = new ctownDataContext();

            var q = (from a in Database.GetTable<employee>()
                     where a.username == uname && a.password == password && a.login_type=="Admin"
                     select new
                     {
                         a.username,
                         a.Id
                     }).First();
            int x = q.Id;
            if (x > 0)
            {
                returnid = q.Id;
            }


        }
        catch (Exception e)
        {

        }
        return returnid;
    }
}