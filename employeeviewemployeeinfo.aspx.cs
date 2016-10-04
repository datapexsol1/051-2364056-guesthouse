using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeeviewemployeeinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
   
        TableRow tRow1 = new TableRow();
        empInfoViewTable.Rows.Add(tRow1);
        TableCell tCell1 = new TableCell();
        tCell1.Text = "Image ";
        tRow1.Cells.Add(tCell1);
        TableCell tCell2 = new TableCell();
        tCell2.Text = "Name";
        tRow1.Cells.Add(tCell2);
        TableCell tCell3 = new TableCell();
        tCell3.Text = "Email";
        tRow1.Cells.Add(tCell3);
        TableCell tCell4 = new TableCell();
        tCell4.Text = "Employee no";
        tRow1.Cells.Add(tCell4);

        int branchid = employeeProfile.getEmployeBranch("kk"); ;//int.Parse(Request["branch"]);get from session 


        IQueryable<employee> rom = employeeProfile.getAllEmployee(branchid);//branchAssetsClass.getAllBranchAssets(branchid);
        foreach (var x in rom)
        {
            TableRow tRow = new TableRow();
            empInfoViewTable.Rows.Add(tRow);
            TableCell tCellr = new TableCell();
            tCellr.Text = string.Format("<img src='data:image/jpg' />");
            tRow.Cells.Add(tCellr);
            TableCell tCellrn = new TableCell();
            tCellrn.Text = x.name;
            tRow.Cells.Add(tCellrn);
            TableCell tCellrd = new TableCell();
            tCellrd.Text = x.email;
            tRow.Cells.Add(tCellrd);
            TableCell tCellri = new TableCell();
            tCellri.Text = x.employee_no.ToString();
            tRow.Cells.Add(tCellri);
        }
    }
    
}
