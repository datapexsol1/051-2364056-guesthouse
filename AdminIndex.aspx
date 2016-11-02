<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.master" AutoEventWireup="true" CodeFile="adminIndex.aspx.cs" Inherits="AdminIndex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="build/css/style.css" rel="stylesheet" />
     <script src="js/canvasjs.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
     <script src="js/ajax.js"></script>
    <script>
  $(document).ready(function() {
      $("#datewincome").datepicker();
      $("#datebexp3").datepicker();
      $("#datebexpy").datepicker();
      
  });


  
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <!-- page content-->
       
    <div class="right_col" role="main">
          <div class="">
            <div class="row top_tiles" style="margin: 10px 0;">
              <div class="col-md-3 col-sm-3 col-xs-6 tile">
                <span>Total Sessions</span>
                <h2>231,809</h2>
                <span class="sparkline_one" style="height: 160px;">
                      <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                  </span>
              </div>
              <div class="col-md-3 col-sm-3 col-xs-6 tile">
                <span>Total Revenue</span>
                <h2>$ 231,809</h2>
                <span class="sparkline_one" style="height: 160px;">
                      <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                  </span>
              </div>
              <div class="col-md-3 col-sm-3 col-xs-6 tile">
                <span>Total Sessions</span>
                <h2>231,809</h2>
                <span class="sparkline_two" style="height: 160px;">
                      <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                  </span>
              </div>
              <div class="col-md-3 col-sm-3 col-xs-6 tile">
                <span>Total Sessions</span>
                <h2>231,809</h2>
                <span class="sparkline_one" style="height: 160px;">
                      <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                  </span>
              </div>
            </div>
            <br />

              
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="dashboard_graph x_panel">
                 <%-- <div class="row x_title">
                    <div class="col-md-6">
                      <h3>Network Activities <small>Graph title sub-title</small></h3>
                    </div>
                    <div class="col-md-6">
                      <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                        <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                      </div>
                    </div>
                  </div>--%>
                  
                  <div class="x_content">
                      <div id="chartContainer" style="height: 400px; width: 100%;"></div>
                    <div class="demo-container" style="height:0px">
                        
                      <div id="placeholder3xx3" class="demo-placeholder" style="width: 100%; height:250px;"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>


           <%-- <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="dashboard_graph x_panel">
                  <div class="row x_title">
                    <div class="col-md-6">
                      <h3>Network Activities <small>Graph title sub-title</small></h3>
                    </div>
                    <div class="col-md-6">
                      <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                        <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                      </div>
                    </div>
                  </div>
                  <div class="x_content">
                    <div class="demo-container" style="height:250px">
                      <div id="placeholder3xx3" class="demo-placeholder" style="width: 100%; height:250px;"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>--%>

              <input id="bincome" type="hidden" />
               <input id="hdatewincome" type="hidden" />
               <input id="hmonthlyincome" type="hidden" />
               <input id="hyearincome" type="hidden" />
              <%--<input id="bexpenditure" type="hidden" />--%>
              
            <div class="row">
              <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="x_panel graphheight">
                  <div class="x_title">
                    <h2>Weekly</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                            <%  IQueryable<branch> br = admingraphclass.getAllbranches();
                                foreach (branch x in br)
                                { %>
                          <li><a href="#" onclick="changevaluebincome('<%=x.name %>');"><%=x.name %></a></li>
                            <%} %>
                         
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                       <div class="x_content">
                    <h4 id ="incomebranches"></h4>
                           <small><input id="datewincome" onchange="changevaluebincome($('#bincome').val()); "/></small>
                        
                     <div id="chartContainer1" ></div>

                  </div>
                  </div>
                 
                </div>
              </div>
                  <!-- Monthly Income-->
                <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="x_panel graphheight">
                  <div class="x_title">
                    <h2>Monthly<small></small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                            <%  //IQueryable<branch> br = admingraphclass.getAllbranches();
                                foreach (branch x in br)
                                { %>
                          <li><a href="#" onclick="changemonthlygraph('<%=x.name %>');"><%=x.name %></a></li>
                            <%} %>
                         
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                       <div class="x_content">
                    <h4 id ="incomebranches3"> </h4>
                           <small><input id="datebexp3" onchange="changemonthlygraph($('#hmonthlyincome').val()); "/></small>
                       
                     <div id="chartContainer3" ></div>

                  </div>
                  </div>
                 
                </div>
              </div>
               <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="x_panel graphheight">
                  <div class="x_title">
                    <h2>Yearly<small> </small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                            <%  //IQueryable<branch> br = admingraphclass.getAllbranches();
                                foreach (branch x in br)
                                { %>
                          <li><a href="#" onclick="changeyearlygraph('<%=x.name %>');"><%=x.name %></a></li>
                            <%} %>
                         
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                       <div class="x_content">
                    <h4 id ="incomebranches1"> </h4>
                           <small><input id="datebexpy" onchange="changeyearlygraph($('#hyearincome').val()); "/></small>
                       
                     <div id="chartContainer2" ></div>

                  </div>
                  </div>
                 
                </div>
              </div>
    <script>

        function changevaluebincome(val){
            $('#bincome').val(val);
            $('#hdatewincome').val($('#datewincome').val());
            var date=$('#datewincome').val();
            var xyz=  getbranchweeklyincome($('#bincome').val(),date);
            var abc=  getbranchweeklyexpenditure($('#bincome').val(),date);
            var chart = new CanvasJS.Chart("chartContainer1");
  chart.options.animationEnabled= true;
    
    chart.options.toolTip={
    		
    		content: function(e){
    	          var body ;
    	          var head ;
    	          head = "<span style= 'color:"+e.entries[0].dataSeries.color + "'> <strong>"+e.entries[0].dataSeries.name +"</strong></span><br/>";

    	          body = " <strong>New <strong>"+e.entries[0].dataSeries.name +":</strong>"+  e.entries[0].dataPoint.y + "</strong><br/>";

    	          return (head.concat(body));
    	        }
          };
     chart.options.theme= "theme3";
    chart.options.axisX = { title: "Weekly ",titleFontSize: 30,interval: 1};
    chart.options.axisY = { title: "Rupees", includeZero: false,interval: 100000,titleFontSize: 20};
    /* chart.options.axisY2 = { prefix: "$", suffix: "K",title: "Price"}; */
    chart.options.title = { text: "Income & Expenditure" };
    var series=[];
  
    
    series[0]={ //dataSeries - first quarter
        type: "bar",         //area ,spline,scatter
        name: "Income",
        color:"Green",
        fillOpacity:1,
            showInLegend: true,
           
    };
    series[1]={ //dataSeries - first quarter
        type: "bar",         //area ,spline,scatter
        name: "Expenditure",
        color:"Red",
        fillOpacity:1,
        showInLegend: true,
           
    };
    
   
   
    chart.options.data = [];
    for(var z=0;z<2;z++){ 
        chart.options.data.push(series[z]);
      }
   
        series[0].dataPoints = [
                { label:"Mon", y: xyz[0]},
               { label:"Tue", y: xyz[1] },
               { label:"Wed", y: xyz[2]},
               { label:"Thu", y: xyz[3] },
               { label:"Fri", y:  xyz[4]},
               { label:"Sat", y: xyz[5]},
               { label:"sun", y:  xyz[6]}, 
        ];
        series[1].dataPoints = [
            { label:"Mon", y: abc[0]},
           { label:"Tue", y: abc[1] },
           { label:"Wed", y: abc[2]},
           { label:"Thu", y: abc[3] },
           { label:"Fri", y:  abc[4]},
           { label:"Sat", y:abc[5]},
           { label:"sun", y:  abc[6]}, 
        ];

        
    chart.render();

  
       
    if($('#hdatewincome').val()==''){

        if($('#bincome').val()==''){
            var m_names = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");

            var d = new Date();
            var curr_date = d.getDate().toString();
            var curr_month = d.getMonth();
            var curr_year = d.getFullYear().toString();
            var date = curr_date+ "-" +m_names[curr_month]  + "-" + curr_year;
                 
            $('#incomebranches').html("All Branches    &"+ date);

        }
        else{

            var m_names = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");

            var d = new Date();
            var curr_date = d.getDate().toString();
            var curr_month = d.getMonth();
            var curr_year = d.getFullYear().toString();
            var date =curr_date+ "-" +m_names[curr_month]  + "-" + curr_year;
                 
            $('#incomebranches').html($('#bincome').val()+"  & "+ date);
        }
                   
    }else{
        if($('#bincome').val()==''){
            var d=new Date($('#hdatewincome').val()).format('d,M,y');

            //var curr_date = d.getDate().toString();
            //var curr_month = d.getMonth();
            //var curr_year = d.getFullYear().toString();
            //var date = m_names[curr_month]  + "-" + curr_year;
            $('#incomebranches').html("All Branches"+"   &"+d);
        }
        else{
            var d=new Date($('#hdatewincome').val()).format('d,M,y');

            //var curr_date = d.getDate().toString();
            //var curr_month = d.getMonth();
            //var curr_year = d.getFullYear().toString();
            //var date = m_names[curr_month]  + "-" + curr_year;
            $('#incomebranches').html($('#bincome').val()+"  &"+d);
        }

    }
        
        
        
        
        
        }


        //change expenditure
        //function changevalueexpenditure(val){
          
        //    $('#bexpenditure').val(val);
        //     var date =$('#datebexp').val();
           
        //     var xyz=  getbranchweeklyexpenditure($('#bexpenditure').val(),date);
        //    var chart = new CanvasJS.Chart("chartContainer2");
        //    chart.options.animationEnabled= true;
    
        //    chart.options.toolTip={
    		
        //        content: function(e){
        //            var body ;
        //            var head ;
        //            head = "<span style= 'color:"+e.entries[0].dataSeries.color + "'> <strong>"+e.entries[0].dataSeries.name +"</strong></span><br/>";

        //            body = " <strong>New <strong>"+e.entries[0].dataSeries.name +":</strong>"+  e.entries[0].dataPoint.y + "</strong><br/>";

        //            return (head.concat(body));
        //        }
        //    };
        //    chart.options.theme= "theme4";
        //    chart.options.axisX = { title: "This Week",titleFontSize: 30,interval: 1};
        //    chart.options.axisY = { title: "Income", includeZero: false,interval: 10000,titleFontSize: 20};
        //    /* chart.options.axisY2 = { prefix: "$", suffix: "K",title: "Price"}; */
        //    chart.options.title = { text: "Income & Expenditure" };
        //    var series=[];
  
    
        //    series[0]={ //dataSeries - first quarter
        //        type: "bar",         //area ,spline,scatter
        //        name: "Expenditure",
        //        color:"red",
        //        fillOpacity:1,
        //        showInLegend: true,
           
        //    };
    
   
   
        //    chart.options.data = [];
        //    for(var z=0;z<1;z++){ 
        //        chart.options.data.push(series[z]);
        //    }
        //    for(var y=0;y<1;y++){
        //        series[y].dataPoints = [
        //                { label:"Mon", y: xyz[0]},
        //               { label:"Tue", y: xyz[1] },
        //               { label:"Wed", y: xyz[2]},
        //               { label:"Thu", y: xyz[3] },
        //               { label:"Fri", y:  xyz[4]},
        //               { label:"Sat", y: xyz[5]},
        //               { label:"sun", y:  xyz[6]}, 
        //        ];

        //    }
        //    chart.render();
        //    if($('#bexpenditure').val()==''){
    
        //        $('#incomebranches1').html("All Branches");
        //    }else{
        //        $('#incomebranches1').html($('#bexpenditure').val());
        //    }
        //}
        //*******************************************************************end of weekly expenditure

        function numberOfDays(year, month) {
            var d = new Date(year, month, 0);
            return d.getDate();
        }
       
        //MOnthly INcome
        function changemonthlygraph(val){
          
            // var monthlyincomedate=[];
            // var monthlyincomevalue=[];
            var dps=[];
            var mexp=[];
            $('#hmonthlyincome').val(val);
            var date =$('#datebexp3').val();
           
            var xyz=  getMonthlyIncome($('#hmonthlyincome').val(),date);
            var exp=  getMonthlyExp($('#hmonthlyincome').val(),date);
            var i=0;
            $.each(xyz, function (k, v) {
                // monthlyincomedate[i]=k;
                //monthlyincomevalue[i]=v;
                dps.push({x:new Date(k), y: v});
               
            });
            $.each(exp, function (k, v) {
                // monthlyincomedate[i]=k;
                // monthlyincomevalue[i]=v;
                mexp.push({x:new Date(k), y: v});
               
            });
           
            var chart = new CanvasJS.Chart("chartContainer3");
            chart.options.animationEnabled= true;
    
            chart.options.toolTip={
    		
                content: function(e){
                    var body ;
                    var head ;
                    var curretdate=new Date(e.entries[0].dataPoint.x).toString('d,MMM, y');//.format("D-M-Y");
                    head = "<span style= 'color:"+e.entries[0].dataSeries.color + "'> <strong>"+e.entries[0].dataSeries.name +"</strong></span><br/>";

                    body = " <strong>New <strong>"+e.entries[0].dataSeries.name +":</strong>"+  e.entries[0].dataPoint.y + "</strong><br/>"+"</strong><strong style= 'color:blue'> Date:"+curretdate+ "</strong><br/>";

                    return (head.concat(body));
                }
            };
            chart.options.theme= "theme3";
            chart.options.axisX = { title: "Monthly",titleFontSize: 25, interval: 4,
                intervalType: "day",includeZero: true,valueFormatString: "DD-MMM"};
            chart.options.axisY = { title: "Rupees", includeZero: false,interval: 100000,titleFontSize: 20};
            /* chart.options.axisY2 = { prefix: "$", suffix: "K",title: "Price"}; */
            chart.options.title = { text: "Income & Expenditure" };
            var series=[];
  
    
            series[0]={ //dataSeries - first quarter
                type: "bar",         //area ,spline,scatter
                name: "Income",
                color:"green",
                fillOpacity:1,
                showInLegend: true,
           
            };
            series[1]={ //dataSeries - first quarter
                type: "bar",         //area ,spline,scatter
                name: "Expenditure",
                color:"red",
                fillOpacity:1,
                showInLegend: true,
           
            };
            chart.options.data = [];
            for(var z=0;z<2;z++){ 
                chart.options.data.push(series[z]);
            }
            chart.options.data[0].dataPoints=dps;
            chart.options.data[1].dataPoints=mexp;

            // }
            chart.render();

            //for showing msg on graph
              
                if($('#datebexp3').val()==''){

                    if($('#hmonthlyincome').val()==''){
                        var m_names = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");

                        var d = new Date();
                        var curr_date = d.getDate().toString();
                        var curr_month = d.getMonth();
                        var curr_year = d.getFullYear().toString();
                        var date = m_names[curr_month]  + "-" + curr_year;
                 
                        $('#incomebranches3').html("All Branches    &"+ date);

                    }
                    else{

                        var m_names = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");

                        var d = new Date();
                        var curr_date = d.getDate().toString();
                        var curr_month = d.getMonth();
                        var curr_year = d.getFullYear().toString();
                        var date = m_names[curr_month]  + "-" + curr_year;
                 
                        $('#incomebranches3').html($('#hmonthlyincome').val()+"  & "+ date);
                    }
                   
                }else{
                    if($('#hmonthlyincome').val()==''){
                        var d=new Date($('#datebexp3').val()).format('M,y');

                        //var curr_date = d.getDate().toString();
                        //var curr_month = d.getMonth();
                        //var curr_year = d.getFullYear().toString();
                        //var date = m_names[curr_month]  + "-" + curr_year;
                        $('#incomebranches3').html("All Branches"+"   &"+d);
                    }
                    else{
                        var d=new Date($('#datebexp3').val()).format('M,y');

                        //var curr_date = d.getDate().toString();
                        //var curr_month = d.getMonth();
                        //var curr_year = d.getFullYear().toString();
                        //var date = m_names[curr_month]  + "-" + curr_year;
                        $('#incomebranches3').html($('#hmonthlyincome').val()+"  &"+d);
                    }

                }
            //}
      

        }
        function changeyearlygraph(val){
            var dps=[];
            var mexp=[];
            $('#hyearincome').val(val);
            var date =$('#datebexpy').val();
            alert("yearly"+val);
            alert("yearly"+date);
            var xyz=  getyearlyIncome($('#hyearincome').val(),date);
            var exp=  getyearlyExp($('#hyearincome').val(),date);
            var i=0;
            $.each(xyz, function (k, v) {
                dps.push({x:new Date(k), y: v});
               
            });
            $.each(exp, function (k, v) {
                mexp.push({x:new Date(k), y: v});    
            });
           
            var chart = new CanvasJS.Chart("chartContainer2");
            chart.options.animationEnabled= true;
    
            chart.options.toolTip={
    		
                content: function(e){
                    var body ;
                    var head ;
                    var curretdate=new Date(e.entries[0].dataPoint.x).toString('d,MMM, y');//.format("D-M-Y");
                    head = "<span style= 'color:"+e.entries[0].dataSeries.color + "'> <strong>"+e.entries[0].dataSeries.name +"</strong></span><br/>";

                    body = " <strong>New <strong>"+e.entries[0].dataSeries.name +":</strong>"+  e.entries[0].dataPoint.y + "</strong><br/>"+"</strong><strong style= 'color:blue'> Date:"+curretdate+ "</strong><br/>";

                    return (head.concat(body));
                }
            };
            chart.options.theme= "theme3";
            chart.options.axisX = { title: "Monthly",titleFontSize: 25, interval: 4,
                intervalType: "day",includeZero: true,valueFormatString: "DD-MMM"};
            chart.options.axisY = { title: "Rupees", includeZero: false,interval: 100000,titleFontSize: 20};
            /* chart.options.axisY2 = { prefix: "$", suffix: "K",title: "Price"}; */
            chart.options.title = { text: "Income & Expenditure" };
            var series=[];
  
    
            series[0]={ //dataSeries - first quarter
                type: "bar",         //area ,spline,scatter
                name: "Income",
                color:"green",
                fillOpacity:1,
                showInLegend: true,
           
            };
            series[1]={ //dataSeries - first quarter
                type: "bar",         //area ,spline,scatter
                name: "Expenditure",
                color:"red",
                fillOpacity:1,
                showInLegend: true,
           
            };
            chart.options.data = [];
            for(var z=0;z<2;z++){ 
                chart.options.data.push(series[z]);
            }
            chart.options.data[0].dataPoints=dps;
            chart.options.data[1].dataPoints=mexp;

            // }
            chart.render();

           // for showing msg on graph
          
                if($('#datebexpy').val()==''){
                    if($('#hyearincome').val()==''){
                        var m_names = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");

                        var d = new Date();
                        var curr_date = d.getDate().toString();
                        var curr_month = d.getMonth();
                        var curr_year = d.getFullYear().toString();
                        var date = m_names[curr_month]  + "-" + curr_year;
                        $('#incomebranches1').html("All Branches:"+ date);
                    }
                    else{

                        var m_names = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");

                        var d = new Date();
                        var curr_date = d.getDate().toString();
                        var curr_month = d.getMonth();
                        var curr_year = d.getFullYear().toString();
                        var date = m_names[curr_month]  + "-" + curr_year;
                        $('#incomebranches1').html($('#hyearincome').val()+"   &"+ date);

                    }
                   
                }else{
                    if($('#hyearincome').val()==''){
                        var da=new Date($('#datebexpy').val()).format('M,y');
                        $('#incomebranches1').html("All Branches  &" +da);
                    }
                    else{
                        var da=new Date($('#datebexpy').val()).format('M,y');
                        $('#incomebranches1').html($('#hyearincome').val()+" &" +da);
                    }
                }
            
        }

              


    </script>
    <script>
   <%

         int[] exp = admingraphclass.getTotalExpendeture();
         int[] income = admingraphclass.getTotalIncome();


          %>
	
//*******************RecruiterDataBinding***************************
        window.onload=function myfucntion(){

             var jan=[2];
 	    var feb=[2];
 	    var march=[2];
 	    var april=[2];
 	    var may=[2];
 	    var june=[2];
 	    var july=[2];
 	    var augest=[2];
 	    var september=[2];
 	    var october=[2];
 	    var november=[2];
 	    var december=[2];
            //*********************************RecruiterBindin
	  jan[0]= <%=exp[0]%>;
 	  feb[0]= <%=exp[1] %>;
 	  march[0]= <%=exp[2]%>;
 	  april[0]=<%=exp[3]%>;
 	  may[0]=<%=exp[4]%>;
 	  june[0]= <%=exp[5]%>;
 	  july[0]=  <%=exp[6]%>;
 	  augest[0]= <%=exp[7]%>;
 	  september[0]= <%=exp[8]%>;
 	  october[0]= <%=exp[9]%>;
 	  november[0]= <%=exp[10]%>;
 	  december[0]=<%=exp[11]%>;
 	    //***************************************JobSeekerdata binding

 	     jan[1]= <%=income[0]%>;
 	     feb[1]= <%=income[1] %>;
 	     march[1]= <%=income[2]%>;
 	     april[1]=<%=income[3]%>;
 	     may[1]=<%=income[4]%>;
 	     june[1]= <%=income[5]%>;
 	     july[1]=  <%=income[6]%>;
 	     augest[1]= <%=income[7]%>;
 	     september[1]= <%=income[8]%>;
 	     october[1]= <%=income[9]%>;
 	     november[1]= <%=income[10]%>;
            december[1]=<%=income[11]%>;
           

            var chart = new CanvasJS.Chart("chartContainer");
  chart.options.animationEnabled= true;
    
    chart.options.toolTip={
    		
    		content: function(e){
    	          var body ;
    	          var head ;
    	          head = "<span style= 'color:"+e.entries[0].dataSeries.color + "'> <strong>"+e.entries[0].dataSeries.name +"</strong></span><br/>";

    	          body = " <strong>New <strong>"+e.entries[0].dataSeries.name +":</strong>"+  e.entries[0].dataPoint.y + "</strong><br/>";

    	          return (head.concat(body));
    	        }
          };
     chart.options.theme= "theme4";
    chart.options.axisX = { title: "Month",titleFontSize: 30,interval: 1};
    chart.options.axisY = { title: "Income", includeZero: false,interval: 100000,titleFontSize: 20};
    /* chart.options.axisY2 = { prefix: "$", suffix: "K",title: "Price"}; */
    chart.options.title = { text: "Income & Expenditure" };
    var series=[];
  
    
    series[0]={ //dataSeries - first quarter
        type: "splineArea",         //area ,spline,scatter
        name: "Expenditure",
        color:"red",
        fillOpacity:0.1,
            showInLegend: true,
           
    };
    series[1]={ //dataSeries - first quarter
        type: "splineArea",   
        name: "Income",
        color:"Orange",
        fillOpacity:0.2,
        showInLegend: true,
           
    };
   
   
    chart.options.data = [];
    for(var z=0;z<2;z++){ 
        chart.options.data.push(series[z]);
      }
    for(var y=0;y<2;y++){
        series[y].dataPoints = [
                { label:"Jan", y: jan[y] },
               { label:"Feb", y: feb[y] },
               { label:"March", y: march[y] },
               { label:"April", y: april[y] },
               { label:"May", y: may[y] },
               { label:"June", y: june[y]},
               { label:"July", y: july[y] },
               { label:"Aug", y: augest[y] },
                { label:"Sep", y: september[y] },
                 { label:"Oct", y: october[y] },
                  { label:"Nov", y: november[y] },
                  { label:"Dec", y: december[y] },        
        ];

        }
        chart.render();
        }
        changevaluebincome('');
       //changevalueexpenditure('');
        changemonthlygraph('');
        changeyearlygraph('');
      
        //////////////////////////////////////////////////////////////////        
  </script>
    
</asp:Content>

