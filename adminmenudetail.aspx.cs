using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminmenudetail : System.Web.UI.Page
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
    //}
    //    TableRow tRow1 = new TableRow();
    //    menuview.Rows.Add(tRow1);
    //    //TableCell tCell1 = new TableCell();
    //    //tCell1.Text = "Menu type ";
    //    //tRow1.Cells.Add(tCell1);
    //    TableCell tCell2 = new TableCell();
    //    tCell2.Text = "Item name";
    //    tRow1.Cells.Add(tCell2);
    //    TableCell tCell3 = new TableCell();
    //    tCell3.Text = "Item price";
    //    tRow1.Cells.Add(tCell3);
    //    TableCell tCell4 = new TableCell();
    //    tCell4.Text = "Item Quantity";
    //    tRow1.Cells.Add(tCell4);

    //    // int roomid = int.Parse(Request["rnovxxxx"].ToString());
    //    // int branchid = int.Parse(Request["branch"]);
    //    if(branch.SelectedValue!="Select Branch") { 
    //    int bid = branchClass.getBranchID(branch.SelectedValue);// employeeProfile.getEmployeBranch("kk");//get from sessions
    //    if (branch.SelectedValue == "Select Branch")
    //    {

    //    }
    //    else
    //    {

    //        int branchid = branchClass.getBranchID(branch.SelectedValue);
    //        //IQueryable<room_service_menu> assets = empmenuclass.getMenuItem(bid); // old function
    //        IQueryable<room_service_menu> assets = empmenuclass.getMenuItem(branchid);
    //        string checkin = "";
    //            foreach (var x in assets)
    //            {
    //                if (x.type == checkin)
    //                {
    //                    TableRow tRow = new TableRow();
    //                    menuview.Rows.Add(tRow);
    //                    //TableCell tCellr = new TableCell();
    //                    //tCellr.Text = x.type.ToString();
    //                    //tRow.Cells.Add(tCellr);
    //                    TableCell tCellrn = new TableCell();
    //                    tCellrn.Text = x.item_name;
    //                    tRow.Cells.Add(tCellrn);
    //                    TableCell tCellrd = new TableCell();
    //                    tCellrd.Text = x.price.ToString();
    //                    tRow.Cells.Add(tCellrd);
    //                    TableCell tCellri = new TableCell();
    //                    tCellri.Text = x.quantity.ToString();
    //                    tRow.Cells.Add(tCellri);
    //                    checkin = x.type;
    //                }
    //                else
    //                {
    //                    TableRow hRow = new TableRow();
    //                    menuview.Rows.Add(hRow);
    //                    TableCell hCellr = new TableCell();
    //                    hCellr.Text = x.type.ToString();
    //                    hCellr.BackColor = System.Drawing.ColorTranslator.FromHtml("#800000");
    //                    hCellr.ForeColor = System.Drawing.Color.White;
    //                    hCellr.ColumnSpan = 3;
    //                    hRow.Cells.Add(hCellr);

    //                    TableRow tRow = new TableRow();
    //                    menuview.Rows.Add(tRow);
    //                    //TableCell tCellr = new TableCell();
    //                    //tCellr.Text = x.type.ToString();
    //                    //tRow.Cells.Add(tCellr);
    //                    TableCell tCellrn = new TableCell();
    //                    tCellrn.Text = x.item_name;
    //                    tRow.Cells.Add(tCellrn);
    //                    TableCell tCellrd = new TableCell();
    //                    tCellrd.Text = x.price.ToString();
    //                    tRow.Cells.Add(tCellrd);
    //                    TableCell tCellri = new TableCell();
    //                    tCellri.Text = x.quantity.ToString();
    //                    tRow.Cells.Add(tCellri);
    //                    checkin = x.type;


    //                    checkin = x.type;
    //                }

    //            }
    //        }
    //    }
    //}
    protected void branchindexchange(object sender, EventArgs e)
    {
        viewMenu();
    }
        
    protected void viewMenu()
    {
        TableRow tRow1 = new TableRow();
        menuview.Rows.Add(tRow1);
        //TableCell tCell1 = new TableCell();
        //tCell1.Text = "Menu type ";
        //tRow1.Cells.Add(tCell1);
        TableCell tCell2 = new TableCell();
        tCell2.Text = "Item name";
        tRow1.Cells.Add(tCell2);
        TableCell tCell3 = new TableCell();
        tCell3.Text = "Item price";
        tRow1.Cells.Add(tCell3);
        TableCell tCell4 = new TableCell();
        tCell4.Text = "Item Quantity";
        tRow1.Cells.Add(tCell4);

        // int roomid = int.Parse(Request["rnovxxxx"].ToString());
        // int branchid = int.Parse(Request["branch"]);
        int bid = branchClass.getBranchID(branch.SelectedValue);//get from sessions

        IQueryable<room_service_menu> assets = empmenuclass.getMenuItem(bid);
        string checkin = "";
        foreach (var x in assets)
        {
            if (x.type == checkin)
            {
                TableRow tRow = new TableRow();
                menuview.Rows.Add(tRow);
                //TableCell tCellr = new TableCell();
                //tCellr.Text = x.type.ToString();
                //tRow.Cells.Add(tCellr);
                TableCell tCellrn = new TableCell();
                tCellrn.Text = x.item_name;
                tRow.Cells.Add(tCellrn);
                TableCell tCellrd = new TableCell();
                tCellrd.Text = x.price.ToString();
                tRow.Cells.Add(tCellrd);
                TableCell tCellri = new TableCell();
                tCellri.Text = x.quantity.ToString();
                tRow.Cells.Add(tCellri);
                checkin = x.type;
            }
            else
            {
                TableRow hRow = new TableRow();
                menuview.Rows.Add(hRow);
                TableCell hCellr = new TableCell();
                hCellr.Text = x.type.ToString();
                hCellr.BackColor = System.Drawing.ColorTranslator.FromHtml("#800000");
                hCellr.ForeColor = System.Drawing.Color.White;
                hCellr.ColumnSpan = 3;
                hRow.Cells.Add(hCellr);

                TableRow tRow = new TableRow();
                menuview.Rows.Add(tRow);
                //TableCell tCellr = new TableCell();
                //tCellr.Text = x.type.ToString();
                //tRow.Cells.Add(tCellr);
                TableCell tCellrn = new TableCell();
                tCellrn.Text = x.item_name;
                tRow.Cells.Add(tCellrn);
                TableCell tCellrd = new TableCell();
                tCellrd.Text = x.price.ToString();
                tRow.Cells.Add(tCellrd);
                TableCell tCellri = new TableCell();
                tCellri.Text = x.quantity.ToString();
                tRow.Cells.Add(tCellri);
                checkin = x.type;


                checkin = x.type;
            }

        }
    }
    protected void saveitem_click(object sender, EventArgs e)
    {
        //ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_add');", true);

        int eid = employeeProfile.getEmployeid(Session["adminLogin"].ToString());
        int bid = branchClass.getBranchID(branch.SelectedValue);
        room_service_menu rm = new room_service_menu();
        rm.type = Request.Form["addtype"].ToString();
        rm.item_name = Request.Form["additemname"].ToString();
        rm.price = int.Parse(Request.Form["additemprice"].ToString());
        rm.quantity = Request.Form["additemquantity"].ToString();
        rm.employee_id = eid;
        rm.bid = bid;
        check = empmenuclass.addMenuItem(rm);
        if (check == true)
        {
            //admin_notification_class.addnotification(eid, bid, DateTime.Now, admin_notification_class.TableNames.room_service_menu.ToString(), rm.Id, admin_notification_class.CommandType.Add.ToString());
            msg = "Successfully stored the information";
            type = "Success";

        }
        else
        {
            msg = "There is some error";
            type = "Error";
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");
        viewMenu();
    }
    protected void ddtypeindexchange(object sender, EventArgs e)
    {
        var type = ddtype.SelectedValue;
        int eid = employeeProfile.getEmployeid(Session["adminLogin"].ToString());
        int bid = branchClass.getBranchID(branch.SelectedValue);
        if (type != "Select")
        {
            IQueryable<room_service_menu> rsm = menuservice.getMenuItem(type, bid);
            string[] item = new string[rsm.Count() + 1];
            item[0] = "Select";
            int i = 1;
            foreach (var x in rsm)
            {

                item[i] = x.item_name;
                i++;
            }
            dditem.DataSource = item;
            dditem.DataBind();
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_update');", true);



    }
    protected void dditemchange(object sender, EventArgs e)
    {
        var type = ddtype.SelectedValue;
        int eid = employeeProfile.getEmployeid(Session["adminLogin"].ToString());
        int bid = branchClass.getBranchID(branch.SelectedValue);
        var item = dditem.SelectedValue;
        int id = menuservice.getId(bid, type, item);
        ipitemId.Value = id.ToString();
        if (type != "Select" || item != "Select")
        {
            IQueryable<room_service_menu> rsm = menuservice.getMenuInfo(type, bid, item);
            foreach (var x in rsm)
            {
                uptype.Value = x.type;
                upitem.Value = x.item_name;
                upprice.Value = x.price.ToString();
                upqty.Value = x.quantity;
            }
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_update');", true);

    }
    protected void update_click(object sender, EventArgs e)
    {
        room_service_menu r = new room_service_menu();
        int eid = employeeProfile.getEmployeid(Session["adminLogin"].ToString());
        int bid = branchClass.getBranchID(branch.SelectedValue);
        r.type = uptype.Value;
        r.item_name = upitem.Value;
        r.price = int.Parse(upprice.Value);
        r.quantity = upqty.Value;
        r.employee_id = eid;
        check = menuservice.updateMenu(r, bid, int.Parse(ipitemId.Value));

        if (check == true)
        {
           // admin_notification_class.addnotification(eid, bid, DateTime.Now, admin_notification_class.TableNames.room_service_menu.ToString(), int.Parse(ipitemId.Value), admin_notification_class.CommandType.Update.ToString());
            msg = "Successfully stored the information";
            type = "Success";

        }
        else
        {
            msg = "There is some error";
            type = "Error";
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");
        viewMenu();
    }


}