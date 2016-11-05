using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for admin_notification_class
/// </summary>
public class admin_notification_class
{
    public enum CommandType { Add, Update, Delete };
    public enum TableNames {bill, booking, booking_Room,banch,Branch_assets,employee,employesalary,
    event_calender,facility_payment,guests,images,online_guest_booking,other_requirement,placed_order, room_assets, room_service_menu,rooms, total_payment};

    public admin_notification_class()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static string  addnotification(int eid,int branch_id,DateTime date,string table_name,int changed_row_id,string operation_type,string seenValue)
    {
        ctownDataContext db = new ctownDataContext();
        admin_notification adminnotic = new admin_notification();
        adminnotic.eid = eid;
        adminnotic.branch_id = branch_id;
        adminnotic.time = date;
        adminnotic.table_name = table_name;
        adminnotic.Changed_row_id = changed_row_id;
        adminnotic.operation_type = operation_type;
        adminnotic.seen = seenValue;
        db.admin_notifications.InsertOnSubmit(adminnotic);
        db.SubmitChanges();

        return "Date"+operation_type+"Succesfully";
    }
    public static void notification()
    {

    //    System.Web.UI.Page.RegisterClientScriptBlock(this, "script", "  <script>ShowNotification('Error','There are an error , try again');</script>");
        //ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);

    }
}