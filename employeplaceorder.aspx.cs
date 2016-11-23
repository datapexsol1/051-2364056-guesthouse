using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employemenuservice : System.Web.UI.Page
{
    string msg, type;
    bool check;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginId"] == null)
        {
            Response.Redirect("employelogin.aspx");
        }
        else if (!IsPostBack)
        {
            ordersummery.Visible = false;
            savetodb.Visible = false;
            int bid = employeeProfile.getEmployeBranch("kk");//get from session
            bookingid.Value = bid.ToString();
            IQueryable<room> r = roomsclass.getBookedROoms(bid);
            string[] rooms = new string[r.Count() + 1];
            rooms[0] = "Select";
            int i = 1;
            foreach (var x in r)
            {

                rooms[i] = x.room_no;
                i++;
            }
            roombranch.DataSource = rooms;
            roombranch.DataBind();


            bindMenu();







        }
    }
    public void bindMenu()
    {
        TableRow tRow1 = new TableRow();
        menuview.Rows.Add(tRow1);
        tRow1.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
        tRow1.ForeColor = System.Drawing.Color.White;
        TableCell tCell2 = new TableCell();
        tCell2.Text = "Item name";
        tRow1.Cells.Add(tCell2);
        TableCell tCell3 = new TableCell();
        tCell3.Text = "Item price";
        tRow1.Cells.Add(tCell3);
        TableCell tCell4 = new TableCell();
        tCell4.Text = "Item Quantity";
        tRow1.Cells.Add(tCell4);

        TableCell cbox = new TableCell();
        cbox.Text = "Select";
        tRow1.Cells.Add(cbox);

        TableCell qu = new TableCell();
        qu.Text = "Value";
        tRow1.Cells.Add(cbox);

        TableCell dd = new TableCell();
        dd.Text = "Quantity";
        tRow1.Cells.Add(dd);

        // int roomid = int.Parse(Request["rnovxxxx"].ToString());
        // int branchid = int.Parse(Request["branch"]);
        int bbid = employeeProfile.getEmployeBranch("kk");//get from session
                                                          // bid.Value = bbid.ToString();
        IQueryable<room_service_menu> assets = empmenuclass.getMenuItem(bbid);
        string checkin = "";

        foreach (var x in assets)
        {
            if (x.type == checkin)
            {
                TableRow tRow = new TableRow();
                menuview.Rows.Add(tRow);
                //TableCell tCellr = new TableCell();
                //tCellr.Text = x.type.ToString();
                //tRow.Cells.Add(tCellr);
                TableCell tCellrn = new TableCell();
                tCellrn.Text = x.item_name;
                tCellrn.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                tRow.Cells.Add(tCellrn);
                TableCell tCellrd = new TableCell();
                tCellrd.Text = x.price.ToString();
                tCellrd.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                tRow.Cells.Add(tCellrd);
                TableCell tCellri = new TableCell();
                tCellri.Text = x.quantity.ToString();
                tCellri.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                tRow.Cells.Add(tCellri);

                TableCell checkbox = new TableCell();
                checkbox.Text = "<input type='checkbox' name='tbbox' id='tbox" + x.Id + "' value=" + x.Id + " onclick='xyz(this.value)'";
                checkbox.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                tRow.Cells.Add(checkbox);
                TableCell quan = new TableCell();
                quan.Text = "<input type = 'number' id='noitem" + x.Id + "' name='noitem" + x.Id + "' value='1' min='1'/>";
                quan.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                tRow.Cells.Add(quan);

                checkin = x.type;
            }
            else
            {
                TableRow hRow = new TableRow();
                menuview.Rows.Add(hRow);
                TableCell hCellr = new TableCell();
                hCellr.Text = x.type.ToString();
                hCellr.BackColor = System.Drawing.ColorTranslator.FromHtml("#800000");
                hCellr.ForeColor = System.Drawing.Color.White;
                hCellr.ColumnSpan = 5;
                hRow.Cells.Add(hCellr);

                TableRow tRow = new TableRow();
                menuview.Rows.Add(tRow);
                tRow.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                TableCell tCellrn = new TableCell();
                tCellrn.Text = x.item_name;
                tCellrn.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                tRow.Cells.Add(tCellrn);
                TableCell tCellrd = new TableCell();
                tCellrd.Text = x.price.ToString();
                tCellrd.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                tRow.Cells.Add(tCellrd);
                TableCell tCellri = new TableCell();
                tCellri.Text = x.quantity.ToString();
                tCellri.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                tRow.Cells.Add(tCellri);

                TableCell checkbox = new TableCell();
                checkbox.Text = "<input type='checkbox' name='tbbox' id='tbox" + x.Id + "' value=" + x.Id + " onclick='xyz(this.value)'";
                checkbox.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                tRow.Cells.Add(checkbox);

                TableCell quan = new TableCell();
                quan.Text = "<input type = 'number' id='noitem" + x.Id + "' name='noitem" + x.Id + "' value='1' min='1' />";
                quan.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                tRow.Cells.Add(quan);
                checkin = x.type;




                checkin = x.type;
            }



        }

    }
    protected void getsummary_click(object sender, EventArgs e)
    {
        try { 
        int eid = employeeProfile.getEmployeid(Session["loginName"].ToString());
        int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
            if (itemid.Value == "" && nofitem.Value == "")
            {
                //  bookingid.Value= "";
                bindMenu();
            }
            else
            {
                double totalprice = 0;
                string str = itemid.Value;
                string[] words = str.Split(',');
                string[] value = new string[words.Length];
                int i = 0;
                foreach (string w in words)
                {
                    value[i] = null;
                    value[i] = Request.Form["noitem" + w].ToString();
                    i++;
                }


                menuview.Visible = false;
                ordersummery.Visible = true;
                TableRow hrow = new TableRow();
                hrow.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                ordersummery.Rows.Add(hrow);
                TableCell date = new TableCell();
                date.Text = "<h4>Date" + DateTime.Now.ToString() + "</h4>";
                date.ColumnSpan = 2;

                hrow.Cells.Add(date);
                TableCell roomno = new TableCell();
                roomno.Text = "Room_no :101";
                roomno.ColumnSpan = 2;
                hrow.Cells.Add(roomno);
                TableRow tRow1 = new TableRow();
                tRow1.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                ordersummery.Rows.Add(tRow1);
                TableCell tCell2 = new TableCell();
                tCell2.Text = "Item name";
                tRow1.Cells.Add(tCell2);
                TableCell tCell4 = new TableCell();
                tCell4.Text = "Item Quantity";
                tRow1.Cells.Add(tCell4);
                TableCell tCell3 = new TableCell();
                tCell3.Text = "Item price";
                tRow1.Cells.Add(tCell3);
                TableCell tCell5 = new TableCell();
                tCell5.Text = "Total Price";
                tRow1.Cells.Add(tCell5);
                int bidx = int.Parse(bookingid.Value);//BRANCHID
                IQueryable<room_service_menu> menu = empmenuclass.getMenuItem(bidx);
                int l = 0;
                placed_order p = new placed_order();
                foreach (room_service_menu x in menu)
                {

                    foreach (string k in words)
                    {
                        if (x.Id == int.Parse(k))
                        {
                            TableRow tRow = new TableRow();
                            ordersummery.Rows.Add(tRow);
                            //TableCell tCellr = new TableCell();
                            //tCellr.Text = x.type.ToString();
                            //tRow.Cells.Add(tCellr);
                            TableCell tCellrn = new TableCell();
                            tCellrn.Text = x.item_name;

                            //  tCellrn.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                            tRow.Cells.Add(tCellrn);
                            TableCell tCellri = new TableCell();
                            tCellri.Text = value[l];
                            // tCellri.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                            tRow.Cells.Add(tCellri);
                            TableCell tCellrd = new TableCell();
                            tCellrd.Text = x.price.ToString();
                            //  tCellrd.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                            tRow.Cells.Add(tCellrd);
                            TableCell tCelltoalp = new TableCell();
                            tCelltoalp.Text = (x.price * int.Parse(value[l])).ToString();
                            totalprice += x.price * int.Parse(value[l]);
                            // tCelltoalp.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                            tRow.Cells.Add(tCelltoalp);

                            //code to get booking id




                            p.booking_id = bookingRoomClass.getbookingid(roombranch.Text);
                            p.room_no = roombranch.Text;
                            p.item_id = x.Id;
                            p.quantity = int.Parse(value[l]);
                            p.date = DateTime.Now;
                            p.delivery = "no";
                            check = empmenuclass.placeOrder(p);
                            if (check == true)
                            {
                                admin_notification_class.addnotification(eid, bid, DateTime.Now, admin_notification_class.TableNames.placed_order.ToString(), 0, admin_notification_class.CommandType.Add.ToString());
                                msg = "Successfully placed order";
                                type = "Success";

                            }
                            else
                            {
                                msg = "There is some error";
                                type = "Error";
                            }
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");
                            l++;

                        }
                    }

                }

                TableRow totalbill = new TableRow();
                totalbill.BackColor = System.Drawing.ColorTranslator.FromHtml("#212121");
                totalbill.ForeColor = System.Drawing.Color.Cyan;
                ordersummery.Rows.Add(totalbill);

                TableCell tb = new TableCell();
                tb.Text = "Total BIll:" + totalprice;
                tb.ColumnSpan = 5;
                totalbill.Cells.Add(tb);


                getsummary.Visible = false;
                savetodb.Visible = true;

            }
        }
        catch(Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('Error','" + ex.Message + "');</script>");

        }
    }
    protected void saveitem_click(object sender, EventArgs e)
    {
        try {
            int eid = employeeProfile.getEmployeid(Session["loginName"].ToString());
            int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
            room_service_menu rm = new room_service_menu();
            rm.type = Request.Form["addtype"].ToString();
            rm.item_name = Request.Form["additemname"].ToString();
            rm.price = int.Parse(Request.Form["additemprice"].ToString());
            rm.quantity = Request.Form["additemquantity"].ToString();
            rm.bid = bid;// employeeProfile.getEmployeBranch(Session["loginName"].ToString());//get from session
            check = empmenuclass.addMenuItem(rm);
            if (check == true)
            {
                admin_notification_class.addnotification(eid, bid, DateTime.Now, admin_notification_class.TableNames.placed_order.ToString(), rm.Id, admin_notification_class.CommandType.Add.ToString());
                msg = "Successfully stored the information";
                type = "Success";

            }
            else
            {
                msg = "There is some error";
                type = "Error";
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");
        }catch(Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('Error','" + ex.Message + "');</script>");

        }
    }
}