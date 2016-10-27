using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminbranchbills : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            branch.Items.Clear();
            IQueryable<branch> br = admingraphclass.getAllbranches();
            branch.Items.Add("Select Branch");
            foreach (branch b in br)
            {
                branch.Items.Add(b.name);
            }
        }
        int branchID = employeeProfile.getEmployeBranch("kk");
        IQueryable<bill> bs = billclass.getAllBills(branchID);
        //string[] billType = new string[bs.Count() + 1];
        //billType[0] = "Select";
        //int i = 1;
        //foreach (var x in bs)
        //{

        //    billType[i] = x.BillType;
        //    i++;
        //}
        //ddBillType.DataSource = billType;
        //ddBillType.DataBind();


    


}




protected void Button1_Click(object sender, EventArgs e)
{
    if (ddBillType.Text != "Select")
    {
        bill b = new bill();
        b.BranchId = employeeProfile.getEmployeBranch("kk");//get from session
        b.BillAmount = Convert.ToInt32(Request.Form["abamount"]);
        b.BillType = abtype.Value.ToString();
        b.bill_description = Request.Form["desc"];
        b.Date = Convert.ToDateTime(Request.Form["abdate"]);
        b.employee_id = int.Parse(Session["loginId"].ToString());
        billclass.Addbill(b);
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content1');", true);

    }
}

protected void Update_bills(object sender, EventArgs e)
{
    bill b = new bill();
    //  GetID(b.BranchId, b.BillType);
    //  b.Id =int.Parse(Request.Form["ubno"].ToString());
    if (ddBillType.Text != "Select" && ddDate.Text != "Select")
    {
        b.BranchId = employeeProfile.getEmployeBranch("kk");//get from session
        b.BillAmount = int.Parse(ubamount.Value);// Convert.ToInt32(Request.Form["ubamount"]);
        b.BillType = ddBillType.SelectedValue.ToString();

        b.Date = DateTime.Parse(ddDate.SelectedValue.ToString());
        b.employee_id = int.Parse(Session["loginId"].ToString());
        //    b.Date = //Convert.ToDateTime(Request.Form["ubdate"]);
        billclass.updateBills(b, b.BranchId);
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content1');", true);

    }
}


protected void branchBillSelectedIndexChange(object sender, EventArgs e)
{
    int branchID = employeeProfile.getEmployeBranch("kk");

    var bType = ddBillType.SelectedValue;

    var selectedBillDate = ddDate.Text;
    int id = billclass.retrieveBillItem(bType, DateTime.Parse(selectedBillDate), branchID);
    bill b = billclass.getBills(id, DateTime.Parse(selectedBillDate), bType, branchID);
    ubamount.Value = b.BillAmount.ToString();

    ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);


}
protected void billTypeSelectedIndexChange(object sender, EventArgs e)
{
    int branchID = employeeProfile.getEmployeBranch("kk");
    var bType = ddBillType.SelectedValue;

    ////date dropdownlist
    List<bill> bs = billclass.getBillItem(bType, branchID);

    string[] billType = new string[bs.Count() + 1];
    billType[0] = "Select";
    int i = 1;
    foreach (var x in bs)
    {
        //int result = int.Parse((DateTime.Now.Day - x.Date.Day).ToString());
        //if (result == 1 || result == 0)
        //{

        billType[i] = x.Date.ToShortDateString();
        i++;
        //}

    }
    ddDate.DataSource = billType;
    ddDate.DataBind();


    ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);
}
}



