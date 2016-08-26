<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.master" AutoEventWireup="true" CodeFile="adminemployesignup.aspx.cs" Inherits="adminemployesignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    
  
 

</asp:Content>






<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Gentellela Alela! | </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    
    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
  </head>
     <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Form Validation</h3>
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
                    <h2>Form validation <small>sub title</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
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

                      
                      <span class="section">Employe Signup</span>
                        
                        <div class="row">
                          <div class="form-group col-md-6" style="float:right;">
                              <label class="control-label col-md-4 " for="name">Branch <span class="required">*</span></label>
                              <div class="col-md-8">
                                  <select class="form-control" name="brancid">
                                      <option value="0">Select</option>
                                      <% IQueryable<branch> brachdata=branchClass.getBrachesinfo();
                                          foreach (var b in brachdata)
                                          {%>
                                      <option value=<%=b.Id %>>   <%=b.city %></option>
                                      <%} %>
                                  </select>

                          
                        </div>
                             </div>
                            </div>
                        <div class="row">
                      <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="name">Name <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input id="name" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="Complete name(s) e.g Waqas khan" required="required" type="text"/>
                        </div>
                      </div>
                      <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="email">Email <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="email" id="email" name="email" required="required" placeholder="Email" class="form-control "/>
                        </div>
                      </div>
                        
                           <div class="form-group col-md-6">
                        <label class="control-label col-md-4" for="number">Number <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="number" id="number" name="number" required="required" data-validate-minmax="10,100" class="form-control col-md-7 col-xs-12"/>
                        </div>
                      </div>
                        

                      <div class="form-group col-md-6">
                        <label class="control-label col-md-4" for="website">C.N.I.C <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="number" id="cnic" name="cnic" required="required"  class="form-control"/>
                        </div>
                          </div>
                      
                    <div class="form-group col-md-6">
                        <label class="control-label col-md-4" for="occupation">Designation <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input id="designation" type="text" name="designation" data-validate-length-range="5,20" class="optional form-control"/>
                        </div>
                      </div>
                        
                   <div class="form-group col-md-6">
                        <label class="control-label col-md-4" for="website">Salary <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="number" id="salary" name="salary" required="required" class="form-control"/>
                        </div>
                       </div>
                      
                    <div class="form-group col-md-6">
                        <label class="control-label col-md-4" for="occupation">Choose Image <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input id="image" type="file" name="image"  class="optional form-control " runat="server"/>
                        </div>
                      </div>

                      <div class="form-group col-md-6">
                        <label class="control-label col-md-4" for="email">Username <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="text" id="username" name="username"  required="required" class="form-control"/>
                        </div>
                          </div>
                          <div class="form-group col-md-6">
                        <label class="control-label col-md-4" for="website">Password <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="password" id="password" name="password" required="required" class="form-control"/>
                        </div>
                              </div>
                      
                    <div class="form-group col-md-6">
                        <label class="control-label col-md-4" for="occupation">confirm Password <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input id="confirmpassword" type="password" name="confirmpassword" data-validate-length-range="5,20" class="optional form-control"/>
                        </div>
                      </div>
                      
                         <div class="form-group col-md-12">
                             <label class="control-label col-md-2" for="email">Address <span class="required">*</span></label>
                        <div class="col-md-10">
                            
                             <input id="address" type="text" name="address" data-validate-length-range="5,150" class="optional form-control"/>

                          
                        </div>
                             </div>
                       </div>
                     
                        <div style="margin-top:20px;">
                    
                      <div class="form-group">
                        <div class="col-md-6 col-md-offset-10">
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
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- validator -->
    <script src="../vendors/validator/validator.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>



</asp:Content>

