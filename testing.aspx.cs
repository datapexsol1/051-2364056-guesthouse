﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class testing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ipaddress;
        ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (ipaddress == "" || ipaddress == null)
            ipaddress = Request.ServerVariables["REMOTE_ADDR"];

        XmlDocument doc = new XmlDocument();

        //   string str= new WebClient().DownloadString("http://api.hostip.info/get_json.php");
        doc.Load("http://www.showmyip.com/xml/?ip=" + ipaddress);

        //begin finding the country by tag name
        XmlNodeList nodeLstCountry = doc.GetElementsByTagName("lookup_country");

        ////begin finding the city by tag name
        XmlNodeList nodeLstCity = doc.GetElementsByTagName("lookup_city2");

        //concatinating the result for show, u could also use it
        //to save in data base
        ipaddress = "Country :" + nodeLstCountry[0].InnerText +
             " --  City :" + nodeLstCity[0].InnerText + "" + ipaddress;
        Response.Write(ipaddress);

    }
}