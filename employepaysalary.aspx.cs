using System;

using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employepaysalary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginId"] == null)
        {
            Response.Redirect("employelogin.aspx");
        }
        else if (!IsPostBack)
        {
            int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
            List<employee> emp = employeeProfile.getunpaidemploye(bid);
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

        }

    }
    protected void savebtnclick(object sender, EventArgs e)
    {

        if (tbpaidvalue.Value != null && tbpaidvalue.Value != "")
        {
            //int id=int.Parse(Request.QueryString["id"]);
            employesalary es = new employesalary();
            es.employe_id = int.Parse(tbid.Value);
            es.payment_date = DateTime.Now;
            //string str = "paidamount" + id;
            es.amount = tbpaidvalue.Value;//Request.Form[str].ToString();
            employeeProfile.addemployesalary(es);
        }
        else
        {

        }
    }
    protected void ddemployeenameselectedindexchange(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);
        table.Visible = true;
        var name = ddemployeename.SelectedValue;
        int id = employeeProfile.getEmployeeId(name);
        int salaryId = employeeProfile.getEmployeeIdSalaryID(id);

        employesalary x = employeeProfile.getInfo(salaryId);
        employee emp = employeeProfile.getEmpInfo(id);
       
        
            if (x.payment_date.Month==DateTime.Now.Month ) {
                empname.InnerText = emp.name;
                empphone.InnerText = emp.employee_no;
                inputid.Value = x.Id.ToString();
            empamount.InnerText = x.amount;
            idhid.Value = x.employe_id.ToString();
            empdate.InnerText = x.payment_date.ToShortDateString();
                Hiddenname.Value = empname.InnerText;
                Hiddenphone.Value = empphone.InnerText; 
        }
            else
            {
                table.Visible = false;
                tbupdate.Visible = false;
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
    protected void updateSalary2(object sender, EventArgs e)
    {
        int hiddenid = int.Parse(inputid.Value);
        table.Visible = false;
        tbupdate.Visible = true;
        empamount.Visible = true;
        
        employesalary empsalary = new employesalary();
        empsalary.amount = Request.Form["inamount"];// inamount.Value;
        empsalary.payment_date = DateTime.Parse(Request.Form["indate"]);
        bool check = employeeProfile.updateEmployeeSalary(empsalary,hiddenid);
        if (check == true)
        {
            int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
            List<employee> emp = employeeProfile.getunpaidemploye(bid);
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
        }
    }
   
}