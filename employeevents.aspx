<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeevents.aspx.cs" Inherits="employeevents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title></title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
            <!-- Ion.RangeSlider -->
    <link href="../vendors/normalize-css/normalize.css" rel="stylesheet">
    <link href="../vendors/ion.rangeSlider/css/ion.rangeSlider.css" rel="stylesheet">
    <link href="../vendors/ion.rangeSlider/css/ion.rangeSlider.skinFlat.css" rel="stylesheet">
    <!-- Bootstrap Colorpicker -->
    <link href="../vendors/mjolnic-bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css" rel="stylesheet">

    <link href="../vendors/cropper/dist/cropper.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="../custom/custom.min.css" rel="stylesheet">
    <script>
        function activaTab(tab) {

            $('.nav-tabs a[href="#' + tab + '"]').tab('show');

            //alert("working");
        };
        function delFunction(val) {
      
            alert("Are you sure you want to delete the event ? ");
           
            
        }
        function deleteRow(obj) {
            $(obj).closest('tr').remove();
        }

        function ShowMessage(message, messagetype) {
            var cssclass;
            switch (messagetype) {
                case 'Success':
                    cssclass = 'alert-success'
                    break;
                case 'Error':
                    cssclass = 'alert-danger'
                    break;
                case 'Warning':
                    cssclass = 'alert-warning'
                    break;
                default:
                    cssclass = 'alert-info'
            }
            $('#alert_container').append('<div id="alert_div" style="margin-top:40px;margin-left:100px;width:50%; -webkit-box-shadow: 3px 4px 6px #999;" class="alert fade in ' + cssclass + '"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><strong>' + messagetype + '!</strong> <span>' + message + '</span></div>');
        }
    </script>
    <style>
    .messagealert {
            width: 100%;
            position: fixed;
             top:0px;
            z-index: 100000;
            padding: 0;
            font-size: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <%--<%Session["updateEventID"] = id;%> --%>  
     
      <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
                 <div class="messagealert" id="alert_container">  </div>	
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Events</h3>
         
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">View Events</a></li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab1" data-toggle="tab" aria-expanded="false">Add Event</a></li>

                            
                          
                        </ul>
                        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">




                    







                            <!-- start recent activity -->
                             <!-- page content -->
     

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  
                  <div class="x_content">

                   

                    <!-- start project list -->
                     
                    <table class="table table-striped projects">
                      <thead>
                        <tr>
                          <th style="width: 20%">Event Name</th>
                          
                         
                          <th style="width: 20%"></th>
                        </tr>
                      </thead>
                         <% IQueryable<event_calender> evecal = events.retrieveAllEvents();
                          foreach (event_calender ec in evecal)
                          {
                               %>
                      <tbody>
                        <tr>
                          <td>
                            <a><%=ec.event_name %></a>
                            <br />
                            <small><%=ec.event_description %><br /><%=ec.event_start_date %></small>
                          </td>
                            
                         
                          <td>
                             
                            <a href="employeupdateevent.aspx?id=<%=ec.Id %>" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                               <a href="employeupdateevent.aspx?id=<%=ec.Id %>&del=true" class="btn btn-danger btn-xs"><i class="fa fa-pencil"></i> Delete </a>
                            <%--<a href="employeupdateevent.aspx?id=<%=ec.Id %>"  class="btn btn-danger btn-xs" runat="server"><i class="fa fa-trash-o"></i> Delete </a>--%>
                          </td>
                        </tr>
                         
                  <% 
                      } %>
                     
                       
                      </tbody>
                    </table>                       
                      

                      
                    <!-- end project list -->

                  </div>
                </div>
              </div>
           </div>
 
        <!-- /page content -->
                          
                            <!-- end recent activity -->
                              
</div>
                
                         
                            <!--start add event-->
                            <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                                <div class="row">
                                     <div class="col-md-5">
                                         <b>Event name</b>
                                            <input runat="server" type="text" id="eventname" name="eventname" placeholder="Event name..." data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter event" class="form-control"/>
                                         </div>
                                
                                     <div class="col-md-5">
                                         <b>Event description</b>
                                            <input runat="server" type="text" id="eventdesc" name="eventdesc" placeholder="Event description..." class="form-control"/>
                                         </div>
                                </div>
                                <div class="row">
                                     <div class="col-md-5">
                                         <b>Event start date</b>
                                            <input  type="date" id="eventstartdate" data-validation="required" 

		 data-validation-error-msg="Select date" name="eventstartdate"  class="form-control" runat="server"/>
                                         </div>
                               
                                     <div class="col-md-5">
                                         <b>Event end date</b>
                                            <input  type="date" id="eventenddate"  name="eventenddate" data-validation="required" 

		 data-validation-error-msg="Select date"  placeholder="Select date..." class="form-control" runat="server"/>
                                         </div>
                                </div>
                                <div class="row">
                        <div class="col-md-5">
                          <div class="input-group demo2">
                              <b>Event color</b>
                            <input type="text"  placeholder="Select color.." class="form-control" runat="server" id="eventcolor" data-validation="required" 

		 data-validation-error-msg="Enter event color" name="eventcolor"/>
                            <span class="input-group-addon"><i></i></span>
                          </div>
                        </div>
                      </div>
                              <asp:Button ID="eventsubmit" runat="server" Text="Submit" class="btn btn-success" OnClick="eventsubmit_Click" AutoPostBack="false" CausesValidation="true" />
                              
                              
                              
                              
                          </div>
                            <!--end add event-->
                       
                        </div>
                      </div>
         </div>
         </div>
         </div>
        </div>
          </div>
    
  
    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="js/moment/moment.min.js"></script>
    <script src="js/datepicker/daterangepicker.js"></script>
    <!-- Ion.RangeSlider -->
    <script src="../vendors/ion.rangeSlider/js/ion.rangeSlider.min.js"></script>
    <!-- Bootstrap Colorpicker -->
    <script src="../vendors/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
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

</script> 

   
    <!-- Bootstrap Colorpicker -->
    <script>
      $(document).ready(function() {
        $('.demo1').colorpicker();
        $('.demo2').colorpicker();

        $('#demo_forceformat').colorpicker({
            format: 'rgba',
            horizontal: true
        });

        $('#demo_forceformat3').colorpicker({
            format: 'rgba',
        });

        $('.demo-auto').colorpicker();
      });
    </script>
    <!-- /Bootstrap Colorpicker -->
</asp:Content>

