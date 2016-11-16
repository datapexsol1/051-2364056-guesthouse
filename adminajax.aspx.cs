﻿using signalR_dependency;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class adminajax : System.Web.UI.Page
{
    public static object JsonConvert { get; private set; }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static int[] getBranchWeeklyIncome(string inputVal,string dateofweek)
    {
        int[] list = new int[7];
        ctownDataContext db = new ctownDataContext();
       
        if (inputVal != "")
        {
            IQueryable<total_payment> brows = admingraphclass.getbranchweeklyincome(inputVal);
            if (dateofweek == "")
            {


                foreach (total_payment p in brows)
                {
                    if (CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(p.paymentdate, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday) == CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(DateTime.Now, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday))
                    {
                        if (p.paymentdate.ToString("ddd") == "Mon")
                        {
                            list[0] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Tue")
                        {
                            list[1] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Wed")
                        {
                            list[2] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Thu")
                        {
                            list[3] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Fri")
                        {
                            list[4] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Sat")
                        {
                            list[5] += int.Parse(p.paid_amount);
                        }
                        else
                        {
                            list[6] += int.Parse(p.paid_amount);
                        }
                    }
                }
            }
            else
            {
                foreach (total_payment p in brows)
                {
                    if (CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(p.paymentdate, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday) == CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(DateTime.Parse(dateofweek), CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday))
                    {
                        if (p.paymentdate.ToString("ddd") == "Mon")
                        {
                            list[0] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Tue")
                        {
                            list[1] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Wed")
                        {
                            list[2] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Thu")
                        {
                            list[3] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Fri")
                        {
                            list[4] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Sat")
                        {
                            list[5] += int.Parse(p.paid_amount);
                        }
                        else
                        {
                            list[6] += int.Parse(p.paid_amount);
                        }
                    }
                }
            }
        }
        else
        {
            IQueryable<total_payment> brows = admingraphclass.getallbranchweeklyincome();
            if (dateofweek == "")
            {


                foreach (total_payment p in brows)
                {
                    if (CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(p.paymentdate, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday) == CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(DateTime.Now, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday))
                    {
                        if (p.paymentdate.ToString("ddd") == "Mon")
                        {
                            list[0] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Tue")
                        {
                            list[1] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Wed")
                        {
                            list[2] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Thu")
                        {
                            list[3] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Fri")
                        {
                            list[4] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Sat")
                        {
                            list[5] += int.Parse(p.paid_amount);
                        }
                        else
                        {
                            list[6] += int.Parse(p.paid_amount);
                        }
                    }
                }
            }
            else
            {
                foreach (total_payment p in brows)
                {
                    if (CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(p.paymentdate, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday) == CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(DateTime.Parse(dateofweek), CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday))
                    {
                        if (p.paymentdate.ToString("ddd") == "Mon")
                        {
                            list[0] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Tue")
                        {
                            list[1] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Wed")
                        {
                            list[2] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Thu")
                        {
                            list[3] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Fri")
                        {
                            list[4] += int.Parse(p.paid_amount);
                        }
                        else if (p.paymentdate.ToString("ddd") == "Sat")
                        {
                            list[5] += int.Parse(p.paid_amount);
                        }
                        else
                        {
                            list[6] += int.Parse(p.paid_amount);
                        }
                    }
                }
            }



        }
        // string json= Serialize<int[]>(list);

        // return json;
        return list;
    }

  

    [WebMethod]
    public static int[] getBranchWeeklyexpenditure(string inputVal,string incomedate)
    {
        
        // string json= Serialize<int[]>(list);
        //if(inputVal=="")
             return admingraphclass.getTotalweeklybranchexpenditure(inputVal,incomedate);
        //else
        //    return admingraphclass.getTotalweeklybranchexpenditure(inputVal,incomedate);
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string getMonthlyincome(string inputVal, string incomedate)
    {

        Dictionary<string, int> data = admingraphclass.getbranc_all_monthlyincome(inputVal, incomedate);
        string myJsonString = (new JavaScriptSerializer()).Serialize(data);
        return myJsonString;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string getMonthlyExpenditure(string inputVal, string incomedate)
    {

        Dictionary<string, int> data = admingraphclass.getbranc_all_monthlyexpenditure(inputVal, incomedate);
        string myJsonString = (new JavaScriptSerializer()).Serialize(data);
        return myJsonString;
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string getyearlyincome(string inputVal, string incomedate)
    {

        Dictionary<string, int> data = admingraphclass.getbranc_all_yearlyincome(inputVal, incomedate);
        string myJsonString = (new JavaScriptSerializer()).Serialize(data);
        return myJsonString;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string getyearlyExpenditure(string inputVal, string incomedate)
    {

        Dictionary<string, int> data = admingraphclass.getbranc_all_yearlyexpenditure(inputVal, incomedate);
        string myJsonString = (new JavaScriptSerializer()).Serialize(data);
        return myJsonString;
    }
    [WebMethod]
    public static IEnumerable<admin_notification> GetData()
    {
        var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["guest_house_databaseConnectionString1"].ConnectionString);
        SqlDependency.Stop(ConfigurationManager.ConnectionStrings["guest_house_databaseConnectionString1"].ConnectionString);
        SqlDependency.Start(ConfigurationManager.ConnectionStrings["guest_house_databaseConnectionString1"].ConnectionString);
        connection.Open();
        //   string com1 = "select count(Id) from dbo.Products";
        using (SqlCommand com = new SqlCommand("select Id,eid,branch_id,time,table_name,Changed_row_id,operation_type,seen from admin_notification", connection))
        {
            com.Notification = null;
            SqlDependency dependency = new SqlDependency(com);
            dependency.OnChange += new OnChangeEventHandler(dependency_OnChange);
            if (connection.State == ConnectionState.Closed)

                connection.Open();

            var reader = com.ExecuteReader();

            return reader.Cast<IDataRecord>().Select(x => new admin_notification
            {
                Id = x.GetInt32(0),
                eid = x.GetInt32(1),
                branch_id = x.GetInt32(2),
                time = x.GetDateTime(3),
                table_name = x.GetString(4),
                Changed_row_id = x.GetInt32(5),
                operation_type = x.GetString(6),
                seen = x.GetString(7)
               

            }
            ).ToList();


        }




    }

   

    private static void dependency_OnChange(object sender, SqlNotificationEventArgs e)
    {
        //throw new NotImplementedException();
        if (e.Type == SqlNotificationType.Change)
        {
            MyHub.Show();
        }
    }

    public static string Serialize<T>(T obj)
    {
        DataContractJsonSerializer serializer = new DataContractJsonSerializer(obj.GetType());
        MemoryStream ms = new MemoryStream();
        serializer.WriteObject(ms, obj);
        string retVal = Encoding.UTF8.GetString(ms.ToArray());
        return retVal;
    }
}