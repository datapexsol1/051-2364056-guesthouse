<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeguesthouseassets.aspx.cs" Inherits="employeguesthouseassets" %>

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




      <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Rooms</h3>
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Home</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Branch Assets</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Room Assets</a>
                          </li>
                            
                          
                        </ul>
       
                        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">




                    







                            <!-- start recent activity -->
<%--                           <table class="data table table-striped no-margin">
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
                                  <td><label id="froomid">1</label></td>
                                  <td><label id="froomtype">suite</label></td>
                                  <td><label id="froomsize">normal</label></td>
                                  <td> <label id="froomrent">10000</label></td>
                                  <td><label id="froombranch">Capetown</label></td>
                                </tr>
                               
                              </tbody>
                            </table>--%>
                            <!-- end recent activity -->

                 </div>
                         
                            
                             <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">




                                        <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="room no">Branch No <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="number" id="bno" name="bno" required="required" placeholder="Branch No" class="form-control "/>
                        </div>
                      </div>
                              <div class="form-group col-md-6">
                               <label class="control-label col-md-4 " for="room no">Asset Tittle <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="text" id="batitle" name="batitle" required="required" placeholder="Asset Tittle" class="form-control "/>
                        </div>
                                  </div>
                     

                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="room type">Asset Description<span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="text" id="badiscription" name="badiscription" required="required" placeholder="Description" class="form-control "/>
                        </div>
                      </div>











                            <!-- start user projects -->
                        <%--    <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="room no">Branch No <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="number" id="bno" name="bno" required="required" placeholder="Branch No" class="form-control "/>
                        </div>
                      </div>
                              <div class="form-group col-md-6">
                               <label class="control-label col-md-4 " for="room no">Branch Name <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="text" id="bname" name="baname" required="required" placeholder="Branch Name" class="form-control "/>
                        </div>
                                  </div>
                     

                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="room type">Branch City <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="text" id="bcity" name="bcity" required="required" placeholder="Description" class="form-control "/>
                        </div>
                      </div>
                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4" for="room size">Branch Country<span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="text" id="bcountry" name="bcountry" required="required" placeholder="Branch Country" class="form-control "/>
                        </div>
                      </div>
                                       <div class="form-group col-md-6">
                        <label class="control-label col-md-4" for="room size">Branch Country<span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="text" id="bcountry" name="bcountry" required="required" placeholder="Branch Country" class="form-control "/>
                        </div>
                      </div>
                                       <div class="form-group col-md-6">
                        <label class="control-label col-md-4" for="room size">Branch Country<span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="text" id="bcountry" name="bcountry" required="required" placeholder="Branch Country" class="form-control "/>
                        </div>
                      </div>--%>
                           
                              <div class="form-group">
                        <div class="col-md-6 col-md-offset-11">
                          <asp:Button ID="Button1" runat="server" Text="Submit"  class="btn btn-success" />
                        </div>
                      </div>
                            <!-- end user projects -->

                          </div>
                          <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                             
                              
                                   <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="room no">Room No <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="number" id="aroomno" name="aroomno" required="required" placeholder="Room No" class="form-control "/>
                        </div>
                      </div>
                              <div class="form-group col-md-6">
                               <label class="control-label col-md-4 " for="room no">Label <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="text" id="alabel" name="alabel" required="required" placeholder="Label" class="form-control "/>
                        </div>
                                  </div>
                     

                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="room type">Item Description <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="text" id="adescription" name="adescription" required="required" placeholder="Description" class="form-control "/>
                        </div>
                      </div>
                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4" for="room size">Number of Item <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="number" id="aitemno" name="aitemno" required="required" placeholder="Number Of Items" class="form-control "/>
                        </div>
                      </div>
                           
                              <div class="form-group">
                        <div class="col-md-6 col-md-offset-11">
                          <asp:Button ID="send" runat="server" Text="Submit"  class="btn btn-success" />
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
         </div>
        </div>
         
    

</asp:Content>

