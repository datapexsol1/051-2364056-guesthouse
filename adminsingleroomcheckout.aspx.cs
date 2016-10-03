using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminsingleroomcheckout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["roomid"] != null)
        {
            int rid=int.Parse(Request.QueryString["roomid"].ToString());
            ctownDataContext db = new ctownDataContext();
            booking_Room data = (from x in db.booking_Rooms
                       where x.roomid == rid 
                       select x).First();
            data.checkout = DateTime.Now.ToString();
          

            room r = (from y in db.rooms
                      where y.Id == rid
                      select y).First();
            r.availbilty = "yes";
           
            db.SubmitChanges();




            //update details off paymenthere 
            Response.Redirect("employeguestpayment.aspx?booking=" + Request.QueryString["booking"].ToString());
        }
    }
}