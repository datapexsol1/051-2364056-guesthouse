<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employetemproomlayout.aspx.cs" Inherits="employeroomlayout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<title>SEAT LAYOUT</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<%--<script src="js/jquery-1.8.3.js"></script>
--%>
      
<link rel="stylesheet" href="css/seatlayout.css" />
    <script>
        imgseaterArr = new Array();
        for (var i = 0; i < 100; i++) {
            imgseaterArr[i] = new Array('layoutimg/images/open_door.png', 'layoutimg/images/closed_door.png');
            
          
        }
      $(document).ready(function() {
          $('#checkindate').daterangepicker({
          singleDatePicker: true,
          calender_style: "picker_2",
          showDropdowns: true
        });
     ///dob 
          $('#checkoutdate').daterangepicker({
              //singleDatePicker: true,
             // calender_style: "picker_2"
            singleDatePicker: true,
          showDropdowns: true
          });
          //
          $('#Depature').daterangepicker({
              singleDatePicker: true,
              calender_style: "picker_2"
          });
          //
       
       

      });
    
        </script>
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div class="right_col" role="main" align="center">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h1 >Room Selection</h1>
         <hr  style="width:50%;border-color:#800000;border-width: 4px;"/>
         <br /><br />
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
        <h2>Temporary Book Room</h2>
       <%
           int totalNoOfRooms = roomsclass.getAvailableRoomNos(employeeProfile.getEmployeBranch(Session["loginName"].ToString()));
           if (totalNoOfRooms >= 1)
           {
               %>
        <textarea id='t' name='roomselected' class='input' placeholder="Select room" >Seats:</textarea><br/>
 <%          }
    else
    {
         %>
         <h3> No rooms Available</h3>

 <%   }%>



       
      
         </div>
        <div id="detaildiv">

            
                           <div id="s2">
 <div  class="form-vertical">

     <div class="form-group">
                            
                           
                          <%--</div>

                          <div class="form-group">--%>
                           
                            <div class="item col-md-6 col-sm-4 col-xs-12">
                                 <label >Check In Date<span class="required">*</span>
                            </label>
                              <%--<input type="text" class="form-control has-feedback-left" id="Arrival" placeholder="First Name" aria-describedby="inputSuccess2Status2">--%>

                              <input type="text" id="checkindate" name="checkindate" class="form-control col-md-7 col-xs-12" />
                            </div>
                 
                            
                            <div class="item col-md-6 col-sm-4 col-xs-12">
                                 <label >Check out Date<span class="required">*</span>
                            </label>
                              <%--<input type="text" class="form-control has-feedback-left" id="Arrival" placeholder="First Name" aria-describedby="inputSuccess2Status2">--%>

                              <input type="text" id="checkoutdate" name="checkoutdate" class="form-control col-md-7 col-xs-12" />
                            </div>
                         
                  </div>

                          <div class="form-group">
                          <%--</div>
                            
                          <div class="form-group">--%>
                            
                            <div class="item col-md-4 col-sm-4 col-xs-12">
                                <label>Guest Name <span class="required">*</span>
                            </label>
                              <input type="text" id="gname" name="gname"  class="form-control col-md-7 col-xs-12" />
                            </div>
                          

                          
                          
                          <%--</div>
                          <div class="form-group">--%>
                           


                                  <div class="item col-md-4 col-sm-4 col-xs-12">
                                                            <label>N.I.C No / Passport <span class="required"/>*</span>
                            </label>
                              <input type="text" id="cnicno" name="cnicno"   class="form-control col-md-7 col-xs-12" data-inputmask="'mask' : '99999-9999999-9'"/>
                            </div>


                          
                          </div>
                            
                          <div class="form-group">

                        
                          <%--</div>

                            <div class="form-group">--%>
                           
                            <div class="form-group">
                             
                           <div class="item col-md-4 col-sm-4 col-xs-12">
                                 <label >Guest Phone <span class="required">*</span>
                            </label>
                              <input type="number"  id="gphone" name="gphone"  class="form-control col-md-7 col-xs-12" 
                                  />
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
                              <input type="text" id="gemail" name="gemail"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                                 <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >No of Guest<span class="required">*</span>
                            </label>
                              <input type="text" id="noofguest" name="noofguest"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                             <label>Room_Rent <span class="required">*</span>
                            </label>
                              <input type="text" id="roomrent" name="roomrent"  class="form-control col-md-7 col-xs-12"/>
                            </div>

                          </div>

                            <div class="form-group">
                          
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                  <label>Referance by</label>
                              <input id="referanceby" name="referanceby" class="form-control col-md-7 col-xs-12" type="text" />
                            </div>
                          <%--</div>

                            <div class="form-group">--%>

                          
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                  <label>Referance by phone</label>
                              <input id="referancephone" name="referancephone" class="form-control col-md-7 col-xs-12" type="text" />
                            </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                  <label>Selected Room No</label>
                              <input id="roomnonew" name="roomnonew" class="form-control col-md-7 col-xs-12" type="text" readonly />
                            </div>
                                <div class="col-md-12 col-sm-4 col-xs-12">
                                  <label>Comments</label>
                              <textarea id="comments" name="comments" class="form-control col-md-7 col-xs-12" >Comments:</textarea>
                            </div>

                                  <div class="col-md-12 col-sm-8 col-xs-12">
                              <asp:Button ID="savebtn" runat="server" Text="SAve" class="btn btn-success" UseSubmitBehavior="false" OnClick="savebtn_Click" />
                                 
                            </div>
                          </div>



     

     </div>
    </div>
            
        </div>
    </div>
         <br />
   <a id="linktopage" name="linktopage" class="btn btn-success" >Book Room</a>
    </div></div></div></div></div><
    <script>
        $(document).ready(function () {
            $('#detaildiv').hide();
        });
        $(document).ready(function () {
            $("#linktopage").click(function () {
                var value = $('#t').val();
                if (value != "") {
                    $('#roomnonew').val(value);
                    $('#form1').hide("slow", function () {

                    });
                    $('#linktopage').hide("slow", function () {

                    });

                    $('#detaildiv').show(2000);
                   // $("#linktopage").attr("href", "#?id=" + value);
                } else {
                    alert("Please Select ROom no");
                }
            });
            $("#Savebtn").click(function () {
                var value = $('#t').val();
                $('#detaildiv').hide("slow");
              
                $('#form1').show(2000);
                $('#linktopage').show(2000);

               // $("#linktopage").attr("href", "#?id=" + value);
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
            $('#t').val(allVals)
        }
        $(function () {
            $('#c_b input').click(updateTextArea);
            updateTextArea();
        });
    </script>
       <!-- jquery.inputmask -->
    <script>
      $(document).ready(function() {
        $(":input").inputmask();
      });
    </script>
    <!-- /jquery.inputmask -->
</asp:Content>

