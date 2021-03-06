﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminemployesignup : System.Web.UI.Page
{
    string msg, type;
    bool check;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminLogin"] == null)
        {
            Response.Redirect("adminlogin.aspx");
        }
    }

    protected void send_Click(object sender, EventArgs e)
    {
        employee emp = new employee();
        emp.name = Request.Form["name"].ToString();
        emp.username = Request.Form["username"].ToString();
        emp.password = Request.Form["password"].ToString();
        emp.email = Request.Form["email"].ToString();
        emp.employee_no = Request.Form["number"];
        emp.cnic = Request.Form["cnic"].ToString();
        emp.designation = Request.Form["designation"].ToString();
        emp.branch_id = int.Parse(Request.Form["brancid"].ToString());
        emp.block_client = 0;
        emp.dateofjoining = DateTime.Now;
        emp.login_type = "Employe";
        emp.salary = int.Parse(Request.Form["salary"].ToString());
        if (image.HasFile)
        {
            HttpPostedFile postedfile = image.PostedFile;
            emp.image = imageToByteArray(postedfile);
        }
        
        //if(imageuploaded.hasfile)then do this
        //     HttpPostedFile postedfile = image.PostedFile;
        // emp.image = imageToByteArray(postedfile);
        emp.address = Request.Form["address"].ToString(); ;

        bool result = employeeProfile.employeSignUp(emp);
        if (result == true)
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
    public static byte[] imageToByteArray(HttpPostedFile postedfile)
    {
        string filename = Path.GetFileName(postedfile.FileName);
        string fileextention = Path.GetExtension(filename);
        int size = postedfile.ContentLength;
        byte[] imgbytes = null;
        if (fileextention.ToLower() == ".jpg" || fileextention.ToLower() == ".jpeg" || fileextention.ToLower() == ".png")
        {
            Stream stream = postedfile.InputStream;
            BinaryReader binaryreader = new BinaryReader(stream);
            imgbytes = binaryreader.ReadBytes((int)stream.Length);
        }
        return imgbytes;
    }
}