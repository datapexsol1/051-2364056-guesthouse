using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employebranchbills : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int branchID = employeeProfile.getEmployeBranch("kk");
            IQueryable<bill> bs = billclass.getAllBills(branchID);
            string[] billType = new string[bs.Count() + 1];
            billType[0] = "Select";
            int i = 1;
            foreach (var x in bs)
            {

                billType[i] = x.BillType;
                i++;
            }
            ddBillType.DataSource = billType;
            ddBillType.DataBind();


        }


    }




    protected void Button1_Click(object sender, EventArgs e)
    {
        bill b = new bill();
        b.BranchId = employeeProfile.getEmployeBranch("kk");//get from session
        b.BillAmount = Convert.ToInt32(Request.Form["abamount"]);
        b.BillType = abtype.Value.ToString();
        b.bill_description = Request.Form["desc"];
        b.Date = Convert.ToDateTime(Request.Form["abdate"]);
        billclass.Addbill(b);
    }

    protected void Update_bills(object sender, EventArgs e)
    {
        //    bill b = new bill();
        //    b.Id= Convert.ToInt32(Request.Form["ubno"]);
        //    b.BranchId = employeeProfile.getEmployeBranch("kk");//get from session
        //    b.BillAmount = Convert.ToInt32(Request.Form["ubamount"]);
        //    b.BillType = ddBillType.SelectedValue.ToString();
        //    b.Date = Convert.ToDateTime(Request.Form["ubdate"]);
        //    billclass.updateBills(b,b.Id);
    }


    protected void branchBillSelectedIndexChange(object sender, EventArgs e)
    {
        int branchID = employeeProfile.getEmployeBranch("kk");
        
        var bType = ddBillType.SelectedValue;
        int id = billclass.retrieveBillItem(bType, branchID);
        var selectedBillType = ((DropDownList)sender).SelectedValue;
        bill b = billclass.getBills(id,DateTime.Parse(selectedBillType),bType,branchID);
        ubamount.Value = b.BillAmount.ToString();

        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);


    }
    protected void billTypeSelectedIndexChange(object sender, EventArgs e)
    {
        int branchID = employeeProfile.getEmployeBranch("kk");
        var bType = ddBillType.SelectedValue;

        ////date dropdownlist
        IQueryable<DateTime> bs = billclass.getBillItem(bType,branchID);

        string[] billType = new string[bs.Count() + 1];
        billType[0] = "Select";
        int i = 1;
        foreach (var x in bs)
        {

            billType[i] = x.Date.ToString();
            i++;
        }
        ddDate.DataSource = billType;
        ddDate.DataBind();


        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);
    }



}