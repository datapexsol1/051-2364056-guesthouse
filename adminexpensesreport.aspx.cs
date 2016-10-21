using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminexpensesreport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            IQueryable<branch> br = admingraphclass.getAllbranches();
            branches.Items.Add("Select Branch");
            foreach (branch x in br)
            {
                branches.Items.Add(x.name);
            }
         IQueryable<employee> emp=   employeeProfile.getAllEmployee_allbranch(0);
            employe.Items.Add("Select Employe");
            foreach(employee ex in emp)
            {
                employe.Items.Add(ex.username);
            }
            branches.SelectedIndex = 0;
            employe.SelectedIndex = 0;
            
        }

       
    }


    protected void branches_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<string> ls = new List<string>();
        ls.Add("Select Employe");
        if (branches.SelectedIndex == 0)
        {
           
            IQueryable<employee> emp=  employeeProfile.getAllEmployee_allbranch(0);
            foreach (employee em in emp)
            {
                ls.Add(em.username);
            }
        }
        else
        {
            employe.DataSource = null;
            employe.DataBind();
            IQueryable<employee> emp=employeeProfile.getAllEmployee_allbranch(branchClass.getBranchID(branches.SelectedValue));
            foreach(employee em in emp)
            {
                ls.Add(em.username);
            }
        }
        employe.DataSource = ls;
        employe.DataBind();
        Button1_Click(this, e);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string ds = date.Value;
        DateTime dat = DateTime.Parse(date.Value);
        string bname = "";
        string empname = "";
        if (branches.SelectedIndex != 0)
        {
            bname = branches.SelectedValue;
        }

        if (employe.SelectedIndex != 0)
        {
            empname = employe.SelectedValue;
        }

        //if (date.Value != "null")
        //{
        //    dat = DateTime.Parse(date.Value);
        //}
       empbillandsalclass emp= adminexpencesreport.getexpenditures(bname, empname, dat);
        IQueryable<bill> bill = emp.bills;
        IQueryable<employesalary> sal = emp.salary;
        expance.Rows.Clear();
        TableRow tRow1 = new TableRow();
        expance.Rows.Add(tRow1);
        tRow1.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
        tRow1.ForeColor = System.Drawing.Color.White;
        TableCell tCell2 = new TableCell();
        tCell2.Text = "Branch";
        tRow1.Cells.Add(tCell2);
        TableCell tCell3 = new TableCell();
        tCell3.Text = "Employe";
        tRow1.Cells.Add(tCell3);
        TableCell tCell4 = new TableCell();
        tCell4.Text = "Bill Type";
        tRow1.Cells.Add(tCell4);

        TableCell cbox = new TableCell();
        cbox.Text = "BillAmount";
        tRow1.Cells.Add(cbox);
        TableCell d = new TableCell();
        d.Text = "Date";
        tRow1.Cells.Add(d);
        TableCell qu = new TableCell();
        qu.Text = "Description";
        tRow1.Cells.Add(qu);

       
        foreach (var x in bill)
        {

            TableRow tRow = new TableRow();
            expance.Rows.Add(tRow);


            string branchname = branchClass.getBranchname(x.BranchId);
            TableCell tCellrn = new TableCell();
            tCellrn.Text = branchname;
            tCellrn.BackColor = System.Drawing.ColorTranslator.FromHtml("#312121");
            tRow.Cells.Add(tCellrn);
            TableCell tCellrd = new TableCell();
            tCellrd.Text = employeeProfile.getEmpInfo(x.employee_id).name;
            tCellrd.BackColor = System.Drawing.ColorTranslator.FromHtml("#312121");
            tRow.Cells.Add(tCellrd);
            TableCell tCellri = new TableCell();
            tCellri.Text = x.BillType;
            tCellri.BackColor = System.Drawing.ColorTranslator.FromHtml("#312121");
            tRow.Cells.Add(tCellri);

            TableCell checkbox = new TableCell();
            checkbox.Text = x.BillAmount.ToString();
            checkbox.BackColor = System.Drawing.ColorTranslator.FromHtml("#312121");
            tRow.Cells.Add(checkbox);



            TableCell date1 = new TableCell();
            date1.Text = x.Date.ToShortDateString();
            date1.BackColor = System.Drawing.ColorTranslator.FromHtml("#213121");
            tRow.Cells.Add(date1);
            TableCell quan = new TableCell();
            quan.Text = x.bill_description;
            quan.BackColor = System.Drawing.ColorTranslator.FromHtml("#233121");
            tRow.Cells.Add(quan);





        }
        Salary.Rows.Clear();
        TableRow tR = new TableRow();
        Salary.Rows.Add(tR);
        tR.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
        tR.ForeColor = System.Drawing.Color.White;
        TableCell tCell11 = new TableCell();
        tCell11.Text = "Branch";
        tR.Cells.Add(tCell11);
        TableCell tCell12 = new TableCell();
        tCell12.Text = "Employe Name";
        tR.Cells.Add(tCell12);
        TableCell tCell13 = new TableCell();
        tCell13.Text = "Amount";
        tR.Cells.Add(tCell13);

     
        TableCell dd = new TableCell();
        dd.Text = "Date";
        tR.Cells.Add(dd);
        TableCell qu1 = new TableCell();
        qu1.Text = "Paid by";
        tR.Cells.Add(qu1);


        foreach (var x in sal)
        {

            TableRow tRow = new TableRow();
            Salary.Rows.Add(tRow);

            employee emm=employeeProfile.getEmpInfo(x.employe_id);
            string branchname = branchClass.getBranchname(emm.branch_id);
            string empplname = emm.name;
            TableCell tCellrn = new TableCell();
            tCellrn.Text = branchname;
            tCellrn.BackColor = System.Drawing.ColorTranslator.FromHtml("#312121");
            tRow.Cells.Add(tCellrn);
            TableCell tCellrd = new TableCell();
            tCellrd.Text = empplname;
            tCellrd.BackColor = System.Drawing.ColorTranslator.FromHtml("#312121");
            tRow.Cells.Add(tCellrd);
            TableCell tCellri = new TableCell();
            tCellri.Text = x.amount;
            tCellri.BackColor = System.Drawing.ColorTranslator.FromHtml("#312121");
            tRow.Cells.Add(tCellri);

          



            TableCell date1 = new TableCell();
            date1.Text = x.payment_date.ToShortDateString();
            date1.BackColor = System.Drawing.ColorTranslator.FromHtml("#213121");
            tRow.Cells.Add(date1);
            TableCell quan = new TableCell();
            quan.Text = employeeProfile.getEmpusername(x.paidby);
            quan.BackColor = System.Drawing.ColorTranslator.FromHtml("#233121");
            tRow.Cells.Add(quan);





        }
    }

    protected void employe_SelectedIndexChanged(object sender, EventArgs e)
    {
        Button1_Click(this, e);
    }
}