<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.master" AutoEventWireup="true" CodeFile="adminbranch.aspx.cs" Inherits="adminbranch" %>

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
      <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Branch</h3>
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">All Branches</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Add Branch</a>
                          </li>
                          
                        </ul>
                        
    
    <!-- start recent activity -->
        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                               <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                  <th>Branch No</th>
                                  <th>Name</th>
                                  <th>City</th>
                                  <th class="hidden-phone">Country</th>
                                  <th>Adress</th>
                                </tr>
                              </thead>
                              <tbody>
                                  <% IQueryable<branch> branch_data = branchClass.getBrachesinfo();
                                      foreach (var b in branch_data)
                                      {%>
                                <tr>
                                    
                                  <td><label id="vbno"><%=b.brachno %></label></td>
                                  <td><label id="vbname"><%=b.name %></label></td>
                                  <td><label id="vbcity"><%=b.city %></label></td>
                                  <td><label id="vbcountry"><%=b.country %></label></td>
                                  <td><label id="vbadress"><%=b.address %></label></td>
                                </tr>
                                  <%} %>
                            </tbody>
                                  </table>
                              </div>
            
                            <!-- end recent activity -->




                               <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                               <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                  <th>Branch NO</th>
                                  <th>Branch Name</th>
                                  <th>Branch City</th>
                                  <th>Branch Country</th>
                                  <th>Branch Adress</th>
                                
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td><input type="text" name="bno" id="bno"/></td>
                                  <td><input type="text" name="bname" id="abname"/></td>
                                    <td><input type="text" name="bcity" id="abcity"/></td>
                                  <td><input type="text" name="bcountry" id="abcountry"/></td>
                                  <td><input type="text" name="badress" id="abadress"/></td>
                                    
                                 
                                </tr>  
                                  <tr><td colspan="1"><asp:Button ID="savebranch" runat="server" Text="Save Branch" onclick="savebranch_click" /></td></tr> 
                              </tbody>
                            </table>
                        </div>
                            
        
        </div>
       </div>
         </div>
         </div>
        </div>
        </div>
    
                          
                              <
</asp:Content>

