<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeupdateevent.aspx.cs" Inherits="employeupdateevent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%  
        event_calender eventInfo = new event_calender();
        if (!string.IsNullOrEmpty(Request.QueryString["id"]))
        {
            string eventid = Request.QueryString["id"].ToString();
            updatehiddenid.Value = eventid;
            if (!string.IsNullOrEmpty(Request.QueryString["del"]))
            {
                if (Request.QueryString["del"].ToString() == "true")
                {
                    event_calender eve = new event_calender();
                    events.deleteEvent(eve, int.Parse(eventid));
                    Response.Redirect("employeevents.aspx?msg=done");
                }
            }
            else
            {
                eventInfo = events.retrieveSelectedEvent(int.Parse(eventid));
            }

        }

        %>

    <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Update Events</h3>



                                <div class="row">
                                     <div class="col-md-5">
                                            <input  type="text" id="eventname" name="eventname" value="<%=eventInfo.event_name %>"  placeholder="Event name..." class="form-control">
                                         </div>
                                </div>
                                <div class="row">
                                     <div class="col-md-5">
                                            <input  type="text" id="eventdesc" name="eventdesc" value="<%=eventInfo.event_description %>" placeholder="Event description..." class="form-control"/>
                                         </div>
                                </div>
                                <div class="row">
                                     <div class="col-md-5">
                                            <input  type="date" id="eventstartdate" name="eventstartdate"  class="form-control"  value="<%=eventInfo.event_start_date %>"/>
                                         </div>
                                </div>
                                <div class="row">
                                     <div class="col-md-5">
                                            <input  type="date" id="eventenddate" name="eventenddate" value="<%=eventInfo.event_end_date %>"  placeholder="Select date..." class="form-control" />
                                         </div>
                                </div>
                                <div class="row">
                        <div class="col-md-5">
                          <div class="input-group demo2">
                            <input type="text"  placeholder="Select color.." class="form-control"  id="eventcolor" value="<%=eventInfo.event_color %>" name="eventcolor"/>
                            <span class="input-group-addon"><i></i></span>
                          </div>
                        </div>
                      </div>
                              <asp:Button ID="eventsubmit" runat="server" Text="Update" class="btn btn-success"  AutoPostBack="false" CausesValidation="true" OnClick="eventsubmit_Click" />
              <input  type="text" id="updatehiddenid"  runat="server"/>

                              
     </div>
         </div>
         </div></div></div>                         
                              
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

