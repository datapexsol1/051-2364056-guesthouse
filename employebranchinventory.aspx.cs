using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employebranchinventory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TableRow tRow1 = new TableRow();
        assetsViewTable.Rows.Add(tRow1);
        TableCell tCell1 = new TableCell();
        tCell1.Text = "Branch ";
        tRow1.Cells.Add(tCell1);
        TableCell tCell2 = new TableCell();
        tCell2.Text = "Item Name";
        tRow1.Cells.Add(tCell2);
        TableCell tCell3 = new TableCell();
        tCell3.Text = "Description";
        tRow1.Cells.Add(tCell3);
        TableCell tCell4 = new TableCell();
        tCell4.Text = "Total Item";
        tRow1.Cells.Add(tCell4);

        int branchid = 2;//int.Parse(Request["branch"]);get from session 


        IQueryable<Branch_asset> rom = branchAssetsClass.getAllBranchAssets(branchid);
        foreach (var x in rom)
        {
            TableRow tRow = new TableRow();
            assetsViewTable.Rows.Add(tRow);
            TableCell tCellr = new TableCell();
            tCellr.Text = x.bid.ToString();
            tRow.Cells.Add(tCellr);
            TableCell tCellrn = new TableCell();
            tCellrn.Text = x.title;
            tRow.Cells.Add(tCellrn);
            TableCell tCellrd = new TableCell();
            tCellrd.Text = x.description;
            tRow.Cells.Add(tCellrd);
            TableCell tCellri = new TableCell();
            tCellri.Text = x.no_item.ToString();
            tRow.Cells.Add(tCellri);
        }


    }
    protected void saveBAssets_click(object sender, EventArgs e)
    {
        room_asset r = new room_asset();
        Branch_asset b = new Branch_asset();
        b.bid = int.Parse(Request.Form["branch"].ToString());
        b.title = Request.Form["alabel1"].ToString();
        b.description = Request.Form["adescription1"].ToString();
        b.no_item = int.Parse(Request.Form["insertaitemno"].ToString());
        branchAssetsClass.addinventry(b);
    }
   
}