<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeguestpayment.aspx.cs" Inherits="employeguestpayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
             <h3>Facilities</h3>
               <hr style="border:dashed;" />
               <asp:Table ID="facilites" runat="server" class="table table-bordered table-striped">



    </asp:Table>
         
         </div>
          <hr style="border:dashed;" />

         <div style="float:right;">
             
             
             <br />
             <div style="float:right;">
                 <asp:HiddenField ID="tbroombill" runat="server" />
                 <asp:HiddenField ID="tbfacilitebill" runat="server" />
                 <!-- if stay hours is less than 6 hours-->
                 <br />
                <%--  --%><asp:DropDownList ID="paymentDropdown" runat="server" AutoPostBack="True" CausesValidation="True" OnSelectedIndexChanged="paymentDropdown_SelectedIndexChanged">
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

                  <label id="gtotal1"><u>Paid Amount : </u></label>
                 <asp:Textbox ID="tbpaidamount" runat="server"></asp:Textbox>                  
                                <asp:CheckBox ID="cbtax" runat="server" Text="Discount" AutoPostBack="true" OnCheckedChanged="checkedchange"  />

                 <br />
                       <asp:Button ID="btnpaid" CssClass="btn btn-success" runat="server" Text="Pay" OnClick="btnpaid_Click" />
               </div>

             </div>

          <input id="input" type="hidden" runat="server"/>
         <input id="hrs" type="hidden" runat="server"/>
         <input id="totalbill" type="hidden" runat="server"/>









         </div>
         </div>
        </div>
           </div>
   </div>







</asp:Content>

