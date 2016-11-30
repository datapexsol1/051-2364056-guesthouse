using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminrooms : System.Web.UI.Page
{
    string msg, type;
    bool check;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminLogin"] == null)
        {
            Response.Redirect("adminlogin.aspx");
        }
        else if (!IsPostBack)
        {
            branch.Items.Clear();
            IQueryable<branch> br = admingraphclass.getAllbranches();
            branch.Items.Add("Select Branch");
            foreach (branch b in br)
            {
                branch.Items.Add(b.name);
            }
           
        }
    }

   

    protected void saveroom_click(object sender, EventArgs e)
    {
        try
        {
            int bid = branchClass.getBranchID(branch.SelectedValue);// employeeProfile.getEmployeBranch(Session["loginName"].ToString());
            int eid = employeeProfile.getEmployeid(Session["adminLogin"].ToString());
            room r = new room();
            r.employee_id = eid;// int.Parse(Session["loginId"].ToString());
            r.room_no = Request.Form["roomno"].ToString();
            r.room_type = Request.Form["roomtype"].ToString();
            r.room_size = Request.Form["roomsize"].ToString();
            r.maximum_room_rent = Request.Form["roommaxrent"].ToString();
            r.minimum_room_rent = Request.Form["roomminrent"].ToString();
            r.branch_id = bid;//int.Parse(Request.Form["roombranch"].ToString());
            r.availbilty = "yes";
            bool check = roomsclass.Addroom(r);//if true display msg 
            if (check == true)
            {
            //    admin_notification_class.addnotification(eid, bid, DateTime.Now, admin_notification_class.TableNames.rooms.ToString(), r.Id, admin_notification_class.CommandType.Add.ToString());
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
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('Error','" + ex.Message + "');</script>");

        }
    }
    protected void branchIndexChange(object sender, EventArgs e)
    {
        IQueryable<room> rm = roomsclass.getAllRooms(branchClass.getBranchID(branch.SelectedValue));

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
        //int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
        //string selectedRoomNo = ddRoomNo.SelectedItem.Value;
        //room rm = roomsclass.getRoomInfo(selectedRoomNo, bid);
        //roomnoupdate.Value = rm.room_no;
        //roomtypeupdate.Value = rm.room_type;
        //roomminrentupdate.Value = rm.minimum_room_rent;
        //roommaxrentupdate.Value = rm.maximum_room_rent;
        //roomsizeupdate.Value = rm.room_size;
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content3');", true);

    }
    
    protected void ddRoomNoIndexChanged(object sender, EventArgs e)
    {
        int bid = branchClass.getBranchID(branch.SelectedValue);// employeeProfile.getEmployeBranch(Session["adminLogin"].ToString());
        string selectedRoomNo = ddRoomNo.SelectedItem.Value;
        room rm = roomsclass.getRoomInfo(selectedRoomNo, bid);
        roomnoupdate.Value = rm.room_no;
        roomtypeupdate.Value = rm.room_type;
        roomminrentupdate.Value = rm.minimum_room_rent;
        roommaxrentupdate.Value = rm.maximum_room_rent;
        roomsizeupdate.Value = rm.room_size;
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content3');", true);

    }
    protected void updateRoomInfo(object sender, EventArgs e)
    {
        try
        {
            int bid = branchClass.getBranchID(branch.SelectedValue);// employeeProfile.getEmployeBranch(Session["loginName"].ToString());
            int eid = employeeProfile.getEmployeid(Session["adminLogin"].ToString());
            room rm = new room();
            rm.room_no = roomnoupdate.Value;
            rm.room_type = roomtypeupdate.Value;
            rm.minimum_room_rent = roomminrentupdate.Value;
            rm.maximum_room_rent = roommaxrentupdate.Value;
            rm.room_size = roomsizeupdate.Value;
            bool check = roomsclass.updateRoom(rm, bid);
            if (check == true)
            {
             //   admin_notification_class.addnotification(eid, bid, DateTime.Now, admin_notification_class.TableNames.bill.ToString(), rm.Id, admin_notification_class.CommandType.Update.ToString());
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
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('Error','" + ex.Message + "');</script>");

        }
    }

    //protected void saveroom_click(object sender, EventArgs e)
    //{
    //    room r = new room();
    //    r.employee_id = employeeProfile.getEmployeeId(Session["adminLogin"].ToString());
    //    r.room_no = Request.Form["roomno"].ToString();
    //    r.room_type = Request.Form["roomtype"].ToString();
    //    r.room_size = Request.Form["roomsize"].ToString();
    //    r.maximum_room_rent = Request.Form["roommaxrent"].ToString();
    //    r.minimum_room_rent = Request.Form["roomminrent"].ToString();
    //    r.branch_id = int.Parse(Request.Form["roombranch"].ToString());
    //    r.availbilty = "yes";
    //    check = roomsclass.Addroom(r);//if true display msg 
    //    if (check == true)
    //    {
    //        msg = "Successfully stored the information";
    //        type = "Success";
    //        //show succesful msg
    //    }
    //    else
    //    {
    //        msg = "There is some error";
    //        type = "Error";
    //    }
    //    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");

    //}
}