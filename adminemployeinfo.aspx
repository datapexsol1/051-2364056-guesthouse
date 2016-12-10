<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.master" AutoEventWireup="true" CodeFile="adminemployeinfo.aspx.cs" Inherits="EmployeeInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    <!-- page content -->
        
   <div class="right_col" role="main">
          <div class="">
    <div class="page-title">
              <div class="title_left">
                   <h3>Employee detail</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                      <span class="input-group-btn">
                              <button class="btn btn-default" type="button" disabled="disabled">Select branch!</button>
                          </span>
                  <asp:DropDownList ID="branch" runat="server"  AutoPostBack="true" ClientIDMode="Static" OnSelectedIndexChanged="sranchSelected_Indexchange" CssClass="form-control"></asp:DropDownList>

                    
                  </div>
                </div>
              </div>
            </div>
      <div class="clearfix"></div>

            <div class="row">
          <div class="">
         <%--   <div class="page-title">
              <div class="title_left">
                <h3>Contacts Design</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for..."/>
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>--%>

            <div class="clearfix"></div>
   
            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_content">
                    <%--<asp:DropDownList ID="branch" runat="server" OnSelectedIndexChanged="sranchSelected_Indexchange" AutoPostBack="true"></asp:DropDownList>--%>


                      <div class="clearfix"></div>
                       
                    
                         <% 
                             List<employee> employes = null;
                             if (branch.SelectedValue == "Select Branch") {
                                 //get all branches
                                 employes= employeeProfile.getAllEmployee().ToList<employee>();
                             }
                             else
                             {
                                 employes = employeeProfile.getAllEmployee(branch.SelectedValue).ToList<employee>();
                             }
                          
                       

                             foreach (employee e in employes)
                             {
                                    byte[] img1 = null;
                      if (e.image != null)
                      {
                          img1 = e.image.ToArray();
                      }
                      else
                      {
                          img1 = System.Text.Encoding.UTF8.GetBytes ("images/images.png");
                      }

                             %>

                      
                      <div class="col-md-4 col-sm-4 col-xs-12 profile_details">
                                           
                        <div class="well profile_view">
                          <div class="col-sm-12">
                            <h4 class="brief"><i><%=e.designation %></i></h4>
                            <div class="left col-xs-7">
                              <h2><%=e.name %></h2>
                              <p><strong>About: </strong> <%=e.designation %></p>
                              <ul class="list-unstyled">
                                <li><i class="fa fa-building"></i> Address:<%=e.address %> </li>
                                <li><i class="fa fa-phone"></i> Phone #:<%=e.employee_no %> </li>
                              </ul>
                            </div>
                            <div class="right col-xs-5 text-center">
                              <img src='data:image/jpg;base64,<%= Convert.ToBase64String(img1) %>' alt="" class="img-circle img-responsive">
                            </div>
                          </div>
                          
                        </div>
                     </div>










                         <%} %>

                     






























                      <%--<div class="col-md-5 col-sm-5 col-xs-12 profile_details">
                        <div class="well profile_view">
                          <div class="col-sm-12">
                            <h4 class="brief"><i><%=e.designation %></i></h4>
                            <div class="left col-xs-7">
                              <h2><%=e.name %></h2>
                              <p><strong>About: </strong> Web Designer / UI. </p>
                              <ul class="list-unstyled">
                                <li><i class="fa fa-building"></i> <%=e.address %></li>
                                <li><i class="fa fa-phone"></i> <%=e.employee_no %></li>
                              </ul>
                            </div>
                            <div class="right col-xs-5 text-center">
                                <%
                                    byte[] img = null;
                                    if (e.image != null)
                                    {
                                        img = e.image.ToArray();
                                    }
                                   else
                                      {
                                          img = System.Text.Encoding.UTF8.GetBytes ("images/images.png");
                                      }
                                     %>
                              <img src="data:image/png;base64,<%=Convert.ToBase64String(img) %>" alt="" class="img-circle img-responsive">
                            </div>
                          </div>
                          <div class="col-xs-12 bottom text-center">
                         

                        
                          </div>
                        </div>
                      </div>--%>
                   
              

                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
       </div></div>
        <!-- /page content -->
</asp:Content>

