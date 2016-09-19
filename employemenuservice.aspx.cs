using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employemenuservice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TableRow tRow1 = new TableRow();
        menuview.Rows.Add(tRow1);
        TableCell tCell1 = new TableCell();
        tCell1.Text = "Menu type ";
        tRow1.Cells.Add(tCell1);
        TableCell tCell2 = new TableCell();
        tCell2.Text = "Item name";
        tRow1.Cells.Add(tCell2);
        TableCell tCell3 = new TableCell();
        tCell3.Text = "Item price";
        tRow1.Cells.Add(tCell3);
        TableCell tCell4 = new TableCell();
        tCell4.Text = "Item Quantity";
        tRow1.Cells.Add(tCell4);

       // int roomid = int.Parse(Request["rnovxxxx"].ToString());
       // int branchid = int.Parse(Request["branch"]);


       /* IQueryable<room_asset> rom = roomassetclass.getAllRoomAssets(branchid, roomid);
        foreach (var x in rom)
        {
            TableRow tRow = new TableRow();
            menuview.Rows.Add(tRow);
            TableCell tCellr = new TableCell();
            tCellr.Text = x.room_id.ToString();
            tRow.Cells.Add(tCellr);
            TableCell tCellrn = new TableCell();
            tCellrn.Text = x.label;
            tRow.Cells.Add(tCellrn);
            TableCell tCellrd = new TableCell();
            tCellrd.Text = x.description;
            tRow.Cells.Add(tCellrd);
            TableCell tCellri = new TableCell();
            tCellri.Text = x.total_item.ToString();
            tRow.Cells.Add(tCellri);
        }*/
    }
}