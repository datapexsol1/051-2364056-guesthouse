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
        if (Session["loginId"] == null)
        {
            Response.Redirect("employelogin.aspx");
        }
        else
        {
            if (!IsPostBack && Request.QueryString["booking"].ToString() != null)
            {
                chaqueno.Visible = false;
                taxtdiscount.Visible = false;
                bindTable();
                tbpaidamount.Text = Gtotal.Text;
                if (double.Parse(hrs.Value) <= 6)
                {
                    timelesscbox.Visible = true;
                }
                else
                {
                    timelesscbox.Visible = false;
                }
            }
            else
            {
                bindTable();
            }
        }
    }
    void bindTable()
    {
        double roombill = 0.0;
        double facilitiesbill = 0.0;
        double grand_totalbill = 0.0;
        bookingtable.Rows.Clear();
        facilites.Rows.Clear();
        int bid = int.Parse(Request.QueryString["booking"]);
        tbbid.Value = bid.ToString();
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
        TableCell tCell7 = new TableCell();
        tCell7.Text = "Total hours";
        tRow1.Cells.Add(tCell7);
        TableCell tCell6 = new TableCell();
        tCell6.Text = "Checkout";
        tRow1.Cells.Add(tCell6);

        foreach (bookingRoomAttr x in data)
        {
            TableRow tRow = new TableRow();
            bookingtable.Rows.Add(tRow);


            TableCell tCellr = new TableCell();
            tCellr.Text = roomsclass.getRoomNo(int.Parse(x.r_roomid.ToString()), x.b_branch_id);
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
            double currentbill = totalcost(Double.Parse(x.r_rent), x.b_check_in_date);
            roombill += currentbill; // totalcost(Double.Parse(x.r_rent), x.b_check_in_date);
            tCellbtotal.Text = currentbill.ToString();//roombill.ToString() ;
            tRow.Cells.Add(tCellbtotal);
            //total hrs
            TableCell tCellhr = new TableCell();
            //TimeSpan difference = x.b_check_in_date - x.b_check_out_date ;
            //double diffInHours = difference.TotalHours;
            DateTime d1 = DateTime.Parse(x.b_check_in_date.ToString());
            DateTime d2 = DateTime.Parse(DateTime.Now.ToString());
            // DateTime.Subtract(DateTime);
            double d3 = d2.Subtract(d1).TotalHours;

            tCellhr.Text = d3.ToString();//DateTime.Now.ToShortTimeString();// DateTime.Now.ToShortDateString();
            tRow.Cells.Add(tCellhr);
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

            hrs.Value = tCellhr.Text;

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
                facilitiesbill += or.order.quantity * or.rs_orde_menu.price; //grand total 
                totalprice.Text = (or.order.quantity * or.rs_orde_menu.price).ToString();
                orderitem.Cells.Add(totalprice);
                TableCell date = new TableCell();
                date.Text = or.order.date.ToString();
                orderitem.Cells.Add(date);
            }



            input.Value = x.r_rent;

        }
        tbfacilitebill.Value = facilitiesbill.ToString();
        tbroombill.Value = roombill.ToString();
        double taxAmount = (roombill + facilitiesbill) * 17 / 100;
        Gtotal.Text = (roombill + facilitiesbill + taxAmount).ToString();
        totalbill.Value = (roombill + facilitiesbill + taxAmount).ToString(); //Gtotal.Text;
        lbfacilities.Text = (facilitiesbill ).ToString();
        lbtax.Text = taxAmount.ToString();
        lbroomrent.Text = roombill.ToString();
        //Gtotal.Text = totalbill.Value;
        //tbpaidamount.Text = Gtotal.Text;
        //hidden val



    }
    //houre less then six then 
    protected void checkedchange(object sender, EventArgs e)
    {
        if (timelesscbox.Checked && double.Parse(hrs.Value) <= 6)
        {
            //< !-- if stay hours is less than 6 hours then 50% discount will be provided-- >
            double revertTax = double.Parse(input.Value) * 50 / 100;
            Gtotal.Text = (double.Parse(totalbill.Value) - revertTax).ToString();

            //double taxAmount = double.Parse(input.Value) * 50 / 100;
            // tbpaidamount.Text = (double.Parse(input.Value ) - taxAmount).ToString();
            tbpaidamount.Text = Gtotal.Text;
            

        }
        else
        {
            tbpaidamount.Text = Gtotal.Text;
        }
        bindTable();

    }
    protected void tax_discount(object sender, EventArgs e)
    {
        if (taxtdiscount.Checked)
        {
            //< !-- if stay hours is less than 6 hours then 50% discount will be provided-- >
            double revertTax = double.Parse(lbtax.Text);
            Gtotal.Text = (double.Parse(totalbill.Value) - revertTax).ToString();

            //double taxAmount = double.Parse(input.Value) * 50 / 100;
            // tbpaidamount.Text = (double.Parse(input.Value ) - taxAmount).ToString();
            tbpaidamount.Text = Gtotal.Text;


        }
        else
        {
            tbpaidamount.Text = Gtotal.Text;
        }
        bindTable();

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
        }
        else
        {
            total += costperday * nodays;
        }
        return total;
    }

    protected void btnpaid_Click(object sender, EventArgs e)
    {
        string msgshow = "";
        if (paymentDropdown.SelectedIndex != 0)
        {
            //bid is booking id 
            bookingRoomAttr[] data = bookingclass.getBookingDetail(int.Parse(tbbid.Value));
            int counter = 0;
            int branchid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
            foreach (bookingRoomAttr r in data)
            {
                if (roomsclass.checkroomAvalbilty(r.r_roomid, branchid) == "yes")
                {
                    counter++;
                }
                else
                {
                    break;
                }
            }
            if (counter == data.Count())
            {
                if (tbbid.Value != "" && tbroombill.Value != null && tbfacilitebill.Value != "" && Gtotal.Text != "" && tbpaidamount.Text != "" && paymentDropdown.SelectedIndex != 0)
                {
                    total_payment tp = new total_payment();
                    tp.booking_id = int.Parse(tbbid.Value);
                    tp.total_rent = tbroombill.Value;
                    tp.facility_total_payment = tbfacilitebill.Value;
                    tp.total_bill = Gtotal.Text;
                    tp.paid_amount = tbpaidamount.Text;
                    tp.paymentdate = DateTime.Now;
                    tp.payment_type = paymentDropdown.SelectedValue;
                    if (paymentDropdown.SelectedIndex == 2 && chaqueno.Text != "")  ///Cheque is on index 2 
                    {
                        tp.chaqueno = chaqueno.Text;
                        tp.employee_id = employeeProfile.getEmployeeIdfromusername(Session["loginName"].ToString());
                        guestpayment.addPayment(tp);
                        msgshow = "Data Saved Successfully";
                    }
                    else if (paymentDropdown.SelectedIndex == 1 || paymentDropdown.SelectedIndex == 3)
                    {
                        tp.chaqueno = null;
                        tp.employee_id = employeeProfile.getEmployeeIdfromusername(Session["loginName"].ToString());
                        guestpayment.addPayment(tp);
                        msgshow = "Data saved Successfully";
                    }
                    else
                    {
                        msgshow = "Please add CHAQUE NO";
                    }

                }
                else
                {
                    msgshow = "Please Cheaque out all rooms of this booking ";
                    //display msg checkout before
                    //  bindTable();
                    // Page_Load(this, e);
                    //display msg of error 
                }
            }

        }else
        {
            msgshow = "Please Select Payment type";
        }
    }

    protected void paymentDropdown_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (paymentDropdown.SelectedIndex == 0)
        {
            chaqueno.Visible = false;
            taxtdiscount.Visible = false;
            timelesscbox.Visible = false; //show msg "please select payment type"
        }
        if (paymentDropdown.SelectedValue == "Cash")
        {
            chaqueno.Visible = false;
            taxtdiscount.Visible = true;
            timelesscbox.Visible = true;
        }else if(paymentDropdown.SelectedValue== "Cheque")
        {
            chaqueno.Visible = true;
            taxtdiscount.Visible = false;
            timelesscbox.Visible = true;
        }
        else if (paymentDropdown.SelectedValue == "Pay later")
        {
            chaqueno.Visible = false;
            taxtdiscount.Visible = true;
            timelesscbox.Visible = true;
        }
    }
}