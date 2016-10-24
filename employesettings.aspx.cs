using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employesettings : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        //TableRow tRow1 = new TableRow();
        //empInfoViewTable.Rows.Add(tRow1);
        //TableCell tCell1 = new TableCell();
        //tCell1.Text = "Image ";
        //tRow1.Cells.Add(tCell1);
        //TableCell tCell2 = new TableCell();
        //tCell2.Text = "Name";
        //tRow1.Cells.Add(tCell2);
        //TableCell tCell3 = new TableCell();
        //tCell3.Text = "Email";
        //tRow1.Cells.Add(tCell3);
        //TableCell tCell4 = new TableCell();
        //tCell4.Text = "Employee no";
        //tRow1.Cells.Add(tCell4);
        //TableCell tCell5 = new TableCell();
        //tCell5.Text = "Cnic";
        //tRow1.Cells.Add(tCell5);
        //TableCell tCell6 = new TableCell();
        //tCell6.Text = "Designation";
        //tRow1.Cells.Add(tCell6);
        //TableCell tCell7 = new TableCell();
        //tCell7.Text = "Date of joining";
        //tRow1.Cells.Add(tCell7);
        //TableCell tCell8 = new TableCell();
        //tCell8.Text = "Address";
        //tRow1.Cells.Add(tCell8);
        //TableCell tCell9 = new TableCell();
        //tCell9.Text = "Employee type";
        //tRow1.Cells.Add(tCell9);
        //TableCell tCell10 = new TableCell();
        //tCell10.Text = "Salary";
        //tRow1.Cells.Add(tCell10);

        //int branchid = employeeProfile.getEmployeBranch("kk"); ;//int.Parse(Request["branch"]);get from session 


        //IQueryable<employee> em = employeeProfile.getAllEmployee(branchid);//branchAssetsClass.getAllBranchAssets(branchid);

        ////employee emp = new employee();
        //foreach (var x in em)
        //{ 
        //    byte[] img1 = null;
        //    if (x.image != null)
        //    {
        //        img1 = x.image.ToArray();
        //    }                                                      // System.Web.UI.WebControls.Image img = new System.Web.UI.WebControls.Image();


        //    TableRow tRow = new TableRow();
        //    empInfoViewTable.Rows.Add(tRow);
        //    TableCell tCellr = new TableCell();
        //    tCellr.Text =  string.Format("<img src='data:image/jpg;base64,<%= Convert.ToBase64String("+img1+") %>'  />");
        //    tRow.Cells.Add(tCellr);
        //    TableCell tCellrn = new TableCell();
        //    tCellrn.Text = x.name;
        //    tRow.Cells.Add(tCellrn);
        //    TableCell tCellrd = new TableCell();
        //    tCellrd.Text = x.email;
        //    tRow.Cells.Add(tCellrd);
        //    TableCell tCellri = new TableCell();
        //    tCellri.Text = x.employee_no.ToString();
        //    tRow.Cells.Add(tCellri);


        //    TableCell tCellcnic = new TableCell();
        //    tCellcnic.Text = x.cnic;
        //    tRow.Cells.Add(tCellcnic);
        //    TableCell tCelldes = new TableCell();
        //    tCelldes.Text = x.designation;
        //    tRow.Cells.Add(tCelldes);
        //    TableCell tCelljoiningdate = new TableCell();
        //    tCelljoiningdate.Text = x.dateofjoining.ToString();
        //    tRow.Cells.Add(tCelljoiningdate);
        //    TableCell tCelladdress = new TableCell();
        //    tCelladdress.Text = x.address;
        //    tRow.Cells.Add(tCelladdress);
        //    TableCell tCellemptype = new TableCell();
        //    tCellemptype.Text = x.login_type;
        //    tRow.Cells.Add(tCellemptype);
        //    TableCell tCellsalary = new TableCell();
        //    tCellsalary.Text = x.salary.ToString();
        //    tRow.Cells.Add(tCellsalary);

        //    TableCell tCellupdate = new TableCell();
        //    tCellupdate.Text = string.Format("<a href='employeeupdateemployeeinfo.aspx?id=" + x.Id+ "'  style='background-color:green;' onserverclick='update_Click' class='btn btn-success' >" + "Update" + "</ a >");
        //    tRow.Cells.Add(tCellupdate);
        //   // int
        //    string.Format("<input type='text' id='val' value='"+"hello"+"' runat='server'>");

        //    divTitle.InnerHtml = "<input type='hidden' class='input_Text' id='Title' runat='server'  name='Title' value='" + Request.QueryString["id"] + "' />";

        //    //    ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content3');", true);

        //}


        if (Session["loginId"] == null)
        {
            Response.Redirect("employelogin.aspx");
        }
    }


    protected void update_Click(object sender, EventArgs ex)
    {
        //int branchid = employeeProfile.getEmployeBranch("kk");
        //int val =int.Parse( Request.Form["Title"]);
        //employee emp = employeeProfile.getSelectedEmployeeInfo(val, branchid);

    }
}