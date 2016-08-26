using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminemployesignup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }

    protected void send_Click(object sender, EventArgs e)
    {
        employee emp = new employee();
        emp.name = Request.Form["name"].ToString();
        emp.username = Request.Form["username"].ToString();
        emp.password = Request.Form["password"].ToString();
        emp.email = Request.Form["email"].ToString();
        emp.employee_no = "123";
        emp.cnic = Request.Form["cnic"].ToString();
        emp.designation = Request.Form["designation"].ToString();
        emp.branch_id = 1.ToString();
        emp.block_client = 0;
        emp.dateofjoining = DateTime.Now;
        emp.login_type = "Employe";
        //if(imageuploaded.hasfile)then do this
        HttpPostedFile postedfile = image.PostedFile;
        emp.image = imageToByteArray(postedfile);
        emp.address = "XYz";

        employeeProfile.employeSignUp(emp);
    }
    public static byte[] imageToByteArray(HttpPostedFile postedfile)
    {
        string filename = Path.GetFileName(postedfile.FileName);
        string fileextention = Path.GetExtension(filename);
        int size = postedfile.ContentLength;
        byte[] imgbytes = null;
        if (fileextention.ToLower() == ".jpg")
        {
            Stream stream = postedfile.InputStream;
            BinaryReader binaryreader = new BinaryReader(stream);
            imgbytes = binaryreader.ReadBytes((int)stream.Length);
        }
        return imgbytes;
    }
}