﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeguestpayment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && Request.QueryString["booking"].ToString() != null)
        {
            double grand_totalbill = 0.0;
            int bid = int.Parse(Request.QueryString["booking"]);
            bookingRoomAttr[] data = bookingclass.getBookingDetail(bid);
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
                tCellr.Text = roomsclass.getRoomNo(int.Parse(x.r_roomid.ToString()),x.b_branch_id);
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
                grand_totalbill = totalcost(Double.Parse(x.r_rent), x.b_check_in_date);
                tCellbtotal.Text =grand_totalbill.ToString() ;
                tRow.Cells.Add(tCellbtotal);
                TableCell checkoutbtn = new TableCell();
                if (x.r_checkout != null)
                {
                    checkoutbtn.Text = "<h5 style='color:red'>" + x.r_checkout + "</h5>";
                }
                else
                {
                    checkoutbtn.Text = "<a style='color:blue' href='adminsingleroomcheckout.aspx?roomid=" + x.r_roomid.ToString() + "&&booking=" + bid + "'>Checkout</a>";
                }
                tRow.Cells.Add(checkoutbtn);


                // itemname item price item quantity quantity
                //create orderdetail table\
                 orderdetail_attr[] oders = empmenuclass.getOrderPLaced(bid);
                TableRow horderitem = new TableRow();
                facilites.Rows.Add(horderitem);
                TableCell hroomno = new TableCell();
                hroomno.Text = "RoomNo ";
                horderitem.Cells.Add(hroomno);
                TableCell hitemname = new TableCell();
                hitemname.Text = "Item";
                horderitem.Cells.Add(hitemname);
                TableCell hitemprice = new TableCell();
                hitemprice.Text = "item price";
                horderitem.Cells.Add(hitemprice);
                TableCell hquantity = new TableCell();
                hquantity.Text = "Quantity";
                horderitem.Cells.Add(hquantity);
                TableCell hitemquantity = new TableCell();
                hitemquantity.Text = "#Item";
                horderitem.Cells.Add(hitemquantity);
                TableCell htotalprice = new TableCell();
                htotalprice.Text = "Total Price";
                horderitem.Cells.Add(htotalprice);
                TableCell hdate = new TableCell();
                hdate.Text = "Date";
                horderitem.Cells.Add(hdate);

                foreach (orderdetail_attr or in oders)
                {
                    TableRow orderitem = new TableRow();
                    facilites.Rows.Add(orderitem);
                    TableCell roono = new TableCell();
                    roono.Text = roomsclass.getRoomNo(int.Parse(x.r_roomid.ToString()), x.b_branch_id);
                    orderitem.Cells.Add(roono);
                    TableCell itemname = new TableCell();
                    itemname.Text = or.rs_orde_menu.item_name;
                    orderitem.Cells.Add(itemname);
                    TableCell itemprice = new TableCell();
                    itemprice.Text = or.rs_orde_menu.price.ToString();
                    orderitem.Cells.Add(itemprice);
                    TableCell quantity = new TableCell();
                    quantity.Text = or.rs_orde_menu.quantity;
                    orderitem.Cells.Add(quantity);
                    TableCell itemquantity = new TableCell();
                    itemquantity.Text = or.order.quantity.ToString();
                    orderitem.Cells.Add(itemquantity);
                    TableCell totalprice = new TableCell();
                    grand_totalbill += or.order.quantity * or.rs_orde_menu.price; //grand total 
                    totalprice.Text = (or.order.quantity*or.rs_orde_menu.price).ToString();
                    orderitem.Cells.Add(totalprice);
                    TableCell date = new TableCell();
                    date.Text = or.order.date.ToString();
                    orderitem.Cells.Add(date);
                }
               




            }
            Gtotal.Text = grand_totalbill.ToString();
        }
    }
    double totalcost(double costperday, DateTime d1)
    {

        //if checkout on same day the check hour nd get cancel registration time from guest house 
        DateTime d2 = DateTime.Now;
        int nodays = d2.Date.Subtract(d1.Date).Days;
        double total = 0.0;
        if (nodays == 0)
        {
            total = costperday;
        }else
        {
            total += costperday * nodays;
        }
        return total;
    }
}