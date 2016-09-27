<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeplaceorder.aspx.cs" Inherits="employemenuservice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function xyz(value) {
            if ( $('#tbox' + value).is(":checked"))
            {
                
                if ($('#<%=itemid.ClientID%>').val() == "") {
                    $('#<%=itemid.ClientID%>').val(value);
                    alert($('#<%=itemid.ClientID%>').val());
                }
                else {
                    var val = $('#<%=itemid.ClientID%>').val();
                    val += "," + value;
                    $('#<%=itemid.ClientID%>').val(val);
                    alert($('#<%=itemid.ClientID%>').val());
                }
                var x = $('#noitem' + value).val();
                alert("id of item :" + value + "Value of item :" + x);
            }
            else {
                var mystr = $('#<%=itemid.ClientID%>').val();
                    var avoid = value + ',';
                   

                    var abc = mystr.replace(avoid, '');
                    abc = abc.replace(value, '');
                  
                    $('#<%=itemid.ClientID%>').val(abc);
                    alert($('#<%=itemid.ClientID%>').val());
                
                
            }
            
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <input type="hidden" id="itemid" runat="server" />
    <input type="hidden" id="nofitem" runat="server" />
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
                            <asp:Button ID="getsummary" runat="server" Text="Button" OnClick="getsummary_click" />
                           <asp:Table class="data table table-striped no-margin"  ID="menuview"  runat="server">
                             
                            
                             
                               
                             
                           </asp:Table>
                             <asp:Table class="data table table-striped no-margin" ID="ordersummery"  runat="server">
                             
                            
                             
                               
                             
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
                            <div class="col-md-12">
                <div class="x_panel">
                 
                  <div class="x_content">
                  
                   <div class="row">
                        <div class="col-md-6">
                       <div class="form-group">
                        
                       
                            <label>Select type</label>
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
                       <div class="col-md-6">
                      <div class="form-group">
                        
                        
                            <label >Select Item</label>
                          <select class="form-control">
                            <option>choose item</option>
                            
                          </select>
                        </div>
                      </div>
                       </div>
               
                       <div class="row">
                           <div class="col-md-6">
                           <div class="form-group">
                       
                        
                             <label >Edit type (optional)</label>
                          <input type="text" class="form-control" placeholder="Enter type"/>
                        </div>
                      </div>
                           <div class="col-md-6">
                      <div class="form-group">
                       
                        
                             <label >Edit item (optional)</label>
                          <input type="text" class="form-control" placeholder="Enter item name"/>
                        </div>
                      </div>
                           </div>
                      <div class="row">
                          <div class="col-md-6">
                      <div class="form-group">
                        
                        
                            <label >Price</label>
                          <input type="number" class="form-control" placeholder="Enter Price" min="0"/>
                        </div>
                      </div>
                          <div class="col-md-6">
                    <div class="form-group">
                        
                        
                            <label ">Quantity</label>
                          <input type="text" class="form-control" placeholder="Enter Quantity" min="0"/>
                        </div>

                      </div>
                           </div>
                     
                      <br />
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button type="submit" class="btn btn-success">Submit</button>
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

