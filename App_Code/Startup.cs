using System;
using System.Threading.Tasks;
using Microsoft.Owin;
using Owin;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

[assembly: OwinStartup(typeof(signalR_dependency.Startup))]

namespace signalR_dependency
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["guest_house_databaseConnectionString"].ConnectionString);



                System.Data.SqlClient.SqlDependency.Start(con.ConnectionString);
                app.MapSignalR();
                con.Close();
            }catch(Exception ex)
            {
               
            }
        }
    }
}
