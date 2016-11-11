using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for guestpayment
/// </summary>
public class guestpayment
{
    static ctownDataContext db;
    public static void addPayment(total_payment tp)
    {
        db = new ctownDataContext();
        if (tp.paid_amount != "")
        {

            db.total_payments.InsertOnSubmit(tp);
            db.SubmitChanges();
        }

    }
    public static List<employepaymentrecivableAttributes> getGuest_recivables(int bid)
    {

        db = new ctownDataContext();
      var payment_result= from g in db.guests
                             join b in db.bookings on g.Id equals b.guest_id
            
                             join br in db.booking_Rooms on b.Id equals br.bookingId
                             
                             join r in db.rooms on br.roomid equals r.Id
                             join tp in db.total_payments on b.Id equals tp.booking_id
                             
                     where b.branch_id == bid
                     select new
                     {
                          total_payment=tp,
                          booking_Room=br,
                          booking=b,
                         guest=g,
                         room=r
                     };

        List<employepaymentrecivableAttributes> recivables_payments = new List<employepaymentrecivableAttributes>();
        foreach(var x in payment_result)
        {
            bool foundrecord = false; 
            if (recivables_payments.Count > 0)
            {
                foreach(employepaymentrecivableAttributes rp in recivables_payments)
                {
                    if(x.total_payment.booking_id == rp.tp.booking_id)
                    {
                        foundrecord = true;
                        //addrecord somewhere 
                        double paidamout= double.Parse(rp.tp.paid_amount) + double.Parse(x.total_payment.paid_amount);
                        if (paidamout == double.Parse(rp.tp.total_bill))
                        {
                            recivables_payments.Remove(rp);

                        }
                        else
                        {
                            if ((double.Parse(x.total_payment.total_bill) - double.Parse(x.total_payment.paid_amount)) > 0)
                            {
                                
                                rp.tp.paid_amount = paidamout.ToString();
                                rp.tp.paymentdate = x.total_payment.paymentdate;
                                rp.tp.payment_type = x.total_payment.payment_type;
                                
                                employepaymentrecivableAttributes w = rp;
                                recivables_payments.Remove(rp);
                                recivables_payments.Add(w);
                                
                                   // uv 912 islmabad
                            }
                        }
                        break;
                    }
                }
                if (foundrecord == false) {
                    if ((double.Parse(x.total_payment.total_bill) - double.Parse(x.total_payment.paid_amount)) > 0)
                    {
                        employepaymentrecivableAttributes temp = new employepaymentrecivableAttributes();
                        temp.b = x.booking;
                        temp.br = x.booking_Room;
                        temp.g = x.guest;
                        temp.r = x.room;
                        temp.tp = x.total_payment;
                        recivables_payments.Add(temp);
                    }
                }
            }
            else
            {
                if ((double.Parse(x.total_payment.total_bill) - double.Parse(x.total_payment.paid_amount)) > 0)
                {
                    employepaymentrecivableAttributes temp = new employepaymentrecivableAttributes();
                    temp.b = x.booking;
                    temp.br = x.booking_Room;
                    temp.g = x.guest;
                    temp.r = x.room;
                    temp.tp = x.total_payment;
                    recivables_payments.Add(temp);
                }
            }
        }

        return recivables_payments;
    }
    
    public static bool updatePayment(total_payment tp)
    {

        db = new ctownDataContext();
        total_payment tpayment = (from x in db.total_payments
                    where x.Id == tp.Id
                    select x).First();
        tpayment.paid_amount = tp.paid_amount;
        return true;
    }
    public static bool addrecieable(int tpid,string amount,string paytype,string chaquno)
    {
        try {
            db = new ctownDataContext();
            var tp = (from x in db.total_payments
                                      where x.Id == tpid
                                      select x).First();
            total_payment tpayment = new total_payment();
            tpayment.booking_id = tp.booking_id;
            tpayment.total_rent = tp.total_rent;
            tpayment.facility_total_payment = tp.facility_total_payment;
            tpayment.total_bill = tp.total_bill;
           
            tpayment.paid_amount = amount;
            tpayment.paymentdate = DateTime.Now;
            tpayment.employee_id = tp.employee_id;
            tpayment.payment_type = paytype;
            tpayment.chaqueno = chaquno;
            db.total_payments.InsertOnSubmit(tpayment);
            db.SubmitChanges();
            return true;
        }
        catch(Exception ex)
        {
            string msg = ex.Message;
            return false;
        }
    }

}