using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeerooms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)

    { 
       //get braches and assign branch name to drop down and asssign value as id
    }
    protected void saveroom_click(object sender, EventArgs e)
    {
        room r = new room();
        r.room_no = Request.Form["roomno"].ToString();
        r.room_type= Request.Form["roomtype"].ToString();
        r.room_size = Request.Form["roomsize"].ToString();
        r.maximum_room_rent = Request.Form["roommaxrent"].ToString();
        r.minimum_room_rent = Request.Form["roomminrent"].ToString();
        r.branch_id = int.Parse(Request.Form["roombranch"].ToString());
        r.availbilty = "yes";
        roomsclass.Addroom(r);//if true display msg 
    }
    
}