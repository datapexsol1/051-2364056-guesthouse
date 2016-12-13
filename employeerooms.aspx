<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeerooms.aspx.cs" Inherits="employeerooms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

 

   <style>
       .tbl{
           margin-left:-20px;
       }
   </style>
   <script>
     
       
              function activaTab(tab) {

                  $('.nav-tabs a[href="#' + tab + '"]').tab('show');
                  $('#updateroomavalibilty').hide();


           //alert("working");
       };


              function showupdatediv(tab) {
                  readonlytrue();
                  $('.nav-tabs a[href="#' + tab + '"]').tab('show');
                  $('#roomavalibilty').hide("slow", function () { });
                  
                  //alert("working");
              };
              //function bookingtabactivate(tab) {

              //    $('.nav-tabs a[href="#' + tab + '"]').tab('show');

              //    //alert("working");
              //};
              function InsertAddRoomsValues() {
           $("input[name=roomno]").val("000");
           $("input[name=roomtype]").val("000");
           $("input[name=roomsize]").val("000");
           $("input[name=roommaxrent]").val("000");
           $("input[name=roomminrent]").val("000");
           $("input[name=roombranch]").val("Islamabad");

           //document.getElementById("roomno").value = "abc";
           //document.getElementById("roomtype").value = "abc";
           //document.getElementById("roomsize").value = "abc";
           //document.getElementById("roommaxrent").value = "123";
           //document.getElementById("roomminrent").value = "123";
           //document.getElementById("roombranch").value = "Islamabad";
           //alert("hello");
       }
       function removeValue() {
           $("input[name=roomno]").val("");
           $("input[name=roomtype]").val("");
           $("input[name=roomsize]").val("");
           $("input[name=roommaxrent]").val("");
           $("input[name=roomminrent]").val("");
           $("input[name=roombranch]").val("");
       }
       function readonlyfalse() {
           // alert("working");
           $('#<%=roomnonew.ClientID%>').removeAttr('value');
           $('#btncancel').hide();
           $('#btnupdatebooking').hide();
           $('#<%=btnupdate.ClientID%>').show(); 
           //  $('#comments').removeAttr("readonly");
           if ($('#<%=comments.ClientID%>').attr("disabled", true)) {
               $('#<%=comments.ClientID%>').attr("disabled", false);
           }
           $("#<%=btnupdate.ClientID%>").val('Cancel');
           if ($("#comments").attr("readonly", false)) {
               $("#comments").attr("readonly", true);
           };
       }
       function readonlytrue() {
            $('#<%=btnupdate.ClientID%>').hide();
       $('#<%=checkindate.ClientID%>').attr("disabled", true);
           $('#<%=checkoutdate.ClientID%>').attr("disabled", true);
       <%-- $('#<%=gname.ClientID%>').attr("disabled", true);
        $('#<%=cnicno.ClientID%>').attr("disabled", true);
        $('#<%=gphone.ClientID%>').attr("disabled", true);
        $('#<%=gemail.ClientID%>').attr("disabled", true);
        $('#<%=noofguest.ClientID%>').attr("disabled", true);
        $('#<%=roomrent.ClientID%>').attr("disabled", true);
        $('#<%=referanceby.ClientID%>').attr("disabled", true);
        $('#<%=referancephone.ClientID%>').attr("disabled", true);
        $('#<%=roomnonew.ClientID%>').attr("disabled", true);
        $('#<%=comments.ClientID%>').attr("disabled", true);
           $('#<%=comments.ClientID%>').attr("disabled", true);--%>
       }
       function btnupdatefunctions() {
           //alert("sdasd");
           //InsertAddRoomsValues();
           alert($('#<%=gname.ClientID %>').val()+"checking");
       }
   </script>
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hroomno" runat="server" />

  
        <div id="Notify"></div>
     <div class="messagealert" id="alert_container"  style=" opacity: 0;transition: visibility 0s 2s, opacity 2s linear;">  </div> 

      <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Rooms</h3>
          <div class="container">
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Rooms</a></li>
                          
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false" onclick="removeValue()">Add Rooms</a></li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false" onclick="InsertAddRoomsValues()">Update Rooms</a></li>

                          
                        </ul>
                        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">




                    







                            <!-- start recent activity -->
                           <div id="roomavalibilty">
                           <table class="table tbl">
                              <thead class="thead-inverse">
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
    {
        if (r.temporarybooked == "yes")
        {
                                                       %>
                                              <td><label id="availbiltyroomn" style="color:red">Temporary Booked</label></td>
                                           <%--//dnt change any thing in error its working --%>
                                             <td><label id="Updateroomg"><input type="button" id="<%=r.room_no %>" class="xyz" value="Cancel/Detail"  </label>
                                                 
                                                 <label id="Updateroombooking"><input type="button" id="bookbutton" value="Book"/></label></td>

                                            
                                                    

                                                
                                   
                                               <%}
    else
    {
                                                     %>
                                              <td><label id="availbiltyroomn" style="color:red">Booked</label></td>
                                               <%}
    }%>
                                </tr>
                                  <%} %>
                               
                              </tbody>
                            </table>
                               </div>
                              <div id="updateroomavalibilty">
                                    <h1>Booking Detail</h1>
                                     <div id="s2">
 <div  class="form-vertical">

     <div class="form-group">
                            
                           
                          <%--</div>

                          <div class="form-group">--%>
                           
                            <div class="item col-md-6 col-sm-4 col-xs-12">
                                 <label >Check In Date<span class="required">*</span>
                            </label>
                              <%--<input type="text" class="form-control has-feedback-left" id="Arrival" placeholder="First Name" aria-describedby="inputSuccess2Status2">--%>

                              <input type="text" runat="server" id="checkindate" name="checkindate" class="form-control col-md-7 col-xs-12" readonly="readonly" />
                            </div>
                 
                            
                            <div class="item col-md-6 col-sm-4 col-xs-12">
                                 <label >Check out Date<span class="required">*</span>
                            </label>
                              <%--<input type="text" class="form-control has-feedback-left" id="Arrival" placeholder="First Name" aria-describedby="inputSuccess2Status2">--%>

                              <input type="text" id="checkoutdate" runat="server" name="checkoutdate" class="form-control col-md-7 col-xs-12" readonly="readonly"/>
                            </div>
                         
                  </div>

                          <div class="form-group">
                          <%--</div>
                            
                          <div class="form-group">--%>
                            
                            <div class="item col-md-4 col-sm-4 col-xs-12">
                                <label>Guest Name <span class="required">*</span>
                            </label>
                              <input type="text" id="gname" name="gname"  runat="server"  class="form-control col-md-7 col-xs-12" readonly="readonly" />
                            </div>
                          

                          
                          
                          <%--</div>
                          <div class="form-group">--%>
                           


                                  <div class="item col-md-4 col-sm-4 col-xs-12">
                                                            <label>N.I.C No / Passport <span class="required"/>*</span>
                            </label>
                              <input type="text" id="cnicno" name="cnicno"  runat="server"   class="form-control col-md-7 col-xs-12" readonly="readonly" />
                            </div>


                          
                          </div>
                            
                          <div class="form-group">

                        
                          <%--</div>

                            <div class="form-group">--%>
                           
                            <div class="form-group">
                             
                           <div class="item col-md-4 col-sm-4 col-xs-12">
                                 <label >Guest Phone <span class="required">*</span>
                            </label>
                              <input type="number"  id="gphone" name="gphone"  runat="server"  class="form-control col-md-7 col-xs-12" readonly="readonly"   />
                            </div>
                          <%--</div>

                             <div class="form-group">--%>
                                
                        
                          
                          </div>

                          

                            <div class="form-group">
                            
                         
                          <%--</div>

                             <div class="form-group">--%>
                                 <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >Guest Email <span class="required">*</span>
                            </label>
                              <input type="text" id="gemail" name="gemail"  runat="server" class="form-control col-md-7 col-xs-12" readonly="readonly"/>
                            </div>
                                 <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >No of Guest<span class="required">*</span>
                            </label>
                              <input type="text" id="noofguest" name="noofguest"   runat="server" class="form-control col-md-7 col-xs-12" readonly="readonly"/>
                            </div>
                          </div>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                             <label>Room_Rent <span class="required">*</span>
                            </label>
                              <input type="text" id="roomrent" name="roomrent"  runat="server"  class="form-control col-md-7 col-xs-12" readonly="readonly"/>
                            </div>

                          </div>

                            <div class="form-group">
                          
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                  <label>Referance by</label>
                              <input id="referanceby" name="referanceby"  runat="server" class="form-control col-md-7 col-xs-12" type="text" readonly="readonly" />
                            </div>
                          <%--</div>

                            <div class="form-group">--%>

                          
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                  <label>Referance by phone</label>
                              <input id="referancephone" name="referancephone"  runat="server" class="form-control col-md-7 col-xs-12" type="text" readonly="readonly" />
                            </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                  <label>Selected Room No</label>
                              <input id="roomnonew" name="roomnonew"  runat="server" class="form-control col-md-7 col-xs-12" type="text" readonly="readonly"/>
                            </div>
                                <div class="col-md-12 col-sm-4 col-xs-12">
                                  <label>Comments</label>
                              <textarea id="comments" name="comments"   runat="server" class="form-control col-md-7 col-xs-12" readonly="readonly"  >Comments:</textarea>
                            </div>

                                  <div class="col-md-12 col-sm-8 col-xs-12">
                            
                                      <asp:HiddenField ID="tbookingid" runat="server" />
                            </div>
                          </div>



     

     </div>
    </div>
                                  <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="updateTempbooking_click" OnClientClick="btnupdatefunctions();" UseSubmitBehavior="false" />
                                       
                                  <input type="button" id="btncancel"  value="Cancel Booking" onclick="readonlyfalse()" />    
                                  <input type="button" id="btnupdatebooking"  value="Update Booking"  onclick="readonlytrue()"/> 
                                     
                            </div>
                                 
                                 
                                 

                              </div>
                            <!-- end recent activity -->
                              
                            
                 
                         
                            
                            
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
                                      <asp:DropDownList runat="server" ID="ddRoomNo" ClientIDMode="Static" OnSelectedIndexChanged="ddRoomNoIndexChanged" AutoPostBack="true" data-validation="required" required="required"
		 data-validation-error-msg="Room no is required !"  CssClass="btn btn-default">
                                      </asp:DropDownList> 
                                </div>
                                <div class="row">
                                  <div class="form-group col-md-6">
                                    <label class="control-label col-md-4 " for="room rent">Room No (optional) <span class="required">*</span></label>
                                    <div class="col-md-8">
                                      <input type="text" id="roomnoupdate" name="roomnoupdate" readonly runat="server" placeholder="Select Room no"  class="form-control "/>
                                    </div>
                                  </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label col-md-4 " for="room rent">Room type (optional) <span class="required">*</span></label>
                                    <div class="col-md-8">
                                      <input type="text" id="roomtypeupdate" name="roomtypeupdate" runat="server"  placeholder="Select Room type" class="form-control " data-validation="required" 
		 data-validation-error-msg="Room type is required !"/>
                                    </div>
                                  </div>
                                    </div>
                                
                                <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label col-md-4 " for="room rent">Minimum Room rent (optional) <span class="required">*</span></label>
                                    <div class="col-md-8">
                                      <input type="number" id="roomminrentupdate" data-validation="required" 
		 data-validation-error-msg="Minimum room rent is required !" name="roomminrentupdate" runat="server"  placeholder="Select minimum Room Rent" class="form-control "/>
                                    </div>
                                  </div>
                                    <div class="form-group col-md-6">
                                    <label class="control-label col-md-4 " for="room rent">Maximum Room rent (optional) <span class="required">*</span></label>
                                    <div class="col-md-8">
                                      <input type="number"  data-validation="required" 
		 data-validation-error-msg="Max room rent is required !" id="roommaxrentupdate" name="roommaxrentupdate" runat="server"  placeholder="Select maximum Room type" class="form-control "/>
                                    </div>
                                  </div>
                                    </div>
                                <div class="row">
                                  <div class="form-group col-md-6">
                                    <label class="control-label col-md-4 " for="room rent">Room Size (optional) <span class="required">*</span></label>
                                    <div class="col-md-8">
                                      <input type="text" id="roomsizeupdate"  data-validation="required" 
		 data-validation-error-msg="RoomSize is required !" name="roomsizeupdate" runat="server" placeholder="Select Room size" class="form-control "/>
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
   
   
    $(document).ready(function () {
       
        if ($('#<%=hroomno.ClientID%>').val() == "") {
            $('#updateroomavalibilty').hide();
        }
       

        $('#<%=checkindate.ClientID%>').daterangepicker({
            singleDatePicker: true,
            calender_style: "picker_2",
            showDropdowns: true,
            
        });
        ///dob 
        $('#<%=checkoutdate.ClientID%>').daterangepicker({
            //singleDatePicker: true,
            // calender_style: "picker_2"
            singleDatePicker: true,
            showDropdowns: true,
           
           
        });
        //
          
        //
        $(".xyz").click(function() {
            $('#<%=hroomno.ClientID%>').val(this.id);

            $('#roomavalibilty').hide("slow", function () {});
           
           $('#updateroomavalibilty').show(2000);
           
           __doPostBack("mybtn", roomno)
          
       });
         
       
       
       
       
       
      
       

    });




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

  
</asp:Content>

