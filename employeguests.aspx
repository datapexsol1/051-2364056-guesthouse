﻿<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeguests.aspx.cs" Inherits="employeguests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
   <%--  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title></title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../custom/custom.min.css" rel="stylesheet">
  </head>--%>


   

      <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Guests</h3>
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Local Guests</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Foriegn Guests</a>
                          </li>
                         
                        </ul>
                        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

                            <!-- start recent activity -->
                               <div style="overflow:auto;white-space:nowrap;">
                               <table class="table table-bordered table-striped" >
                              <thead>
                                <tr >
                                    <th></th>
                                    <th>Image</th>
                                    <th>Check In</th>
                                    <th>Check Out</th>
                                    <th>Room No</th>
                                    <th>No Of Persons</th>
                                  <th>Reg No</th>
                                  <th>Name</th>
                                  <th>N.I.C No</th>
                                  <th >Birth Date</th>
                                  <th>Company Name</th>
                                    
                                    <th>Profession</th>
                                    <th>Designation</th>
                                    <th>Company Adress</th>
                                    <th>Permanent Adress</th>
                                    <th>Present Adress</th>
                                    <th>Ph No Office</th>
                                    <th>Ph No Residence</th>
                                </tr>

                              </thead>
                              <tbody>
                                  <%--should get bid and get element with that bid --%>
                                  <% 
                                       int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
                                      guestBookingAttributes[] bookings=gusetRegistrationClass.getlocalClientData(bid);
                                      foreach (guestBookingAttributes b in bookings)
                                      {
                                          try
                                          {
                                              if (b.b_id != 0)
                                              {
                                       %>
                                <tr>
                                    <td><a href="employeguestpayment.aspx?booking=<%=b.b_id%>"<label style="color:red">Check Out</label></a></td>
                                      <td><label id="image">"Not added yet"</label></td>
                                      <td><label id="checkin"><%=b.b_checkinDate%> </label></td>
                                      <td><label id="checkout"><%=b.b_checkoutdate%> </label></td>
                                      <td><label id="roomno"><%=b.b_roomno %></label></td>
                                      <td><label id="noofpersons"><%=b.b_no_pax %></label></td>
                                      <td><label id="regno"><%=b.g_reg_no %></label></td>
                                      <td><label id ="name"><%= b.g_guest_name%></label></td>
                                       <td><label id="nicno"><%=b.g_cnic %></label></td>
                                       <td><label id="dob"><%=b.g_date_of_birth %></label></td>
                                       <td><label id="companyname"><%= b.g_company_name%></label></td>
                                      <td><label id="proffesion"><%=b.g_profession %></label></td>
                                      <td><label id="designation"><%=b.g_designation %></label></td>
                                      <td><label id="companyadress"><%=b.g_company_name%> </label></td>
                                       <td><label id="permanentadress"><%=b.g_permanent_address %></label></td>
                                       <td><label id="presentadress" ><%="not added in yet"%></label></td>
                                       <td><label id="phoffice"><%=b.g_office_phone %></label></td>
                                       <td><label id="phresidence" ><%=b.g_residence %></label></td>
                                      


                                  </tr>
                                  <%}
        } catch (Exception ex) { } } %>
                              </tbody>
                            </table>
                                   </div>
                            <!-- end recent activity -->

                          </div>
                          <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">

                            <!-- start user projects -->
                                <div style="overflow:auto;white-space:nowrap;">
                            <table class="table table-bordered table-striped" >
                              <thead>
                                <tr>
                                    <th>*</th>
                                 <th>Image</th>
                                    <th>Check In</th>
                                    <th>Check Out</th>
                                    <th>Room No</th>
                                    <th>No Of Persons</th>
                                  <th>Reg No</th>
                                  <th>Name</th>
                                  <th>Passport No</th>
                                    <th>Nationality</th>
                                    <th>Visa No</th>
                                    <th>Valid Upto</th>
                                     <th>Purpose of visit</th>
                                    <th>Coming From</th>
                                    <th>Going To</th>
                                    <th>Issue Date</th>
                                  <th>Birth Date</th>
                                  <th>Company Name</th>                                
                                    <th>Profession</th>
                                    <th>Designation</th>
                                    <th>Company Adress</th>
                                    <th>Permanent Adress</th>
                                    <th>Present Adress</th>
                                    <th>Ph No Office</th>
                                    <th>Ph No Residence</th>
                                </tr>
                              </thead>
                              <tbody>
                                  <% guestBookingAttributes[] fbooking = gusetRegistrationClass.getforignerClientData(bid);
                                      foreach (guestBookingAttributes fb in fbooking)
                                      { 
                                          %>
                                 <tr>

                                     <td><a href="employeguestpayment.aspx?booking=<%=fb.b_id%>"><label>Check Out</label></a></td>
                                      <td><label id="fimage"><%="not yet"%></label></td>
                                      <td><label id="fcheckin"><%=fb.b_checkinDate %></label></td>
                                      <td><label id="fcheckout"><%=fb.b_checkoutdate %></label></td>
                                      <td><label id="froomno"><%= fb.b_roomno%></label></td>
                                      <td><label id="fnoofpersons"><%=fb.b_no_pax %></label></td>
                                      <td><label id="fregno"><%= fb.g_reg_no%></label></td>
                                      <td><label id ="fname"><%= fb.g_guest_name%></label></td>
                                      <td><label id="passportno"><%= fb.g_f_passport_no%></label></td>
                                      <td><label id="fnationality"><%=fb.g_f_nationality %></label></td>
                                      <td><label id="fvisano"><%=fb.g_f_visa_number %></label></td>
                                      <td><label id="fvalidupto"><%=fb.g_f_visa_valid_upto %></label></td>
                                      <td><label id="fpurposeofvisit"><%= fb.g_f_purpose_of_vist%></label></td>
                                      <td><label id="fcomingfrom"><%=fb.g_f_coming_from%></label></td>
                                      <td><label id="fgoingto"><%=fb.g_f_going_to %></label></td>
                                      <td><label id="fissuedate"><%=fb.g_f_passport_issue_date%></label></td>
                                       
                                       <td><label id="fdob"><%=fb.g_date_of_birth %></label></td>
                                       <td><label id="fcompanyname"><%=fb.g_company_name %></label></td>
                                      <td><label id="fproffesion"><%=fb.g_profession %></label></td>
                                      <td><label id="fdesignation"><%=fb.g_designation %></label></td>
                                      <td><label id="fcompanyadress"><%=fb.g_company_name %></label></td>
                                       <td><label id="fpermanentadress"><%= fb.g_permanent_address%></label></td>
                                       <td><label id="fpresentadress" ><%= "not added"%></label></td>
                                       <td><label id="fphoffice"><%=fb.g_office_phone%></label></td>
                                       <td><label id="fphresidence" ><%=fb.g_residence%></label></td>
                                      


                                  </tr>
                                  <%} %>
                              </tbody>
                            </table>
                                    </div>
                            <!-- end user projects -->

                          </div>
                          <%--<div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                               <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                  <th>#</th>
                                  <th>Project Name</th>
                                  <th>Client Company</th>
                                  <th class="hidden-phone">Hours Spent</th>
                                  <th>Contribution</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>1</td>
                                  <td>New Company Takeover Review</td>
                                  <td>Deveint Inc</td>
                                  <td class="hidden-phone">18</td>
                                  <td class="vertical-align-mid">
                                    <div class="progress">
                                      <div class="progress-bar progress-bar-success" data-transitiongoal="35"></div>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>2</td>
                                  <td>New Partner Contracts Consultanci</td>
                                  <td>Deveint Inc</td>
                                  <td class="hidden-phone">13</td>
                                  <td class="vertical-align-mid">
                                    <div class="progress">
                                      <div class="progress-bar progress-bar-danger" data-transitiongoal="15"></div>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>3</td>
                                  <td>Partners and Inverstors report</td>
                                  <td>Deveint Inc</td>
                                  <td class="hidden-phone">30</td>
                                  <td class="vertical-align-mid">
                                    <div class="progress">
                                      <div class="progress-bar progress-bar-success" data-transitiongoal="45"></div>
                                    </div>
                                  </td>
                                </tr>
                                <tr>
                                  <td>4</td>
                                  <td>New Company Takeover Review</td>
                                  <td>Deveint Inc</td>
                                  <td class="hidden-phone">28</td>
                                  <td class="vertical-align-mid">
                                    <div class="progress">
                                      <div class="progress-bar progress-bar-success" data-transitiongoal="75"></div>
                                    </div>
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </div>--%>
                        </div>
                      </div>
         </div>
         </div>
         </div>
        </div>
          </div>
    


    <%--  <!-- jQuery -->
    <%--<script src="../vendors/jquery/dist/jquery.min.js"></script>--%>
    <!-- Bootstrap -->
   <%-- <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- morris.js -->
    <script src="../vendors/raphael/raphael.min.js"></script>
    <script src="../vendors/morris.js/morris.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="js/moment/moment.min.js"></script>
    <script src="js/datepicker/daterangepicker.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>--%>

   

</asp:Content>

