<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeshiftroom.aspx.cs" Inherits="employeerooms" %>

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
                        
                        <div id="myTabContent" class="tab-content">
                            <!-- start recent activity -->
                           <div id="roomavalibilty" class="table-responsive">
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
                                  <%    List<bookingroomdetailclass> rb= bookingRoomClass.Getbookingandroomdetail(employeeProfile.getEmployeBranch(Session["loginName"].ToString()));
                                      foreach (bookingroomdetailclass r in rb)
                                      { %>
                                <tr>
                                    <td><label id="availbiltyroomy" style="color:green">ShiftRoom</label></td>
                                   <td><label id="froombranch"><%=r.g_reg_no%></label></td>
                                    <td><label id="froomid"><%=r.g_guest_name%></label></td>
                                  <td><label id="froomtype"><%=r.g_cnic_orpassport %></label></td>
                                  <td><label id="froomsize"><%=r.phone%></label></td>
                                  <td> <label id="froomrent"><%=r.booking_rent%></label></td>
                                  <td><label id="froombranch"><%=r.b_checkinDate%></label></td>
                                    <td><label id="froombranch"><%=r.b_roomno%></label></td>
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
                                    <h1>Booking Detail</h1>
                                     <div id="s2">
 <div  class="form-vertical">

     <div class="form-group">
                            
                           
                          <%--</div>

                          <div class="form-group">--%>
                           
                           
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
    </div>
     <%--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>--%>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script>
   
   
    $(document).ready(function () {
        if ($('#<%=hroomno.ClientID%>').val() == "") {
            $('#updateroomavalibilty').hide();
        }
       

        
        //
          
        //
         
       
        $(".xyz").click(function() {
           $('#<%=hroomno.ClientID%>').val(this.id);
           $('#roomavalibilty').hide("slow", function () { });
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

