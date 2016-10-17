using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for guestpayment
/// </summary>
public class guestpayment
{
     static ctownDataContext db;
    public static bool addPayment(total_payment tp)
    {
        db = new ctownDataContext();
        if (tp.paid_amount != "")
        {
            db.total_payments.InsertOnSubmit(tp);
            db.SubmitChanges();
            return true;
        }
        else
        {
            return false;
        }

    }
}