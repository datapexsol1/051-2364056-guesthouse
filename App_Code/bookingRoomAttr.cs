using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bookingRoomAttr
/// </summary>
public class bookingRoomAttr
{
    public int b_id;
    public int b_employeid;
    public int b_guestid;
    public DateTime b_check_in_date;
    public DateTime b_check_out_date;
    public int b_branch_id;
    public string b_guest_reg_card_arr_date;
    public string b_no_pax;
    public int r_id;
    public int r_roomid;
    public string r_rent;
    public string r_checkout;
    public int r_bid;

    public bookingRoomAttr()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}