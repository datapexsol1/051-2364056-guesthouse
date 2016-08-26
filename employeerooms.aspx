<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeerooms.aspx.cs" Inherits="employeerooms" %>

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
    <link href="../custom/custom.min.css" rel="stylesheet">

  </head>

    <style>
	
	/* 
	Max width before this PARTICULAR table gets nasty
	This query will take effect for any screen smaller than 760px
	and also iPads specifically.
	*/
	
	</style>




      <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Rooms</h3>
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Rooms</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Available Rooms</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Add Rooms</a>
                          </li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

                            <!-- start recent activity -->
                               <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                  <th>Room No</th>
                                  <th>Room Type</th>
                                  <th>Room Size</th>
                                  <th>Room Rent</th>
                                  <th>Branch</th>
                                </tr>
                              </thead>
                              <tbody>
                                
                                <tr>
                                  <td>rooom no<label></label></td>
                                  <td><label id="froomtype">suite</label></td>
                                  <td><label id="froomsize0">normal</label></td>
                                  <td> <label id="froomrent">10000</label></td>
                                  <td><label id="froombranch">Capetown</label></td>
                                </tr>
                               
                              </tbody>
                            </table>
                            <!-- end recent activity -->

                          </div>
                          <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">

                            <!-- start user projects -->
                            <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                  <th>Room No</th>
                                  <th>Room Type</th>
                                  <th>Room Size</th>
                                  <th>Maximum Room Rent</th>
                                  <th>Minimum Room Rent</th>
                                  <th>Branch</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td><label id="Aroomid">1</label></td>
                                  <td><label id="Aroomtype">suite</label></td>
                                  <td><label id="Aroomsize">normal</label></td>
                                  <td> <label id="Amaxroomrent">10000</label></td>
                                  <td> <label id="Aminroomrent">5000</label></td>
                                  <td><label id="Aroombranch">Capetown</label></td>
                                </tr>
                                
                              </tbody>
                            </table>
                            <!-- end user projects -->

                          </div>
                          <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                               
                              
                              <div class="container">       
                                        
                                   
                                <label class="control-label col-md-5 col-sm-5 col-xs-12"> Room NO</label>
                                       <div class="col-md-6 col-sm-6 col-xs-12">
                                         <input type="text" name="roomno" id="roomno"/>
                                             </div>
                                          
                                          
                                         

                                             <div class="col-md-6 col-sm-6 col-xs-12">
                                              <input type="text" name="roomtype" id="roomtype"/>
                                          </div>
                                              
                                          
                                        
                                <label class="control-label col-md-5 col-sm-5 col-xs-12">Room Size</label>
                                              <div class="col-md-6 col-sm-6 col-xs-12">
                                             <input type="text" name="roomsize" id="roomsize"/>
                                             </div>
                                              
                                         
                                         
                              <label class="control-label col-md-5 col-sm-5 col-xs-12">Maximum Room Rent</label>
                                             <div class="col-md-6 col-sm-6 col-xs-12">
                                               <input type="text" name="roommaxrent" id="roommaxrent"/>
                                               </div>
                                             
                                          
                                        
                               <label class="control-label col-md-5 col-sm-5 col-xs-12">Minimum Room Rent</label>
                                              <div class="col-md-6 col-sm-6 col-xs-12">
                                             <input type="text" name="roomminrent" id="roomminrent"/>
                                             </div>
                                             
                                          
                                         
                                 <label class="control-label col-md-5 col-sm-5 col-xs-12">Branch</label>
                                             <div class="col-md-6 col-sm-6 col-xs-12">
                                         <input type="text" name="roombranch" id="roombranch"/>
                                              </div>
                                       
                                         
                                         <div style="padding-top:10px;" class="col-md-4 col-sm-4 col-xs-12">
                                         <asp:Button ID="saveroom" runat="server" Text="Save Room" OnClick="saveroom_click" />
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
    


  
    
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>

    
    <!-- /datepicker -->
   
</asp:Content>

