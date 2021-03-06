﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.master" AutoEventWireup="true" CodeFile="adminguesthistory.aspx.cs" Inherits="adminguesthistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class="right_col" role="main">
          <div class="">
    <div class="page-title">
              <div class="title_left">
                   <h3>Guests</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                      <span class="input-group-btn">
                              <button class="btn btn-default" type="button" disabled="disabled">Select branch!</button>
                          </span>
                  <asp:DropDownList ID="branch" runat="server"  AutoPostBack="true" ClientIDMode="Static"  CssClass="form-control"></asp:DropDownList>

                    
                  </div>
                </div>
              </div>
            </div>
      <div class="clearfix"></div>
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
                                      if (branch.SelectedValue != "Select Branch")
                                      {
                                          int bid = branchClass.getBranchID(branch.SelectedValue);//employeeProfile.getEmployeBranch(Session["loginName"].ToString());
                                          guestBookingAttributes[] bookings = gusetRegistrationClass.getlocalClienthistor(bid);
                                          foreach (guestBookingAttributes b in bookings)
                                          {
                                              try
                                              {
                                                  if (b.b_id != 0)
                                                  {
                                       %>
                                <tr>
                                  
                                    <td><a href="adminpaymentdetail.aspx?booking=<%=b.b_id%>"<label style="color:red">View Booking Detail</label></a></td>
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
                                          }
                                          catch (Exception ex) { }
                                      } %>
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
                                  <% guestBookingAttributes[] fbooking = gusetRegistrationClass.getforignerClienthistory(bid);
                                      foreach (guestBookingAttributes fb in fbooking)
                                      {
                                          %>
                                 <tr>

                                     <td><a href="employepaymentdetail.aspx?booking=<%=fb.b_id%>"><label>View Booking Detail</label></a></td>
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
                                  <%}
                                      } %>
                              </tbody>
                            </table>
                                    </div>
                            <!-- end user projects -->

                          </div>
                         
                        </div>
                      </div>
         </div>
         </div>
         </div>
        </div>
          </div>
    



   

</asp:Content>

