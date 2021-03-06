﻿<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeevents.aspx.cs" Inherits="employeevents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
    <link href="../custom/custom.min.css" rel="stylesheet" />
    <!-- validator -->
    <script src="../vendors/validator/validator.js"></script>
    <%-- <link href="css/jquery-ui.css" rel="stylesheet" />--%>

    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#eventstartdate").datepicker();
            $("#eventstartdate").datepicker('setDate', new Date());
            <%-- __doPostBack('<%=date.ClientID%>');
        });
        
    </script>--%>
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<%Session["updateEventID"] = id;%> --%>
    <div id="Notify"></div>
    <div class="messagealert" id="alert_container" style="opacity: 0; transition: visibility 0s 2s, opacity 2s linear;"></div>

    <div class="right_col" role="main">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
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
                                                        <% IQueryable<event_calender> evecal = events.retrieveAllEvents(Session["loginName"].ToString());
                                                            foreach (event_calender ec in evecal)
                                                            {
                                                        %>
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <a><%=ec.event_name %></a>
                                                                    <br />
                                                                    <small><%=ec.event_description %><br />
                                                                        <%=ec.event_start_date %></small>
                                                                </td>


                                                                <td>

                                                                    <%--                            <a href="?id=<%=ec.Id %>" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>--%>
                                                                    <a href="employeupdateevent.aspx?id=<%=ec.Id %>" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i>Edit </a>
                                                                    <a href="employeupdateevent.aspx?id=<%=ec.Id %>&del=true" class="btn btn-danger btn-xs"><i class="fa fa-pencil"></i>Delete </a>
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

                                        <div class="item col-md-5">
                                            <b>Event name</b>
                                            <input runat="server" type="text" id="eventname" name="eventname" placeholder="Event name..."
                                                data-validate-length-range="6" data-validate-words="1" required="required" class="form-control" />
                                        </div>


                                        <div class=" col-md-5">
                                            <b>Event description</b>

                                            <input runat="server" type="text" id="eventdesc" name="eventdesc" placeholder="Event description..." class="form-control" />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="item col-md-5">
                                            <b>Event start date</b>
                                            <div class="input-prepend input-group">
                                                <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                <input type="text" name="eventstartdate" id="eventstartdate" required="required" value="<%=DateTime.Now.ToShortDateString() %>" class="form-control" />

                                            </div>
                                            <%--<input  type="text" id="eventstartdate" value="<%=DateTime.Now.ToShortDateString() %>" required="required" name="eventstartdate"  class="form-control"/>--%>
                                        </div>

                                        <div class="item col-md-5">
                                            <b>Event end date</b>

                                            <div class="input-prepend input-group">
                                                <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                <input type="text" name="eventenddate" id="eventenddate" required="required" value="<%=DateTime.Now.ToShortDateString() %>" class="form-control" />

                                            </div>
                                            <%--<input  type="text" id="eventenddate" value="<%=DateTime.Now.ToShortDateString() %>" required="required"  name="eventenddate"   placeholder="Select date..." class="form-control has-feedback-left"/>--%>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="item col-md-5">
                                            <b>Event color</b>
                                            <div class=" input-group demo2">

                                                <input type="text" placeholder="Select color.." class="form-control" runat="server" id="eventcolor" value="#000000"
                                                    required="required" name="eventcolor" />
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

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>



    <script>


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

        $.validate({
            modules: 'location, date, security, file',
            onModulesLoaded: function () {
                $('#country').suggestCountry();
            }
        });

        // Restrict presentation length
        $('#presentation').restrictLength($('#pres-max-length'));

    </script>


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

