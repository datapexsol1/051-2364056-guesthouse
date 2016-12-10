using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void gbooking_click(object sender, EventArgs e)
    {
        int branchId;
        string selectedCity = Request.Form["branchcity"];
        if(selectedCity!= "")
        {
            branchId = branchClass.getBranchIDbyCity(selectedCity);
            online_guest_booking ogb = new online_guest_booking();
            ogb.branch_id = branchId;
            ogb.check_in_date = DateTime.Parse(Request.Form["gcheckindate"]);
            ogb.check_out_date = DateTime.Parse(Request.Form["gcheckoutdate"]);
            ogb.no_of_guest = int.Parse(Request.Form["gnoofguest"]);
            ogb.guest_name = Request.Form["gname"];
            ogb.guest_cnic_passport = Request.Form["gcnic"];
            ogb.guest_phone = Request.Form["gcontact"];
            ogb.guest_email = Request.Form["gemail"];
            ogb.no_of_room = Request.Form["noofrooms"];
            ogb.room_type = Request.Form["roomtype"];
            ogb.request_time = DateTime.Now;
            
                    onlineguestbooking.register_guest_booking(ogb);
             
                
        }
    }
  
}