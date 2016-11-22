<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeindex.aspx.cs" Inherits="employeindex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <!-- FullCalendar -->
    <link href="../vendors/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
    <link href="../vendors/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" media="print">
     <link href="../custom/custom.min.css" rel="stylesheet"/>
    <!-- Custom styling plus plugins -->
    
    
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!-- page content -->
    
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Calendar </h3>
              </div>

              <div class="title_right">
                <div style="float:right">
                  <div class="input-group">
                      <u><b><a href="employeevents.aspx" style="font:x-larger">Add/Edit/Delete Events</a></b></u>
                   
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Calendar Events </h2>
                <!--------------------------------------->
                 
                <!--------------------------------------->

                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <div id='calendar'></div>

                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
      <!-- calendar modal -->
    <div id="CalenderModalNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">

          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title" id="myModalLabel">New Calendar Entry</h4>
          </div>
          <div class="modal-body">
            <div id="testmodal" style="padding: 5px 20px;">
              <div id="antoform" class="form-horizontal calender" role="">
                <div class="form-group">
                  <label class="col-sm-3 control-label">Title</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control" id="title" name="title">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">Description</label>
                  <div class="col-sm-9">
                    <textarea class="form-control" style="height:55px;" id="descr" name="descr"></textarea>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default antoclose" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary antosubmit">Save changes</button>
          </div>
        </div>
      </div>
    </div>
    <div id="CalenderModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">

          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title" id="myModalLabel2">Edit Calendar Entry</h4>
          </div>
          <div class="modal-body">

            <div id="testmodal2" style="padding: 5px 20px;">
              <div id="antoform2" class="form-horizontal calender" role="">
                <div class="form-group">
                  <label class="col-sm-3 control-label">Title</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control" id="title2" name="title2">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">Description</label>
                  <div class="col-sm-9">
                    <textarea class="form-control" style="height:55px;" id="descr2" name="descr"></textarea>
                  </div>
                </div>

              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default antoclose2" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary antosubmit2">Save changes</button>
          </div>
        </div>
      </div>
    </div>

    <div id="fc_create" data-toggle="modal" data-target="#CalenderModalNew"></div>
    <div id="fc_edit" data-toggle="modal" data-target="#CalenderModalEdit"></div>
    <!-- /calendar modal -->
        
    <!-- jQuery -->
    <script src="js/ajax.js"></script>
     <script src="Scripts/jquery-1.10.2.js"></script>
     <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <script src="Scripts/jquery.signalR-2.1.2.js"></script>
    <script src="Scripts/jquery.signalR-2.2.1.min.js"></script>
   <script src="/signalR/hubs"></script>
   <%-- <script type="text/javascript" src='<%= ResolveClientUrl("~/signalr/hubs") %>'></script>--%>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- FullCalendar -->
    <script src="../vendors/moment/min/moment.min.js"></script>
    <script src="../vendors/fullcalendar/dist/fullcalendar.min.js"></script>
    <script src="vendors/fullcalendar/dist/fullcalendar.js"></script>

    <!-- Custom Theme Scripts -->
   
    <!-- FullCalendar -->
    

   <%-- <script>
        $(document).ready(function () {
            var job = $.connection.myHub;
            job.client.displayStatus = function () {
                getData();
            };
            $.connection.hub.start();
            getData();
        });
        function getData() {
            var $tb1 = $('#menu1');
            
            $.ajax({
                url: 'adminajax.aspx/GetData',
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                type: "POST",
                success: function (data) {
                    debugger;
                    if (data.d.length > 0) {
                        var newData = data.d;
                      //  alert(JSON.stringify(data.d));
                        $tb1.empty();
                        $tb1.append('<tr><th>ID</th><th>name</th></tr>');
                        $('#counter').text(newData.length);
                        
                        
                        var rows = [];
                   
                       
                                       
                        for (var i = 0; i < newData.length; i++) {
                            var dateobj = new Date(parseInt(newData[i].request_time.substr(6)));
                            rows.push('<li><a><span><span id="not_name">'+newData[i].guest_name+'</span><span class="time" id="not_time">'+timeSince(dateobj)+'</span> </span><span class="message" id="bid"></span> </a></li>');
                        }
                        rows.push('<li><div class="text-center"> <a><strong>See All Alerts</strong><i class="fa fa-angle-right"></i></a></div> </li>');
                        $tb1.append(rows.join(''));
                    }
                }

            });
        }
    </script>--%>
      
    <script>
        function formatDate(date) {
            var d = new Date(date),
                month = '' + (d.getMonth() + 1),
                day = '' + d.getDate(),
                year = d.getFullYear();

            if (month.length < 2) month = '0' + month;
            if (day.length < 2) day = '0' + day;

            return [day, month, year].join('-');
        }
        <%
        IQueryable<event_calender> eve = events.retrieveAllEvents(Session["loginName"].ToString());
        int i = 0; %>

        

        
        $(window).load(function () {
            var eventTitle = [];
            var eventDisc=[];
            var startDate=[];
            var endDate=[];
            var color=[];
            <% foreach(event_calender ec in eve)
        {%>
            eventTitle [<%=i%>]=  "<%=ec.event_name %>";
            eventDisc [<%=i%>]=  "<%=ec.event_description %>";
            startDate [<%=i%>]=  "<%=ec.event_start_date%>";
            endDate [<%=i%>]=  "<%=ec.event_end_date %>";
            color [<%=i%>]=  "<%=ec.event_color %>";
            <% i++;}%>
            var getEvent = []; 
            for(var i = 0;i < eventTitle.length;i++)
            {
                var hue = 'rgb(' + (Math.floor(Math.random() * 256)) + ',' + (Math.floor(Math.random() * 256)) + ',' + (Math.floor(Math.random() * 256)) + ')';
                
                var primaryAsset =eventTitle[i] ;
                var release_Date =  formatDate(startDate[i]);
                var end_Date = endDate[i];
                var eve_desc = eventDisc[i];
                var eve_color = color[i];
                var insertEvents = [];
              
                insertEvents =
                {
                    title: 'Title : '+primaryAsset+'\nDescription : '+eve_desc,
                    start: release_Date,
                    end:end_Date,
                    color:eve_color

                }
                allDay:true,
                
                getEvent.push(insertEvents);

            }
            //**********
            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                editable: false,
                weekends: true, 
                events: getEvent,
               

            });
        });
       
     
    </script>
    <!-- /FullCalendar -->
</asp:Content>

