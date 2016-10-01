<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeguestpayment.aspx.cs" Inherits="employeguestpayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


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
             
             <h3>Grand Total</h3>
             <br />
             <label id="gtotal" style="float:right;">
                 <asp:TextBox ID="Gtotal" runat="server"></asp:TextBox></label>

             </div>










         </div>
         </div>
        </div>
           </div>
   </div>







</asp:Content>

