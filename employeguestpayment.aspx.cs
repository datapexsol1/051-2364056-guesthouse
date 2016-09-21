using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeguestpayment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && Request.QueryString["booking"].ToString()!=null)
        {
            int bid = int.Parse(Request.QueryString["booking"]);
           bookingRoomAttr[] data= bookingclass.getBookingDetail(bid);
            TableRow tRow1 = new TableRow();
            bookingtable.Rows.Add(tRow1);
            TableCell tCell1 = new TableCell();
            tCell1.Text = "RoomNo ";
            tRow1.Cells.Add(tCell1);
            TableCell tCell2 = new TableCell();
            tCell2.Text = "Room Rent";
            tRow1.Cells.Add(tCell2);
            TableCell tCell3 = new TableCell();
            tCell3.Text = "Check In Date";
            tRow1.Cells.Add(tCell3);
            TableCell tCell4 = new TableCell();
            tCell4.Text = "Check Out Date";
            tRow1.Cells.Add(tCell4);
            TableCell tCell5 = new TableCell();
            tCell5.Text = "Total";
            tRow1.Cells.Add(tCell5);
            TableCell tCell6 = new TableCell();
            tCell6.Text = "Checkout";
            tRow1.Cells.Add(tCell6);
            foreach (bookingRoomAttr x in data)
            {
                TableRow tRow = new TableRow();
                bookingtable.Rows.Add(tRow);


                TableCell tCellr = new TableCell();
                tCellr.Text = x.r_roomid.ToString();
                tRow.Cells.Add(tCellr);
                TableCell tCellrn = new TableCell();
                tCellrn.Text = x.r_rent;
                tRow.Cells.Add(tCellrn);
                TableCell tCellrd = new TableCell();
                tCellrd.Text = x.b_check_in_date.ToShortDateString();
                tRow.Cells.Add(tCellrd);
                TableCell tCellri = new TableCell();
                tCellri.Text = DateTime.Now.ToShortDateString();
                tRow.Cells.Add(tCellri);
                //multiply now days between dates with roomrent ;
                TableCell tCellbtotal = new TableCell();
               tCellbtotal.Text = totalcost(Double.Parse(x.r_rent), x.b_check_in_date).ToString();
                tRow.Cells.Add(tCellbtotal);
                TableCell checkoutbtn = new TableCell();
                if (x.r_checkout != null)
                {
                    checkoutbtn.Text = "<h5 style='color:red'>"+x.r_checkout+"</h5>";
                }
                else
                {
                    checkoutbtn.Text = "<a style='color:blue' href='adminsingleroomcheckout.aspx?roomid=" + x.r_roomid.ToString()+"&&booking="+bid+"'>Checkout</a>";
                }
                tRow.Cells.Add(checkoutbtn);

            }
        }
    }
    double totalcost(double costperday,DateTime d1)
    {

        //if checkout on same day the check hour nd get cancel registration time from guest house 
        DateTime d2 = DateTime.Now;
        int nodays = d2.Date.Subtract(d1.Date).Days;
        double total = 0.0;
        if (nodays == 0)
        {
            total = costperday * 1;
        }
        return total;
    }
}