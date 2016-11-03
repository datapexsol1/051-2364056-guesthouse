using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for admin_notification_class
/// </summary>
public class admin_notification_class
{
    public admin_notification_class()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static string  addnotification(int eid,int branch_id,DateTime date,string table_name,int changed_row_id,string operation_type)
    {
        ctownDataContext db = new ctownDataContext();
        admin_notification adminnotic = new admin_notification();
        adminnotic.eid = eid;
        adminnotic.branch_id = branch_id;
        adminnotic.time = date;
        adminnotic.table_name = table_name;
        adminnotic.Changed_row_id = changed_row_id;
        adminnotic.operation_type = operation_type;
        db.admin_notifications.InsertOnSubmit(adminnotic);
        db.SubmitChanges();

        return "Date"+operation_type+"Succesfully";
    }
}