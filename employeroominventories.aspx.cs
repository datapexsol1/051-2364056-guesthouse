using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeroominventories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
  protected void saveAssets_click(object sender, EventArgs e)
    {
        room_asset r = new room_asset();
        r.room_id = int.Parse(Request.Form["rno"].ToString());
        r.label = Request.Form["alabel"].ToString();
        r.description = Request.Form["adescription"].ToString();
        r.total_item =int.Parse(Request.Form["insertaitemno"].ToString());
        roomassetclass.addinventry(r);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       


        TableRow tRow1 = new TableRow();
        assetsViewTable.Rows.Add(tRow1);
            TableCell tCell1 = new TableCell();
            tCell1.Text = "RoomNo ";
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
        // }
        int roomid=int.Parse(Request["rnovxxxx"].ToString());
        int branchid = int.Parse(Request["branch"]);
       
        
        IQueryable<room_asset> rom = roomassetclass.getAllRoomAssets(branchid, roomid);
        foreach(var x in rom) { 
            TableRow tRow = new TableRow();
            assetsViewTable.Rows.Add(tRow);
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
        }



      
    }
}
   