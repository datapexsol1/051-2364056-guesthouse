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


    public static bool adminAuthentication(string uname, string password)
    {

        
        try
        {
            ctownDataContext Database = new ctownDataContext();

            int count = (from a in Database.GetTable<employee>()
                     where a.username == uname && a.password == password && a.login_type == "Admin"
                     select new
                     {
                         a.username,
                         a.Id
                     }).Count();
            
            if (count > 0)
            {
                return true;
            }
            else
            {
                return false; 
            }


        }
        catch (Exception e)
        {
            return false;
        }
      
    }
  
}