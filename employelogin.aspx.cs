﻿using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employelogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void login_Click(object sender, EventArgs e)
    {
      
        string name = Request.Form["username"];
        string password = Request.Form["password"];

        if(name!="" && password != "")
        {
            int emp = employeeProfile.employeSignin(name, password);
           
            if (emp == 1)
            {
                
                Session["loginName"] = name;
                int branchid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
                int id = employeeProfile.getEmpID(name, password, branchid);
                Session["loginId"] = id;
                Response.Write("yourlogin");
              Response.Redirect("employeindex.aspx");
            }
            else
            {
                Response.Write("yournotlogin");
            }
        }
        //string emp = employeeProfile.employeSignin(name, password);
        //int id = employeeProfile.getEmpID(name, password, branchid);

        //if (emp != "" || emp != null)
        //{
        //    Session["loginId"] = id;
        //    Response.Redirect("employeindex.aspx");

        //}
        //else
        //{
        //    Response.Write("yournotlogin");
        //}
    }
  
}
