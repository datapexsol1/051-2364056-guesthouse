<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeeviewemployeeinfo.aspx.cs" Inherits="employeeviewemployeeinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Employee Info</h3>
          <div class="container">
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Employee</a></li>
                          
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Add Employee</a></li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab3" data-toggle="tab" aria-expanded="false">Update Info</a></li>
                            
                          
                        </ul>
                        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">




                    







                            <!-- start recent activity -->
                           
                           <table class="table tbl">
                              <thead class="thead-inverse">
                                <tr>
                                  <th>Image</th>
                                  <th>Name</th>
                                  <th>Email</th>
                                  <th>Employee no</th>
                                  <th>Cnic</th>
                                    <th>Designation</th>
                                    <th>Date of joining</th>
                                    <th>Address</th>
                                    <th>Employee type</th>
                                    <th>Salary</th>
                                    
                                </tr>
                              </thead>
                              <tbody>
                               
                                <tr>
                                  <td><label id="image"></label></td>
                                  <td><label id="name"></label></td>
                                  <td><label id="email"></label></td>
                                  <td><label id="employe no"> </label></td>
                                  <td> <label id="cnic"></label></td>
                                  <td><label id="designation"></label></td>
                                 <td><label id="joiningdate"> </label></td>
                                    <td><label id="address"></label></td>
                                     <td><label id="emptype"> </label></td>
                                     <td><label id="salary"> </label></td>
                                      <td><a href="#" style="color:red">Payed</a></td>
                                              <td><a href="#" style="color:green">Block employee</a></td>
                                              
                                              
                                </tr>
                                 
                               
                              </tbody>
                            </table>
                            <!-- end recent activity -->
                              

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

