using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeeupdateemployeeinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //int branchid = employeeProfile.getEmployeBranch("kk");
        //int val = int.Parse(Request.QueryString["id"]);
        //employee emp = employeeProfile.getSelectedEmployeeInfo(val, branchid);

        //injoiningdate.Value = Convert.ToString(DateTime.Parse(emp.dateofjoining.ToString()));
        //byte[] bytes = (byte[])emp.image.ToArray();
        //string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
        //Image1.ImageUrl = "data:image/png;base64," + base64String;
        //employee em = employeeProfile.getSelectedEmployeeInfo(val, branchid);
        //byte[] img1 = null;
        //if (em.image != null)
        //{
        //    img1 = em.image.ToArray();
        //}
        //imageupload.SaveAs(Server.MapPath(img1.ToString()));

    }
    protected void update_Click(object sender, EventArgs e)
    {
        int branchid = employeeProfile.getEmployeBranch("kk");
        int val = int.Parse(Request.QueryString["id"]);
        ////   employee em = employeeProfile.getSelectedEmployeeInfo(val, branchid);
        //byte[] img1 = null;
        //if (em.image != null)
        //{
        //    img1 = em.image.ToArray();
        //}
        //imageupload.SaveAs(Server.MapPath(img1.ToString()));
        if (imageupload.HasFile)
        {





            employee emp = new employee();
            HttpPostedFile postedfile = imageupload.PostedFile;
            emp.image = imageToByteArray(postedfile);
            emp.name = Request.Form["inname"].ToString();
            emp.email = Request.Form["inemail"];
            emp.employee_no = Request.Form["inempno"];
            emp.cnic = Request.Form["incnic"];
            emp.designation = Request.Form["indesig"];
            emp.dateofjoining =DateTime.Parse(Request.Form["injoiningdate"]);// injoiningdate.Value);// DateTime.Parse(Request.Form["injoiningdate"].ToString());
            emp.address = Request.Form["inaddress"];
            emp.salary = int.Parse(Request.Form["insalary"]);
            employeeProfile.updateEmployeeInfo(emp, val, branchid);
            Response.Redirect("employeeviewemployeeinfo.aspx");

        }
        else
        {
            employee emp = new employee();
            emp.name = Request.Form["inname"].ToString();
            emp.email = Request.Form["inemail"];
            emp.employee_no = Request.Form["inempno"];
            emp.cnic = Request.Form["incnic"];
            emp.designation = Request.Form["indesig"];
            emp.dateofjoining = DateTime.Parse(Request.Form["injoiningdate"]);// injoiningdate.Value);// DateTime.Parse(Request.Form["injoiningdate"].ToString());
            emp.address = Request.Form["inaddress"];
            emp.salary = int.Parse(Request.Form["insalary"]);
            employeeProfile.updateEmployeeInfo(emp, val, branchid);
            Response.Redirect("employeeviewemployeeinfo.aspx");
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
