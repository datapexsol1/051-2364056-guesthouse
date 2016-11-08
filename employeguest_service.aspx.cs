using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employebranchbills : System.Web.UI.Page
{
    string msg, type;
    bool addcheck, updatecheck,check;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null)
        {
            Response.Redirect("employelogin.aspx");
        }
        else if (!IsPostBack)
        {
            int branchID = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
            ddServiceType.Items.Clear();
            //update function dropdown branch name
            IQueryable<guest_service> b = guestservice_class.getAllService(branchID);
            string[] serviceType = new string[b.Count() + 1];
            serviceType[0] = "Select";
            int i = 1;
            foreach (var x in b)
            {

                serviceType[i] = x.type;
                i++;
            }
            ddServiceType.DataSource = serviceType;
            ddServiceType.DataBind();


        }
  }




    protected void SaveServices(object sender, EventArgs e)
    {

        int eid = employeeProfile.getEmployeid(Session["loginName"].ToString());
        int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
        guest_service gs = new guest_service();
        gs.type = Request.Form["serviceId"];
        gs.description = Request.Form["addesc"];
        gs.item_quantity = int.Parse(Request.Form["adqty"]);
        gs.date_time = DateTime.Now;//.Parse(Request.Form["abdate"]);
        gs.room_no = Request.Form["adroomno"];
        gs.employee_id = eid;
        booking_Room bookroominfo = guestservice_class.getBooking(gs.room_no,bid);

        gs.item_cost = Request.Form["adcost"];
        gs.branch_id = bid;
        gs.booking_Id = bookroominfo.bookingId; 
        check = guestservice_class.addService(gs);
        if (check == true)
        {
           admin_notification_class.addnotification(eid, bid, DateTime.Now, admin_notification_class.TableNames.guest_services.ToString(), 0, admin_notification_class.CommandType.Add.ToString());
            msg = "Successfully stored the information";
            type = "Success";

        }
        else
        {
            msg = "There is an error";
            type = "Error";
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");

    }
    protected void ddServiceTypeSelectedIndex(object sender, EventArgs e)
    {
        int branchID = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
        var selectedServiceType = ddServiceType.SelectedValue;
        if (selectedServiceType != "Select" )
        {
            IQueryable<guest_service> b = guestservice_class.getRoomNo(branchID,selectedServiceType);
            string[] RoomNo = new string[b.Count() + 1];
            RoomNo[0] = "Select";
            int i = 1;
            foreach (var x in b)
            {

                RoomNo[i] = x.room_no;
                i++;
            }
            ddRoomNo.DataSource = RoomNo;
            ddRoomNo.DataBind();
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);

    }
   
    protected void ddRoomNoTypeSelectedIndex(object sender, EventArgs e)
    {
        int branchID = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
        var selectedServiceType = ddServiceType.SelectedValue;
        var roomNo = ddRoomNo.SelectedValue;
        
            List<guest_service> b = guestservice_class.getDate(branchID,selectedServiceType,roomNo);
            string[] date = new string[b.Count() + 1];
            date[0] = "Select";
            int i = 1;
            foreach (var x in b)
            {

            date[i] = x.date_time.ToString();
                i++;
            }
            ddDate.DataSource = date;
            ddDate.DataBind();
       
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);

    }
    protected void ddDateTypeSelectedIndex(object sender, EventArgs e)
    {
        int branchID = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
        var selectedServiceType = ddServiceType.SelectedValue;
        var roomNo = ddRoomNo.SelectedValue;
        DateTime date = DateTime.Parse(ddDate.SelectedValue);
        guest_service b = guestservice_class.getInfoForUpdate(branchID, selectedServiceType, roomNo,date);
        updesc.Value = b.description;
        upqty.Value = b.item_quantity.ToString();
        upcost.Value = b.item_cost.ToString();

        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);

    }
    
    protected void Update_service(object sender, EventArgs e)
    {

        int eid = employeeProfile.getEmployeid(Session["loginName"].ToString());
        int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString()); ;
        guest_service b = new guest_service();
        DateTime d = DateTime.Parse(ddDate.SelectedValue);
        b.room_no = ddRoomNo.SelectedValue;
        b.type = ddServiceType.SelectedValue;
        b.employee_id = eid;
        b.branch_id = bid;
        b.description = updesc.Value;
        b.item_cost = upcost.Value;
        b.item_quantity = int.Parse(upqty.Value);
        check = guestservice_class.updateService(b,d);
        if (check == true)
        {
            msg = "Successfully updated the information";
            type = "Success";
            admin_notification_class.addnotification(eid, bid, DateTime.Now, admin_notification_class.TableNames.guest_services.ToString(), 0, admin_notification_class.CommandType.Update.ToString());


        }
        else
        {
            msg = "There is a error";
            type = "Error";
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");
        //ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content1');", true);
    }



    }



