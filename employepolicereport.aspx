<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employepolicereport.aspx.cs" Inherits="employepolicereport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
  <link rel="stylesheet" type="text/css" href="css/printing.css" media="print" />
     <script>
         function xyz(value) {
             if ( $('#tbox' + value).is(":checked"))
             {
                 //alert("checked");
                 $('#trow' + value).hide();
                 
             }
         }
         
        
         </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="right_col" role="main">
    <div class="row">
        <h3>Guest Information</h3>
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
   <%--  <div class="col-md-9 col-sm-9 col-xs-12">
                <h3>Guest Report </h3>
              </div>--%>
                 <div id="printguestinfo">
   
            
                          <div class="row">
                              <div class="table-responsive">
                 <table id="logoid" border="0" width="100%" >
                     <tr>
                         <td><img src="img/logo.png" width="200" height="200" style="float:left"/></td>
                         <td style="text-align:center;font-family:Magneto"><b style="font-size:xx-large">Cape Town</b></td>
                         <td style="text-align:center;font-size:large">
                 
                             <label>House NO. 10 Street 12 <br />
                             F-7/2 Islamabad<br />
                             Ph. 0518318731-2<br />
                             NTN#4263282-0</label>

                         </td>
                     </tr>
                 </table>
                                  </div>
             </div>
         <div class="row">
                         <div class="table-responsive">
                  <table id="example" border="0" width="100%"  class="table table-bordered ">
                      <tr style="text-align:left">
                          <th class="hidecheckbox">Remove</th>
                          
                          <th>Room no</th>
                          <th>Guest name</th>
                          <th>CNIC/Passport#</th>
                          <th colspan="2">Address</th>
                          <th>Arrival</th>
                          <th>Departure</th>
                          <th>Persons</th>
                          <th>Purpose of visit</th>
                      </tr>
                      <%
                          int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
                          List<employepaymentrecivableAttributes> guestInfo = employeeProfile.getGuestInfo(bid);
                          foreach (var x in guestInfo)
                          {
                           %>
                      <tr id="trow<%=x.g.Id %>" style="text-align:left">
                          <td class="hidecheckbox"><input type="checkbox" id="tbox<%=x.g.Id %>" name="tbox<%=x.g.Id %>"  value="<%=x.g.Id %>" onclick='xyz(this.value)'/></td>
                          <%--<td><input type="text" id='ibox" + x.Id + "' value="<%=x.g.Id %>"/></td>--%>
                          <td><%=x.r.room_no %></td>
                          <td><%=x.g.guest_name %></td>
                          <td><%=x.g.cnic %><%=x.g.f_passport_no %></td>
                          <td colspan="2"><%=x.g.permanent_address %></td>
                          <td><%=x.b.check_in_date %></td>
                          <td>OPEN</td>
                          <td><%=x.b.no_of_pax %></td>
                          <td><%=x.g.f_purpose_of_vist %></td>
                      </tr>
                      <%} %>
                  </table>
                             </div>
                              </div>
                      </div>
                      <input type="button" id="btn" value="Print "  class="btn btn-default"/>
              </div>
              </div>
        </div>
          </div>
                  

    <script>

        $(document).ready(function () {
            $("#logoid").hide();
            
            $("#btn").click(function () {
                $(".hidecheckbox").hide();
              
            });
        });
        $(function () {
            $("#btn").click(function () {
                $("#logoid").show();
                var contents = $("#printguestinfo").html();
                var frame1 = $('<iframe />');
                frame1[0].name = "frame1";
                frame1.css({ "position": "absolute", "top": "-1000000px" });
                $("body").append(frame1);
                var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
                frameDoc.document.open();
                //Create a new HTML document.
                frameDoc.document.write('<html><head><title>CapeTown guest house</title>');
                frameDoc.document.write('</head><body style="-webkit-print-color-adjust: exact;background-color:white; height: 950px;left: 0; right: 0; background-repeat: no-repeat; background-size:700px 500px;align-content:center;>');
                //Append the external CSS file.


                //Append the DIV contents.
                frameDoc.document.write(contents);
                frameDoc.document.write('</body></html>');
                frameDoc.document.close();
                setTimeout(function () {
                    window.frames["frame1"].focus();
                    window.frames["frame1"].print();
                    frame1.remove();
                }, 500);

            });
        });

    </script>
</asp:Content>

