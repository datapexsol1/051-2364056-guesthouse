using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ghuestclass
/// </summary>
public class ghuestclass
{
    public ghuestclass()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static int getTotalGuest()
    {
        ctownDataContext db = new ctownDataContext();
        int guest=(from x in db.GetTable<guest>()
                  select x).Count();
        return guest;
    }

}