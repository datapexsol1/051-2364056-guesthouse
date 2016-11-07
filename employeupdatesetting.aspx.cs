using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeupdatesetting : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }
    string msg;
    string type;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginId"] == null)
        {
            Response.Redirect("employelogin.aspx");
        }
        if (!IsPostBack)
        {

        }
    }
    protected void update_Click(object sender, EventArgs e)
    {
        int branchid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
        int eid = employeeProfile.getEmployeeIDbyusername(Session["loginName"].ToString());
        int updateId = int.Parse(Request.QueryString["id"]);
        employee emp = new employee();

        emp.name = Request.Form["inname"].ToString();
        emp.email = Request.Form["inemail"];
        emp.employee_no = Request.Form["inempno"];
        emp.cnic = Request.Form["incnic"];
        emp.designation = Request.Form["indesig"];
        emp.dateofjoining = DateTime.Parse(Request.Form["injoiningdate"]);// injoiningdate.Value);// DateTime.Parse(Request.Form["injoiningdate"].ToString());
        emp.address = Request.Form["inaddress"];
        emp.salary = int.Parse(Request.Form["insalary"]);

        if (imageupload.HasFile)
        {

            HttpPostedFile postedfile = imageupload.PostedFile;
            emp.image = imageToByteArray(postedfile);

        }

        bool check = employeeProfile.updateEmployeeInfo(emp, updateId, branchid);
        //  Response.Redirect("employeeviewemployeeinfo.aspx");
        admin_notification_class.addnotification(eid, branchid, DateTime.Now, admin_notification_class.TableNames.employee.ToString(), updateId, admin_notification_class.CommandType.Update.ToString());
        if (check == true)
        {
            msg = "Successfully updated";
            type = "Success";

        }
        else
        {
            msg = "There is some error";
            type = "Error";
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "  <script>ShowNotification('" + type + "','" + msg + "');</script>");

        //ShowMessage(msg, type);
    }
    public static byte[] imageToByteArray(HttpPostedFile postedfile)
    {
        string filename = Path.GetFileName(postedfile.FileName);
        string fileextention = Path.GetExtension(filename);
        int size = postedfile.ContentLength;
        byte[] imgbytes = null;
        if (fileextention.ToLower() == ".jpg" || fileextention.ToLower() == ".png")
        {
            Stream stream = postedfile.InputStream;
            BinaryReader binaryreader = new BinaryReader(stream);
            imgbytes = binaryreader.ReadBytes((int)stream.Length);
        }
        return imgbytes;
    }
}
