<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeerooms.aspx.cs" Inherits="employeerooms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


   <style>
       .tbl{
           margin-left:-20px;
       }
   </style>
   
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     

  

      <div class="right_col" role="main">
          
       
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
          <div id="Notify"></div>
  
             <div class="messagealert" id="alert_container"  style=" opacity: 0;transition: visibility 0s 2s, opacity 2s linear;">  </div> 
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Rooms</h3>
          <div class="container">
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Rooms</a></li>
                          
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false" onclick="insertupdatevalues()">Add Rooms</a></li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false" onclick="InsertAddRoomsValues()">Update Rooms</a></li>

                          
                        </ul>
                        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">




                    




                              <div class="table-responsive">


                            <!-- start recent activity -->
                           
                           <table  class="table table-condensed">
                              <thead >
                                <tr>
                                  <th>Room No</th>
                                  <th>Room Type</th>
                                  <th>Room Size</th>
                                  <th>Room Rent</th>
                                  <th>Branch</th>
                                    <th>Availbilty</th>
                                </tr>
                              </thead>
                              <tbody>
                                  <%  IQueryable<room> branchRooms=roomsclass.getAllRooms(employeeProfile.getEmployeBranch(Session["loginName"].ToString()));
                                      foreach (var r in branchRooms)
                                      { %>
                                <tr>
                                  <td><label id="froomid"><%=r.room_no%></label></td>
                                  <td><label id="froomtype"><%=r.room_type %></label></td>
                                  <td><label id="froomsize"><%=r.room_size%></label></td>
                                  <td> <label id="froomrent"><%=r.maximum_room_rent %></label></td>
                                  <td><label id="froombranch"><%=r.branch_id %></label></td>
                                    <% if (r.availbilty == "yes")
                                        { %>
                                              <td><label id="availbiltyroomy" style="color:green">Available</label></td>
                                              <%}
                                                else
                                                { %>
                                              <td><label id="availbiltyroomn" style="color:red">Booked</label></td>
                                               <%} %>
                                </tr>
                                  <%} %>
                               
                              </tbody>
                            </table>
                            <!-- end recent activity -->
                              
                 </div>
                 </div>
                         
                            
                            
                          <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                             
                              
                                   <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="room no">Room No <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="text" id="roomno" name="roomno"  placeholder="Room No" class="form-control "  data-validation="required" 
		 data-validation-error-msg="Room no is required !"/>
                        </div>
                      </div>

                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="room type">Room Type <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="text" id="roomtype" name="roomtype" data-validation="required" 
		 data-validation-error-msg="Room Type is required !" placeholder="Room type" class="form-control "/>
                        </div>
                      </div>
                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="room size">Room Size <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="text" id="roomsize" name="roomsize"  placeholder="Room size" class="form-control " data-validation="required" 

		 data-validation-error-msg="Room size is not in correct format"/>
                        </div>
                      </div>
                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="room rent">Max Room Rent <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="number" id="roommaxrent" name="roommaxrent"  placeholder="Room rent max" class="form-control "
                              min="0" data-validation="required" 
		 data-validation-error-msg="Maximum room rent is required !"/>
                        </div>
                      </div>
                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="room rent">Min Room Rent <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="number" id="roomminrent" name="roomminrent"  placeholder="Room Rent" class="form-control "
                              min="0" data-validation="required" 
		 data-validation-error-msg="Minimum room rent is required !"/>
                        </div>
                      </div>
                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4 " for="branch no">Branch <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                        <select class="form-control" name="roombranch" >
                             <option value="">Select</option>
                             <% IQueryable<branch> brachdata=branchClass.getBrachesinfo();
                                          foreach (var b in brachdata)
                                          {%>
                                      <option value='<%=b.Id %>'>   <%=b.city %></option>
                                      <%} %>
                            </select>
                        </div>
                      </div>
                              <div class="form-group">
                        <div class="col-md-6 col-md-offset-1">
                          <asp:Button ID="saveroom" runat="server" Text="Save Room" OnClick="saveroom_click" CssClass="btn btn-success" />
                        </div>
                      </div>
                           
                              
                              
                              
                              
                              
                          </div>
                            <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                                <div class="form-group col-md-12">
                                    <label>Select room</label>
                                      <asp:DropDownList runat="server" ID="ddRoomNo" ClientIDMode="Static" OnSelectedIndexChanged="ddRoomNoIndexChanged" AutoPostBack="true"  CssClass="btn btn-default">
                                      </asp:DropDownList> 
                                </div>
                                <div class="row">
                                  <div class="form-group col-md-6">
                                    <label class="control-label col-md-4 " for="room rent">Room No (optional) <span class="required">*</span></label>
                                    <div class="col-md-8">
                                      <input type="text" id="roomnoupdate" name="roomnoupdate" runat="server" placeholder="Select Room no" class="form-control "/>
                                    </div>
                                  </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label col-md-4 " for="room rent">Room type (optional) <span class="required">*</span></label>
                                    <div class="col-md-8">
                                      <input type="text" id="roomtypeupdate" name="roomtypeupdate" runat="server"  placeholder="Select Room type" class="form-control "/>
                                    </div>
                                  </div>
                                    </div>
                                
                                <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label col-md-4 " for="room rent">Minimum Room rent (optional) <span class="required">*</span></label>
                                    <div class="col-md-8">
                                      <input type="number" id="roomminrentupdate" name="roomminrentupdate" runat="server"  placeholder="Select minimum Room Rent" class="form-control "/>
                                    </div>
                                  </div>
                                    <div class="form-group col-md-6">
                                    <label class="control-label col-md-4 " for="room rent">Maximum Room rent (optional) <span class="required">*</span></label>
                                    <div class="col-md-8">
                                      <input type="number" id="roommaxrentupdate" name="roommaxrentupdate" runat="server"  placeholder="Select maximum Room type" class="form-control "/>
                                    </div>
                                  </div>
                                    </div>
                                <div class="row">
                                  <div class="form-group col-md-6">
                                    <label class="control-label col-md-4 " for="room rent">Room Size (optional) <span class="required">*</span></label>
                                    <div class="col-md-8">
                                      <input type="text" id="roomsizeupdate" name="roomsizeupdate" runat="server" placeholder="Select Room size" class="form-control "/>
                                    </div>
                                  </div>
                                    </div>
                                <asp:Button runat="server" Text="Update" OnClick="updateRoomInfo" CssClass="btn btn-success" />
                          </div>
                            
                        </div>
       
                      </div>
                  
         </div>
         </div>
         </div>
        </div>
          </div>
    </div>
     <%--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>--%>
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
  function activaTab(tab) {

      $('.nav-tabs a[href="#' + tab + '"]').tab('show');

      //alert("working");
  };
</script>

      <!-- jQuery -->
   <%-- <script src="../vendors/jquery/dist/jquery.min.js"></script>
  --%>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- morris.js -->
    <script src="../vendors/raphael/raphael.min.js"></script>
    <script src="../vendors/morris.js/morris.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="js/moment/moment.min.js"></script>
    <script src="js/datepicker/daterangepicker.js"></script>
    

   <script>
       function InsertAddRoomsValues() {
           //alert("update");
           $("input[name=roomno]").val("000");
           $("input[name=roomtype]").val("000");
           $("input[name=roomsize]").val("000");
           $("input[name=roommaxrent]").val("000");
           $("input[name=roomminrent]").val("000");
           $("input[name=roombranch]").val("Islamabad");
        <%--   $("<%=ddRoomNo.ClientID%>").val("Select");
           $("<%=roomnoupdate.ClientID%>").val("");
           $("<%=roomtypeupdate.ClientID%>").val("");
           $("<%=roomminrentupdate.ClientID%>").val("");
           $("<%=roommaxrentupdate.ClientID%>").val("");
           $("<%=roomsizeupdate.ClientID%>").val("");--%>
           //     alert("hello");
       
       }
       function insertupdatevalues() {
           //alert("add panel");
           $("<%=roomnoupdate. MaxL ength,%>").val("101");
           $("input[name=roomnoupdate]").val("123");
           $("input[name=roomtypeupdate]").val("123");
           $("input[name=roomminrentupdate]").val("123");
           $("input[name=roommaxrentupdate]").val("123");
           $("input[name=roomsizeupdate]").val("123");
           <%--<% 
       int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
       room rm = roomsclass.getroom(bid);
       ddRoomNo.Text = rm.room_no;
       room rm1 = roomsclass.getRoomInfo(ddRoomNo.Text, bid);
       roomnoupdate.Value = rm1.room_no;
       roomtypeupdate.Value = rm1.room_type;
       roomminrentupdate.Value = rm1.minimum_room_rent;
       roommaxrentupdate.Value = rm1.maximum_room_rent;
       roomsizeupdate.Value = rm1.room_size;
       %>--%>
           //$("input[name=roomno]").val("");
           //$("input[name=roomtype]").val("");
           //$("input[name=roomsize]").val("");
           //$("input[name=roommaxrent]").val("");
           //$("input[name=roomminrent]").val("");
           //$("input[name=roombranch]").val("");

       }
   </script>
   
</asp:Content>

