using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employebranchinventory : System.Web.UI.Page
{
    string msg, type;
    bool check;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["loginId"] == null)
        {
            Response.Redirect("employelogin.aspx");
        }
        // viewBranchAssets();

       else if (!IsPostBack)
        {
            


            ddbranchname.Items.Clear();
            //update function dropdown branch name
            IQueryable<branch> b = branchClass.getBrachesinfo();
            string[] branchName = new string[b.Count()+1];
            branchName[0] = "Select";
            int i = 1;
            foreach (var x in b)
            {

                branchName[i] = x.name;
                i++;
            }
            ddbranchname.DataSource = branchName;
            ddbranchname.DataBind();
            viewBranchAssets();
        }
        else
        {
            viewBranchAssets();
        }

    }
    public void viewBranchAssets()
    {
        
        TableRow tRow1 = new TableRow();
        assetsViewTable.Rows.Add(tRow1);
        TableCell tCell1 = new TableCell();
        tCell1.Text = "Branch ";
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

        int branchid = employeeProfile.getEmployeBranch(Session["loginName"].ToString()); ;//int.Parse(Request["branch"]);get from session 


        IQueryable<Branch_asset> rom = branchAssetsClass.getAllBranchAssets(branchid);
        foreach (var x in rom)
        {
            TableRow tRow = new TableRow();
            assetsViewTable.Rows.Add(tRow);
            TableCell tCellr = new TableCell();
            tCellr.Text = x.bid.ToString();
            tRow.Cells.Add(tCellr);
            TableCell tCellrn = new TableCell();
            tCellrn.Text = x.title;
            tRow.Cells.Add(tCellrn);
            TableCell tCellrd = new TableCell();
            tCellrd.Text = x.description;
            tRow.Cells.Add(tCellrd);
            TableCell tCellri = new TableCell();
            tCellri.Text = x.no_item.ToString();
            tRow.Cells.Add(tCellri);
        }
    }
    protected void saveBAssets_click(object sender, EventArgs e)
    {
        try
        {
            int eid = employeeProfile.getEmployeid(Session["loginName"].ToString());
            int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
            room_asset r = new room_asset();
            Branch_asset b = new Branch_asset();
            b.employee_id = eid;
            b.bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());//int.Parse(Request.Form["branch"].ToString());
            b.title = Request.Form["alabel1"].ToString();
            b.description = Request.Form["adescription"].ToString();
            b.no_item = int.Parse(Request.Form["aitemno"].ToString());
            check = branchAssetsClass.addinventry(b);
            if (check == true)
            {
                msg = "Successfully stored the information";
                type = "Success";
            }
            else
            {
                msg = "There is some error";
                type = "Error";
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content3');", true);

        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('Error','" + ex.Message + "');</script>");

        }
    }
    protected void branchNameSelectedIndexChange(object sender, EventArgs e)
    {
        

        var branchName = ddbranchname.SelectedValue;
        int branchId = branchClass.getBranchID(branchName);
        IQueryable<Branch_asset> bs = branchAssetsClass.getAllBranchAssets(branchId);
        string[] branchAssets = new string[bs.Count()+1];
        branchAssets[0] = "Select";
        int i = 1;
        foreach (var x in bs)
        {

            branchAssets[i] = x.title;
            i++;
        }
        dditemname.DataSource = branchAssets;
        dditemname.DataBind();
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);
    }
    protected void itemNameSelectedIndexChange(object sender, EventArgs e)
    {
        

        //**************************************

        var branchName = ddbranchname.SelectedValue;
        int branchId = branchClass.getBranchID(branchName);
        var selectedValue = ((DropDownList)sender).SelectedValue;
        if (selectedValue != "" || selectedValue != "Select") {
            Branch_asset bs = branchAssetsClass.getBranchAssets(branchId, selectedValue);
            itemname.Value = bs.title;
            itemdescription.Value = bs.description;
            totalitem.Value = bs.no_item.ToString();
            branchassets.Value = branchId.ToString();
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);
    }
    protected void updateBranchAssets_click(object sender, EventArgs e)
    {
        try
        {
            int eid = employeeProfile.getEmployeid(Session["loginName"].ToString());
            int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
            Branch_asset ba = new Branch_asset();

            int getBranchId = branchClass.getBranchID(ddbranchname.Text);
            int getAssetsID = branchAssetsClass.getBranchAssetsId(getBranchId, dditemname.SelectedValue.ToString());// getting branch assets item id
                                                                                                                    // ba.bid =
            ba.employee_id = eid;
            ba.title = itemname.Value;
            ba.description = itemdescription.Value;
            ba.no_item = int.Parse(totalitem.Value);
            check = branchAssetsClass.updateBranchAssets(ba, getAssetsID);
            if (check == true)
            {
                admin_notification_class.addnotification(eid, bid, DateTime.Now, admin_notification_class.TableNames.rooms.ToString(), ba.id, admin_notification_class.CommandType.Update.ToString());
                msg = "Successfully stored the information";
                type = "Success";

            }
            else
            {
                msg = "There is some error";
                type = "Error";
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);
        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('Error','" + ex.Message + "');</script>");
        }
    }


    }