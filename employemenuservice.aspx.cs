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


        IQueryable < room_service_menu >assets= empmenuclass.getMenuItem();
        string checkin = "";
        foreach (var x in assets)
        {
            if (x.type == checkin)
            {
                TableRow tRow = new TableRow();
                menuview.Rows.Add(tRow);
                TableCell tCellr = new TableCell();
                tCellr.Text = x.type.ToString();
                tRow.Cells.Add(tCellr);
                TableCell tCellrn = new TableCell();
                tCellrn.Text = x.item_name;
                tRow.Cells.Add(tCellrn);
                TableCell tCellrd = new TableCell();
                tCellrd.Text = x.price.ToString();
                tRow.Cells.Add(tCellrd);
                TableCell tCellri = new TableCell();
                tCellri.Text = x.quantity.ToString();
                tRow.Cells.Add(tCellri);
                checkin = x.type;
            }else
            {
                TableRow hRow = new TableRow();
                menuview.Rows.Add(hRow);
                TableCell hCellr = new TableCell();
                hCellr.Text = x.type.ToString();
                hCellr.BackColor = System.Drawing.Color.Azure;
                hRow.Cells.Add(hCellr);
                TableRow tRow = new TableRow();
                menuview.Rows.Add(tRow);
                TableCell tCellr = new TableCell();
                tCellr.Text = x.type.ToString();
                tRow.Cells.Add(tCellr);
                TableCell tCellrn = new TableCell();
                tCellrn.Text = x.item_name;
                tRow.Cells.Add(tCellrn);
                TableCell tCellrd = new TableCell();
                tCellrd.Text = x.price.ToString();
                tRow.Cells.Add(tCellrd);
                TableCell tCellri = new TableCell();
                tCellri.Text = x.quantity.ToString();
                tRow.Cells.Add(tCellri);
                checkin = x.type;


                checkin = x.type;
            }

        }
    }
    protected void saveitem_click(object sender,EventArgs e)
    {
        room_service_menu rm = new room_service_menu();
        rm.type = Request.Form["addtype"].ToString();
            rm.item_name= Request.Form["additemname"].ToString();
        rm.price=int.Parse(Request.Form["additemprice"].ToString());
        rm.quantity=Request.Form["additemquantity"].ToString();
        empmenuclass.addMenuItem(rm);
    }
}