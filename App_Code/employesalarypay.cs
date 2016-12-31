using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for employesalarypay
/// </summary>
public class employesalarypay
{
   public  employee emp;
   public int amount_topay;
    public employesalarypay(employee e,int amount)
    {
        emp = e;
        amount_topay = amount;
    }
    public employesalarypay()
    {

    }
}