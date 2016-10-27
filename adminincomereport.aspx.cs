using System;
using System.Collections.Generic;
using System.Globalization;
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
       
        
        DateTime dat = DateTime.ParseExact(date.Value, "MM/dd/yyyy",
                                       System.Globalization.CultureInfo.InvariantCulture);
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
       IQueryable<total_payment> emp_payments= adminexpencesreport.gettotalPayments(bname, empname, dat);
        
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
        tCell4.Text = "TotalRent";
        tRow1.Cells.Add(tCell4);
        TableCell cbox = new TableCell();
        cbox.Text = "Facilites Total";
        tRow1.Cells.Add(cbox);
        TableCell d = new TableCell();
        d.Text = "Total Bill";
        tRow1.Cells.Add(d);
        TableCell qu = new TableCell();
        qu.Text = "Paid Amount";
        tRow1.Cells.Add(qu);
        TableCell gst = new TableCell();
        gst.Text = "Paid GST";
        tRow1.Cells.Add(gst);
        TableCell pd = new TableCell();
        pd.Text = "Payment Date";
        tRow1.Cells.Add(pd);
        //TableCell bid = new TableCell();
        //bid.Text = "Booking ID";
        //tRow1.Cells.Add(bid);


        foreach (var x in emp_payments)
        {

            TableRow tRow = new TableRow();
            expance.Rows.Add(tRow);


            string branchname = bookingclass.getbookbranchname(x.booking_id);
            TableCell tCellrn = new TableCell();
            tCellrn.Text = branchname;
            tCellrn.BackColor = System.Drawing.ColorTranslator.FromHtml("#312121");
            tRow.Cells.Add(tCellrn);
            TableCell tCellrd = new TableCell();
            tCellrd.Text = employeeProfile.getEmpInfo(x.employee_id).name;
            tCellrd.BackColor = System.Drawing.ColorTranslator.FromHtml("#312121");
            tRow.Cells.Add(tCellrd);
            TableCell tCellri = new TableCell();
            tCellri.Text = x.total_rent;
            tCellri.BackColor = System.Drawing.ColorTranslator.FromHtml("#312121");
            tRow.Cells.Add(tCellri);

            TableCell checkbox = new TableCell();
            checkbox.Text = x.facility_total_payment;
            checkbox.BackColor = System.Drawing.ColorTranslator.FromHtml("#312121");
            tRow.Cells.Add(checkbox);



            TableCell tbill = new TableCell();
            tbill.Text = x.total_bill;
            tbill.BackColor = System.Drawing.ColorTranslator.FromHtml("#213121");
            tRow.Cells.Add(tbill);
            TableCell quan = new TableCell();
            quan.Text = x.paid_amount;
            quan.BackColor = System.Drawing.ColorTranslator.FromHtml("#233121");
            tRow.Cells.Add(quan);

            TableCell gstp = new TableCell();
            gstp.Text = "coming soon";
            gstp.BackColor = System.Drawing.ColorTranslator.FromHtml("#233121");
            tRow.Cells.Add(gstp);

            TableCell date1 = new TableCell();
            date1.Text = x.paymentdate.ToShortDateString();
            date1.BackColor = System.Drawing.ColorTranslator.FromHtml("#213121");
            tRow.Cells.Add(date1);



        }
    }

    protected void employe_SelectedIndexChanged(object sender, EventArgs e)
    {
        Button1_Click(this, e);
    }
}