<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employebranchinventory.aspx.cs" Inherits="employebranchinventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Branch Assets</h3>
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Branch Assets</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Update Assets</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Add Assets</a>
                          </li>
                            
                          
                        </ul>
       
         <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                <div style="overflow:auto;">
       <!-- start recent activity -->
                        <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                  <th>Branch No</th>
                                  <th>Asset Tittle</th>
                                  <th>Asset Description</th>
                                 
                                </tr>
                              </thead>
                              <tbody>
                                
                               
                              </tbody>
                            </table>
                            <!-- end recent activity -->

                 </div>
                              </div>




              <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">


                                     <div style="overflow:auto;">
       <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                  <th>Branch No</th>
                                  <th>Title</th>
                                  <th>Item Description</th>
                                
                                 
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td> <input type="number" id="uroomno" name="ubranchno" required="required" placeholder="Branch No" class="form-control "/></td>
                                  <td> <input type="text" id="ulabel" name="utitle" required="required" placeholder="Title" class="form-control "/></td>
                                  <td>  <input type="text" id="udescription" name="adescription" required="required" placeholder="Description" class="form-control "/></td>
                                 
                                  <td>  <asp:Button ID="send" runat="server" Text="Update"  class="btn btn-success" /></td>
                                </tr>
                               
                              </tbody>
                            </table>

      </div>


                              </div>


             <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">




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

