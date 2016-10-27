using signalR_dependency;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeonlinevieworder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static IEnumerable<online_guest_booking> GetData()
    {
        var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["guest_house_databaseConnectionString1"].ConnectionString);

        connection.Open();
        //   string com1 = "select count(Id) from dbo.Products";
        using (SqlCommand com = new SqlCommand("select Id,branch_id,check_in_date,check_out_date,no_of_guest,request_time,guest_name,guest_cnic_passport,guest_phone,guest_email,no_of_room,room_type from dbo.online_guest_booking where seen='no'", connection))
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
                guest_email = x.GetString(9),
                no_of_room = x.GetInt32(10),
                room_type = x.GetString(11),

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
}