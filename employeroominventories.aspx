<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeroominventories.aspx.cs" Inherits="employeroominventories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function activaTab(tab) {
            $('.nav-tabs a[href="#' + tab + '"]').tab('show');
            //alert("working");
        };
       
    </script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="Notify"></div>
     <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Room Assets</h3>
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="false">Room Assets</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Update Assets</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Add Assets</a>
                          </li>
                            
                          
                        </ul>

        </div>

   <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
     <div style="overflow:auto;">
      
                                                   
                         <div class="form-group col-md-5">

                        
                        
                             <%  int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());//get from session %>
                                   <input type="hidden" name="branch" id="branch"  runat="server"/>
                                  <select  id="rnovxxxx" name="rnovxxxx"  class="form-control col-md-7 col-xs-12" required="required" >
                                         <option value="">Select Room</option>
                                          <%  

                                              IQueryable<room> r = roomsclass.getAllRooms(bid);
                                              foreach (var x in r)
                                              { %>
                                             <option value='<%=x.Id %>'><%= x.room_no %></option>
                                           <%} 
                                               %>
                                </select>
                      </div>
         <a href="#" runat="server" onserverclick="Button1_Click" class="btn btn-success">View</a>

      <%--<asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click" class="btn btn-success" />--%>   
                                      </div>
                             
                             
                           <asp:Table class="data table table-striped no-margin" ID="assetsViewTable"  runat="server">
                             
                            
                             
                               
                             
                           </asp:Table>
      </div>
                              


                                <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">


                                     <div style="overflow:auto;white-space:nowrap;">
       <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                  <th>Room No</th>
                                    <th>Select Inventory</th>
                                  <th>Edit inventory item (optional)</th>
                                  <th>Item Description</th>
                                  <th>Number Of Item</th>
                                 
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>
                                        
                                                 <asp:DropDownList  runat="server" class="form-control" ID="uroomno" name="aroomno" AutoPostBack="True" OnSelectedIndexChanged="roomSelectedIndexChange" required="required" >
                                                    
                                                   
                                         
                                               </asp:DropDownList>  
                                  
                                     </td>

                                    <td>
                                        <asp:DropDownList  runat="server" class="form-control" ID="roombranch" name="roombranch" AutoPostBack="True"  OnSelectedIndexChanged="inventorySelectedIndexChange" required="required">
                                                      
                                                   
                                         
                                               </asp:DropDownList> 
                                        
                                        
                                        
                                        </td>
                                  <td> <input type="text" id="ulabel" name="alabel"  placeholder="Edit inventory name" class="form-control " runat="server" /></td>
                                  <td>  <input type="text" id="udescription" name="adescription"  placeholder="Description" class="form-control " runat="server" data-validation="length alphanumeric" 
		 data-validation-length="3-100" 
		 data-validation-error-msg="Item description is required"/></td>
                                  <td>   <input type="number" id="uitemno" name="aitemno"  placeholder = "Number Of Items" class="form-control " runat="server"/></td>
                                  <td>
                                      <a href="#" class="btn btn-success" onserverclick="updateAssets_click" runat="server">Update</a>
                                        <%--<asp:Button ID="send" runat="server" Text="Update"  class="btn btn-success" OnClick="updateAssets_click" />--%>

                                  </td>
                                </tr>
                               
                              </tbody>
                            </table>
   <input type="hidden" id="inventoryId" name="inventoryId"   runat="server"/>

      </div>


                              </div>


           <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                             
                           <div class="form-group">
                        
                        <div class="col-md-6">
                            <label >Room No</label>
                          <select  id="rno" name="rno"  class="form-control col-md-7 col-xs-12" required="required">
                                     <option value=''>Select Room</option>
                                      <%  

                                        //  IQueryable<room> r = roomsclass.getAllRooms(bid);
                                          foreach (var x in r)
                                          { %>
                                         <option value='<%=x.Id %>'><%= x.room_no %></option>
                                       <%} %>
                                  </select>
                        </div>
                      </div>   


                        <div class="form-group">
                        
                        <div class="col-md-6">
                            <label >Item</label>
                          <input type="text" id="alabel" name="alabel" placeholder="Label" class="form-control " data-validation="length alphanumeric" 
		 data-validation-length="2-25" 
		 data-validation-error-msg="Enter item name "/>
                        </div>
                      </div>

                    
                    <div class="form-group">
                        
                        <div class="col-md-6">
                            <label >Item Description</label>
                          <input type="text" id="adescription" name="adescription"  placeholder="Description" class="form-control " data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter item description"/>
                        </div>
                      </div>
                              
                     
                <div class="form-group">
                        
                        <div class="col-md-6">
                            <label >Number of Item</label>
                          <input type="number" id="aitemno" name="insertaitemno"  placeholder="Number Of Items" class="form-control " min="1" required="required"/>
                        </div>
                      </div>
                            
                             
                           
                              <div class="form-group">
                        <div class="col-md-6">
                            <a href="#" onserverclick="saveAssets_click" class="btn btn-success" runat="server">Save</a>
                        <%--<asp:Button ID="SaveAssets" runat="server" OnClick="saveAssets_click" Text="Save" class="btn btn-success"/>--%>
                        </div>
                      </div>
                            </div>
         </div>

         </div>
        </div>
         </div>
         </div>
         </div>
    <%--  
     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>--%>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script>

  $.validate({
    modules : 'location, date, security, file',
    onModulesLoaded : function() {
      $('#country').suggestCountry();
    }
  });

  // Restrict presentation length
  $('#presentation').restrictLength( $('#pres-max-length') );

</script>     



</asp:Content>