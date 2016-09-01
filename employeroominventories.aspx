<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeroominventories.aspx.cs" Inherits="employeroominventories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Room Assets</h3>
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Room Assets</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Update Assets</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Add Assets</a>
                          </li>
                            
                          
                        </ul>



     <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
  <div style="overflow:auto;">
       <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                  <th>Room No</th>
                                  <th>Label</th>
                                  <th>Item Description</th>
                                  <th>Number Of Item</th>
                                 
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td><label id="roomno"></label></td>
                                  <td><label id="label"></label></td>
                                  <td><label id="item description"></label></td>
                                  <td> <label id="numberofitem"></label></td>
                                  
                                </tr>
                               
                              </tbody>
                            </table>

      </div>
                              </div>


                                <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">


                                     <div style="overflow:auto;">
       <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                  <th>Room No</th>
                                  <th>Label</th>
                                  <th>Item Description</th>
                                  <th>Number Of Item</th>
                                 
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td> <input type="number" id="uroomno" name="aroomno" required="required" placeholder="Room No" class="form-control "/></td>
                                  <td> <input type="text" id="ulabel" name="alabel" required="required" placeholder="Label" class="form-control "/></td>
                                  <td>  <input type="text" id="udescription" name="adescription" required="required" placeholder="Description" class="form-control "/></td>
                                  <td>   <input type="number" id="uitemno" name="aitemno" required="required" placeholder="Number Of Items" class="form-control "/></td>
                                  <td>  <asp:Button ID="send" runat="server" Text="Update"  class="btn btn-success" /></td>
                                </tr>
                               
                              </tbody>
                            </table>

      </div>


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
                          <asp:Button ID="Button1" runat="server" Text="Submit"  class="btn btn-success" />
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

