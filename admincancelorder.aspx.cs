using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincancelorder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminLogin"] == null)
        {
            Response.Redirect("adminlogin.aspx");
        }
        int bid = employeeProfile.getEmployeBranch("kk");
        //get from session
                                                         //    brachid.Value = bid.ToString();
                                                         //    IQueryable<room> r = roomsclass.getBookedROoms(bid);
                                                         //    string[] rooms = new string[r.Count() + 1];
                                                         //    rooms[0] = "Select";
                                                         //    int i = 1;
                                                         //    foreach (var x in r)
                                                         //    {

        //        rooms[i] = x.room_no;
        //        i++;
        //    }
        //    ddrooms.DataSource = rooms;
        //    ddrooms.DataBind();

        double grand_totalbill = 0.0;
        orderdetail_attr[] oders = empmenuclass.getAllrecentItems(bid);
        TableRow horderitem = new TableRow();
        viewOrder.Rows.Add(horderitem);
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
        TableCell cancel = new TableCell();
        cancel.Text = "Cancel Item";
        horderitem.Cells.Add(cancel);
        string temproomno = "";
        foreach (orderdetail_attr or in oders)
        {
            if (temproomno == "")
            {
                TableRow hrorderitem = new TableRow();
                hrorderitem.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                viewOrder.Rows.Add(hrorderitem);
                TableCell Headerrow = new TableCell();
                Headerrow.Text = "Room NO" + or.order.room_no;
                Headerrow.ColumnSpan = 8;
                hrorderitem.Cells.Add(Headerrow);
                TableRow orderitem = new TableRow();
                viewOrder.Rows.Add(orderitem);
                TableCell roono = new TableCell();
                roono.Text = or.order.room_no.ToString(); //ddrooms.Text;
                temproomno = or.order.room_no.ToString();
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
                totalprice.Text = (or.order.quantity * or.rs_orde_menu.price).ToString();
                orderitem.Cells.Add(totalprice);
                TableCell date = new TableCell();
                date.Text = or.order.date.ToString();
                orderitem.Cells.Add(date);
                TableCell canelbtn = new TableCell();
                canelbtn.Text = "<input type='checkbox' id ='cb" + or.order.Id + "'value='" + or.order.Id + "' name='xyz' onclick='checkfunction(this.value)' />";

                orderitem.Cells.Add(canelbtn);
            }
            else
            {
                if (temproomno == or.order.room_no.ToString())
                {
                    TableRow orderitem = new TableRow();
                    viewOrder.Rows.Add(orderitem);
                    TableCell roono = new TableCell();
                    roono.Text = or.order.room_no.ToString(); //ddrooms.Text;
                    temproomno = or.order.room_no.ToString();
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
                    totalprice.Text = (or.order.quantity * or.rs_orde_menu.price).ToString();
                    orderitem.Cells.Add(totalprice);
                    TableCell date = new TableCell();
                    date.Text = or.order.date.ToString();
                    orderitem.Cells.Add(date);
                    TableCell canelbtn = new TableCell();
                    canelbtn.Text = "<input type='checkbox' id ='cb" + or.order.Id + "'value='" + or.order.Id + "' name='xyz' onclick='checkfunction(this.value)' />";


                    orderitem.Cells.Add(canelbtn);


                }
                else
                {
                    TableRow hrorderitem = new TableRow();
                    hrorderitem.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                    viewOrder.Rows.Add(hrorderitem);
                    TableCell Headerrow = new TableCell();
                    Headerrow.Text = "Room NO" + or.order.room_no;
                    Headerrow.ColumnSpan = 8;
                    hrorderitem.Cells.Add(Headerrow);
                    //extra row above 
                    TableRow orderitem = new TableRow();
                    viewOrder.Rows.Add(orderitem);
                    TableCell roono = new TableCell();
                    roono.Text = or.order.room_no.ToString(); //ddrooms.Text;
                    temproomno = or.order.room_no.ToString();
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
                    totalprice.Text = (or.order.quantity * or.rs_orde_menu.price).ToString();
                    orderitem.Cells.Add(totalprice);
                    TableCell date = new TableCell();
                    date.Text = or.order.date.ToString();
                    orderitem.Cells.Add(date);
                    TableCell canelbtn = new TableCell();
                    canelbtn.Text = "<input type='checkbox' id ='cb" + or.order.Id + "'value='" + or.order.Id + "' name='xyz' onclick='checkfunction(this.value)' />";

                    orderitem.Cells.Add(canelbtn);

                }
            }
        }





    }










protected void Button1_Click(object sender, EventArgs e)
{
    string str = cancelids.Value;
    string[] words = str.Split(',');
    if (words != null)
    {
        int[] value = new int[words.Length - 1];
        for (int i = 0; i < value.Length; i++)
        {
            value[i] = new int();
            value[i] = int.Parse(words[i]);

        }
        empmenuclass.deleteplacedorders(value);
        cancelids.Value = "";
    }
}
  
}
    