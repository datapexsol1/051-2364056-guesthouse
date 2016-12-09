<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.master" AutoEventWireup="true" CodeFile="adminguestpayment.aspx.cs" Inherits="adminguestpayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        
/****** LOGIN MODAL ******/
.loginmodal-container {
  padding: 30px;
  max-width: 350px;
 /*height: 450px;*/
  width: 100% !important;
  background-color: #F7F7F7;
  margin: 0 auto;
  border-radius: 2px;
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  overflow: hidden;
  font-family: roboto;
}

.loginmodal-container h1 {
  text-align: center;
  font-size: 1.8em;
  font-family: roboto;
}

.loginmodal-container input[type=submit] {
  width: 100%;
  display: block;
  margin-bottom: 10px;
  position: relative;
}

.loginmodal-container input[type=text], input[type=password] {
  height: 44px;
  font-size: 16px;
  width: 100%;
  margin-bottom: 10px;
  -webkit-appearance: none;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  /* border-radius: 2px; */
  padding: 0 8px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}

.loginmodal-container input[type=text]:hover, input[type=password]:hover {
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
}

.loginmodal {
  text-align: center;
  font-size: 14px;
  font-family: 'Arial', sans-serif;
  font-weight: 700;
  height: 36px;
  padding: 0 8px;
/* border-radius: 3px; */
/* -webkit-user-select: none;
  user-select: none; */
}

.loginmodal-submit {
  /* border: 1px solid #3079ed; */
  border: 0px;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1); 
  background-color: #4d90fe;
  padding: 17px 0px;
  font-family: roboto;
  font-size: 14px;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
}

.loginmodal-submit:hover {
  /* border: 1px solid #2f5bb7; */
  border: 0px;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #357ae8;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
}

.loginmodal-container a {
  text-decoration: none;
  color: #666;
  font-weight: 400;
  text-align: center;
  display: inline-block;
  opacity: 0.6;
  transition: opacity ease 0.5s;
} 

.login-help{
  font-size: 12px;
}
    </style>
   
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="Notify"></div>
    <asp:HiddenField ID="tbbid" runat="server" />
       <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <div id="printPaymentpage">
             <div class="row">
                 <table id="logoid" border="0" width="100%">
                     <tr>
                         <td><img src="img/logo.png" width="200" height="200"/></td>
                         <td style="text-align:center;font-family:Magneto"><b style="font-size:xx-large">Cape Town</b></td>
                         <td style="text-align:center;font-size:large">
                 
                             <label>House NO. 10 Street 12 <br />
                             F-7/2 Islamabad<br />
                             Ph. 0518318731-2<br />
                             NTN#4263282-0</label>

                         </td>
                     </tr>
                 </table>
             </div>
             <br />
             <%
                 int bookingId = int.Parse(Request.QueryString["booking"]);
                 guest g = bookingclass.getguestdetail(bookingId);
                  %>
             <hr style="border:dashed;" />
             <div class="row">
                 <h3>Guest Information</h3>
                 <table  width="80%" class="table table-bordered table-striped">
                     <tr style="text-align:left">
                         <th>Registration #</th>
                         <th>Guest Name</th>
                         <th>CNIC</th>
                         <th>Address</th>
                         <th>Contact</th>
                     </tr>
                     <tr style="text-align:left">
                         <td><%=g.reg_no %></td>
                         <td><%=g.guest_name %></td>
                         <td><%=g.cnic %><%=g.f_passport_no %></td>
                         <td><%=g.permanent_address %></td>
                         <td><%=g.mobile %></td>
                     </tr>
                 </table>

             </div>
<%--             <div class="row">
             <div class="col-md-3" style="float:left;width:20%">
                 <img src="img/logo.png" width="200" height="200"/>
             </div>
             <div class="col-md-3">
         <h3 style="text-align:center;width:20%;float:left">Guest Payment</h3>
                 </div>
             <div class="col-md-6" style="">
                 <h5>Cape Town</h5>
                 
                 <h5>House NO. 10 Street 12</h5>
                 <h5>F-7/2 Islamabad</h5>
                 <h5>Ph. 0518318731.2</h5>
                 <h5>NTN#4263282-0</h5>
                 </div>
                 </div>--%>
             <div class="clearfix"></div>
         <hr style="border:dashed;" />
                 
         <div>
             <asp:HiddenField ID="roomCheckout" runat="server" />
             <div id="roompaymentid">
             <h3>Room Payment</h3>
                 
               <div style="overflow:auto;white-space:nowrap;">
                   <asp:Table ID="bookingtable" runat="server" Width="100%" class="table table-bordered table-striped">



                 </asp:Table>
                              
                                    
                                    
                                 
        </div>
                 </div>
         </div>


          <div id ="facilities">
             <h3>Facilities</h3>
               <hr style="border:dashed;" />
              <div style="overflow:auto;white-space:nowrap;">
               <asp:Table ID="facilites" runat="server" Width="100%" class="table table-bordered table-striped">



    </asp:Table>
                  </div>
         
         </div>
          <hr style="border:dashed;" />

         
             
             
             <br />
             <div style="float:right;">
                  
                 <label id="gbill" style="background-color:goldenrod;width:100%;text-align:center;font-size:x-large"><u>Bill  </u></label>
                 <br />
                 <div id="paymenttype">
                  <asp:DropDownList ID="paymentDropdown"  runat="server" AutoPostBack="True" CausesValidation="True" OnSelectedIndexChanged="paymentDropdown_SelectedIndexChanged">
                    <asp:ListItem>Select Payment Method</asp:ListItem>       
                    <asp:ListItem>Cash</asp:ListItem>
                     <asp:ListItem>Cheque</asp:ListItem>
                     <asp:ListItem>Pay later</asp:ListItem>

                          </asp:DropDownList>
                     </div><br />
                 <div id="type">
                     <b>Payment type</b>
                  <label name="setpaymenttype" runat="server" id="setpaymenttype" ></label>

                 </div>
                 <br />
                 <b id="roomrent">Room Rent
                 <asp:Label Font-Bold="true" ID="lbroomrent" runat="server"></asp:Label></b>
                 <br />
                 
                 <b id="facility"> Facilities 
                 <asp:Label Font-Bold="true" ID="lbfacilities" runat="server"></asp:Label></b>
                 <br />
                 <b>Tax</b>
                 <asp:Label Font-Bold="true" ID="lbtax" runat="server"></asp:Label>
                      <br />
                       <b>Total Bill</b>
                 <asp:Label Font-Bold="true" ID="tbill" runat="server"></asp:Label>
                 <br />
                     
                       <b>Advance</b>
                 <asp:Label Font-Bold="true" ID="lbadvance" runat="server"></asp:Label>
                 <br />
                                     <label id="chequeid" runat="server" ><u>Chaque No:<asp:TextBox ID="chaqueno" runat="server" placeholder="Enter cheque no."></asp:TextBox> </u></label><br />


             <label id="gtotal" ><u>Remaining Bill : </u></label>
                 <asp:Label Font-Bold="true" ID="Gtotal" runat="server"></asp:Label>
                      <asp:HiddenField ID="gtotaltb" runat="server" />
             <br />
                  <label id="gtotal1"><u>Paid Amount : </u></label>
               
                 <asp:Textbox ID="tbpaidamount" runat="server"></asp:Textbox>  
               
                 <!-- if stay hours is less than 6 hours-->
               
                            <div id="cb">
                                <asp:CheckBox ID="timelesscbox" ClientIDMode="Static" runat="server" Text="RentDiscount" AutoPostBack="true" OnCheckedChanged="checkedchange"  />
                                <asp:CheckBox ID="taxtdiscount" ClientIDMode="Static" runat="server" Text="Tax Discount" AutoPostBack="true" OnCheckedChanged="tax_discount"  />
</div>
                 <br />
                <%--  --%><%--<asp:DropDownList ID="paymentDropdown" runat="server" AutoPostBack="True" CausesValidation="True" OnSelectedIndexChanged="paymentDropdown_SelectedIndexChanged">
                    <asp:ListItem>Select Payment Method</asp:ListItem>       
                    <asp:ListItem>Cash</asp:ListItem>
                     <asp:ListItem>Cheque</asp:ListItem>
                     <asp:ListItem>Pay later</asp:ListItem>

                          </asp:DropDownList><br />
                 <label id="gbill" ><u>Bill  </u></label>
                 <br />
                 <b>Room Rent</b>
                 <asp:Label Font-Bold="true" ID="lbroomrent" runat="server"></asp:Label>
                 <br />
                 <b> Facilities </b>
                 <asp:Label Font-Bold="true" ID="lbfacilities" runat="server"></asp:Label>
                 <br />
                 <b>Tax</b>
                 <asp:Label Font-Bold="true" ID="lbtax" runat="server"></asp:Label>
                 <br />

             <label id="gtotal" ><u>Total Bill : </u></label>
                 <asp:Label Font-Bold="true" ID="Gtotal" runat="server"></asp:Label>
             <br />
                   <label><u>Chaque No:<asp:TextBox ID="chaqueno" runat="server"></asp:TextBox> </u></label><br />
                  <label id="gtotal1"><u>Paid Amount : </u></label>
               
                 <asp:Textbox ID="tbpaidamount" runat="server"></asp:Textbox>                  
                                <asp:CheckBox ID="timelesscbox" runat="server" Text="RRentDiscount" AutoPostBack="true" OnCheckedChanged="checkedchange"  />
                                <asp:CheckBox ID="taxtdiscount" runat="server" Text="Tax Discount" AutoPostBack="true" OnCheckedChanged="tax_discount"  />

                 <br />
   

                       <asp:Button ID="btnpaid" CssClass="btn btn-success" runat="server" Text="Pay" OnClick="btnpaid_Click" />--%>
               </div>

             </div>
         <div style="float:right;margin-top:250px">
           

              
                                        <asp:Button ID="btnpaid" CssClass="btn btn-success" runat="server" Text="Pay" CausesValidation="false" OnClick="btnpaid_Click" />
             <input type="button" id="btnPrint" value="Print Complete Bill"  class="btn btn-default"/>
                          <input type="button" id="btnRoomPayment" value="Print Room Bill "  class="btn btn-default"/>
             <input type="button" id="btnfacility" value="Print Facility Bill "  class="btn btn-default"/>
                 <%--<a href="#" data-toggle="modal" data-target="#login-modal"  class="btn btn-default">Print Bill Now</a>--%>
                 <asp:HiddenField ID="tbroombill" runat="server" />
                 <asp:HiddenField ID="tbfacilitebill" runat="server" />
                  <asp:HiddenField ID="taxdiscountH" runat="server" />
             <asp:HiddenField ID="tbpayType" runat="server" />
             </div>
         <!--popup start-->
                         <%-- <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	  <div class="modal-dialog">
				<div class="loginmodal-container">
        <div id="dvbill" >

					
            <div>
                <div class="col-sm-12">
                                       <h3 style=" background-color:goldenrod;color:black;      width:100%; ">Guest house customer Bill</h3>
                    </div>
                <div class="col-sm-12">
                    <b class="col-sm-4">Room Rent</b>
                    <asp:Label Font-Bold="true" class="col-sm-8" ID="prroomrent" runat="server"><%=lbroomrent.Text %></asp:Label>
                </div >
                <div class="col-sm-12">
                    <b class="col-sm-4">Facilities</b>
                    <asp:Label Font-Bold="true" class="col-sm-8" ID="printfacilities"  runat="server"><%=lbfacilities.Text %></asp:Label>
                </div>
                <div class="col-sm-12">
                    <b class="col-sm-4">Tax</b>
                    <asp:Label Font-Bold="true" class="col-sm-8" ID="printtax"  runat="server"><%=lbtax.Text %></asp:Label>
                </div>
                <div class="col-sm-12">
                    <b class="col-sm-4">Total Bill</b>
                    <asp:Label Font-Bold="true" class="col-sm-8" ID="printbill"  runat="server"><%=tbill.Text %></asp:Label>
                </div>
                <div class="col-sm-12">
                    <b class="col-sm-4">Advance </b>
                    <asp:Label Font-Bold="true" class="col-sm-8" ID="printadvance"  runat="server"><%=lbadvance.Text %></asp:Label>
                </div>
                <div class="col-sm-12">
                    <b class="col-sm-4">Remaining Bill</b>
                    <asp:Label Font-Bold="true" class="col-sm-8" ID="printrbill"  runat="server"><%=gtotaltb.Value %></asp:Label>
                </div>
                <div class="col-sm-12">
                    <b class="col-sm-4">Paid Amount</b>
                    <asp:Label Font-Bold="true" class="col-sm-8" ID="printpaidamount"  runat="server"><%=tbpaidamount.Text %></asp:Label>
                </div>
                <div class="col-sm-12">
                    <%
                        if (paymentDropdown.Text == "Cheque")
                        {
                        %>
                    <label class="col-sm-4"><u>Chaque No: <%=chaqueno.Text %> </u></label><br />
                    <%} %>
                </div>
            </div>
				 
                 
                 <br />
                     
                 
   </div>
<div class="row">
    <div class="col-md-12">
               	 <input type="button" id="btnPrint" value="Print Bill"  class="btn btn-default"/>
                      <br />
                      
					<%--<input type="submit" name="gbook" class="tm-yellow-btn" value="Book room">--%>
				  </div>
				</div>
                              </div>
			</div>
		 
                         <!--popup end-->
          <input id="input" type="hidden" runat="server"/>
         <input id="hrs" type="hidden" runat="server"/>
         <input id="totalbill" type="hidden" runat="server" />
            </div>
     <script>
         $(document).ready(function () {
             $("#logoid").hide();
         });
         $(function () {
            $("#btnPrint").click(function () {
                //alert("hello");
                <%
         if (bookingRoomClass.checkBookingRoomcheckout(int.Parse(tbbid.Value)) == true)
         {
             if (paymentDropdown.SelectedIndex != 0)
             {
                 // setpaymenttype.Value = paymentDropdown.SelectedValue;
                 // setpaymenttype.Value = paymentDropdown.SelectedValue;
         %>
<%--                $("#type").show();
               var v = "<%=paymentDropdown.SelectedValue.ToString()%>";
               // alert(v);
                document.getElementById('setpaymenttype').innerText = v;--%>
                //$("input[name=setpaymenttype]").val(v);
                //$("tbpayType").val(v);
                $("#cb").hide();
                $("#logoid").show();
                $("#paymenttype").hide();
                var contents = $("#printPaymentpage").html();
                var frame1 = $('<iframe />');
                frame1[0].name = "frame1";
                frame1.css({ "position": "absolute", "top": "-1000000px" });
                $("body").append(frame1);
                var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
                frameDoc.document.open();
                //Create a new HTML document.
                frameDoc.document.write('<html><head><title>CapeTown guest house</title>');
                frameDoc.document.write('</head><body style="-webkit-print-color-adjust: exact;background-color:white; height: 950px;left: 0; right: 0; background-repeat: no-repeat; background-size:700px 500px;align-content:center;>');
                //Append the external CSS file.


                //Append the DIV contents.
                frameDoc.document.write(contents);
                frameDoc.document.write('</body></html>');
                frameDoc.document.close();
                setTimeout(function () {
                    window.frames["frame1"].focus();
                    window.frames["frame1"].print();
                    frame1.remove();
                }, 500);
               <%}
         else
         {%>
                         ShowNotification('Error', 'Select Payment type');
                <%
             }


         }
         else
         {%>
                ShowNotification('Error', 'Pay bill first to print the bill');
        <% }%>
            });
        });

        $(function () {
            $("#btnRoomPayment").click(function () {
                
                $("#logoid").show();
                $("#cb").hide();
                $("#paymenttype").hide();
              //  $("#facilities").hide();
                // $("#facilities").style.marginTop = "50px";
                $("#facility").css('margin-top', 5000 );
               // document.getElementById("facility").style.marginTop = "7500px";
               // $("#facility").hide();
                var totalbill =$("#<%=tbill.ClientID%>").text() ; //document.getElementById(<%=tbill.ClientID%>).val;//$("#<%=tbill.ClientID%>").val(); 
                var facility = $("#<%=lbfacilities.ClientID%>").text();
                var tax = $("#<%=lbtax.ClientID%>").text();
                var roomrent =$("#<%=lbroomrent.ClientID%>").text() ;
                var roomtax = roomrent * 17 / 100;
                $("#<%=lbtax.ClientID%>").text(roomtax);
                totalbill = parseInt(roomrent) + parseInt(roomtax);
                $("#<%=tbill.ClientID%>").text(totalbill);
                //Remaining bill
                var advance = $("#<%=lbadvance.ClientID%>").text() ;
                var remainingBill = parseInt(totalbill) - parseInt(advance )
                $("#<%=Gtotal.ClientID%>").text(remainingBill);
                $("#<%=tbpaidamount.ClientID%>").text(remainingBill);

                <%--var totalbill =$("#<%=tbill.ClientID%>").text() ;
                alert(totalbill);--%>
                //$("#<%=lbtax.ClientID%>").hide(); 
                var contents = $("#printPaymentpage").html();
                var frame1 = $('<iframe />');
                frame1[0].name = "frame1";
                frame1.css({ "position": "absolute", "top": "-1000000px" });
                $("body").append(frame1);
                var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
                frameDoc.document.open();
                //Create a new HTML document.
                frameDoc.document.write('<html><head><title>CapeTown guest house</title>');
                frameDoc.document.write('</head><body style="-webkit-print-color-adjust: exact;background-color:white; height: 950px;left: 0; right: 0; background-repeat: no-repeat; background-size:700px 500px;align-content:center;>');
                //Append the external CSS file.


                //Append the DIV contents.
                frameDoc.document.write(contents);
                frameDoc.document.write('</body></html>');
                frameDoc.document.close();
                setTimeout(function () {
                    window.frames["frame1"].focus();
                    window.frames["frame1"].print();
                    frame1.remove();
                }, 500);
             
            });
        });
         $(function () {
             $("#btnfacility").click(function () {
                
                $("#logoid").show();
                $("#cb").hide();
                $("#paymenttype").hide();
                $("#facilities").show();
                $("#facility").show();
                $("#roomrent").hide();
                
                $("#roompaymentid").hide();


                 var totalbill =$("#<%=tbill.ClientID%>").text() ; //document.getElementById(<%=tbill.ClientID%>).val;//$("#<%=tbill.ClientID%>").val(); 
                var facility = $("#<%=lbfacilities.ClientID%>").text();
                var tax = $("#<%=lbtax.ClientID%>").text();
                var roomrent =$("#<%=lbfacilities.ClientID%>").text() ;
                var roomtax = roomrent * 17 / 100;
                $("#<%=lbtax.ClientID%>").text(roomtax);
                totalbill = parseInt(roomrent) + parseInt(roomtax);
                $("#<%=tbill.ClientID%>").text(totalbill);




                var contents = $("#printPaymentpage").html();
                var frame1 = $('<iframe />');
                frame1[0].name = "frame1";
                frame1.css({ "position": "absolute", "top": "-1000000px" });
                $("body").append(frame1);
                var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
                frameDoc.document.open();
                //Create a new HTML document.
                frameDoc.document.write('<html><head><title>CapeTown guest house</title>');
                frameDoc.document.write('</head><body style="-webkit-print-color-adjust: exact;background-color:white; height: 950px;left: 0; right: 0; background-repeat: no-repeat; background-size:700px 500px;align-content:center;>');
                //Append the external CSS file.


                //Append the DIV contents.
                frameDoc.document.write(contents);
                frameDoc.document.write('</body></html>');
                frameDoc.document.close();
                setTimeout(function () {
                    window.frames["frame1"].focus();
                    window.frames["frame1"].print();
                    frame1.remove();
                }, 500);
             
            });
        });
         
    </script>

</asp:Content>

