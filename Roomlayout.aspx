<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Roomlayout.aspx.cs" Inherits="Roomlayout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
</head>
<body>
    <form id="form1" runat="server">
    <div>
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
<textarea id='t' name='seatnames' class='input'>Seats:</textarea><br><br>

<div style='bold'> Available Rooms</div>
       
      
    </tr>
  
</table>
    </div>
    </form>
    <script>

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
</body>
</html>
