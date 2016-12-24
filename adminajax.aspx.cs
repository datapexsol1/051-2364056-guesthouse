using signalR_dependency;
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
        var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["guest_house_databaseConnectionString"].ConnectionString);
        SqlDependency.Stop(ConfigurationManager.ConnectionStrings["guest_house_databaseConnectionString"].ConnectionString);
        SqlDependency.Start(ConfigurationManager.ConnectionStrings["guest_house_databaseConnectionString"].ConnectionString);
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
         [WebMethod]
    public static IEnumerable<online_guest_booking> GetWebsitebooking()
    {
        var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["guest_house_databaseConnectionString"].ConnectionString);
        SqlDependency.Stop(ConfigurationManager.ConnectionStrings["guest_house_databaseConnectionString"].ConnectionString);
        SqlDependency.Start(ConfigurationManager.ConnectionStrings["guest_house_databaseConnectionString"].ConnectionString);
        connection.Open();
        //   string com1 = "select count(Id) from dbo.Products";
        using (SqlCommand com = new SqlCommand(@"select Id,branch_id,check_in_date,check_out_date,no_of_guest,request_time,guest_name,guest_cnic_passport,guest_phone,guest_email,no_of_room,room_type,seen,referance_by_name,referance_by_contact,cancel_booking,Comments,room_rent
from dbo.online_guest_booking
where seen = 'no'; ", connection))
        {
            com.Notification = null;
            SqlDependency dependency = new SqlDependency(com);
            dependency.OnChange += new OnChangeEventHandler(dependency_OnChange);
            if (connection.State == ConnectionState.Closed)

                connection.Open();

            var reader = com.ExecuteReader();
           
            return reader.Cast<IDataRecord>().Select(x => new online_guest_booking
            {
                Id = x.GetInt32(0),
                branch_id = x.GetInt32(1),
                check_in_date = x.GetDateTime(2),
                check_out_date = x.GetDateTime(3),
                no_of_guest = x.GetInt32(4),
                request_time = x.GetDateTime(5),
                guest_name = x.GetString(6),
                guest_cnic_passport = x.GetString(7),
                guest_phone = x.GetString(8),
                guest_email = x.GetString(9) as string ,
                no_of_room = x.GetString(10),
                room_type = x.GetString(11) as string,
                seen = x.GetString(12),
                referance_by_name = x.GetString(13),
                referance_by_contact = x.GetString(14),
                cancel_booking = x.GetString(15) as string,
                Comments=x.GetString(16),
                room_rent=x.GetString(17)
               

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