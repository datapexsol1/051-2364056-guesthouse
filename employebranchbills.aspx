<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employebranchbills.aspx.cs" Inherits="employebranchbills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function activaTab(tab) {

            $('.nav-tabs a[href="#' + tab + '"]').tab('show');

            //alert("working");
        };
 
        function myfunction() {
            alert("adsa");
            var d = new Date();
            d.setDate(0);
            document.getElementById('<%=ddBillType.ClientID %>').value = 'Water';
            document.getElementById('<%=ddDate.ClientID %>').value =  '123' ;
            document.getElementById('<%=ubamount.ClientID %>').value = 123;

<%--            document.getElementById('abamount').value = "";
                document.getElementById('<%=abtype.ClientID %>').value = "";
                document.getElementById('abdate').value = '';
                document.getElementById('desc').value = "";--%>
        }
        function setAddVal() {
            alert("adsa");
            //$("input[name=abamount]").val("123");
            document.getElementById('abamount').value = 123;
            document.getElementById('<%=abtype.ClientID %>').value = "Water";
            document.getElementById('abdate').value = '01-10-1991';
            document.getElementById('desc').value = "123";

          <%-- document.getElementById('<%=ddBillType.ClientID %>').value = '';
            document.getElementById('<%=ddDate.ClientID %>').value =  '' ;
            document.getElementById('<%=ubamount.ClientID %>').value = "";--%>

        }
    </script>
     
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



     <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Branch Bills</h3>
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tab
                            
                            ">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Bills</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false" onclick="setAddVal()">Update Bills</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false" onclick="myfunction()">Add Bills</a>
                          </li>
                            
                          
                        </ul>



     <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
  <div style="overflow:auto;">
       <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
<%--                                  <th>Bill Id</th>--%>
                                  <th>Bill Amount</th>
                                  <th>Bill Type</th>
                                  <th>Bill Date</th>
                                 
                                </tr>
                              </thead>
                              <tbody>
                                     <%  bill b = new bill();
                                         IQueryable<bill> bill=billclass.getAllbills(b.Id);
                                         foreach (var r in bill)
                                         { %>
                                <tr>
<%--                                  <td><label id="bilid"><%=r.Id %></label></td>--%>
                                  <td><label id="bilamount"><%=r.BillAmount%></label></td>
                                  <td><label id="biltype"><%=r.BillType%></label></td>
                                  <td> <label id="bildate"><%=r.Date%></label></td>
                                  
                                </tr>
                               <%} %>
                              </tbody>
                            </table>

      </div>
                              </div>


                                <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab" onselect="setAddVal()">


                                     <div style="overflow:auto;white-space:nowrap;">
       <table class="data table table-striped no-margin">
                              <thead>
                                 <tr>
<%--                                  <th>Bill Id</th>--%>
                                     <th>Bill Type</th>
                                     <th>Bill Date</th>
                                  <th>Bill Amount</th>
                                  
                                  
                                 
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                    <td> <asp:DropDownList  runat="server" class="form-control" clientIdMode="static" ID="ddBillType" name="ddBillType" AutoPostBack="True" OnSelectedIndexChanged="billTypeSelectedIndexChange" required>
                                      <Items>
                                           <asp:ListItem Text="Select" Value="" />
                                          <asp:ListItem value="Electricity" Text="Electricity"></asp:ListItem>
                                          <asp:ListItem value="Gas" Text="Gas"></asp:ListItem>
                                          <asp:ListItem value="Water" Text="Water"></asp:ListItem>
                                          <asp:ListItem value="Other" Text="Other"></asp:ListItem>
                                       </Items>
                                      </asp:DropDownList>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddBillType" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>--%>
                                    <%--<select class="form-control" id="ddBillType" name="ubtype" runat="server">
                                        <option value="0">Select</option>
                                    <option value="Electricity" id="ubtype1">Electricity</option>
                              <option value="Gas" id="ubtype2">Gas</option>
                              <option value="Water" id="ubtype3">Water</option>


                                        </select>--%></td>
                               
                                  <td>

                                      <asp:DropDownList  runat="server" class="form-control" ID="ddDate" name="ddDate" OnSelectedIndexChanged="branchBillSelectedIndexChange" AutoPostBack="True"  >
                                      <Items>
                                           <asp:ListItem Text="Select" Value="" />
                                          
                                           
                                       </Items>
                                      </asp:DropDownList>
                                      
                                      
                                      
                                         <%--<input type="date" id="ubdate" name="ubdate"  placeholder="Date" class="form-control "/>--%></td>
                                                                    <td> <input type="number" id="ubamount" name="ubamount" runat="server" placeholder="Bill Amount" class="form-control " required="required"/></td>

                                    <td>
                                        <%--<input type="submit" runat="server" id="send" onserverclick="Update_bills" causesvalidation="false" />--%>
                                <asp:Button ID="send" runat="server" Text="Update" class="btn btn-success" OnClick="Update_bills"  />

                                    </td>
                                </tr>
                               
                              </tbody>
                            </table>

      </div>


                              </div>


           <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                             
 
                              
                            <div class="col-md-4">
                             <label >Bill Amount <span class="required">*</span></label>

                              <input type="number" id="abamount" min="0" name="abamount" required="required" 
                                  aria-required="true"  placeholder="Amount" class="form-control"/>

                            </div>
                                  
                     
                                
                        <div class="col-md-4">
                            <label>Bill Type <span class="required">*</span></label>
                             <select class="form-control" id="abtype" name="abtype" runat="server" required="required">
                                            <option value="0">Select</option>
                                              <option value="Electricity" id="abtype1">Electricity</option>
                                              <option value="Gas" id="abtype2">Gas</option>
                                              <option value="Water" id="abtype3">Water</option>
                                             <option value="Other" id="abtype4">Other</option>

                            </select>
                        </div>
                      
                           

                        
                        <div class="col-md-4">
                            <label >Date <span class="required">*</span></label>
                          <input type="text" id="abdate" name="abdate"  placeholder="Date" class="form-control " required="required"/>
                        </div>
                      
                <div class="form-group col-md-12">
                    <div class="row">
                        
                        <div class="col-md-12">
                        <label >Bill Description <span class="required">*</span>
                        </label>
                              <textarea  id="desc" name="desc"  placeholder="Description" rows="2" class="form-control "></textarea>
                        </div>
                 </div>
                    </div>
                   
                           
                              <div class="form-group">
                        <div class="col-md-6 col-md-offset-11">
                            <%--<a href="#" onserverclick="Button1_Click" runat="server" class="btn btn-success" >Submit</a>--%>
                           <%--<button onserverclick="Button1_Click" runat="server" class="btn btn-success">Submit</button>--%>
                          <asp:Button ID="Button1" runat="server" Text="Submit"   class="btn btn-success"    OnClick="Button1_Click" />
                            <%--<input type="submit" name="submit" onserverclick="Button1_Click" runat="server" class="btn btn-success"/>--%>
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
    <script src="../vendors/jquery/dist/jquery.min.js"></script>

    <!-- bootstrap-daterangepicker -->
    <script src="js/moment/moment.min.js"></script>
    <script src="js/datepicker/daterangepicker.js"></script>
  


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
      
          $('#abdate').daterangepicker({
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

