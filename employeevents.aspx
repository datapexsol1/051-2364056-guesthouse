<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeevents.aspx.cs" Inherits="employeevents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <head>
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
    </head>
     
      <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Rooms</h3>
          <div class="container">
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">View Events</a></li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab1" data-toggle="tab" aria-expanded="false">Add Event</a></li>

                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Update Event</a></li>
                            
                          
                        </ul>
                        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">




                    







                            <!-- start recent activity -->
                           
                          
                            <!-- end recent activity -->
                              

                 </div>
                         
                            <!--start add event-->
                            <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                                <div class="row">
                                     <div class="col-md-5">
                                            <input runat="server" type="text" id="eventname" name="eventname" placeholder="Event name..." class="form-control"/>
                                         </div>
                                </div>
                                <div class="row">
                                     <div class="col-md-5">
                                            <input runat="server" type="text" id="eventdesc" name="eventdesc" placeholder="Event description..." class="form-control"/>
                                         </div>
                                </div>
                                <div class="row">
                                     <div class="col-md-5">
                                            <input  type="date" id="eventstartdate" name="eventstartdate"  class="form-control"/>
                                         </div>
                                </div>
                                <div class="row">
                                     <div class="col-md-5">
                                            <input  type="date" id="eventenddate" name="eventenddate"  placeholder="Select date..." class="form-control"/>
                                         </div>
                                </div>
                                <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Styled</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <div class="input-group demo2">
                            <input type="text" value="#e01ab5" class="form-control" />
                            <span class="input-group-addon"><i></i></span>
                          </div>
                        </div>
                      </div>
                              <asp:Button ID="eventsubmit" runat="server" Text="Submit" class="btn btn-success" OnClick="eventsubmit_Click"/>
                              
                              
                              
                              
                          </div>
                            <!--end add event-->
                            
                          <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                             
                              
                                   <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="room no">Room No <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="text" id="roomno" name="roomno"  placeholder="Room No" class="form-control "  data-validation="required" 
		 data-validation-error-msg="Room no is required !"/>
                        </div>
                      </div>

                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="room type">Room Type <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="text" id="roomtype" name="roomtype" data-validation="required" 
		 data-validation-error-msg="Room Type is required !" placeholder="Room type" class="form-control "/>
                        </div>
                      </div>
                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="room size">Room Size <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="text" id="roomsize" name="roomsize"  placeholder="Room size" class="form-control " data-validation="length alphanumeric" 
		 data-validation-length="3-12" 
		 data-validation-error-msg="Room size is not in correct format"/>
                        </div>
                      </div>
                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="room rent">Max Room Rent <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="number" id="roommaxrent" name="roommaxrent"  placeholder="Room rent max" class="form-control "
                              min="0" data-validation="required" 
		 data-validation-error-msg="Maximum room rent is required !"/>
                        </div>
                      </div>
                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="room rent">Min Room Rent <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="number" id="roomminrent" name="roomminrent"  placeholder="Room Rent" class="form-control "
                              min="0" data-validation="required" 
		 data-validation-error-msg="Minimum room rent is required !"/>
                        </div>
                      </div>
                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="branch no">Branch <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                       
                        </div>
                      </div>
                              <div class="form-group">
                        <div class="col-md-6 col-md-offset-11">
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
    </div>
</asp:Content>

