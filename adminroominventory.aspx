<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.master" AutoEventWireup="true" CodeFile="adminroominventory.aspx.cs" Inherits="adminroominventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
       <!-- jQuery -->
    <script>
        function activaTab(tab) {
            $('.nav-tabs a[href="#' + tab + '"]').tab('show');
            //alert("working");
        };
        function addval() {
            $("input[name=alabel]").val("abc");
            $("input[name=adescription]").val("abc");
            $("input[name=insertaitemno]").val(1);
            document.getElementById('<%=ulabel.ClientID %>').value = '';
            document.getElementById('<%=udescription.ClientID %>').value = '';
            document.getElementById('<%=uitemno.ClientID %>').value = '';
        }
        function addinupdatepanel() {
            //$<%=ulabel.ClientID%>.val("abc");
            //$("input[name=ulabel]").val("abc");
            document.getElementById('<%=ulabel.ClientID %>').value = 'abc';
            document.getElementById('<%=udescription.ClientID %>').value = 'abc';
            document.getElementById('<%=uitemno.ClientID %>').value = 1;
            $("input[name=alabel]").val("");
            $("input[name=adescription]").val("");
            $("input[name=insertaitemno]").val('');
        }
    </script>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <div id="Notify"></div>
   <div class="right_col" role="main">
          <div class="">
    <div class="page-title">
              <div class="title_left">
                   <h3>Room Assets</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                      <span class="input-group-btn">
                              <%--<button class="btn btn-default" type="button" disabled="disabled">Select branch!</button>--%>
                          </span>
                 <asp:DropDownList ID="brid" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="branchindexchange"  CssClass="form-control" ClientIDMode="Static"></asp:DropDownList>

<%--                  <asp:DropDownList ID="DropDownList1" runat="server"  AutoPostBack="true" ClientIDMode="Static"  CssClass="form-control"></asp:DropDownList>--%>

                    
                  </div>
                </div>
              </div>
            </div>
      <div class="clearfix"></div>
                <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">

         <div class="" role="tabpanel" data-example-id="togglable-tabs">
              <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="false">Room Assets</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false" onclick="addval()">Update Assets</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false" onclick="addinupdatepanel()">Add Assets</a>
                          </li>
                            
                          
                        </ul>
             </div>
          <div id="myTabContent" class="tab-content">

              <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                  <%  if (brid.SelectedValue != "Select Branch")
    {
        int bid = branchClass.getBranchID(brid.SelectedValue);%>
                                   <input type="hidden" name="branch" id="branch"  runat="server"/>
                              <%  

        IQueryable<room> r = roomsclass.getAllRooms(bid);

    %>
                                           
                                
                      
                             <b>Select Room no</b>
         <asp:DropDownList runat="server" ID="ddRoomNo" AutoPostBack="True" CssClass="form-control col-md-7 col-xs-12" OnSelectedIndexChanged="ddRoomNoSelectedIndexChanges">
                              
                             </asp:DropDownList>     
           
                             
                           <asp:Table class="data table table-striped no-margin" ID="assetsViewTable"  runat="server">
                             
                            
                             
                               
                             
                           </asp:Table>
              </div>
               <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
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
                                        
                                                 <asp:DropDownList  runat="server" class="form-control" ID="uroomno" name="aroomno" AutoPostBack="True" OnSelectedIndexChanged="roomSelectedIndexChange" >
                                                    
                                                   
                                         
                                               </asp:DropDownList>  
                                  
                                     </td>

                                    <td>
                                        <asp:DropDownList  runat="server" class="form-control" ID="roombranch" name="roombranch" AutoPostBack="True"  OnSelectedIndexChanged="inventorySelectedIndexChange">
                                                      
                                                   
                                         
                                               </asp:DropDownList> 
                                        
                                        
                                        
                                        </td>
                                  <td> <input type="text" id="ulabel" name="ulabel" data-validation="required" data-validation-error-msg="Inventory name is required !"  placeholder="Edit inventory name" class="form-control " runat="server" /></td>
                                  <td>  <input type="text" id="udescription" name="udescription"  placeholder="Description" class="form-control " runat="server" data-validation="required" 
		 data-validation-error-msg="Item description is required"/></td>
                                  <td>   <input type="number" id="uitemno" name="uitemno"  placeholder = "Number Of Items" class="form-control " runat="server" data-validation="required" data-validation-error-msg="No. if item is required !"/></td>
                                  <td>
                                      <%--<a href="#" class="btn btn-success" onserverclick="updateAssets_click" runat="server">Update</a>--%>
                                        <asp:Button ID="send" runat="server" Text="Update" class="btn btn-success" OnClick="updateAssets_click" />

                                  </td>
                                </tr>
                               
                              </tbody>
                            </table>
   <input type="hidden" id="inventoryId" name="inventoryId"   runat="server"/>
                   </div>
              <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                                            
                   
                        <div class="form-group">
                        
                        <div class="col-md-6">
                            <label >Room No</label>
                          <select  id="rno" name="rno"  class="form-control col-md-7 col-xs-12" >
                                     <option value=''>Select Room</option>
                                      <%  

                                          //  IQueryable<room> r = roomsclass.getAllRooms(bid);
                                          foreach (var x in r)
                                          { %>
                                         <option value='<%=x.Id %>'><%= x.room_no %></option>
                                       <%}
                                           } %>
                                  </select>
                        </div>
                      </div>   
                   <div class="form-group">
                        
                        <div class="col-md-6">
                            <label >Item</label>
                          <input type="text" id="alabel" name="alabel" placeholder="Label" class="form-control "/>
                        </div>
                      </div>

                    
                    <div class="form-group">
                        
                        <div class="col-md-6">
                            <label >Item Description</label>
                          <input type="text" id="adescription" name="adescription"  placeholder="Description" class="form-control " data-validation="required"
		 data-validation-error-msg="Item description is required !"/>
                        </div>
                      </div>
                              
                     
                <div class="form-group">
                        
                        <div class="col-md-6">
                            <label >Number of Item</label>
                          <input type="number" id="aitemno" name="insertaitemno" data-validation="required" 
		 data-validation-error-msg="No of item is required !" placeholder="Number Of Items" class="form-control " min="1" />
                        </div>
                      </div>
                            
                             
                           
                              <div class="form-group">
                        <div class="col-md-6">
                            <%--<a href="#" onserverclick="saveAssets_click" class="btn btn-success" runat="server">Save</a>--%>
                        <asp:Button ID="SaveAssets" runat="server" OnClick="saveAssets_click" Text="Save" class="btn btn-success"/>
                        </div>
                      </div>
                  </div>

          </div></div>
         </div>
         </div>
         </div>
         </div>
              </div>

</asp:Content>

