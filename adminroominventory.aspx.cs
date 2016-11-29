using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminroominventory : System.Web.UI.Page
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
            brid.Items.Clear();
            IQueryable<branch> br = admingraphclass.getAllbranches();
            brid.Items.Add("Select Branch");
            foreach (branch b in br)
            {
                brid.Items.Add(b.name);
            }
        }

        //  Response.Redirect("#tab_add");
    }
    protected void branchindexchange(object sender, EventArgs e)
    {
        int bid = branchClass.getBranchID(brid.SelectedValue);
        IQueryable<room> r = roomsclass.getAllRooms(bid);
        string[] rooms = new string[r.Count() + 1];
        rooms[0] = "Select";
        int i = 1;
        foreach (var x in r)
        {

            rooms[i] = x.room_no;
            i++;
        }
        uroomno.DataSource = rooms;
        uroomno.DataBind();
        branch.Value = bid.ToString();
        ddRoomNo.DataSource = rooms;
        ddRoomNo.DataBind();
    }
    protected void roomSelectedIndexChange(object sender, EventArgs e)
    {
        int roomId = roomsclass.getRoomID(uroomno.SelectedItem.ToString(), int.Parse(branch.Value));
        IQueryable<room_asset> r = roomassetclass.getinventry(roomId);
        string[] rooms = new string[r.Count() + 1];
        rooms[0] = "Select";
        int i = 1;
        foreach (var x in r)
        {

            rooms[i] = x.label;
            i++;
        }
        roombranch.DataSource = rooms;
        roombranch.DataBind();
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);

    }
    protected void inventorySelectedIndexChange(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);
        int roomId = roomsclass.getRoomID(uroomno.SelectedItem.ToString(), int.Parse(branch.Value));
        var selectedValue = ((DropDownList)sender).SelectedValue;
        room_asset r = roomassetclass.getRoomAssetsInfo(roomId, selectedValue);
        ulabel.Value = r.label;
        udescription.Value = r.description;
        uitemno.Value = r.total_item.ToString();
        inventoryId.Value = r.id.ToString();
        //     string itemDescription = roomassetclass.getdecriptionItem();

        // ulabel.Value = selectedValue;

        //    udescription.Value = ;
    }
    protected void saveAssets_click(object sender, EventArgs e)
    {
        try
        {
            int eid = employeeProfile.getEmployeid(Session["adminLogin"].ToString());
            int bid = branchClass.getBranchID(brid.SelectedValue);
            room_asset r = new room_asset();
            //r.room_id = roomassetclass.getRoomId(Request.Form["rno"].ToString());
            r.room_id = int.Parse(Request.Form["rno"].ToString());
            r.label = Request.Form["alabel"].ToString();
            r.description = Request.Form["adescription"].ToString();
            r.total_item = int.Parse(Request.Form["insertaitemno"].ToString());
            r.employee_id = eid;//int.Parse(Session["loginId"].ToString());
            check = roomassetclass.addinventry(r);
            if (check == true)
            {
                admin_notification_class.addnotification(eid, bid, DateTime.Now, admin_notification_class.TableNames.rooms.ToString(), 0, admin_notification_class.CommandType.Add.ToString());
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
    protected void updateAssets_click(object sender, EventArgs e)
    {
        try
        {
            room_asset r = new room_asset();
            r.employee_id = employeeProfile.getEmployeid(Session["adminLogin"].ToString());
            r.room_id = roomsclass.getRoomID(uroomno.Text, int.Parse(branch.Value));
            r.label = ulabel.Value;
            r.description = udescription.Value;
            r.total_item = int.Parse(uitemno.Value);
            check = roomassetclass.updateInventory(r, int.Parse(inventoryId.Value));
            int eid = employeeProfile.getEmployeid(Session["adminLogin"].ToString());
            int bid = branchClass.getBranchID(brid.SelectedValue);
            if (check == true)
            {
              //  admin_notification_class.addnotification(eid, bid, DateTime.Now, admin_notification_class.TableNames.rooms.ToString(), r.id, admin_notification_class.CommandType.Update.ToString());
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
    protected void ddRoomNoSelectedIndexChanges(object sender, EventArgs e)
    {
        TableRow tRow1 = new TableRow();
        assetsViewTable.Rows.Add(tRow1);
        TableCell tCell1 = new TableCell();
        tCell1.Text = "RoomNo ";
        tRow1.Cells.Add(tCell1);
        TableCell tCell2 = new TableCell();
        tCell2.Text = "Item Name";
        tRow1.Cells.Add(tCell2);
        TableCell tCell3 = new TableCell();
        tCell3.Text = "Description";
        tRow1.Cells.Add(tCell3);
        TableCell tCell4 = new TableCell();
        tCell4.Text = "Total Item";
        tRow1.Cells.Add(tCell4);
        // }
        int roomid = roomassetclass.getRoomId(ddRoomNo.SelectedValue);//ddRoomNo.SelectedValue;
                                                                      // int roomid = int.Parse(Request["rnovxxxx"].ToString());
        int branchid = int.Parse(branch.Value);


        IQueryable<room_asset> rom = roomassetclass.getAllRoomAssets(branchid, roomid);
        foreach (var x in rom)
        {
            TableRow tRow = new TableRow();
            assetsViewTable.Rows.Add(tRow);
            TableCell tCellr = new TableCell();
            tCellr.Text = x.room_id.ToString();
            tRow.Cells.Add(tCellr);
            TableCell tCellrn = new TableCell();
            tCellrn.Text = x.label;
            tRow.Cells.Add(tCellrn);
            TableCell tCellrd = new TableCell();
            tCellrd.Text = x.description;
            tRow.Cells.Add(tCellrd);
            TableCell tCellri = new TableCell();
            tCellri.Text = x.total_item.ToString();
            tRow.Cells.Add(tCellri);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {



        TableRow tRow1 = new TableRow();
        assetsViewTable.Rows.Add(tRow1);
        TableCell tCell1 = new TableCell();
        tCell1.Text = "RoomNo ";
        tRow1.Cells.Add(tCell1);
        TableCell tCell2 = new TableCell();
        tCell2.Text = "Item Name";
        tRow1.Cells.Add(tCell2);
        TableCell tCell3 = new TableCell();
        tCell3.Text = "Description";
        tRow1.Cells.Add(tCell3);
        TableCell tCell4 = new TableCell();
        tCell4.Text = "Total Item";
        tRow1.Cells.Add(tCell4);
        // }
        //int roomid = roomassetclass.getRoomId(ddRoomNo.SelectedValue);//ddRoomNo.SelectedValue;
        int roomid = int.Parse(Request["rnovxxxx"].ToString());
        int branchid = int.Parse(branch.Value);


        IQueryable<room_asset> rom = roomassetclass.getAllRoomAssets(branchid, roomid);
        foreach (var x in rom)
        {
            TableRow tRow = new TableRow();
            assetsViewTable.Rows.Add(tRow);
            TableCell tCellr = new TableCell();
            tCellr.Text = x.room_id.ToString();
            tRow.Cells.Add(tCellr);
            TableCell tCellrn = new TableCell();
            tCellrn.Text = x.label;
            tRow.Cells.Add(tCellrn);
            TableCell tCellrd = new TableCell();
            tCellrd.Text = x.description;
            tRow.Cells.Add(tCellrd);
            TableCell tCellri = new TableCell();
            tCellri.Text = x.total_item.ToString();
            tRow.Cells.Add(tCellri);
        }




    }


}


//    }
//protected void roomSelectedIndexChange(object sender, EventArgs e)
//{
//        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);

//        int roomId = roomsclass.getRoomID(uroomno.SelectedItem.ToString(), int.Parse(branch.Value));
//    IQueryable<room_asset> r = roomassetclass.getinventry(roomId);
//    string[] rooms = new string[r.Count() + 1];
//    rooms[0] = "Select";
//    int i = 1;
//    foreach (var x in r)
//    {

//        rooms[i] = x.label;
//        i++;
//    }
//    roombranch.DataSource = rooms;
//    roombranch.DataBind();
//    ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);

//}
//protected void inventorySelectedIndexChange(object sender, EventArgs e)
//{
//    ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);
//    int roomId = roomsclass.getRoomID(uroomno.SelectedItem.ToString(), int.Parse(branch.Value));
//    var selectedValue = ((DropDownList)sender).SelectedValue;
//    room_asset r = roomassetclass.getRoomAssetsInfo(roomId, selectedValue);
//    ulabel.Value = r.label;
//    udescription.Value = r.description;
//    uitemno.Value = r.total_item.ToString();
//    inventoryId.Value = r.id.ToString();
//        //     string itemDescription = roomassetclass.getdecriptionItem();

//        // ulabel.Value = selectedValue;

//        //    udescription.Value = ;
//        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);

//    }
//    protected void saveAssets_click(object sender, EventArgs e)
//{
//    room_asset r = new room_asset();
//    r.room_id = int.Parse(Request.Form["rno"].ToString());
//    r.label = Request.Form["alabel"].ToString();
//    r.description = Request.Form["adescription"].ToString();
//    r.total_item = int.Parse(Request.Form["insertaitemno"].ToString());
//    r.employee_id = int.Parse(Session["adminLogin"].ToString());
//    check = roomassetclass.addinventry(r);
//        if (check == true)
//        {
//            msg = "Successfully stored the information";
//            type = "Success";
//            //show succesful msg
//        }
//        else
//        {
//            msg = "There is some error";
//            type = "Error";
//        }
//        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");

//        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);

//    }
//    protected void updateAssets_click(object sender, EventArgs e)
//{

//    room_asset r = new room_asset();
//    r.employee_id = int.Parse(Session["adminLogin"].ToString());
//    r.room_id = roomsclass.getRoomID(uroomno.Text, int.Parse(branch.Value));
//    r.label = ulabel.Value;
//    r.description = udescription.Value;
//    r.total_item = int.Parse(uitemno.Value);
//    check = roomassetclass.updateInventory(r, int.Parse(inventoryId.Value));
//        if (check == true)
//        {
//            msg = "Successfully stored the information";
//            type = "Success";
//            //show succesful msg
//        }
//        else
//        {
//            msg = "There is some error";
//            type = "Error";
//        }
//        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");

//        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);

//    }

//    protected void Button1_Click(object sender, EventArgs e)
//{

//        int bid = branchClass.getBranchID(brid.SelectedValue);

//        TableRow tRow1 = new TableRow();
//    assetsViewTable.Rows.Add(tRow1);
//    TableCell tCell1 = new TableCell();
//    tCell1.Text = "RoomNo ";
//    tRow1.Cells.Add(tCell1);
//    TableCell tCell2 = new TableCell();
//    tCell2.Text = "Item Name";
//    tRow1.Cells.Add(tCell2);
//    TableCell tCell3 = new TableCell();
//    tCell3.Text = "Description";
//    tRow1.Cells.Add(tCell3);
//    TableCell tCell4 = new TableCell();
//    tCell4.Text = "Total Item";
//    tRow1.Cells.Add(tCell4);
//        // }
//        // int roomid = int.Parse(Request["rnovxxxx"].ToString());
//        string roomno = rnovxxxx.SelectedValue;
//        int roomid = roomsclass.getRoomID(roomno,bid);
//        int branchid = int.Parse(branch.Value);


//    IQueryable<room_asset> rom = roomassetclass.getAllRoomAssets(branchid, roomid);
//    foreach (var x in rom)
//    {
//        TableRow tRow = new TableRow();
//        assetsViewTable.Rows.Add(tRow);
//        TableCell tCellr = new TableCell();
//        tCellr.Text = x.room_id.ToString();
//        tRow.Cells.Add(tCellr);
//        TableCell tCellrn = new TableCell();
//        tCellrn.Text = x.label;
//        tRow.Cells.Add(tCellrn);
//        TableCell tCellrd = new TableCell();
//        tCellrd.Text = x.description;
//        tRow.Cells.Add(tCellrd);
//        TableCell tCellri = new TableCell();
//        tCellri.Text = x.total_item.ToString();
//        tRow.Cells.Add(tCellri);
//    }




//}
//    protected void branchindexchange(object sender,EventArgs e)
//    {
//        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);

//        int bid = branchClass.getBranchID(brid.SelectedValue);
//       // int bid = employeeProfile.getEmployeBranch("kk");//get from session
//        IQueryable<room> r = roomsclass.getAllRooms(bid);
//        string[] rooms = new string[r.Count() + 1];
//        rooms[0] = "Select";
//        int i = 1;
//        foreach (var x in r)
//        {

//            rooms[i] = x.room_no;
//            i++;
//        }
//        rnovxxxx.DataSource = rooms;
//        rnovxxxx.DataBind();
//        branch.Value = bid.ToString();

//        // update dropdown changed
//        uroomno.DataSource = rooms;
//        uroomno.DataBind();
//        //   int bid1 = employeeProfile.getEmployeBranch("kk");//get from session
//        //IQueryable<room> r1 = roomsclass.getAllRooms(bid);
//        //string[] rooms1 = new string[r.Count() + 1];
//        //rooms[0] = "Select";
//        //int i1 = 1;
//        //foreach (var x in r1)
//        //{

//        //    rooms[i1] = x.room_no;
//        //    i1++;
//        //}
//        //uroomno.DataSource = rooms;
//        //uroomno.DataBind();
//        //branch.Value = bid1.ToString();





//    }
//    //protected void indexSelectedIndexChange(object sender, EventArgs e)
//    //{
//    //    int bid = branchClass.getBranchID(brid.SelectedValue);
//    //    // int bid = employeeProfile.getEmployeBranch("kk");//get from session
//    //    IQueryable<room> r = roomsclass.getAllRooms(bid);
//    //    string[] rooms = new string[r.Count() + 1];
//    //    rooms[0] = "Select";
//    //    int i = 1;
//    //    foreach (var x in r)
//    //    {

//    //        rooms[i] = x.room_no;
//    //        i++;
//    //    }
//    //    rnovxxxx.DataSource = rooms;
//    //    rnovxxxx.DataBind();
//    //    branch.Value = bid.ToString();




//    //}
//}