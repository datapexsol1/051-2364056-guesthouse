﻿<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeupdateevent.aspx.cs" Inherits="employeupdateevent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
    <style>
        .messagealert {
            width: 100%;
            position: fixed;
            top: 0px;
            z-index: 100000;
            padding: 0;
            font-size: 15px;
        }
    </style>
    <script>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="Notify"></div>
    <input type="hidden" id="eventid" runat="server" />


    <div class="right_col" role="main">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_content">
                    <div class="col-md-9 col-sm-9 col-xs-12">
                        <div class="messagealert" id="alert_container" style="opacity: 0; transition: visibility 0s 2s, opacity 2s linear;"></div>

                        <h3>Update Events</h3>

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
                                        bool check = events.deleteEvent(eve, int.Parse(eventid));
                                        if (check == true)
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage(deleted);", true);
                                        Response.Redirect("employeevents.aspx?msg=done");
                                    }
                                }
                                else
                                {
                                    eventInfo = events.retrieveSelectedEvent(int.Parse(eventid));
                                }

                            }

                        %>

                        <div class="row">
                            <div class="item col-md-5">
                                <b>Event title</b>
                                <input type="text" id="eventname" required="required" data-validate-length-range="6" data-validate-words="1" name="eventname" value="<%=eventInfo.event_name %>" placeholder="Event name..." class="form-control">
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-5">
                                <b>Event description</b>
                                <input type="text" id="eventdesc" name="eventdesc" value="<%=eventInfo.event_description %>" placeholder="Event description..." class="form-control" />
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="item col-md-5">

                                <b>Event start date</b>
                                <div class="input-prepend input-group">
                                    <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                    <input type="" required="required" class="form-control" id="eventstartdate" name="eventstartdate" value="<%=eventInfo.event_start_date.ToString("dd-MM-yyyy") %>">
                                </div>

                                <%--<input  type="datetime" id="eventstartdate" name="eventstartdate"  class="form-control"  value="<%=eventInfo.event_start_date.ToShortDateString() %>"/>--%>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="item col-md-5">
                                <b>Event end date</b>
                                <div class="input-prepend input-group">
                                    <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                    <input type="" required="required" id="eventenddate" name="eventenddate" value="<%=eventInfo.event_end_date.ToString("dd-MM-yyyy") %>" placeholder="Select date..." class="form-control" />

                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-5">
                                <b>Select color (required)</b>
                                <div class="item input-group demo2">

                                    <input type="text" required="required" placeholder="Select color.." class="form-control" id="eventcolor" value="<%=eventInfo.event_color %>" name="eventcolor" />
                                    <span class="input-group-addon"><i></i></span>
                                </div>
                            </div>
                        </div>
                        <a href="#" runat="server" onserverclick="eventsubmit_Click" class="btn btn-success">Update</a>
                        <%--<asp:Button runat="server" Text="Update event"  OnClick="eventsubmit_Click"/>--%>
                        <%--<asp:Button ID="eventsubmit" runat="server" Text="Update" class="btn btn-success"  AutoPostBack="true" CausesValidation="true" OnClick="eventsubmit_Click" />--%>
                        <input type="hidden" id="updatehiddenid" runat="server" />


                    </div>
                </div>
            </div>
        </div>
    </div>


    <%--  <!-- jQuery -->
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
    <script src="../vendors/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>--%>
    <!-- bootstrap-daterangepicker -->




    <script>
        $(document).ready(function () {
            //'#eventstartdate
            
        });

        $(document).ready(function () {
            var d = new Date();
            var mm = d.getMonth() + 1;
            var yy = d.getFullYear();
            $('#eventstartdate').daterangepicker({
                //singleDatePicker: true,
                //calender_style: "picker_2"
                singleDatePicker: true,
                minDate: '01-' + mm + '-' + yy,
                buttonClasses: ['btn btn-default'],
                applyClass: 'btn-small btn-primary',
                calender_style: "picker_5",
                startDate: '01-' + mm + '-' + yy,
                showDropdowns: true
            }, function (start, end, label) {
                console.log(start.toISOString(), end.toISOString(), label);
            });


       
            $('#eventenddate').daterangepicker({
                //singleDatePicker: true,
                //calender_style: "picker_2"
                singleDatePicker: true,
                minDate: '01-' + mm + '-' + yy,
                buttonClasses: ['btn btn-default'],
                applyClass: 'btn-small btn-primary',
                calender_style: "picker_5",
                startDate: '01-' + mm + '-' + yy,
                showDropdowns: true
            }, function (start, end, label) {
                console.log(start.toISOString(), end.toISOString(), label);
            });
        });
    </script>

    <script>
        $(document).ready(function () {
            $('#reservation').daterangepicker(null, function (start, end, label) {
                console.log(start.toISOString(), end.toISOString(), label);
            });
        });
    </script>
    <!-- /bootstrap-daterangepicker -->





    <!-- Bootstrap Colorpicker -->
    <script>
        $(document).ready(function () {
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

