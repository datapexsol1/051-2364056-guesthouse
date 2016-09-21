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
      
       
                                                   
                         <div class="form-group col-md-6">

                        
                        
                             <%  //int bid = employeeProfile.getEmployeBranch("kk");//get from session %>
                                   <input type="hidden" name="branch" id="branch" value=<%//= bid%> />
                                  <select  id="rnovxxxx" name="rnovxxxx"  class="form-control col-md-7 col-xs-12" >
                                         <option value="0">Select Room</option>
                                          <%  

                                            //  IQueryable<room> r = roomsclass.getAllRooms(bid);
                                             // foreach (var x in r)
                                          //    { %>
                                             <option value='<%//=x.Id %>'><%//= x.room_no %></option>
                                           <%//} %>
                                </select>
                      </div>

        
      <asp:Button ID="Button1" class="btn btn-success btn-default" runat="server" Text="Select" OnClick="Button1_Click" />   
                                     
                             
                           <asp:Table class="data table table-striped no-margin" ID="assetsViewTable"  runat="server">
                             
                            
                             
                               
                             
                           </asp:Table>
          </div>
      </div>
                              


                                <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">


                                     <div style="overflow:auto;white-space:nowrap;">
      
                                         
                                   <div class="form-group col-md-6" >     
                                     <select class="form-control col-md-7 col-xs-12" >
                                        <option value="0">Select</option>
                                        </select>
                                            
                                       

                                       </div> 
                                         <div><asp:Button id="upbutton" class="btn btn-success btn-default" Text="Select" runat="server" /></div>
                                         
                                         
                                         
                                         
                                          <table class="data table table-striped no-margin">
                            
           
           
           
           
           
             <thead>
                                <tr>
                                  
                                    
                                  <th>Label</th>
                                  <th>Item Description</th>
                                  <th>Number Of Item</th>
                                 
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                <%--  <td> <input type="number" id="uroomno" name="aroomno"  placeholder="Room No Xyz" class="form-control "/></td>--%>
                                    <%--<td><select class="form-control" name="roombranch">
                                        <option value="0">Select</option>
                                        </select></td>--%>
                                  <td> <input type="text" id="ulabel" name="alabel"  placeholder="Label" class="form-control "/></td>
                                  <td>  <input type="text" id="udescription" name="adescription"  placeholder="Description" class="form-control "/></td>
                                  <td>   <input type="number" id="uitemno" name="aitemno"  placeholder="Number Of Items" class="form-control "/></td>
                                  <td>  <asp:Button ID="send" runat="server" Text="Update"  class="btn btn-success" /></td>
                                </tr>
                               
                              </tbody>
                            </table>

      </div>


                              </div>


           <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                             
                              
                        <div class="col-md-6">

                        <label class="control-label col-md-4" for="room no">Room No <span class="required">*</span>
                        </label>
                         <% // int bid = employeeProfile.getEmployeBranch("kk");//get from session %>
                               <div class="col-md-8">
                              <select  id="rno" name="rno" class="form-control col-md-5 col-xs-12">
                                     <option value=''>Select Room</option>
                                      <%  

                                        //  IQueryable<room> r = roomsclass.getAllRooms(bid);
                                         // foreach (var x in r)
                                          //{ %>
                                         <option value='<%//=x.Id %>'><%//= x.room_no %></option>
                                       <%//} %>
                                  </select>
                                   </div>
                          </div>
                              <div class="form-group col-md-6">
                                    <label class="control-label col-md-4 " for="room no">Label <span class="required">*</span> </label>
                                    <div class="col-md-8">
                                      <input type="text" id="alabel" name="alabel" placeholder="Label" class="form-control "/>
                                    </div>
                              </div>
                     

                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="room type">Item Description <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="text" id="adescription" name="adescription"  placeholder="Description" class="form-control "/>
                        </div>
                      </div>
                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4" for="room size">Number of Item <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="number" id="aitemno" name="insertaitemno"  placeholder="Number Of Items" class="form-control "/>
                        </div>
                      </div>
                           
                              <div class="form-group">
                        <div class="col-md-6 col-md-offset-11">
                        <asp:Button ID="SaveAssets" class="btn btn-success btn-default" runat="server" OnClick="saveAssets_click" Text="Save Assets" />
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

