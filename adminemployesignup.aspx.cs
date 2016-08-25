using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminemployesignup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            
        }
    }

    protected void send_Click(object sender, EventArgs e)
    {
        employee emp = new employee();
        emp.Id = 1;
        emp.name = Request.Form["name"].ToString();
        emp.email = Request.Form["email"].ToString();
        emp.employee_no = "123";
        emp.cnic = Request.Form["cnic"].ToString();
        emp.designation = Request.Form["designation"].ToString();
        emp.branch_id = 1.ToString();
        emp.block_client = 0;

        employeeProfile.addEmployeeInfo(emp);
    }
}