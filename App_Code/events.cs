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
            //db.event_calenders.InsertOnSubmit(ev);
            //db.SubmitChanges();
            //return true;
            int count = (from x in db.event_calenders
                         where x.event_description== ev.event_description && x.event_color == ev.event_color && x.event_start_date == ev.event_start_date
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
    public static event_calender retrieveSelectedEvent(int id)
    {
        ctownDataContext db = new ctownDataContext();
        event_calender getInfo = (from x in db.event_calenders
                                  where x.Id == id
                                  select x).First();
        return getInfo;
    }

    public static IQueryable<event_calender> retrieveAllEvents()
    {
        ctownDataContext db = new ctownDataContext();
        IQueryable <event_calender> ec = from x in db.event_calenders

                               
                               select x;
        return ec;
    }
}