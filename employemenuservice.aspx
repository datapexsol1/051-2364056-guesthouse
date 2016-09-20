<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employemenuservice.aspx.cs" Inherits="employemenuservice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Menu items</h3>
              </div>

             
            </div>

            <div class="clearfix"></div>  
     <div class="">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">


                    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                      <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#tab_view" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">View menu</a>
                        </li>
                        <li role="presentation" class=""><a href="#tab_add" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Add item</a>
                        </li>

                          <li role="presentation" class=""><a href="#tab_update" role="tab" id="profile-tab1" data-toggle="tab" aria-expanded="false">Update item</a>
                        </li>

                    
                      </ul>
                         <!-- start view activity -->
                      <div id="myTabContent" class="tab-content">
                        <div role="tabpanel" class="tab-pane fade active in" id="tab_view" aria-labelledby="home-tab">
                           <asp:Table class="data table table-striped no-margin" ID="menuview"  runat="server">
                             
                            
                             
                               
                             
                           </asp:Table>
                      <!--     <table class="table tbl">
                              <thead class="thead-inverse">
                                <tr>
                                  <th>Menu type</th>
                                  <th>Item name</th>
                                  <th>Item price</th>
                                  <th>Item Quantity</th>
                                </tr>
                              </thead>
                              <tbody>
                                  
                                <tr>
                                  <td><label id="lbtype"></label></td>
                                  <td><label id="lbitemname"></label></td>
                                  <td><label id="lbitemprice"></label></td>
                                  <td> <label id="lbitemqty"></label></td>
                               
                                              
                                </tr>
                                
                               
                              </tbody>
                            </table>-->
                            
                        </div>
                          <!-- end view activity -->
                        
                            <!-- start add activity -->
                        <div role="tabpanel" class="tab-pane fade" id="tab_add" aria-labelledby="profile-tab">
                          <div class="col-md-9 col-xs-12">
                <div class="x_panel">
                 
                  <div class="x_content">
                    <br />
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Select type</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <select class="form-control" name="addtype">
                            <option>Breakfast</option>
                            <option>Soups</option>
                            <option>BBQ special</option>
                            <option>Chicken</option>
                            <option>Handies</option>
                              <option>Mutton</option>
                              <option>Rice & roti</option>
                              <option>Tandoori</option>
                              <option>Sea foods</option>
                              <option>Salad</option>
                              <option>Cold & hot drinks</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Item name</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" name="additemname" placeholder="Enter item name"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Price</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="number" class="form-control" name="additemprice" placeholder="Enter Price" min="0"/>
                        </div>
                      </div>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Quantity</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" name="additemquantity" placeholder="Enter Quantity" min="0"/>
                        </div>

                      </div>
                      <br />
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                         
                            <asp:Button ID="Button1" runat="server" Text="Save"  class="btn btn-success" onclick="saveitem_click"/>

                        </div>
                      </div>
                      </div></div>
                              </div>
                        </div>
                          <!-- end add activity -->
                          <!-- start update activity-->
                        <div role="tabpanel" class="tab-pane fade" id="tab_update" aria-labelledby="profile-tab">
                            <div class="col-md-9 col-xs-12">
                <div class="x_panel">
                 
                  <div class="x_content">
                    <br />
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Select type</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <select class="form-control">
                            <option>Breakfast</option>
                            <option>Soups</option>
                            <option>BBQ special</option>
                            <option>Chicken</option>
                            <option>Handies</option>
                              <option>Mutton</option>
                              <option>Rice & roti</option>
                              <option>Tandoori</option>
                              <option>Sea foods</option>
                              <option>Salad</option>
                              <option>Cold & hot drinks</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Item</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <select class="form-control">
                            <option>choose item</option>
                            
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Edit item (optional)</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" placeholder="Enter item name"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Price</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="number" class="form-control" placeholder="Enter Price" min="0"/>
                        </div>
                      </div>
                     <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Quantity</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" placeholder="Enter Quantity" min="0"/>
                        </div>

                      </div>
                      <br />
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button type="submit" class="btn btn-success">Update</button>
                        </div>
                      </div>
                      </div></div>
                              </div>
                        </div>
                          <!--end update activity-->
                          <div role="tabpanel" class="tab-pane fade" id="tab_delete" aria-labelledby="profile-tab">
                          <p>delete content</p>
                        </div>
                      </div>
                    </div>

                  </div>
                </div>
              </div>


             


           


              

         </div></div>   </div>
</asp:Content>

