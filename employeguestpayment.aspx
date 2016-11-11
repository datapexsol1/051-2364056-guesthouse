<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeguestpayment.aspx.cs" Inherits="employeguestpayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        
/****** LOGIN MODAL ******/
.loginmodal-container {
  padding: 30px;
  max-width: 350px;
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
         <h3>Guest Payment</h3>
         <hr style="border:dashed;" />
         <div>
             <asp:HiddenField ID="roomCheckout" runat="server" />
             <h3>Room Payment</h3>
               <div style="overflow:auto;white-space:nowrap;">
                   <asp:Table ID="bookingtable" runat="server" class="table table-bordered table-striped">



                 </asp:Table>
                              
                                    
                                    
                                 
        </div>
         </div>


          <div>
             <h3>Resturent</h3>
               <hr style="border:dashed;" />
               <asp:Table ID="facilites" runat="server" class="table table-bordered table-striped">



    </asp:Table>
         
         </div>
           <div>
             <h3>Laundry Car Rent</h3>
               <hr style="border:dashed;" />
               <asp:Table ID="laundry" runat="server" class="table table-bordered table-striped">



    </asp:Table>
         
         </div>
          <hr style="border:dashed;" />

         <div style="float:right;">
             
             
             <br />
             <div style="float:right;">
                 <a href="#" data-toggle="modal" data-target="#login-modal"  class="btn btn-default">Pay Now</a>
                 <asp:HiddenField ID="tbroombill" runat="server" />
                 <asp:HiddenField ID="tbfacilitebill" runat="server" />
                  <asp:HiddenField ID="taxdiscountH" runat="server" />
                
                 <!-- if stay hours is less than 6 hours-->
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
         <!--popup start-->
                          <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	  <div class="modal-dialog">
				<div class="loginmodal-container">
					<h1>Guest house customer Bill</h1><br/>
				  <div>
                      <asp:DropDownList ID="paymentDropdown" runat="server" AutoPostBack="True" CausesValidation="True" OnSelectedIndexChanged="paymentDropdown_SelectedIndexChanged">
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
                       <b>Total Bill</b>
                 <asp:Label Font-Bold="true" ID="tbill" runat="server"></asp:Label>
                 <br />
                      <br />
                       <b>Advance</b>
                 <asp:Label Font-Bold="true" ID="lbadvance" runat="server"></asp:Label>
                 <br />

             <label id="gtotal" ><u>Remaining Bill : </u></label>
                 <asp:Label Font-Bold="true" ID="Gtotal" runat="server"></asp:Label>
                      <asp:HiddenField ID="gtotaltb" runat="server" />
             <br />
                   <label><u>Chaque No:<asp:TextBox ID="chaqueno" runat="server"></asp:TextBox> </u></label><br />
                  <label id="gtotal1"><u>Paid Amount : </u></label>
               
                 <asp:Textbox ID="tbpaidamount" runat="server"></asp:Textbox>                  
                                <asp:CheckBox ID="timelesscbox" runat="server" Text="RentDiscount" AutoPostBack="true" OnCheckedChanged="checkedchange"  />
                                <asp:CheckBox ID="taxtdiscount" runat="server" Text="Tax Discount" AutoPostBack="true" OnCheckedChanged="tax_discount"  />

                 <br />
   

                       <asp:Button ID="btnpaid" CssClass="btn btn-success" runat="server" Text="Pay" OnClick="btnpaid_Click" />
               	 
                      <br />
                      
					<%--<input type="submit" name="gbook" class="tm-yellow-btn" value="Book room">--%>
				  </div>
				</div>
			</div>
		  </div>
                         <!--popup end-->
          <input id="input" type="hidden" runat="server"/>
         <input id="hrs" type="hidden" runat="server"/>
         <input id="totalbill" type="hidden" runat="server"/>









         </div>
         </div>
        </div>
           </div>
   </div>







</asp:Content>

