    <%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="employepaysalary.aspx.cs" Inherits="employepaysalary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function updatevalue(x) {
            var val ="#paidamount"+x;//"#paidamount"+val;
           
            $("#<%=tbid.ClientID%>").val(x);
            $("#<%=tbpaidvalue.ClientID%>").val($(val).val());
            $("#<%=tbamounttopay.ClientID%>").val($('#amounttopay'+x).html());
           
   
        }
       
        function updateclick(sid,amount,amounttopay) {
            $('.hideall').hide();
            $('.btnupdate').show();
            $('#<%=salaryid.ClientID%>').val(sid);
            $('#<%=amount.ClientID%>').val(amount)
            $('#<%=amountopay.ClientID%>').val(amounttopay)
            $('#tbamout' + sid).val(amount);
            $('#tbamout' + sid).show();
            $('#tbupdatebtn' + sid).hide();
            $('#tbsavebtn' + sid).show();
           
          
        }
         function saveclick() {
            var sid= $('#<%=salaryid.ClientID%>').val();
            
             var amount = parseInt($('#tbamout' + sid).val());
             $('#<%=amount.ClientID%>').val(amount);
             var paidamout = parseInt($('#<%=amountopay.ClientID%>').val());
             alert(amount + "-" + paidamout);
             if (amount <= paidamout) {
                 __doPostBack("savebtn", "");
                 
             } 
             else {
                 ShowNotification('Warning', 'You can not Enter Amount More then Amount to pay');
             }
          }
           
         function updatadvace(x) {
             var val = "#advace" + x;//"#paidamount"+val;
            var empsalary = "#empsalary" + x;
            $("#<%=tbid.ClientID%>").val(x);
            if ($(val).val() == "") {
                $("#elementId").prop("required", true);
                alert("requiredaddred");
            } else {
                $("#<%=tbpaidvalue.ClientID%>").val($(val).val());
                $("#<%=tbamounttopay.ClientID%>").val($(empsalary).html());
                
            }
        }
        function activaTab(tab) {

            $('.nav-tabs a[href="#' + tab + '"]').tab('show');

            //alert("working");
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:HiddenField ID="salaryid" runat="server" />
    <asp:HiddenField ID="amount" runat="server" />
    <asp:HiddenField ID="amountopay" runat="server" />
     <div id="Notify"></div>
     <div class="messagealert" id="alert_container"  style=" opacity: 0;transition: visibility 0s 2s, opacity 2s linear;">  </div>  
    <% int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
                               List<employesalarypay> emp = employeeProfile.getunpaidemploye(bid);
         %> 
     <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Employee Salary</h3>
          <div class="container">
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true" onclick="setsalaryhistory()">Pending Salary</a></li>
                          
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab1" data-toggle="tab" aria-expanded="false">View History</a></li>
                                                  <li role="presentation" class=""><a href="#advancesalary" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Advance Salary</a></li>

                                <asp:HiddenField ID="tbpaidvalue" runat="server" />
                            <asp:HiddenField ID="tbamounttopay" runat="server" />
                            <asp:HiddenField ID="tbid" runat="server" />    
                            
                        </ul>
                        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">



                            <!-- start recent activity -->
                           <div class="table table-responsive">
                           <table class="table tbl">
                              <thead class="thead-inverse">
                                <tr>
                                  <%--<th>Employee ID</th>--%>
                                  <th>Employee Name</th>
                                  <th>Joining Date</th>
                                  <th>Total Salary</th>
                                    <th>Amount to pay</th>
                                    <th></th>
                                    
                                    
                                </tr>
                              </thead>
                              <tbody>
                               <%
                                   foreach (employesalarypay x in emp)
                                   { %>
                                <tr>
                                  <%--<td><label id="empid""><%=x.Id %></label></td>--%>
                                  <td><label id="name" name="nameid"> <%=x.emp.name %></label></td>
                                  <td><label id="joiningdate"><%=x.emp.dateofjoining %> </label></td>
                                  <td><label id="Salary"><%=x.emp.salary %></label></td>
                                 <td><label id="amounttopay<%=x.emp.Id%>"><%=x.amount_topay %> </label></td>

                                    <td><div class="item form-group">
                                        <input type="number" id="paidamount<%=x.emp.Id%>" class="form-control" min="0"  name="paidamount<%=x.emp.Id%>" onchange="updatevalue(<%=x.emp.Id%>);"/>
                                        </div>
                                        </td>
                                    
                                    
                                    <td>
                                    <%--    <asp:Button ID="savebutton" runat="server" Text="Button"  OnClick="savebtnclick" /></td>--%>
                                      <%--<asp:Button ID="savebutton" runat="server" Text="Button" CssClass="btn btn-success" OnClick="savebtnclick"  />--%>
                                          <a href="#" runat="server" onserverclick="savebtnclick" style="color:green"  class="btn btn-success" >Pay</a>

                                      </td>
                                              
                                              
                                </tr>
                                 <%} %>
                               
                              </tbody>
                            </table>
                               </div>
                            <!-- end recent activity -->
                              <asp:Table ID="Data" runat="server">

                              </asp:Table>

                 </div>
                            <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                               <div class="row">
                                 <div class="col-md-4">
                                     <label>Select employee username</label>
                                    
                              <asp:DropDownList  runat="server" class="form-control" clientIdMode="static" ID="ddemployeename" name="ddemployeename" OnSelectedIndexChanged="ddemployeenameselectedindexchange" AutoPostBack="True" >
                                      <Items>
                                           <asp:ListItem Text="Select" Value="" />
                                       </Items>
                                      </asp:DropDownList>

                                 </div>
                             <div class="table table-responsive">      
                          <asp:Table ID="table" class="table tbl"  runat="server">

                              </asp:Table>
                                  </div>
                                   <input id="inputid" type="hidden"  runat="server" />
                                   <div runat="server" id="tbupdate" >
                                      <table class="table tbl" >
                                          <%
                                  int hiddenid = int.Parse(inputid.Value);
                                      employesalary em = employeeProfile.retrieveSalaryInfo(hiddenid);
                                   %>
                              <thead class="thead-inverse">
                                <tr>
                                  <th> Name</th>
                                  <th>Phone</th>
                                  <th>Paid Amount</th>
                                  <th>Date</th>
                                    
                                    
                                    
                                </tr>
                              </thead>
                              <tbody>
                             
                                <tr>
                                  
                                  <td><label id="inname" name="inname" runat="server"></label></td>
                                    <td><label id="inphone" runat="server" ></label></td>
                                    <td><input id="inamount" name="inamount" value="<%=em.amount %>" type="number" class="form-control"/></td>
                                  
                                    <td><input  id="indate" name="indate" type="" value="<%=em.payment_date.ToShortDateString() %>" class="form-control"  /></td>
                                    <td><a href="#" runat="server" class="btn btn-success" onserverclick="updateSalary2">Update</a></td>
                                  <td> <input id="Hidden1" type="hidden"  runat="server" /></td>
                                    
                                    
                                         
                                </tr>
                              
                               
                              </tbody>
                            </table>
                                   <input id="idhid" type="hidden" runat="server" />
                                   <input id="Hiddenname" type="hidden" runat="server" />
                                   <input id="Hiddenphone" type="hidden" runat="server" />
                            </div>
                                   </div>
                                 </div> 
                            
                                         <div role="tabpanel" class="tab-pane fade" id="advancesalary" aria-labelledby="home-tab">



                            <!-- start recent activity -->
                           <div class="table table-responsive">
                           <table class="table tbl">
                              <thead class="thead-inverse">
                                <tr>
                                 
                                  <th>Employee Name</th>
                                  <th>Joining Date</th>
                                  <th>Salary</th>
                                     <th>Designation</th>
                                     
                                   
                                    
                                    
                                </tr>
                              </thead>
                              <tbody>
                                  <%
                                      IQueryable<employee> allemp = employeeProfile.getAllEmployee(bid);
                                      foreach (employee e in allemp) {%>
                                  <tr>
                                      <td><%=e.name %></td>
                                      <td><%=e.dateofjoining %></td>
                                      <td id="empsalary<%=e.Id %>"><%=e.salary %></td>
                                       <td><%=e.designation %></td>
                                        <td>
                                             <input type="number" id="advace<%=e.Id%>" class="form-control" min="0"  name="advance<%=e.Id%>" onchange="updatadvace(<%=e.Id%>);"/> 
                                            <asp:Button ID="advance" runat="server" Text="Pay Advance" class="btn btn-success" OnClick="advancebtnclick" />
                                        </td>
                                  </tr>
                                     <% } %>
                               
                              </tbody>
                            </table>
                               </div>
                            <!-- end recent activity -->
                              <asp:Table ID="Table1" runat="server">

                              </asp:Table>

                 </div>
                            </div>
        
    </div>

          </div>

     </div>

     </div>

     </div>

    </div>

 </div>
     <!-- jQuery -->
  <%--  <script src="../vendors/jquery/dist/jquery.min.js"></script>--%>

    <!-- bootstrap-daterangepicker -->
    <script src="js/moment/moment.min.js"></script>
    <script src="js/datepicker/daterangepicker.js"></script>
  

    <script>
        function setsalaryhistory() {
            $("input[name=inamount]").val("123");
            $("input[name=indate]").val("01-10-2016");
            $("input[name=inputid]").val("01-10-2016");
            
        }
    </script>
    <!-- bootstrap-daterangepicker -->
   
    <script>
      $(document).ready(function() {
          var d = new Date();
          var mm = d.getMonth() + 1;
          var yy = d.getFullYear();
        $('#indate').daterangepicker({
          //singleDatePicker: true,
            //calender_style: "picker_2"
            singleDatePicker: true,
            minDate: '01-' + mm + '-' + yy,
            buttonClasses: ['btn btn-default'],
            applyClass: 'btn-small btn-primary',
            calender_style: "picker_5",
            startDate: '01-' + mm + '-' + yy,
            showDropdowns: true
        }, function(start, end, label) {
          console.log(start.toISOString(), end.toISOString(), label);
        });
     
       
      });
    </script>

      
        <!-- /bootstrap-daterangepicker -->
</asp:Content>

