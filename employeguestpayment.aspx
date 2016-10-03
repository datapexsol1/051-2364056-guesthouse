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
             <label id="gtotal" ><h3>Grand Total</h3></label>
                 <asp:TextBox ID="Gtotal" runat="server"></asp:TextBox>
                  <label id="gtotal1"><h3>Paid Amount</h3></label>
                 <asp:TextBox ID="tbpaidamount" runat="server"></asp:TextBox>
                       <asp:Button ID="btnpaid" runat="server" Text="Paid" OnClick="btnpaid_Click" />
               </div>

             </div>











         </div>
         </div>
        </div>
           </div>
   </div>







</asp:Content>

