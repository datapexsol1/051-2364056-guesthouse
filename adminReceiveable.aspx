﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.master" AutoEventWireup="true" CodeFile="adminReceiveable.aspx.cs" Inherits="adminReceiveable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function visibleTextbox(val, paidamount) {
           // alert(paidamount);
           // document.getElementById("<%=Hidden1.ClientID%>").innerHTML = val;
            $("input[name=totalPaymentId]").val(paidamount);
            //$("input[id=Hidden1]").val(val)
             $("#<%=Hidden1.ClientID%>").val(val);
         
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!----->
    <div id="Notify"></div>
   <input id="Hidden1" type="hidden"  name="Hidden1"  runat="server" />
     <input  type="hidden" id="totalPaymentId" name="totalPaymentId"/>

    <div class="right_col" role="main">
          <div class="">
    <div class="page-title">
              <div class="title_left">
                   <h3>Guest Payment</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                      <span class="input-group-btn">
                              <button class="btn btn-default" type="button" disabled="disabled">Select branch!</button>
                          </span>
                  <asp:DropDownList ID="brid" runat="server"  AutoPostBack="true" ClientIDMode="Static"  CssClass="form-control"></asp:DropDownList>

                    
                  </div>
                </div>
              </div>
            </div>
      <div class="clearfix"></div>
         <div class="table-responsive">
             <table class="table table-bordered">
                 <thead>
                     <tr>
                         <th></th>
                         <th></th>
                         <th>Guest Name</th>
                         <th>Guest Cnic</th>
                         <th>Room no</th>
                         <th>Room Rent</th>
                         <th>Facility Bill</th>
                         <th>Total Bill</th>
                         <th>Paid Amount</th>
                         <th>Due Amount</th>
                         <th>Payment Date</th>
                         <th>Payment Type</th>
                     </tr>
                     <%
                         if (brid.SelectedValue != "Select Branch" && brid.SelectedValue!="")
                         {
                             int bid = branchClass.getBranchID(brid.SelectedValue);
                                                                     //IQueryable<total_payment> tp = guestpayment.getPayment(bid);
                             List<employepaymentrecivableAttributes> recivable_data = guestpayment.getGuest_recivables(bid);
                             foreach (employepaymentrecivableAttributes x in recivable_data)
                             {
                                 double dueamount = double.Parse(x.tp.total_bill) - double.Parse(x.tp.paid_amount);
                                 int tpid = x.tp.Id;
                             %>
                     <div id="viewpayment" name="viewpayment">
                     <tr>
                        
                         <td>
                             <asp:Button runat="server" ID="paybtn" Text="Pay" class="btn btn-danger" OnClick="paybtn_click"/>
                             <%--<a href="?id=<%=x["Id"] %>" class="btn btn-danger"  id="payid" name="payid">Pay</a>--%>
                             <%--<input type="submit" value="Pay" class="btn btn-danger" onclick="visibleTextbox()" id="payid" name="payid">--%>

                         </td>
                          <td><input type="number" id="duepayment<%=tpid%>" name="duepayment<%=tpid %>" onchange="visibleTextbox(<%=tpid %>, this.value)" min="0"  /></td>
                         <td><%=x.g.guest_name %></td>
                         <td><%=x.g.cnic %></td>
                        <td><%=x.r.room_no %></td>
                         <td><%=x.br.booking_rent %></td>
                         <td><%=x.tp.facility_total_payment%></td>
                         <td><%=x.tp.total_bill%></td>
                         <td><%=x.tp.paid_amount %></td>
                         <td><%=dueamount %></td>
                         <td><%=x.tp.paymentdate %></td>
                         <td><%=x.tp.payment_type %></td>
                         
                     </tr>
                         </div>
                     <%}
    } %>
                   
                 </thead>
             </table>

         </div>
    </div>


     </div>

     </div>

    </div>

     </div>
    </asp:Content>

