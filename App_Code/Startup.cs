using System.Web;
using Microsoft.Owin;
using Owin;
[assembly: OwinStartupAttribute(typeof(SignalR_SQLServer_Notification_MVC.Startup))]
namespace SignalR_SQLServer_Notification_MVC
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.MapSignalR();
        }
    }
}