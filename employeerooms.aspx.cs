using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeerooms : System.Web.UI.Page
{
    string msg, type;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginId"] == null)
        {
            Response.Redirect("employelogin.aspx");
        }
        else if(!IsPostBack)
        {
            IQueryable<room> rm = roomsclass.getAllRooms(employeeProfile.getEmployeBranch(Session["loginName"].ToString()));

            string[] roomNo = new string[rm.Count() + 1];
            roomNo[0] = "Select";
            int i = 1;
            foreach (var x in rm)
            {

                roomNo[i] = x.room_no;
                i++;
            }
            ddRoomNo.DataSource = roomNo;
            ddRoomNo.DataBind();
        }
    }
    protected void save_ServerClick(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + "Success" + "','" + "hello" + "');</script>");

    }

    protected void saveroom_click(object sender, EventArgs e)
    {
        int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
        int eid = employeeProfile.getEmployeid(Session["loginName"].ToString());
        room r = new room();
        r.employee_id = int.Parse(Session["loginId"].ToString());
        r.room_no = Request.Form["roomno"].ToString();
        r.room_type= Request.Form["roomtype"].ToString();
        r.room_size = Request.Form["roomsize"].ToString();
        r.maximum_room_rent = Request.Form["roommaxrent"].ToString();
        r.minimum_room_rent = Request.Form["roomminrent"].ToString();
        r.branch_id = int.Parse(Request.Form["roombranch"].ToString());
        r.availbilty = "yes";
        bool check = roomsclass.Addroom(r);//if true display msg 
        if(check == true)
        {
            admin_notification_class.addnotification(eid, bid, DateTime.Now, admin_notification_class.TableNames.rooms.ToString(),r.Id, admin_notification_class.CommandType.Add.ToString());
            msg = "Successfully stored the information";
            type = "Success";

        }
        else
        {
            msg = "There is some error";
            type = "Error";
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");
    }
    protected void ddRoomNoIndexChanged(object sender, EventArgs e)
    {
        int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
        string selectedRoomNo = ddRoomNo.SelectedItem.Value;
        room rm = roomsclass.getRoomInfo(selectedRoomNo, bid);
        roomnoupdate.Value = rm.room_no;
        roomtypeupdate.Value = rm.room_type;
        roomminrentupdate.Value = rm.minimum_room_rent;
        roommaxrentupdate.Value = rm.maximum_room_rent;
        roomsizeupdate.Value = rm.room_size;
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);
    }
    protected void updateRoomInfo(object sender, EventArgs e)
    {
        int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
        int eid = employeeProfile.getEmployeid(Session["loginName"].ToString());
        room rm = new room();
        rm.room_no = roomnoupdate.Value;
        rm.room_type = roomtypeupdate.Value;
        rm.minimum_room_rent = roomminrentupdate.Value;
        rm.maximum_room_rent = roommaxrentupdate.Value;
        rm.room_size = roomsizeupdate.Value;
        bool check = updateRoom(rm, bid);
        if (check == true)
        {
            admin_notification_class.addnotification(eid, bid, DateTime.Now, admin_notification_class.TableNames.bill.ToString(), rm.Id, admin_notification_class.CommandType.Update.ToString());
            msg = "Successfully updated the information";
            type = "Success";

        }
        else
        {
            msg = "There is some error";
            type = "Error";
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");

    }
    public static bool updateRoom(room rm, int bid)
    {
        ctownDataContext db = new ctownDataContext();
        var ra = (from x in db.rooms
                  where x.branch_id == bid
                  select x).First();

        ra.room_no = rm.room_no;
        ra.room_type = rm.room_type;
        ra.minimum_room_rent = rm.minimum_room_rent;
        ra.maximum_room_rent = rm.maximum_room_rent;
        ra.room_size = rm.room_size;

        int check = (from y in db.rooms
                     where y.Id == ra.Id
                     select y).Count();
        if (check == 1)
        {
            db.SubmitChanges();
            return true;
        }
        else
        {
            return false;
        }
    }
    

}