using System;
using System.Collections.Generic;
using System.Globalization;
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
        else
        {
            if (Request.Form["__EVENTTARGET"] == "mybtn")
            {
                online_guest_booking b=onlineguestbooking.getTemporaryBookingRoom(hroomno.Value.ToString());
                checkindate.Value = b.check_in_date.ToShortDateString();
                checkoutdate.Value = b.check_out_date.ToShortDateString();
                gname.Value = b.guest_name;
                gphone.Value = b.guest_phone;
                noofguest.Value = b.no_of_guest.ToString();
                roomnonew.Value = b.no_of_room;
                gemail.Value = b.guest_email;
                comments.Value = b.Comments;
                referanceby.Value = b.referance_by_name;
                referancephone.Value = b.referance_by_contact;
                tbookingid.Value = b.Id.ToString();
                cnicno.Value = b.guest_cnic_passport;
                roomrent.Value = b.room_rent;
                ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "showupdatediv('updateroomavalibilty');", true);
            }
            
        }
       

       
    }
    protected void updateTempbooking_click(object sender, EventArgs e)
    {
        
        online_guest_booking b = new online_guest_booking();
        if (checkindate.Value != "" && checkoutdate.Value != "")
        {
            b.check_in_date = DateTime.ParseExact(checkindate.Value, "dd-MM-yyyy", CultureInfo.InvariantCulture);// DateTime.Parse(checkindate.Value);
            b.check_out_date = DateTime.ParseExact(checkoutdate.Value, "dd-MM-yyyy", CultureInfo.InvariantCulture);//DateTime.Parse(checkoutdate.Value);

        }
        else
        {
            b.check_in_date  = new DateTime(1991, 4, 1);
            b.check_out_date = new DateTime(1991, 4, 1);

        }
        b.guest_name = gname.Value;
        b.guest_phone = gphone.Value;
        b.no_of_guest = int.Parse(noofguest.Value);
         b.no_of_room= roomnonew.Value;
         b.guest_email= gemail.Value;
         b.Comments= comments.Value;
         b.referance_by_name= referanceby.Value;
       b.referance_by_contact = referancephone.Value;
        b.Id = int.Parse(tbookingid.Value);
         b.guest_cnic_passport= cnicno.Value;
          b.room_rent= roomrent.Value;
        onlineguestbooking.updateTemorarybookingRoom(b);
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), " activaTab('roomavalibilty');", true);
    }
    protected void saveroom_click(object sender, EventArgs e)
    {
        try {
            int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
            int eid = employeeProfile.getEmployeid(Session["loginName"].ToString());
            room r = new room();
            r.employee_id = int.Parse(Session["loginId"].ToString());
            r.room_no = Request.Form["roomno"].ToString();
            r.room_type = Request.Form["roomtype"].ToString();
            r.room_size = Request.Form["roomsize"].ToString();
            r.maximum_room_rent = Request.Form["roommaxrent"].ToString();
            r.minimum_room_rent = Request.Form["roomminrent"].ToString();
            r.branch_id = int.Parse(Request.Form["roombranch"].ToString());
            r.availbilty = "yes";
            bool check = roomsclass.Addroom(r);//if true display msg 
            if (check == true)
            {
                admin_notification_class.addnotification(eid, bid, DateTime.Now, admin_notification_class.TableNames.rooms.ToString(), r.Id, admin_notification_class.CommandType.Add.ToString());
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
        catch(Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('Error','" + ex.Message + "');</script>");

        }
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
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content3');", true);

    }
    protected void updateRoomInfo(object sender, EventArgs e)
    {
        try {
            int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
            int eid = employeeProfile.getEmployeid(Session["loginName"].ToString());
            room rm = new room();
            rm.room_no = roomnoupdate.Value;
            rm.room_type = roomtypeupdate.Value;
            rm.minimum_room_rent = roomminrentupdate.Value;
            rm.maximum_room_rent = roommaxrentupdate.Value;
            rm.room_size = roomsizeupdate.Value;
            bool check = roomsclass.updateRoom(rm, bid);
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

        }catch(Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('Error','" + ex.Message + "');</script>");

        }
    }
    


    }