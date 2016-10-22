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
    public static void updateEvent(event_calender ec, int id)
    {
        ctownDataContext db = new ctownDataContext();
        var updatedEvent = (from x in db.event_calenders
                  where x.Id == id
                  select x).First();
        updatedEvent.event_name = ec.event_name;
        updatedEvent.event_description = ec.event_description;
        updatedEvent.event_start_date = ec.event_start_date;
        updatedEvent.event_end_date = ec.event_end_date;
        updatedEvent.event_color = ec.event_color;
        int check = (from y in db.event_calenders
                     where y.event_name == updatedEvent.event_name && y.event_description==updatedEvent.event_description && y.event_color == updatedEvent.event_color
                     select y).Count();
        if (check == 0)
        {
            db.SubmitChanges();
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
    public static bool deleteEvent(event_calender ec, int id)
    {
        ctownDataContext db = new ctownDataContext();
        event_calender eventcal = (from x in db.event_calenders
                                   where x.Id == id
                                   select x).First();
        int count = (from y in db.event_calenders
                     where y.Id == eventcal.Id
                     select y).Count();
        if (count == 1)
        {
            db.event_calenders.DeleteOnSubmit(eventcal);
            db.SubmitChanges();

            return true;
        }
        else
        {
            return false;
        }

    }
}