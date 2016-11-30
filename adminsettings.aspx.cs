using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminsettings : System.Web.UI.Page
{
    bool check;
    string type, msg;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminLogin"] == null)
        {
            Response.Redirect("adminlogin.aspx");
        }
        else
        {
           
        }
    }
    protected void saveclick(object sender, EventArgs e)
    {
        try {
            int aid = employeeProfile.getEmployeeId(Session["adminLogin"].ToString());
            employee emp = new employee();
            emp.name = Request.Form["name"];
            emp.email = Request.Form["email"];
            emp.password = Request.Form["password"];
            if (FileUpload1.HasFile)
            {
                HttpPostedFile postedfile = FileUpload1.PostedFile;
                emp.image = imageToByteArray(postedfile);
            }
            check = employeeProfile.updateProfile(emp, aid);
            if (check == true)
            {
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