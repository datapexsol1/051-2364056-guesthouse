<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeerooms.aspx.cs" Inherits="employeerooms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


     <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Gentellela Alela! | </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../custom/custom.min.css" rel="stylesheet">
  </head>
      <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Rooms</h3>
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Rooms</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Available Rooms</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Add Rooms</a>
                          </li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

                            <!-- start recent activity -->
                               <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                  <th>Room No</th>
                                  <th>Room Type</th>
                                  <th>Room Size</th>
                                  <th class="hidden-phone">Room Rent Max</th>
                                  <th>Room Rent Min</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>1</td>
                                  <td>suit</td>
                                  <td>Large</td>
                                  <td class="hidden-phone">20000</td>
                                  <td class="vertical-align-mid">
                                    30000
                                  </td>
                                </tr>
                                <tr>
                                  <td>2</td>
                                  <td>suit</td>
                                  <td>Large</td>
                                  <td class="hidden-phone">20000</td>
                                  <td class="vertical-align-mid">
                                    30000
                                  </td>
                                </tr>
                                <tr>
                                  <td>3</td>
                                  <td>suit</td>
                                  <td>Large</td>
                                  <td class="hidden-phone">20000</td>
                                  <td class="vertical-align-mid">
                                    30000
                                  </td>
                                </tr>
                                <tr>
                                  <td>4</td>
                                  <td>suit</td>
                                  <td>Large</td>
                                  <td class="hidden-phone">20000</td>
                                  <td class="vertical-align-mid">
                                    30000
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                            <!-- end recent activity -->

                          </div>
                          <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">

                            <!-- start user projects -->
                           <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                  <th>Room No</th>
                                  <th>Room Type</th>
                                  <th>Room Size</th>
                                  <th class="hidden-phone">Room Rent Max</th>
                                  <th>Room Rent Min</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>1</td>
                                  <td>suit</td>
                                  <td>Large</td>
                                  <td class="hidden-phone">20000</td>
                                  <td class="vertical-align-mid">
                                    30000
                                  </td>
                                </tr>
                                <tr>
                                  <td>2</td>
                                  <td>suit</td>
                                  <td>Large</td>
                                  <td class="hidden-phone">20000</td>
                                  <td class="vertical-align-mid">
                                    30000
                                  </td>
                                </tr>
                                <tr>
                                  <td>3</td>
                                  <td>suit</td>
                                  <td>Large</td>
                                  <td class="hidden-phone">20000</td>
                                  <td class="vertical-align-mid">
                                    30000
                                  </td>
                                </tr>
                                <tr>
                                  <td>4</td>
                                  <td>suit</td>
                                  <td>Large</td>
                                  <td class="hidden-phone">20000</td>
                                  <td class="vertical-align-mid">
                                    30000
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                            <!-- end user projects -->

                          </div>
                          <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                               < <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                  <th>Room No</th>
                                  <th>Room Type</th>
                                  <th>Room Size</th>
                                  <th class="hidden-phone">Room Rent Max</th>
                                  <th>Room Rent Min</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>1</td>
                                  <td>suit</td>
                                  <td>Large</td>
                                  <td class="hidden-phone">20000</td>
                                  <td class="vertical-align-mid">
                                    30000
                                  </td>
                                </tr>
                                <tr>
                                  <td>2</td>
                                  <td>suit</td>
                                  <td>Large</td>
                                  <td class="hidden-phone">20000</td>
                                  <td class="vertical-align-mid">
                                    30000
                                  </td>
                                </tr>
                                <tr>
                                  <td>3</td>
                                  <td>suit</td>
                                  <td>Large</td>
                                  <td class="hidden-phone">20000</td>
                                  <td class="vertical-align-mid">
                                    30000
                                  </td>
                                </tr>
                                <tr>
                                  <td>4</td>
                                  <td>suit</td>
                                  <td>Large</td>
                                  <td class="hidden-phone">20000</td>
                                  <td class="vertical-align-mid">
                                    30000
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
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
    <!-- morris.js -->
    <script src="../vendors/raphael/raphael.min.js"></script>
    <script src="../vendors/morris.js/morris.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="js/moment/moment.min.js"></script>
    <script src="js/datepicker/daterangepicker.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>

    <script>
        $(function () {
            Morris.Bar({
                element: 'graph_bar',
                data: [
                  { "period": "Jan", "Hours worked": 80 },
                  { "period": "Feb", "Hours worked": 125 },
                  { "period": "Mar", "Hours worked": 176 },
                  { "period": "Apr", "Hours worked": 224 },
                  { "period": "May", "Hours worked": 265 },
                  { "period": "Jun", "Hours worked": 314 },
                  { "period": "Jul", "Hours worked": 347 },
                  { "period": "Aug", "Hours worked": 287 },
                  { "period": "Sep", "Hours worked": 240 },
                  { "period": "Oct", "Hours worked": 211 }
                ],
                xkey: 'period',
                hideHover: 'auto',
                barColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
                ykeys: ['Hours worked', 'sorned'],
                labels: ['Hours worked', 'SORN'],
                xLabelAngle: 60,
                resize: true
            });

            $MENU_TOGGLE.on('click', function () {
                $(window).resize();
            });
        });
    </script>

    <!-- datepicker -->
    <script type="text/javascript">
        $(document).ready(function () {

            var cb = function (start, end, label) {
                console.log(start.toISOString(), end.toISOString(), label);
                $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                //alert("Callback has fired: [" + start.format('MMMM D, YYYY') + " to " + end.format('MMMM D, YYYY') + ", label = " + label + "]");
            }

            var optionSet1 = {
                startDate: moment().subtract(29, 'days'),
                endDate: moment(),
                minDate: '01/01/2012',
                maxDate: '12/31/2015',
                dateLimit: {
                    days: 60
                },
                showDropdowns: true,
                showWeekNumbers: true,
                timePicker: false,
                timePickerIncrement: 1,
                timePicker12Hour: true,
                ranges: {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                    'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                },
                opens: 'left',
                buttonClasses: ['btn btn-default'],
                applyClass: 'btn-small btn-primary',
                cancelClass: 'btn-small',
                format: 'MM/DD/YYYY',
                separator: ' to ',
                locale: {
                    applyLabel: 'Submit',
                    cancelLabel: 'Clear',
                    fromLabel: 'From',
                    toLabel: 'To',
                    customRangeLabel: 'Custom',
                    daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
                    monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                    firstDay: 1
                }
            };
            $('#reportrange span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
            $('#reportrange').daterangepicker(optionSet1, cb);
            $('#reportrange').on('show.daterangepicker', function () {
                console.log("show event fired");
            });
            $('#reportrange').on('hide.daterangepicker', function () {
                console.log("hide event fired");
            });
            $('#reportrange').on('apply.daterangepicker', function (ev, picker) {
                console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));
            });
            $('#reportrange').on('cancel.daterangepicker', function (ev, picker) {
                console.log("cancel event fired");
            });
            $('#options1').click(function () {
                $('#reportrange').data('daterangepicker').setOptions(optionSet1, cb);
            });
            $('#options2').click(function () {
                $('#reportrange').data('daterangepicker').setOptions(optionSet2, cb);
            });
            $('#destroy').click(function () {
                $('#reportrange').data('daterangepicker').remove();
            });
        });
    </script>
    <!-- /datepicker -->
   
</asp:Content>

