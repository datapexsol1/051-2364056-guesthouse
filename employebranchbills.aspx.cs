using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employebranchbills : System.Web.UI.Page
{
    string msg, type;
    bool addcheck, updatecheck;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null)
        {
            Response.Redirect("employelogin.aspx");
        }
        else if (!IsPostBack)
        {
            int branchID = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
            IQueryable<bill> bs = billclass.getAllBills(branchID);
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content1');", true);



        }
        if (abtype.Value != "")
        {
       
        }

       


    }




    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {

            int eid = employeeProfile.getEmployeid(Session["loginName"].ToString());
            int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
            if (ddBillType.Text != "Select")
            {
                bill b = new bill();
                b.employee_id = eid;
                b.BranchId = bid;// employeeProfile.getEmployeBranch(Session["loginName"].ToString());//get from session
                b.BillAmount = Convert.ToInt32(Request.Form["abamount"]);
                b.bill_description = Request.Form["desc"];
                b.Date = DateTime.ParseExact(Request.Form["abdate"], "dd-MM-yyyy", CultureInfo.InvariantCulture);// Convert.ToDateTime(Request.Form["abdate"]);
                //checking if bill already exist
                if (abtype.Value == "Electricity" || abtype.Value == "Gas" || abtype.Value == "Water" || abtype.Value == "Nayatel")
                {
                    bool isbillpaid = billclass.isBillPaid(abtype.Value, b.BranchId);
                    if (isbillpaid == true)
                    {
                        b.BillType = abtype.Value.ToString();
                        addcheck = billclass.Addbill(b);

                    }
                    else
                    {
                        msg = "Already bill is paid this month";
                        //return bill is already paid
                    }


                }
                else if (abtype.Value == "House Rent")
                {
                    //int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
                    bill bil = billclass.latestcheckHouseRentYear(bid);
                    if (bil != null)
                    {
                        abcd.Value = bil.Date.ToShortDateString();
                        if (b.Date.Month != DateTime.Now.Month)
                        {
                            b.BillType = abtype.Value.ToString();

                            addcheck = billclass.Addbill(b);
                        }
                        else
                        {
                            msg = "bill have already been paid";
                            //bill have already been paid
                        }
                    }
                    else
                    {
                        abcd.Value = "";
                    }
                }
                else
                {
                    b.BillType = abtype.Value.ToString();
                    addcheck = billclass.Addbill(b);
                }



            }
            if (addcheck == true)
            {
                admin_notification_class.addnotification(eid, bid, DateTime.Now, admin_notification_class.TableNames.bill.ToString(), 0, admin_notification_class.CommandType.Add.ToString());
                msg = "Successfully stored the information";
                type = "Success";

            }
            else
            {
                //   msg = "There is some error";
                type = "Error";
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content1');", true);

        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('Error','" + ex.Message + "');</script>");

        }
    }

    protected void Update_bills(object sender, EventArgs e)
    {
        try
        {
            int eid = employeeProfile.getEmployeid(Session["loginName"].ToString());
            int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString()); ;
            bill b = new bill();
            //  GetID(b.BranchId, b.BillType);
            //  b.Id =int.Parse(Request.Form["ubno"].ToString());
            if (ddBillType.Text != "Select" && ddDate.Text != "Select")
            {
                b.BranchId = bid;//employeeProfile.getEmployeBranch(Session["loginName"].ToString());//get from session
                b.BillAmount = int.Parse(ubamount.Value);// Convert.ToInt32(Request.Form["ubamount"]);
                b.BillType = ddBillType.SelectedValue.ToString();
                int updateBillId = b.Id;
                b.Date = DateTime.Parse(ddDate.SelectedValue.ToString());

                //    b.Date = //Convert.ToDateTime(Request.Form["ubdate"]);
                updatecheck = billclass.updateBills(b, b.BranchId);
                admin_notification_class.addnotification(eid, bid, DateTime.Now, admin_notification_class.TableNames.rooms.ToString(), updateBillId, admin_notification_class.CommandType.Update.ToString());



            }
            if (updatecheck == true)
            {
                msg = "Successfully updated the information";
                type = "Success";

            }
            else
            {
                msg = "There is some error";
                type = "Error";
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content1');", true);
        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('Error','" + ex.Message + "');</script>");

        }
    }

    protected void branchBillSelectedIndexChange(object sender, EventArgs e)
    {
        int branchID = employeeProfile.getEmployeBranch(Session["loginName"].ToString());

        var bType = ddBillType.SelectedValue;

        var selectedBillDate = ddDate.Text;
        int id = billclass.retrieveBillItem(bType, DateTime.Parse(selectedBillDate), branchID);
        bill b = billclass.getBills(id, DateTime.Parse(selectedBillDate), bType, branchID);
        ubamount.Value = b.BillAmount.ToString();

        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);


    }
    protected void billTypeSelectedIndexChange(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);

        int branchID = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
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



