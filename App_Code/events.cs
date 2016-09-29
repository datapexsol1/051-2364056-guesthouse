using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for events
/// </summary>
public class events
{
    public events()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static bool addEvent(event_calender ev)
    {
        try
        {
            ctownDataContext db = db = new ctownDataContext();
            int count = (from x in db.event_calenders
                         where x.Id == ev.Id
                         select x).Count();
            if (count == 0)
            {
                db.event_calenders.InsertOnSubmit(ev);
                db.SubmitChanges();
                return true;
            }
            else
            {
                return false;
            }

        }
        catch (Exception ex)
        {
            return false;
        }
    }
    public static IQueryable<event_calender> retrieveAllEvents()
    {
        ctownDataContext db = new ctownDataContext();
        IQueryable <event_calender> ec = from x in db.event_calenders

                               
                               select x;
        return ec;
    }
}