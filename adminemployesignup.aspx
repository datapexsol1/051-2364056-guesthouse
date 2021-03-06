﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.master" AutoEventWireup="true" CodeFile="adminemployesignup.aspx.cs" Inherits="adminemployesignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    
  
 
<style>
    .abc{
    background-color:red
}</style>
</asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div id="Notify"></div>
     <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Create Employee Account</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                              <button class="btn btn-default" type="button">Go!</button>
                          </span>
                  </div>
                </div>
              </div>
            </div>
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                   
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <div class="form-horizontal form-label-left">

                      
                        
                        <div class="row">
                          <div class="form-group col-md-4">
                              <label >Branch <span class="required">*</span></label>
                             
                                  <select class="form-control" name="brancid">
                                      <option value="0">Select</option>
                                     <%  IQueryable<branch> brachdata=branchClass.getBrachesinfo();
                                          foreach (var b in brachdata)
                                          {%>
                                      <option value=<%=b.Id %>>   <%=b.city %></option>
                                      <%} %>
                                  </select>

                          
                        
                             </div>
                            
                      <div class="form-group col-md-4">
                        <label>Name <span class="required">*</span>
                        </label>
                       
                          <input id="name" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="Complete name(s) e.g Waqas khan" required="required" type="text"/>
                        
                      </div>
                      <div class="form-group col-md-4">
                        <label >Email <span class="required">*</span>
                        </label>
                      
                          <input type="email" id="email" name="email" required="required" placeholder="Email" class="form-control "/>
                        
                      </div>
                        <div class="row">
                           <div class="form-group col-md-4">
                        <label >Contact <span class="required">*</span>
                        </label>
                      
                          <input type="number" id="number" name="number" required="required" min="0" data-validate-minmax="10,100" class="form-control col-md-7 col-xs-12"/>
                     
                      </div>
                        

                      <div class="form-group col-md-4">
                        <label>C.N.I.C <span class="required">*</span>
                        </label>
                        
                          <input type="text" id="cnic" name="cnic" required="required"  class="form-control"/>
                        </div>
                      
                      
                    <div class="form-group col-md-4">
                        <label >Designation <span class="required">*</span>
                        </label>
                        
                          <input id="designation" type="text" name="designation" data-validate-length-range="5,20" class="optional form-control"/>
                        
                      </div>
                        </div>
                            
                            <div class="row">
                   <div class="form-group col-md-4">
                        <label >Salary <span class="required">*</span>
                        </label>
                       
                          <input type="number" id="salary" name="salary" required="required" class="form-control"/>
                        
                       </div>
                      <div class="form-group col-md-4">
                             <label >Address <span class="required">*</span></label>
                       
                            
                             <input id="address" type="text" name="address" data-validate-length-range="5,150" class="optional form-control"/>

                        </div>
                    <div class="form-group col-md-4">
                        <label >Choose Image <span class="required">*</span>
                        </label>
                        <asp:FileUpload ID="image" runat="server" class="optional form-control "/>
                          <%--<input id="image" type="file" name="image"  class="optional form-control " runat="server"/>--%>
                        
                      </div>
                                </div>
                             <div class="row">
                      <div class="form-group col-md-4">
                        <label>Username <span class="required">*</span>
                        </label>
                        <%
                            Random r = new Random();
                            int rand = r.Next(0, 100);
                            bool check = employeeProfile.checkUsername(rand);
                            if (check == true)
                            {
                             %>
                          <input type="text" id="username" name="username" value="CT-<%=rand %>"  required="required" class="form-control"/>
                        <%} %>
                          </div>
                           
                          <div class="form-group col-md-4">
                        <label>Password <span class="required">*</span>
                        </label>
                       
                          <input type="password" id="password" name="password" required="required" class="form-control"/>
                        
                              </div>
                      
                    <div class="form-group col-md-4">
                        <label>confirm Password <span class="required">*</span>
                        </label>
                        
                          <input id="confirmpassword" type="password" name="confirmpassword" data-validate-length-range="5,20" class="optional form-control"/>
                        
                      </div>
                      
                         
                             </div>
                       </div>
                     
                        <div style="margin-top:20px;">
                    
                      <div class="form-group">
                        <div class="col-md-6 col-md-offset-5">
                          <asp:Button ID="send" runat="server" Text="Submit"  class="btn btn-success" OnClick="send_Click" />
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
        <!-- /page content -->


     <!-- jQuery -->
   
 <%--   <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- validator -->
    <script src="../vendors/validator/validator.js"></script>--%>

    <!-- Custom Theme Scripts -->



</asp:Content>

