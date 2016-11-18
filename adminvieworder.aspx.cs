using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminvieworder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminLogin"] == null)
        {
            Response.Redirect("adminlogin.aspx");
        }
        else if (!IsPostBack)
        {
            branch.Items.Clear();
            IQueryable<branch> br = admingraphclass.getAllbranches();
            branch.Items.Add("Select Branch");
            foreach (branch b in br)
            {
                branch.Items.Add(b.name);
            }
       
        if (branch.SelectedValue != "Select Branch")
        {
            int bid = branchClass.getBranchID(branch.SelectedValue);//get from session
            brachid.Value = bid.ToString();
            IQueryable<room> r = roomsclass.getBookedROoms(bid);
            string[] rooms = new string[r.Count() + 1];
            rooms[0] = "Select";
            int i = 1;
            foreach (var x in r)
            {

                rooms[i] = x.room_no;
                i++;
            }
            ddrooms.DataSource = rooms;
            ddrooms.DataBind();
            }
        }
    }

    protected void ddrooms_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (branch.SelectedValue != "Select Branch" && ddrooms.SelectedValue!="Select")
        {
            int bid = branchClass.getBranchID(branch.SelectedValue);
            double grand_totalbill = 0.0;
            orderdetail_attr[] oders = empmenuclass.getRoomorders(ddrooms.Text, bid);
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

            foreach (orderdetail_attr or in oders)
            {
                TableRow orderitem = new TableRow();
                viewOrder.Rows.Add(orderitem);
                TableCell roono = new TableCell();
                roono.Text = ddrooms.Text;
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
            }



            grandtotal.Text = grand_totalbill.ToString();
        }
    }

    }
    