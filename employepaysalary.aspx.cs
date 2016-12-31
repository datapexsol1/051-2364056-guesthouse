using System;

using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employepaysalary : System.Web.UI.Page
{
    string msg, type;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginId"] == null)
        {
            Response.Redirect("employelogin.aspx");
        }
        else if (!IsPostBack)
        {
            //int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
            //List<employee> emp = employeeProfile.getunpaidemploye(bid);
            ////IQueryable<employee> bemploye = employeeProfile.getAllEmployee(bid);
            //IQueryable<employee> bemploye = employeeProfile.getAllEmployeeUserName(bid);
            //List<string> lname = new List<string>();
            //lname.Add("Select");
            //foreach (employee em in bemploye)
            //{
            //    lname.Add(em.username);
            //}
            //ddemployeename.DataSource = lname;
            //ddemployeename.DataBind();
            //table.Visible = false;
            //tbupdate.Visible = false;
            employeUsernameBind();

        }
        else
        {
            if(Request.Form["__EVENTTARGET"] == "savebtn")
            {
               if(employeeProfile.updateemployesalary(int.Parse(salaryid.Value), int.Parse(amount.Value))== true){
                    int branchID = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
                    int employID = employeeProfile.getEmployeid(Session["loginName"].ToString());
                    admin_notification_class.addnotification(employID, branchID, DateTime.Now, admin_notification_class.TableNames.event_calender.ToString(), int.Parse(salaryid.Value), admin_notification_class.CommandType.Update.ToString());
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + "Success" + "','Salary updated SucessFUlly');</script>");

                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + "Error" + "','Can not UPdate SAlary Check Details');</script>");

                }

            }
        }

    }
    protected void employeUsernameBind()
    {
        int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
        List<employesalarypay> emp = employeeProfile.getunpaidemploye(bid);
        //IQueryable<employee> bemploye = employeeProfile.getAllEmployee(bid);
        IQueryable<employee> bemploye = employeeProfile.getAllEmployeeUserName(bid);
        List<string> lname = new List<string>();
        lname.Add("Select");
        foreach (employee em in bemploye)
        {
            lname.Add(em.username);
        }
        ddemployeename.DataSource = lname;
        ddemployeename.DataBind();
        table.Visible = false;
        tbupdate.Visible = false;
      
    }
    protected void savebtnclick(object sender, EventArgs e)
    {
        try {
            if (tbpaidvalue.Value != null && tbpaidvalue.Value != "")
            {
                //int id=int.Parse(Request.QueryString["id"]);
                int branchID = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
                int employID = employeeProfile.getEmployeid(Session["loginName"].ToString());
                employesalary es = new employesalary();
                es.employe_id = int.Parse(tbid.Value);
                es.payment_paid_date = DateTime.Now;
                es.paidby = employID;
                if (DateTime.Now.Month == 1)
                {
                    es.payment_date= new DateTime(DateTime.Now.Year - 1, 12, 1);
                }else
                {
                    es.payment_date = new DateTime(DateTime.Now.Year, DateTime.Now.Month - 1, 1);
                }
                //string str = "paidamount" + id;
                string str = tbamounttopay.Value;
                es.amount_Topay =int.Parse(tbamounttopay.Value);
                es.amount = tbpaidvalue.Value;//Request.Form[str].ToString();
               
                bool check = employeeProfile.addemployesalary(es);
                if (check == true)
                {
                    admin_notification_class.addnotification(employID, branchID, DateTime.Now, admin_notification_class.TableNames.event_calender.ToString(), int.Parse(tbid.Value), admin_notification_class.CommandType.Update.ToString());
                    tbpaidvalue.Value = "";
                    tbamounttopay.Value = "";
                    tbid.Value = "";
                    msg = "Successfully updated the information";
                    type = "Success";

                }
                else
                {
                    msg = "There is some error";
                    type = "Error";
                }


            }
            else
            {
                msg = "Please Enter Amout to pay";
                type = "Error";
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");
        }catch(Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + "Error" + "','" + ex.Message + "');</script>");

        }
    }
    protected void advancebtnclick(object sender, EventArgs e)
    {
        try
        {
            if (tbpaidvalue.Value != null && tbpaidvalue.Value != "")
            {
                //int id=int.Parse(Request.QueryString["id"]);
                int branchID = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
                int employID = employeeProfile.getEmployeid(Session["loginName"].ToString());
                employesalary es = new employesalary();
                es.employe_id = int.Parse(tbid.Value);
                es.payment_paid_date = DateTime.Now;
                es.paidby = employID;
                es.payment_date = DateTime.Now;
                es.amount_Topay = int.Parse(tbamounttopay.Value);
                es.amount = tbpaidvalue.Value;//Request.Form[str].ToString();
                tbpaidvalue.Value = "";
                tbamounttopay.Value = "";
                tbid.Value = "";
                bool check = employeeProfile.addemployesalary(es);
                if (check == true)
                {
                    admin_notification_class.addnotification(employID, branchID, DateTime.Now, admin_notification_class.TableNames.event_calender.ToString(), int.Parse(tbid.Value), admin_notification_class.CommandType.Update.ToString());
                    msg = "Successfully updated the information";
                    type = "Success";

                }
                else
                {
                    msg = "You can not add payment more then Payment Required";
                    type = "Error";
                }


            }
            else
            {
                msg = "Please Enter Amout to pay";
                type = "Error";
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");
        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + "Error" + "','" + ex.Message + "');</script>");

        }
    }
    protected void ddemployeenameselectedindexchange(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);
        table.Visible = true;
        var username = ddemployeename.SelectedValue;
        if (username == "Select")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('Warning','Please Select Employe');</script>");

        }
        else
        {
            int id = employeeProfile.getEmployeeId(username);
            // int salaryId = employeeProfile.getEmployeeIdSalaryID(id);

            IQueryable<employesalary> empsal = employeeProfile.getInfo(id);
            employee emp = employeeProfile.getEmpInfo(id);

            TableRow tRow1 = new TableRow();
            table.Rows.Add(tRow1);
            TableCell tCell1 = new TableCell();
            tCell1.Text = "EmployeNAme ";
            tRow1.Cells.Add(tCell1);
            TableCell tCell2 = new TableCell();
            tCell2.Text = "Phone";
            tRow1.Cells.Add(tCell2);
            TableCell tCell3 = new TableCell();
            tCell3.Text = "Amount";
            tRow1.Cells.Add(tCell3);
            TableCell tCell4 = new TableCell();
            tCell4.Text = "Amount to pay";
            tRow1.Cells.Add(tCell4);
            TableCell tCell5 = new TableCell();
            tCell5.Text = "Payment Month";
            tRow1.Cells.Add(tCell5);
            TableCell tCell6 = new TableCell();
            tCell6.Text = "Payment Date";
            tRow1.Cells.Add(tCell6);



            foreach (employesalary x in empsal)
            {

                TableRow tRow = new TableRow();
                table.Rows.Add(tRow);
                TableCell tCellr = new TableCell();
                tCellr.Text = emp.name;
                tRow.Cells.Add(tCellr);
                TableCell tCellrn = new TableCell();
                tCellrn.Text = emp.employee_no;
                tRow.Cells.Add(tCellrn);
                TableCell tCellrd = new TableCell();
                tCellrd.Text = x.amount;
                tRow.Cells.Add(tCellrd);
                TableCell tCellri = new TableCell();
                tCellri.Text = x.amount_Topay.ToString();
                tRow.Cells.Add(tCellri);
                TableCell tCellri1 = new TableCell();
                tCellri1.Text = x.payment_date.Year + "-" + x.payment_date.ToString("MMM", CultureInfo.InvariantCulture);
                tRow.Cells.Add(tCellri1);
                TableCell tCellri2 = new TableCell();
                tCellri2.Text = x.payment_paid_date.ToString();
                tRow.Cells.Add(tCellri2);
                if (x.payment_paid_date.Value.Month == DateTime.Now.Month && x.payment_paid_date.Value.Year == DateTime.Now.Year)
                {
                    TableCell Button = new TableCell();
                    Button.Text = "<input type='button' value='Update' id='tbupdatebtn" + x.Id + "' class='btn btn-success btnupdate' onclick='updateclick(" + x.Id + "," + x.amount + "," + x.amount_Topay + ");'/>";
                    tRow.Cells.Add(Button);
                    TableCell btnsave = new TableCell();
                    btnsave.Text = "<input type='button' value='Save' id='tbsavebtn" + x.Id + "' class='btn btn-success hideall' style='display:none;' onclick='saveclick()'/>";
                    tRow.Cells.Add(btnsave);
                    TableCell tb = new TableCell();
                    tb.Text = "<input type='text' placeholder='Amount' id='tbamout" + x.Id + "' style='display:none;'  class='hideall' />";
                    tRow.Cells.Add(tb);
                }


            }
        }
        
    }
    protected void updateSalary(object sender, EventArgs e)
    {
     
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);
        table.Visible = false;
        tbupdate.Visible = true;
        int hiddenid = int.Parse(inputid.Value);
        employesalary em = employeeProfile.retrieveSalaryInfo(hiddenid);
     //   inamount.Value = em.amount.ToString();
        //indate.Value = em.payment_date.ToShortDateString();
        inname.InnerText = Hiddenname.Value;
        inphone.InnerText = Hiddenphone.Value;


    }
    protected void updatebuttonClick(object sender, EventArgs e)
    {
        //table.Visible = false;
        //update.Visible = true;
        //var username = ddemployeename.SelectedValue;
        //int id = employeeProfile.getEmployeeId(username);
        //IQueryable<employesalary> empsal = employeeProfile.getlastsalary(id);
        //TableRow tRow1 = new TableRow();
        //table.Rows.Add(tRow1);
        //TableCell tCell1 = new TableCell();
        //tCell1.Text = "EmployeNAme ";
        //tRow1.Cells.Add(tCell1);
        //TableCell tCell2 = new TableCell();
        //tCell2.Text = "Phone";
        //tRow1.Cells.Add(tCell2);
        //TableCell tCell3 = new TableCell();
        //tCell3.Text = "Amount";
        //tRow1.Cells.Add(tCell3);
        //TableCell tCell4 = new TableCell();
        //tCell4.Text = "Amount to pay";
        //tRow1.Cells.Add(tCell4);
        //TableCell tCell5 = new TableCell();
        //tCell5.Text = "Payment Month";
        //tRow1.Cells.Add(tCell5);
        //TableCell tCell6 = new TableCell();
        //tCell6.Text = "Payment Date";
        //tRow1.Cells.Add(tCell6);



        //foreach (employesalary x in empsal)
        //{

        //    TableRow tRow = new TableRow();
        //    table.Rows.Add(tRow);
        //    TableCell tCellr = new TableCell();
        //    tCellr.Text = emp.name;
        //    tRow.Cells.Add(tCellr);
        //    TableCell tCellrn = new TableCell();
        //    tCellrn.Text = emp.employee_no;
        //    tRow.Cells.Add(tCellrn);
        //    TableCell tCellrd = new TableCell();
        //    tCellrd.Text = x.amount;
        //    tRow.Cells.Add(tCellrd);
        //    TableCell tCellri = new TableCell();
        //    tCellri.Text = x.amount_Topay.ToString();
        //    tRow.Cells.Add(tCellri);
        //    TableCell tCellri1 = new TableCell();
        //    tCellri1.Text = x.payment_date.Year + "-" + x.payment_date.ToString("MMM", CultureInfo.InvariantCulture);
        //    tRow.Cells.Add(tCellri1);
        //    TableCell tCellri2 = new TableCell();
        //    tCellri2.Text = x.payment_paid_date.ToString();
        //    tRow.Cells.Add(tCellri2);


           
        //}
       
    }
    protected void updateSalary2(object sender, EventArgs e)
    {
        try {
            int eid = employeeProfile.getEmployeid(Session["loginName"].ToString());
            int hiddenid = int.Parse(inputid.Value);
            table.Visible = false;
            tbupdate.Visible = true;
            //empamount.Visible = true;

            employesalary empsalary = new employesalary();
            empsalary.amount = Request.Form["inamount"];// inamount.Value;
            empsalary.payment_date = DateTime.Parse(Request.Form["indate"]);
            empsalary.payment_paid_date = DateTime.Now;
            bool check = employeeProfile.updateEmployeeSalary(empsalary, hiddenid);
            if (check == true)
            {
                int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());

                List<employesalarypay> emp = employeeProfile.getunpaidemploye(bid);
                IQueryable<employee> bemploye = employeeProfile.getAllEmployee(bid);
                List<string> lname = new List<string>();
                lname.Add("Select");
                foreach (employee em in bemploye)
                {
                    lname.Add(em.name);
                }
                ddemployeename.DataSource = lname;
                ddemployeename.DataBind();

                table.Visible = false;
                tbupdate.Visible = false;


                admin_notification_class.addnotification(eid, bid, DateTime.Now, admin_notification_class.TableNames.bill.ToString(), hiddenid, admin_notification_class.CommandType.Update.ToString());
                msg = "Successfully updated the information";
                type = "Success";

            }
            else
            {
                msg = "There is some error";
                type = "Error";
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");
            employeUsernameBind();
        }
        catch(Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + "Error" + "','" + ex.Message + "');</script>");

        }
    }
}