<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeshiftroom.aspx.cs" Inherits="employeerooms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
 <link rel="stylesheet" href="css/seatlayout.css" />
    <script>
        
        imgseaterArr = new Array();
        for (var i = 0; i < 100; i++) {
            imgseaterArr[i] = new Array('layoutimg/images/open_door.png', 'layoutimg/images/closed_door.png');
            
          
        }
        
      

        
    </script>

   <style>
       .tbl{
           margin-left:-20px;
       }
   </style>
   <script>
         function showavalibaleroom(id,roomno,roomrent) {

            $('#<%=hbid.ClientID%>').val(id);
             $('#<%=hroomno.ClientID%>').val(roomno);
             $('#newroomrent').val(roomrent);
            
           $('#roomavalibilty').hide("slow", function () { });
           $('#updateroomavalibilty').show(2000);
           
          
         };
      
              function activaTab(tab) {

                  $('.nav-tabs a[href="#' + tab + '"]').tab('show');
                  $('#updateroomavalibilty').hide();


           //alert("working");
       };


              function showupdatediv(tab) {

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
           alert("working");
         //  $('#comments').removeAttr("readonly");
           if ($("#comments").attr("readonly", false)) {
               $("#comments").attr("readonly", true);
           };
       }
       function readonlytrue() {
           $("#comments").attr("readonly", true);
       }
       function btnupdatefunctions() {
           alert("sdasd");
           InsertAddRoomsValues();
       
       }
   </script>
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="hroomno" runat="server" />
    <asp:HiddenField ID="hbid" runat="server" />

  
        <div id="Notify"></div>
     <div class="messagealert" id="alert_container"  style=" opacity: 0;transition: visibility 0s 2s, opacity 2s linear;">  </div> 

      <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-12 col-sm-12 col-xs-12">
        
          <div class="container">
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        
                        <div id="myTabContent" class="tab-content">
                            <!-- start recent activity -->
                           <div id="roomavalibilty" class="table-responsive">
                                <h3>Rooms</h3>
                           <table class="table">
                              <thead class="thead-inverse">
                                <tr>
                                    <th></th>
                                    <th>RegNO</th>
                                  <th>Name</th>
                                  <th>Cnic/Passort</th>
                                  <th>Phone</th>
                                  <th>Room Rent</th>
                                  <th>CheckInDate</th>
                                    <th>Roomno</th>
                                     <th>Nationality</th>
                                    

                                </tr>
                              </thead>
                              <tbody>
    <input id="idhidden" type="hidden" />
                                  <%    List<bookingroomdetailclass> rb= bookingRoomClass.Getbookingandroomdetail(employeeProfile.getEmployeBranch(Session["loginName"].ToString()));
                                      foreach (bookingroomdetailclass r in rb)
                                      { %>
                                <tr>
                                    <td><label id="<%=r.booking_id %>" onclick="showavalibaleroom(this.id,<%=r.b_roomno %>,<%=r.booking_rent %>);" style="color:green" >ShiftRoom</label></td>
                                   <td><label id="regno"><%=r.g_reg_no%></label></td>
                                    <td><label id="froomid"><%=r.g_guest_name%></label></td>
                                  <td><label id="froomtype"><%=r.g_cnic_orpassport %></label></td>
                                  <td><label id="froomsize"><%=r.phone%></label></td>
                                  <td> <label id="froomrent<%=r.b_roomno%>"><%=r.booking_rent%></label></td>
                                  <td><label id="checkindate"><%=r.b_checkinDate%></label></td>
                                    <td><label id="roomno"><%=r.b_roomno%></label></td>
                                    <%string nationality;
                                        if (r.g_f_nationality == null)
                                        {
                                            nationality = "pakistani";
                                        }
                                        else
                                        {
                                            nationality = r.g_f_nationality;
                                        } %>
                                     <td><label id="froombranch"><%=nationality%></label></td>
                                   
                                  
                                   
                                  
                                              
                                             
   
                                </tr>
                                  <%} %>
                               
                              </tbody>
                            </table>
                               </div>
                              <div id="updateroomavalibilty">
                                    <h1>Room Shift</h1>
                                     <div id="s2">
 <div  class="form-vertical">

     <div class="form-group">
                            
                           
                         <div class="right_col" role="main" align="center">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h1 >Room Selection</h1>
         <hr  style="width:50%;border-color:#800000;border-width: 4px;"/>
         <br /><br />
         <input type="button" value="BookedRoom Shift" id="brshift"/>
    <div class="" role="tabpanel" data-example-id="togglable-tabs" >
  
        
    <div id="form1" >
    <table frame='box'>
  <%   IQueryable<room> rooms = roomsclass.getAvailableRooms(employeeProfile.getEmployeBranch(Session["loginName"].ToString())); %>
    <h2 > Available Rooms</h2>
    <tr style="min-width: 400px;border:none"> 
      <%foreach (var r in rooms)
        {  %>
              <% if (r.availbilty == "yes")
                  {
                     %>
                    <td style="    padding: 0;float: left;padding: 22px;">
                        <div class="container">
                            <div class="row">
                                
                        <div id='c_b'  >
                            <label style="text-align:center" >
                                <img name='img' id='imge<%=r.room_no %>'  src='layoutimg/images/open_door.png' onclick='swapImage("imge<%=r.room_no %>","layoutimg/images/open_door.png","layoutimg/images/closed_door.png") 'width="45"  class='  imagehover'/>
                       <input type='checkbox' class='checkbox' name='chkchk[]' id='' value="<%=r.room_no %>"  style='visibility:hidden'/>
                                <%=r.room_no %>
                            </label>
                            </div>
                                    </div>
                        </div>
                            
        </td> 
                   <%} %>

                   <%else
    {%> 
               
               <td><div class='container_un'><img src='images/ac_semi_sleeper_unavailable.jpg'/></div></td>;

                   <%}
    }%>
        </tr>
        <tr>
             
      
       
     
    </tr>
   
</table>
        <br /><br />
        <h2>Selected Rooms</h2>
       <%
           int totalNoOfRooms = roomsclass.getAvailableRoomNos(employeeProfile.getEmployeBranch(Session["loginName"].ToString()));
           if (totalNoOfRooms >= 1)
           {
               %>
        <%--<div class="row">
         <div class="col-md-12 col-sm-12 col-xs-12">--%>
          <div class="form-group col-md-12  col-sm-12 col-xs-12">
                            
                            <label class="control-label col-md-4  col-sm-6 col-xs-12">New Room <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                               
                                         <input id="t" type="text" name='roomselected' class='input' placeholder="Select room" required="required" /> 

                            </div>
            
                          
                          </div>
           
              <div class="form-group col-md-12  col-sm-12 col-xs-12">
               <label class="control-label col-md-4  col-sm-6 col-xs-12" for="first-name">RoomRent <span class="required">*</span>
                            </label>
                            <div class="col-md-6  col-sm-6 col-xs-12">
                               
                            <input id="newroomrent" type="text" name="newroomrent" class='input' placeholder="Room Rent" /> 
                            </div>
                          </div>
                         <%-- </div>
        </div>--%>
    
        <%        }
    else
    {
         %>
         <h3> No rooms Available</h3>

 <%   }%>



        </div>

        <!-- Inhouse Transfer-->

   

    </div>
         <br />
   <a id="linktopage" name="linktopage" class="btn btn-success" >Book Room</a>
    </div></div></div></div></div>
                           
                           
                          </div>



     

     </div>
    </div>
                                 
                                     
                            </div>
                            
                                <!--inhouse Roomshift start--> 
                            <div id="updatebookedroom">
                                    <h1>Room Shift</h1>
                                     <div id="s2">
 <div  class="form-vertical">

     <div class="form-group">
                            
                           
                         <div class="right_col" role="main" align="center">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h1 >Room Selection</h1>
         <hr  style="width:50%;border-color:#800000;border-width: 4px;"/>
         <br /><br />
         <input type="button" value="BookedRoom Shift" id="rshift"/>
    <div class="" role="tabpanel" data-example-id="togglable-tabs" >
   <div id="form1" >
    <table frame='box'>
  <%   IQueryable<room> roomsbooked = roomsclass.getBookedROoms(employeeProfile.getEmployeBranch(Session["loginName"].ToString())); %>
    <h2 > Available Rooms</h2>
    <tr style="min-width: 400px;border:none"> 
      <%foreach (var r in roomsbooked)
        {  %>
              <% if (r.availbilty == "no")
                  {
                     %>
                    <td style="    padding: 0;float: left;padding: 22px;">
                        <div class="container">
                            <div class="row">
                                
                        <div id='c_b1'  >
                            <label style="text-align:center" >
                                <img name='img' id='imge1<%=r.room_no %>'  src='layoutimg/images/closed_door.png' width="45"  class='  imagehover'/>
                       <input type='checkbox' class='checkbox' name='chkchk[]' id='' value="<%=r.room_no %>"  style='visibility:hidden'/>
                                <%=r.room_no %>
                            </label>
                            </div>
                                    </div>
                        </div>
                            
        </td> 
                   <%} %>

                   <%else
    {%> 
               
               <td><div class='container_un'><img src='images/ac_semi_sleeper_unavailable.jpg'/></div></td>;

                   <%}
    }%>
        </tr>
        <tr>
             
      
       
     
    </tr>
   
</table>
        <br /><br />
        <h2>Selected Rooms</h2>
       <%
           int broom = roomsbooked.Count(); //roomsclass.getAvailableRoomNos(employeeProfile.getEmployeBranch(Session["loginName"].ToString()));
           if (broom >= 1)
           {
               %>
        <%--<div class="row">
         <div class="col-md-12 col-sm-12 col-xs-12">--%>
         <div class="form-group col-md-6  col-sm-6 col-xs-12">
                            
                            <label class="control-label col-md-6  col-sm-6 col-xs-12">Old Room <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                               
                                         <input id="oldroom" readonly type="text" name='oldroom' class='input' placeholder="Select room" required="required" /> 

                            </div>
            
                          
                          </div>
           
              <div class="form-group col-md-6  col-sm-6 col-xs-12">
               <label class="control-label col-md-6  col-sm-6 col-xs-12" for="first-name">Old Room Rent <span class="required">*</span>
                            </label>
                            <div class="col-md-6  col-sm-6 col-xs-12">
                               
                            <input id="oldrent" type="text" name="oldrent" class='input' placeholder="Room Rent" /> 
                            </div>
                    </div>


          <div class="form-group col-md-6  col-sm-6 col-xs-12">
                            
                            <label class="control-label col-md-6  col-sm-6 col-xs-12">New Room <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                               
                                         <input id="newroom" type="text" readonly name='newroom' class='input' placeholder="Select room" required="required" /> 

                            </div>
            
                          
                          </div>
           
              <div class="form-group col-md-6  col-sm-6 col-xs-12">
               <label class="control-label col-md-6  col-sm-6 col-xs-12" for="first-name">New Room Rent <span class="required">*</span>
                            </label>
                            <div class="col-md-6  col-sm-6 col-xs-12">
                               
                            <input id="newrent" type="text" name="newrent" class='input' placeholder="Room Rent" /> 
                            </div>
                          </div>
                         <%-- </div>
        </div>--%>
    
        <%        }
    else
    {
         %>
         <h3> No rooms Available</h3>

 <%   }%>



        </div>
          </div>
         <br />
   <a id="btnbroomshift" name="linktopage" class="btn btn-success" >Book Room</a>
    </div></div></div></div></div>
                           
                           
                          </div>



     

     </div>
    </div>
                                 
                                     
                            </div>                   
                            
                            
                            
                            
                            
                            
                                 
                                 

                              </div>
                            <!-- end recent activity -->
                              
                            
                 
                         
                       
                            
                            
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
            $('#updatebookedroom').hide();
        }
        $("#linktopage").click(function () {
            __doPostBack("mybtn", roomno);
        });
        $("#btnbroomshift").click(function () {

            __doPostBack("broomshift", roomno);
        });
        $('#brshift').click(function () {
            $('#updateroomavalibilty').hide();
            $('#updatebookedroom').show();
            var roomrentid = '#froomrent' +$('#<%=hroomno.ClientID%>').val() ;
            $('#oldroom').val($('#<%=hroomno.ClientID%>').val());
            $('#oldrent').val($(roomrentid).html());
        });
        $('#rshift').click(function () {
            $('#updateroomavalibilty').show();
            $('#updatebookedroom').hide();
            

        });
        
    });
    function swapImage(id, primary, secondary) {
        src = document.getElementById(id).src;
        if (src.match(primary)) {
            document.getElementById(id).src = secondary;
        } else {
            document.getElementById(id).src = primary;
        }
    }
   


    function updateTextArea() {
        var allVals = [];
        $('#c_b :checked').each(function () {
            allVals.push($(this).val());
        });
        $('#t').val(allVals);
    }
    $(function () {
        $('#c_b input').click(updateTextArea);
        updateTextArea();
    });
    function updateTextArea1() {
        $('#newroom').val($(this).val());
        $('#newrent').val(getroombookingrent($(this).val()));
    }
    $(function () {
        $('#c_b1 input').click(updateTextArea1);
       /// updateTextArea1();
    });
   
    function getroombookingrent(roomnox) {
        var obj;
        var Data = JSON.stringify({ roomno: roomnox });
        $.ajax({

            url: "adminajax.aspx/getroomRent",
            async: false,
            data: Data,
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (mydata) {

                obj = mydata.d;

            }
        });
        return obj;
    }




  $.validate({
    modules : 'location, date, security, file',
    onModulesLoaded : function() {
      $('#country').suggestCountry();
    }
  });

  // Restrict presentation length
  $('#presentation').restrictLength($('#pres-max-length'));

</script>
     

  
</asp:Content>

