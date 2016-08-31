<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employebooking.aspx.cs" Inherits="employebooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Booking</h3>
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Bookings</a>
                          </li>
                            </ul>
                            </div>
       
         
         
          <div style="overflow:auto;">
                               <table  class="table table-sm" <%--class="data table table-striped no-margin"--%> >
                              <thead>
                                <tr >
                                    <th scope="row" >Image</th>
                                   
                                    <th >Check In</th>

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
                                <tr >
                                      <td><label id="image"></label></td>
                                      <td><label id="checkin"></label></td>
                                      
                                      <td><label id="roomno"></label></td>
                                      <td><label id="noofpersons"></label></td>
                                      <td><label id="regno"></label></td>
                                      <td><label id ="name"></label></td>
                                       <td><label id="nicno"></label></td>
                                       <td><label id="dob"></label></td>
                                       <td><label id="companyname"></label></td>
                                      <td><label id="proffesion"></label></td>
                                      <td><label id="designation"></label></td>
                                      <td><label id="companyadress"></label></td>
                                       <td><label id="permanentadress"></label></td>
                                       <td><label id="presentadress" ></label></td>
                                       <td><label id="phoffice"></label></td>
                                       <td><label id="phresidence" ></label></td>
                                      
                                    <td><a href="#"><label id="checkout">Check out</label></a></td>

                                  </tr>
                              </tbody>
                            </table>
                                   </div>
         
         
         
         
         
         
         
           </div>
         </div>
         </div>
        </div>
    </div>
    






</asp:Content>

