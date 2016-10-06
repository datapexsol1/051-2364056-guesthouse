using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminajax : System.Web.UI.Page
{
    public static object JsonConvert { get; private set; }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static int[] getBranchWeeklyIncome(string inputVal)
    {
        int[] list = new int[7];
        ctownDataContext db = new ctownDataContext();

        IQueryable < total_payment > brows = admingraphclass.getbranchweeklyincome(inputVal);

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
        // string json= Serialize<int[]>(list);

        // return json;
        return list;
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