using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminrooms : System.Web.UI.Page
{
    string msg, type;
    bool check;
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
        }
    }
    protected void saveroom_click(object sender, EventArgs e)
    {
        room r = new room();
        r.employee_id = int.Parse(Session["adminLogin"].ToString());
        r.room_no = Request.Form["roomno"].ToString();
        r.room_type = Request.Form["roomtype"].ToString();
        r.room_size = Request.Form["roomsize"].ToString();
        r.maximum_room_rent = Request.Form["roommaxrent"].ToString();
        r.minimum_room_rent = Request.Form["roomminrent"].ToString();
        r.branch_id = int.Parse(Request.Form["roombranch"].ToString());
        r.availbilty = "yes";
        check = roomsclass.Addroom(r);//if true display msg 
        if (check == true)
        {
            msg = "Successfully stored the information";
            type = "Success";
            //show succesful msg
        }
        else
        {
            msg = "There is some error";
            type = "Error";
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");

    }
}