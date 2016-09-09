<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeroomlayout.aspx.cs" Inherits="employeroomlayout" %>

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
            imgseaterArr[i] = new Array('layoutimg/images/volo_sleeper_vertical_vacant.jpg', 'images/ac_sleeper_selected.jpg');
            
          
        }
        
      

        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Room Selection</h3>
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
  

    <div id="form1">
    <table frame='box'>
  <%   IQueryable<room> rooms = roomsclass.getAvailableRooms(2); %>
    
    <tr>
      <%foreach (var r in rooms)
        {  %>
              <% if (r.availbilty == "yes")
    { %>
                    <td><div id='c_b'class='container'><label ><img name='img' id='imge<%=r.room_no %>' src='layoutimg/images/non_ac_vertical_sleeper_ladies.jpg' onclick='swapImage("imge<%=r.room_no %>","layoutimg/images/non_ac_vertical_sleeper_ladies.jpg","layoutimg/images/volvo_sleeper_vertical_selected.jpg") '  class='imagehover'/><input type='checkbox' class='checkbox' name='chkchk[]' id='' value="<%=r.room_no %>"  style='visibility:hidden'/></label></div></td> 
                   <%} %>

                   <%else
    {%> 
               
               <td><div class='container_un'><img src='images/ac_semi_sleeper_unavailable.jpg'/></div></td>;

                   <%}
    }%>
             <div>Selected Rooms</div>
<textarea id='t' name='roomselected' class='input'>Seats:</textarea><br><br>

<div style='bold'> Available Rooms</div>
      
       
      
    </tr>
   
</table>
   <a id="linktopage" name="linktopage" >Book Room</a>
    </div></div></div></div></div></div></div>
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

