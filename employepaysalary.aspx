<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employepaysalary.aspx.cs" Inherits="employepaysalary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

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
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Pending</a></li>
                          
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab1" data-toggle="tab" aria-expanded="false">View</a></li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Update</a></li>
                            
                          
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
                               
                                <tr>
                                  <td><label id="empid"></label></td>
                                  <td><label id="name"></label></td>
                                  <td><label id="joiningdate"> </label></td>
                                  <td><label id="totalsalary"></label></td>
                                 <td><label id="amounttopay"> </label></td>
         
                                      <td><a href="#" style="color:green"  class="btn btn-success">Pay</a></td>
                                              
                                              
                                </tr>
                                 
                               
                              </tbody>
                            </table>
                               </div>
                            <!-- end recent activity -->
                              

                 </div>
                            <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                               <div class="row">
                                 <div class="col-md-4">
                                     <label>Select employee name</label>
                              <asp:DropDownList  runat="server" class="form-control" clientIdMode="static" ID="ddemployeename" name="ddemployeename" AutoPostBack="True" required>
                                      <Items>
                                           <asp:ListItem Text="Select" Value="" />
                                       </Items>
                                      </asp:DropDownList>

                                 </div>

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

