﻿<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeroomlayout.aspx.cs" Inherits="employeroomlayout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<title>SEAT LAYOUT</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<script src="js/jquery-1.8.3.js"></script>
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" href="css/seatlayout.css" />
    <script>
        imgseaterArr = new Array();
        for (var i = 0; i < 100; i++) {
            imgseaterArr[i] = new Array('layoutimg/images/open_door.png', 'layoutimg/images/closed_door.png');
            
          
        }
        
      

        
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
  <%   IQueryable<room> rooms = roomsclass.getAvailableRoomsall(employeeProfile.getEmployeBranch(Session["loginName"].ToString())); %>
    <h2 > Available Rooms</h2>
    <tr style="min-width: 400px;border:none"> 
      <%foreach (var r in rooms)
          {  %>
              <% if (r.availbilty == "yes")
                  {
                      if (r.room_type == "othere" || r.room_type == "no") { %>
                    <td style="    padding: 0;float: left;padding: 22px;">
                        <div class="container">
                          
                            <div class="row">
                                
                        <div id='c_b'  >
                            <label style="text-align:center" >
                                <img name='img' id='imge<%=r.room_no %>'  src='layoutimg/images/openover5000.png' onclick='swapImage("imge<%=r.room_no %>","layoutimg/images/openover5000.png","layoutimg/images/over500close.png") 'width="50"  class='  imagehover'/>
                       <input type='checkbox' class='checkbox' name='chkchk[]' id='' value="<%=r.room_no %>"  style='visibility:hidden'/>
                                <%=r.room_no %>
                            </label>
                            </div>
                                    </div>
                            
                          
                        </div>
                            
        </td> 
        <%} else {%> <td style="    padding: 0;padding: 22px;">
      
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
                            
        </td> <%} %>

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
        <textarea id='t' name='roomselected' class='input' placeholder="Select room" required="required">Seats:</textarea><br/>
 <%          }
    else
    {
         %>
         <h3> No rooms Available</h3>

 <%   }%>



        </div></div>
         <br />
   <a id="linktopage" name="linktopage" class="btn btn-success" >Book Room</a>
    </div></div></div></div></div>
    <script>
        $(document).ready(function () {
            $("#linktopage").click(function () {
                var value = $('#t').val();
                $("#linktopage").attr("href", "employeguestregistration.aspx?id=" + value);
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
</asp:Content>

