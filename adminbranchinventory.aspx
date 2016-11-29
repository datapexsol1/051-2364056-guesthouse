<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.master" AutoEventWireup="true" CodeFile="adminbranchinventory.aspx.cs" Inherits="adminbranchinventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        
         function myFunction() {
             document.getElementById('ddbranchname').selectedIndex = 0;
             document.getElementById('dditemname').selectedIndex = 0;
             
            
         }
         $(document).ready(function () {

             //alert("hello");



         });
         //submitting temporary values in add panel 
         function submitTempValue(){

             $("input[name=alabel1]").val("abc");
             $("input[name=adescription]").val("abc");
             $("input[name=aitemno]").val(1);
             document.getElementById('<%=itemname.ClientID %>').value = '';
            document.getElementById('<%=itemdescription.ClientID %>').value = '';
            document.getElementById('<%=totalitem.ClientID %>').value = '';
             
         }
         function updateTempValue() {
            document.getElementById('<%=itemname.ClientID %>').value = 'abc';
            document.getElementById('<%=itemdescription.ClientID %>').value = 'abc';
            document.getElementById('<%=totalitem.ClientID %>').value = 1;
             $("input[name=alabel1]").val("");
             $("input[name=adescription]").val("");
             $("input[name=aitemno]").val("");

         }

         
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="Notify"></div>
<div class="right_col" role="main">
          <div class="">
    <div class="page-title">
              <div class="title_left">
                   <h3>Branch Assets</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                      <span class="input-group-btn">
                              <button class="btn btn-default" type="button" disabled="disabled">Select branch!</button>
                          </span>
                  <asp:DropDownList ID="brid" runat="server"  AutoPostBack="true" ClientIDMode="Static" OnSelectedIndexChanged="bridindexchange"  CssClass="form-control"></asp:DropDownList>

                    
                  </div>
                </div>
              </div>
            </div>
      <div class="clearfix"></div>

            <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <%--<h3>Branch Assets</h3>--%>
  <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true" onclick="myFunction()" >Branch Assets</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false" onclick="submitTempValue()" >Update Assets</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false"  onclick="updateTempValue()">Add Assets</a>
                          </li>
                            
                          
                        </ul>



     <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
     <div style="overflow:auto;">                                              
                         <div class="form-group col-md-6">

                        
                        
                             <%--<%  //get from session
                                  %>
                                   <input type="hidden" name="branch" id="branch" value=<%= bid%> />
                             --%>    
                      </div>

        
      
                                      </div>
                             
                           <asp:Table class="data table table-striped no-margin" ID="assetsViewTable"  runat="server">
                             
                            
                             
                               
                             
                           </asp:Table>
      </div>
                              

         <!--start of update activity-->
                                <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">


                                     <div style="overflow:auto;white-space:nowrap;">
       <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                  <th>Branch name</th>
                                    <th>Select Item</th>
                                  <th>Edit Item (Optional)</th>
                                  <th>Item Description</th>
                                  <th>Number Of Item</th>
                                 
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>
                                      <asp:DropDownList  runat="server" class="form-control" clientIdMode="static" ID="ddbranchname" name="ddbranchname" AutoPostBack="True" OnSelectedIndexChanged="branchNameSelectedIndexChange" >
                                      <Items>
                                           <asp:ListItem Text="Select" Value="" />
                                       </Items>
                                      </asp:DropDownList>
                                  </td>
                                  <td>
                                      <asp:DropDownList  runat="server" clientIdMode="static" class="form-control" ID="dditemname" name="dditemname" AutoPostBack="True" OnSelectedIndexChanged="itemNameSelectedIndexChange" >
                                          <Items>
                                           <asp:ListItem Text="Select" Value="" />
                                       </Items>
                                      </asp:DropDownList>
                                      <!--<select class="form-control" name="roombranch">
                                        <option value="0">Select</option>
                                        </select>-->
                                  </td>
                                  <td> <input type="text" id="itemname" name="itemname"  placeholder="Label" class="form-control " runat="server" data-validation="required" data-validation-error-msg="Item name is required !"/></td>
                                  <td>  <input type="text" id="itemdescription" name="itemdescription"  placeholder="Description" class="form-control " runat="server" data-validation="required" data-validation-error-msg="Item description is required !"/></td>
                                  <td>   <input type="number" id="totalitem" name="totalitem" min="1"  placeholder="Number Of Items" class="form-control " runat="server" data-validation="required" data-validation-error-msg="Total item is required !"/></td>
                                  <td>
                                      <%--<a href="#" onserverclick="updateBranchAssets_click" runat="server" class="btn btn-success">Update</a>--%>
                                        <asp:Button ID="send" runat="server" Text="Update" class="btn btn-success" OnClick="updateBranchAssets_click" />

                                  </td>
                                </tr>
                               
                              </tbody>
                            </table>
<input type="hidden" id="branchassets" name="branchassets" runat="server"/>
      </div>


                              </div>

         <!--end of update activity-->
           <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                             
                              
                        <div class="form-group col-md-6">

                        <label class="control-label col-md-4 " for="room no">Branch name<span class="required">*</span>
                        </label>
                         <% // int bid = employeeProfile.getEmployeBranch("kk");//get from session 

                             string bname = employeeProfile.getEmployeBranchname(Session["adminLogin"].ToString());%>
                                <div class="col-md-8">
                                      <input type="text" id="alabel" name="alabel" value="<%=bname %>" readonly="true" class="form-control "/>
                                    </div>
                             
                          </div>
                              <div class="form-group col-md-6">
                                    <label class="control-label col-md-4 " for="room no">Item  <span class="required">*</span> </label>
                                    <div class="col-md-8">
                                      <input type="text" id="alabel1" name="alabel1" placeholder="Label" class="form-control " data-validation="required"
		 data-validation-error-msg="Enter item name"/>
                                    </div>
                              </div>
                     

                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="room type">Item Description <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="text" id="adescription" name="adescription"  placeholder="Description" class="form-control " data-validation="required" 
		 data-validation-error-msg="Enter item description"/>
                        </div>
                      </div>
               
                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4" for="room size">Number of Item <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="number" id="aitemno" min="1" name="aitemno" data-validation="required" 

		 data-validation-error-msg="Enter item no"  placeholder="Number Of Items" class="form-control " />
                        </div>
                      </div>
                           
                              <div class="form-group">
                        <div class="col-md-6 col-md-offset-11">
                            <%--<a href="#" onserverclick="saveBAssets_click" runat="server" class="btn btn-success">Add</a>--%>
                        <asp:Button ID="SaveAssets" runat="server" OnClick="saveBAssets_click"  Text="SaveAssets" CssClass="btn btn-success" />
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
        
       
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script>
    function activaTab(tab) {

        $('.nav-tabs a[href="#' + tab + '"]').tab('show');

        //alert("working");
    };
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

