    <%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="employepaysalary.aspx.cs" Inherits="employepaysalary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function updatevalue(x) {
            var val ="#paidamount"+x;//"#paidamount"+val;
           
            $("#<%=tbid.ClientID%>").val(x);
            $("#<%=tbpaidvalue.ClientID%>").val( $(val).val());
   
        }
        function activaTab(tab) {

            $('.nav-tabs a[href="#' + tab + '"]').tab('show');

            //alert("working");
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="Notify"></div>
     <div class="messagealert" id="alert_container"  style=" opacity: 0;transition: visibility 0s 2s, opacity 2s linear;">  </div>  
    <% int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
                               List<employee> emp = employeeProfile.getunpaidemploye(bid);
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
                          
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab1" data-toggle="tab" aria-expanded="false">View Salary History</a></li>
                            <asp:HiddenField ID="tbpaidvalue" runat="server" />
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
                                   foreach (employee x in emp)
                                   { %>
                                <tr>
                                  <%--<td><label id="empid""><%=x.Id %></label></td>--%>
                                  <td><label id="name" name="nameid"> <%=x.name %></label></td>
                                  <td><label id="joiningdate"><%=x.dateofjoining %> </label></td>
                                  <td><label id="Salary"><%=x.salary %></label></td>
                                 <td><label id="amounttopay"><%=x.salary %> </label></td>
                                    <td><div class="item form-group">
                                        <input type="number" id="paidamount<%=x.Id%>" class="form-control" required="required" name="paidamount<%=x.Id%>" onchange="updatevalue(<%=x.Id%>);"/>
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

                                    <table class="table tbl" id="table" runat="server">
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
                                 
                                  <td><label id="empname" runat="server"></label></td>
                                    <td><label id="empphone"  runat="server"></label></td>
                                    <td><label id="empamount"  runat="server"></label></td>
                                    <td><label  id="empdate"   runat="server" ></label></td>
                                    <td><a href="#" runat="server" class="btn btn-success" onserverclick="updateSalary">Update</a></td>
                                  <td> <input id="inputid" type="hidden"  runat="server" /></td>
                                    
                                    
                                         
                                </tr>
                              
                               
                              </tbody>
                            </table>
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
        var cb = function(start, end, label) {
          console.log(start.toISOString(), end.toISOString(), label);
          $('#reportrange_right span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        };

        var optionSet1 = {
          startDate: moment().subtract(29, 'days'),
          endDate: moment(),
          minDate: '01/01/2012',
          maxDate: '12/31/2015',
          dateLimit: {
            days: 60
          },
          showDropdowns: true,
          showWeekNumbers: true,
          timePicker: false,
          timePickerIncrement: 1,
          timePicker12Hour: true,
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          opens: 'right',
          buttonClasses: ['btn btn-default'],
          applyClass: 'btn-small btn-primary',
          cancelClass: 'btn-small',
          format: 'MM/DD/YYYY',
          separator: ' to ',
          locale: {
            applyLabel: 'Submit',
            cancelLabel: 'Clear',
            fromLabel: 'From',
            toLabel: 'To',
            customRangeLabel: 'Custom',
            daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
            monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
            firstDay: 1
          }
        };

        $('#reportrange_right span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));

        $('#reportrange_right').daterangepicker(optionSet1, cb);

        $('#reportrange_right').on('show.daterangepicker', function() {
          console.log("show event fired");
        });
        $('#reportrange_right').on('hide.daterangepicker', function() {
          console.log("hide event fired");
        });
        $('#reportrange_right').on('apply.daterangepicker', function(ev, picker) {
          console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));
        });
        $('#reportrange_right').on('cancel.daterangepicker', function(ev, picker) {
          console.log("cancel event fired");
        });

        $('#options1').click(function() {
          $('#reportrange_right').data('daterangepicker').setOptions(optionSet1, cb);
        });

        $('#options2').click(function() {
          $('#reportrange_right').data('daterangepicker').setOptions(optionSet2, cb);
        });

        $('#destroy').click(function() {
          $('#reportrange_right').data('daterangepicker').remove();
        });

      });
    </script>

    <script>
      $(document).ready(function() {
        var cb = function(start, end, label) {
          console.log(start.toISOString(), end.toISOString(), label);
          $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        };

        var optionSet1 = {
          startDate: moment().subtract(29, 'days'),
          endDate: moment(),
          minDate: '01/01/2012',
          maxDate: '12/31/2015',
          dateLimit: {
            days: 60
          },
          showDropdowns: true,
          showWeekNumbers: true,
          timePicker: false,
          timePickerIncrement: 1,
          timePicker12Hour: true,
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          opens: 'left',
          buttonClasses: ['btn btn-default'],
          applyClass: 'btn-small btn-primary',
          cancelClass: 'btn-small',
          format: 'MM/DD/YYYY',
          separator: ' to ',
          locale: {
            applyLabel: 'Submit',
            cancelLabel: 'Clear',
            fromLabel: 'From',
            toLabel: 'To',
            customRangeLabel: 'Custom',
            daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
            monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
            firstDay: 1
          }
        };
        $('#reportrange span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
        $('#reportrange').daterangepicker(optionSet1, cb);
        $('#reportrange').on('show.daterangepicker', function() {
          console.log("show event fired");
        });
        $('#reportrange').on('hide.daterangepicker', function() {
          console.log("hide event fired");
        });
        $('#reportrange').on('apply.daterangepicker', function(ev, picker) {
          console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));
        });
        $('#reportrange').on('cancel.daterangepicker', function(ev, picker) {
          console.log("cancel event fired");
        });
        $('#options1').click(function() {
          $('#reportrange').data('daterangepicker').setOptions(optionSet1, cb);
        });
        $('#options2').click(function() {
          $('#reportrange').data('daterangepicker').setOptions(optionSet2, cb);
        });
        $('#destroy').click(function() {
          $('#reportrange').data('daterangepicker').remove();
        });
      });
    </script>

    <script>
      $(document).ready(function() {
      
        $('#indate').daterangepicker({
          singleDatePicker: true,
          calender_style: "picker_2"
        }, function(start, end, label) {
          console.log(start.toISOString(), end.toISOString(), label);
        });
     
       
      });
    </script>

        <script>
          $(document).ready(function() {
            $('#reservation').daterangepicker(null, function(start, end, label) {
              console.log(start.toISOString(), end.toISOString(), label);
            });
          });
        </script>
        <!-- /bootstrap-daterangepicker -->
</asp:Content>

