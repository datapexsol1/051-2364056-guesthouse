<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeeReceiveable.aspx.cs" Inherits="employeeReceiveable" %>

<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/jquery-1.8.3.js"></script>
<script src="js/jquery-ui.js"></script>
      <link href="Notifications/NotificationStyle.css" rel="stylesheet" />
    <script src="js/NotificationJS.js"></script>
    <script>
        $(document).ready(function () {
            $('.chaque').hide();
          
        });
        function Cashtypechange(id) {
            
            var index = $("#cashtype" + id).prop('selectedIndex');
            alert(index);
            if (index == 2) {
                alert('#chaqaue' + id);
              //  $('.chaque').not('#chaqaue'+id).hide();
                //$('.chaque').show();
                $('#chaqaue' + id).css("display", "inline");
                
            } else {
                $('.chaque').hide();
            }
        }
        function validatation(id) {
            var index = $("#cashtype" + id).prop('selectedIndex');
            if(index==0){
                
                ShowNotification('Error', 'Please Select Payment Type of this Payment');
            }
            else if(index==1){
                if($('#duepayment'+id).val()==""){
                    ShowNotification('Error', 'Please Select Enter Amount for this Payment');
                   
                }
                else{
                       $('#<%=pamount.ClientID%>').val($('#duepayment'+id).val());
                     $('#<%=pid.ClientID%>').val(id);
                    
                      $('#<%=ptype.ClientID%>').val("Cash");
                   
                    __doPostBack("mybtn", '');
                }
            }
            else{

                if($('#chaqaue' + id).val()==""){
                    ShowNotification('Error', 'Please Select Enter Chaque No for this Payment');
                }
                else if($('#duepayment'+id).val()==""){
                    ShowNotification('Error', 'Please Select Enter Amount for this Payment');
                }
                else{
                    $('#<%=pamount.ClientID%>').val($('#duepayment'+id).val());
                    $('#<%=pid.ClientID%>').val(id);
                    $('#<%=checkno.ClientID%>').val($('#chaqaue' + id).val());
                      $('#<%=ptype.ClientID%>').val("Chaque");
                    __doPostBack("mybtn", '');
                  
                }
            }
           
        }
        function visibleTextbox(val, paidamount) {
            // alert(paidamount);
            // document.getElementById("<%=pid.ClientID%>").innerHTML = val;
            $("input[name=totalPaymentId]").val(paidamount);
            //$("input[id=Hidden1]").val(val)
            $("#<%=pid.ClientID%>").val(val);

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!----->
    <div id="Notify"></div>
    <input id="pid" type="hidden" name="Hidden1" runat="server" />
    <input id="checkno" type="hidden" name="Hidden1" runat="server" />
    <input id="ptype" type="hidden" name="Hidden1" runat="server" />
    <input id="pamount" type="hidden" name="Hidden1" runat="server" />
    
    <input type="hidden" id="totalPaymentId" name="totalPaymentId" />


    <div class="right_col" role="main">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_content">
                    <div class="col-md-9 col-sm-9 col-xs-12">
                        <h3>Guest Payments</h3>


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
                                        <th>Discount type</th>
                                    </tr>
                                    <%
                                        int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
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
                                               
                                                <%--<a href="?id=<%=x["Id"] %>" class="btn btn-danger"  id="payid" name="payid">Pay</a>--%>
                                                <input id="<%=tpid%>" name="btn<%=tpid%>" type="button" value="Paynew" class="btn btn-danger" onclick="validatation(this.id)"/>
                                            </td>
                                            <td>
                                                <select id="cashtype<%=tpid %>" onchange="Cashtypechange(<%=tpid %>)">
                                                    <option>Select</option>
                                                    <option>Cash</option>
                                                    <option>Check</option>
                                                </select>
                                              </br>  <input type="number" placeholder="Payed Amount" id="duepayment<%=tpid%>"  name="duepayment<%=tpid %>" onchange="visibleTextbox(<%=tpid %>, this.value)" min="0" />
                                              </br>  <input type="text" placeholder="Chaque no" class="chaque" id="chaqaue<%=tpid %>" />
                                            </td>
                                            <td><%=x.g.guest_name %></td>
                                            <td><%=x.g.cnic %></td>
                                            <td><%=x.r.room_no %></td>
                                            <td><%=x.br.booking_rent %></td>
                                            <td><%=x.tp.facility_total_payment%></td>
                                            <td><%=x.tp.total_bill%></td>
                                            <td><%=x.tp.paid_amount %></td>
                                            <td><%=dueamount %></td>
                                            <% %><td><%=x.tp.paymentdate %></td>

                                            <td><%=x.tp.payment_type %></td>
                                            <% string[] type = x.tp.discount_type.Split('-');
                                                string msg = "";
                                                if (type.Length == 2)
                                                {
                                                    if (type[0] == "rent")
                                                    {
                                                        msg = "50% discount on room rent";
                                                    }
                                                    else
                                                    {
                                                        msg = "Discount on tax";
                                                    }
                                                }
                                                else if (type.Length > 2)
                                                {
                                                    msg = "50% discount on room rent</br>Discount on tax";
                                                } %>
                                            <td><%=msg%></td>

                                        </tr>
                                    </div>
                                    <%} %>
                                </thead>
                            </table>

                        </div>
                    </div>


                </div>

            </div>

        </div>

    </div>

</asp:Content>

