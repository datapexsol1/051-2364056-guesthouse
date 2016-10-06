<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employepaysalary.aspx.cs" Inherits="employepaysalary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function updatevalue(x) {
            var val ="#paidamount"+x;//"#paidamount"+val;
           
            $("#<%=tbid.ClientID%>").val(x);
            $("#<%=tbpaidvalue.ClientID%>").val( $(val).val());
   
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Employee Salary</h3>
          <div class="container">
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Pending Salary</a></li>
                          
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab1" data-toggle="tab" aria-expanded="false">View Salary History</a></li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Update</a></li>
                            <asp:HiddenField ID="tbpaidvalue" runat="server" />
                            <asp:HiddenField ID="tbid" runat="server" />    
                            <% int bid = employeeProfile.getEmployeBranch("kk");
                               List<employee> emp = employeeProfile.getunpaidemploye(bid); %> 
                          
                        </ul>
                        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">



                            <!-- start recent activity -->
                           <div>
                           <table class="table tbl">
                              <thead class="thead-inverse">
                                <tr>
                                  <th>Employee ID</th>
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
                                  <td><label id="empid""><%=x.Id %></label></td>
                                  <td><label id="name" name="nameid"> <%=x.name %></label></td>
                                  <td><label id="joiningdate"><%=x.dateofjoining %> </label></td>
                                  <td><label id="Salary"><%=x.salary %></label></td>
                                 <td><label id="amounttopay"><%=x.salary %> </label></td>
                                    <td><input type="text" id="paidamount<%=x.Id%>" name="paidamount<%=x.Id%>" onchange="updatevalue(<%=x.Id%>);"/></td>
                                    
                                    
                                    <td>
                                    <%--    <asp:Button ID="savebutton" runat="server" Text="Button"  OnClick="savebtnclick" /></td>--%>
                                      <td><a href="#" runat="server" onserverclick="savebtnclick" style="color:green"  class="btn btn-success" >Pay</a></td>
                                              
                                              
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
                                     <label>Select employee name</label>
                                     <% IQueryable<employee> bemploye = employeeProfile.getAllEmployee(bid);
                                         List<string> lname = new List<string>();
                                         foreach(employee e in bemploye)
                                         {
                                             lname.Add(e.name);
                                         }
                                         ddemployeename.DataSource = lname;
                                         ddemployeename.DataBind();
                                           %>
                              <asp:DropDownList  runat="server" class="form-control" clientIdMode="static" ID="ddemployeename" name="ddemployeename" AutoPostBack="True" required>
                                     
                                      </asp:DropDownList>

                                 </div>
                                   <asp:Table ID="salTable">

                                   </asp:Table>

                            </div>
                                 </div>  
                          <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                          
                       <%--       <br /><br />
                             <div class="row">
                                 <div class="col-md-4">
                                   <label>Name <span class="required">*</span></label>

                                    <input type="text" id="empname" name="empname"  class="form-control "  data-validation="required" />

                                 </div>
                                 <div class="col-md-4">
                                   <label >Email <span class="required">*</span></label>

                                    <input type="text" id="empemail" name="empemail"  class="form-control "  data-validation="required" />

                                 </div>
                                 <div class="col-md-4">
                                   <label >Employee No <span class="required">*</span></label>

                                    <input type="text" id="empno" name="empno"   class="form-control "  data-validation="required" />

                                 </div>
                             </div>
                             <div class="row">
                                 <div class="col-md-4">
                                   <label>Cnic <span class="required">*</span></label>

                                    <input type="text" id="empcnic" name="empcnic"  class="form-control "  data-validation="required" />

                                 </div>
                                 <div class="col-md-4">
                                   <label >Designation <span class="required">*</span></label>

                                    <input type="text" id="empdesignation" name="empdesignation"   class="form-control "  data-validation="required" />

                                 </div>
                                 <div class="col-md-4">
                                   <label >Date of joining <span class="required">*</span></label>

                                    <input type="text" id="empjoiningdate" name="empjoiningdate"   class="form-control "  data-validation="required" />

                                 </div>
                             </div>
                             <div class="row">
                                 <div class="col-md-4">
                                   <label>Address <span class="required">*</span></label>

                                    <input type="text" id="empaddress" name="empaddress"  class="form-control "  data-validation="required" />

                                 </div>
                                 <div class="col-md-4">
                                   <label >Employee type <span class="required">*</span></label>

                                    <input type="text" id="empupdatetype" name="empupdatetype"  class="form-control "  data-validation="required" />

                                 </div>
                                 <div class="col-md-4">
                                   <label >Salary <span class="required">*</span></label>

                                    <input type="number" min="0" id="empsalary" name="empsalary"   class="form-control "  data-validation="required" />

                                 </div>
                             </div>   
                             <a href="#" runat="server" class="btn btn-success">Update</a>--%>
                               
                              </div>
                            </div>
        
    </div>

          </div>

     </div>

     </div>

     </div>

    </div>

 </div>
</asp:Content>

