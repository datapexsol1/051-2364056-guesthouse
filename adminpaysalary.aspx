<%@ Page Title="" Language="C#" EnableViewState="true" MasterPageFile="~/AdminPanel.master" AutoEventWireup="true" CodeFile="adminpaysalary.aspx.cs" Inherits="adminpaysalary" %>

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
    
     <div class="right_col" role="main">
          <div class="">
    <div class="page-title">
              <div class="title_left">
                   <h3>EmployeeSalary</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                      <span class="input-group-btn">
                              <b style="float:right">Select branch!</b>
                          </span>
                  <asp:DropDownList ID="brid" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="branchindexchange" ClientIDMode="Static"  CssClass="form-control"></asp:DropDownList>

                    
                  </div>
                </div>
              </div>
            </div>
      <div class="clearfix"></div>

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
<%  if (brid.SelectedValue == "Select Branch")
    {
        //show all branch bills details 
    }
    else
    {
        int bid = branchClass.getBranchID(brid.SelectedValue);
        // int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
        List<employesalarypay> emp = employeeProfile.getunpaidemploye(bid);
         %>


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
                                 <td><label id="amounttopay"><%=x.amount_topay %> </label></td>
                                    <td><div class="item form-group">
                                        <input type="number" id="paidamount<%=x.emp.Id%>" class="form-control" required="required" name="paidamount<%=x.emp.Id%>" onchange="updatevalue(<%=x.emp.Id%>);"/>
                                        </div>
                                        </td>
                                    
                                    
                                    <td>
                                    <%--    <asp:Button ID="savebutton" runat="server" Text="Button"  OnClick="savebtnclick" /></td>--%>
                                      <%--<asp:Button ID="savebutton" runat="server" Text="Button" CssClass="btn btn-success" OnClick="savebtnclick"  />--%>
                                          <a href="#" runat="server" onserverclick="savebtnclick" style="color:green"  class="btn btn-success" >Pay</a>

                                      </td>
                                              
                                              
                                </tr>
                                 <%}
                                     }%>
                               
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
                                              if (brid.SelectedValue != "Select Branch")
                                              {
                                                  if (ddemployeename.SelectedValue != "" || ddemployeename.SelectedValue != "Select")
                                                  {
                                                      int hiddenid = int.Parse(inputid.Value.ToString());
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
                                    <% }}
        
     %>
                                    
                                         
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

        
</asp:Content>


