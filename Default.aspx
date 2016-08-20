<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Holiday - templatemo</title>
<!--
Holiday Template
http://www.templatemo.com/tm-475-holiday
-->
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700' rel='stylesheet' type='text/css'>
  <link href="css/font-awesome.min.css" rel="stylesheet">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
  <link href="css/flexslider.css" rel="stylesheet">
  <link href="css/templatemo-style.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <  
     <style>


        /*custom font*/
@import url(http://fonts.googleapis.com/css?family=Montserrat);

/*basic reset*/
* {margin: 0; padding: 0;}

html {
	height: 100%;
	Image only BG fallback
	background: url('http://thecodeplayer.com/uploads/media/gs.png');
	background = gradient + image pattern combo
	background: 
		linear-gradient(rgba(196, 102, 0, 0.2), rgba(155, 89, 182, 0.2)), 
		url('http://thecodeplayer.com/uploads/media/gs.png');
}

body {
	font-family: montserrat, arial, verdana;
}
form styles
#msform {
	width: 50%;
	margin: 1% auto;
	text-align: center;
	position: relative;
}
#msform fieldset {
	background: white;
	border: 0 none;
	border-radius: 3px;
	box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
	padding: 2px 3px;
	align-content:center;
	box-sizing: border-box;
	width: 100%;
	margin: 0 0.2%;
	
	stacking fieldsets above each other
	position: absolute;
}
Hide all except first fieldset
#msform fieldset:not(:first-of-type) {
	display: none;
}
inputs
#msform input, #msform textarea {
	padding: 2%;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-bottom: 2%;
	width: 100%;
	box-sizing: border-box;
	font-family: montserrat;
	color: #2C3E50;
	font-size: 13px;
}
buttons
#msform .action-button {
	width: 10%;
	background: #27AE60;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 1px;
	cursor: pointer;
	padding: 1% 0.5%;
	margin: 1% 0.5%;
}
#msform .action-button:hover, #msform .action-button:focus {
	box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}
headings
.fs-title {
	font-size: 15px;
	text-transform: uppercase;
	color: #2C3E50;
	margin-bottom: 10px;
}
.fs-subtitle {
	font-weight: normal;
	font-size: 13px;
	color: #666;
	margin-bottom: 20px;
}
progressbar
#progressbar {
	margin-bottom: 30px;
	overflow: hidden;
	CSS counters to number the steps
	counter-reset: step;
}
#progressbar li {
	list-style-type: none;
	color: white;
	text-transform: uppercase;
	font-size: 9px;
	width: 33.33%;
	float: left;
	position: relative;
}
#progressbar li:before {
	content: counter(step);
	counter-increment: step;
	width: 20px;
	line-height: 20px;
	display: block;
	font-size: 10px;
	color: #333;
	background: white;
	border-radius: 3px;
	margin: 0 auto 5px auto;
}
progressbar connectors
#progressbar li:after {
	content: '';
	width: 100%;
	height: 2px;
	background: white;
	position: absolute;
	left: -50%;
	top: 9px;
	z-index: -1; put it behind the numbers
}
#progressbar li:first-child:after {
	connector not needed before the first step
	content: none; 
}
marking active/completed steps green
The number of the step and the connector before it = green
#progressbar li.active:before,  #progressbar li.active:after{
	background: #27AE60;
	color: white;
}
.lft{
    float:left;
}
.responsive-fieldset {
     width: 100%

}






    </style>




<!--         <div class="container">      multistep form -->
<form id="msform">
	<!-- progressbar -->
	<ul id="progressbar">
		<li class="active">Account Setup</li>
		<li>Social Profiles</li>
		<li>Personal Details</li>
	</ul>
	<!-- fieldsets -->
    
	<fieldset>
        
		<h2 class="fs-title">Create your account</h2>
		<h3 class="fs-subtitle">This is step 1</h3>
       
         <div class="row">
            <div class="form-group col-sm-4 ">
        <label class="lft">Registration No</label>
		<input type="text" name="reg no" class="form-control" placeholder="Registration No" />
                </div>
            <div class="form-group col-sm-4">
        <label class="lft">Arrival Date</label>
        	<input type="date" name="arrdate" class="form-control" placeholder="Arrival Date" />
                </div>
            <div class="form-group col-sm-4">
        <label class="lft">Arrival Time</label>
        	<input type="time" name="arrtime" class="form-control" placeholder="Arrival Time" />
            </div>
             
          
              <div class="form-group col-sm-12">
        <label class="lft">N.I.C No</label>
        	<input type="number" name="nicno" class="form-control" placeholder="N.I.C No" />
                  </div>
              
        
       
        <div class="form-group col-sm-6">
        <label class="lft">Date Of Birth</label>	
        <input type="date" name="dob" class="form-control" placeholder="Date Of Birth"/>
            </div>
            <div class="form-group col-sm-6">
        <label class="lft">Compnay Name</label>
        	<input type="text" name="Company"  class="form-control" placeholder="Compnay Name" />
                </div>
            
        
            <div class="form-group col-sm-12">
        <label class="lft">Complete Address</label>
        	<textarea name="Caddress" class="form-control" placeholder="Complete Address"></textarea>
      </div>
            

        
            <div class="form-group col-sm-6">
        <label class="lft">Proffesion</label>
        	<input type="text" name="proffesion" class="form-control" placeholder="Proffesion" />
                </div>
              <div class="form-group col-sm-6">
        <label class="lft">Designation</label>
        	<input type="text" name="designation" class="form-control" placeholder="Designation" />
                  </div>
            
        
            <div class="form-group col-sm-12">
        
        <label class="lft">Permenent Address</label>
        <textarea name="Paddress" class="form-control" placeholder="Permenent Address"></textarea>
        </div>
         

        
        <div class="form-group col-sm-4">
            <label class="lft">Ph No. Office</label>
        <input type="number" name="officeph" class="form-control" placeholder="Ph No. Office" />
            </div>
            <div class="form-group col-sm-4">
        <label class="lft">Ph No. Residence</label>
        <input type="number" name="residenceph" class="form-control" placeholder="Ph No. Residence" />
                </div>
            <div class="form-group col-sm-4">
        <label class="lft">Ph No. Cell</label>
        <input type="number name="cellph" class="form-control" placeholder="Ph No. Cell" />
                </div>
           

        
            <div class="form-group col-sm-4">
       <label class="lft">Departure Date</label>
         <input type="date" name="ddate" class="form-control" placeholder="Departure Date" />
                </div>
            <div class="form-group col-sm-4">
        <label class="lft">Departure Time</label>
        	<input type="time" name="dptime" class="form-control" placeholder="Departure Time" />
                </div>
                <div class="form-group col-sm-4">
        <label class="lft">Filght No</label>
         <input type="number name="flightno" class="form-control" placeholder="Flight No" />
                    </div>
           
		
            <div class="form-group col-sm-12">
        <input type="button" name="next" class="next action-button" value="Next" />
                </div>
           </div>
           
	</fieldset>
   

	<fieldset>
		<h2 class="fs-title">Personal Details</h2>
		<h3 class="fs-subtitle">We will never sell it</h3>
		<input type="text" name="fname" placeholder="First Name" />
		<input type="text" name="lname" placeholder="Last Name" />
		<input type="text" name="phone" placeholder="Phone" />
		<textarea name="address" placeholder="Address"></textarea>
		<input type="button" name="previous" class="previous action-button" value="Previous" />
		<input type="submit" name="submit" class="submit action-button" value="Submit" />
	</fieldset>
</form>

   




<!-- jQuery -->
<script src="http://thecodeplayer.com/uploads/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<!-- jQuery easing plugin -->
<script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js" type="text/javascript"></script>




     <script>

         //jQuery time
         //var current_fs, next_fs, previous_fs; //fieldsets
         //var left, opacity, scale; //fieldset properties which we will animate
         //var animating; //flag to prevent quick multi-click glitches

         //$(".next").click(function () {
         //    if (animating) return false;
         //    animating = true;

         //    current_fs = $(this).parent();
         //    next_fs = $(this).parent().next();

         //    //activate next step on progressbar using the index of next_fs
         //    $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

         //    //show the next fieldset
         //    next_fs.show();
         //    //hide the current fieldset with style
         //    current_fs.animate({ opacity: 0 }, {
         //        step: function (now, mx) {
         //            //as the opacity of current_fs reduces to 0 - stored in "now"
         //            //1. scale current_fs down to 80%
         //            scale = 1 - (1 - now) * 0.2;
         //            //2. bring next_fs from the right(50%)
         //            left = (now * 50) + "%";
         //            //3. increase opacity of next_fs to 1 as it moves in
         //            opacity = 1 - now;
         //            current_fs.css({ 'transform': 'scale(' + scale + ')' });
         //            next_fs.css({ 'left': left, 'opacity': opacity });
         //        },
         //        duration: 800,
         //        complete: function () {
         //            current_fs.hide();
         //            animating = false;
         //        },
         //        //this comes from the custom easing plugin
         //        easing: 'easeInOutBack'
         //    });
         //});

         //$(".previous").click(function () {
         //    if (animating) return false;
         //    animating = true;

         //    current_fs = $(this).parent();
         //    previous_fs = $(this).parent().prev();

         //    //de-activate current step on progressbar
         //    $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

         //    //show the previous fieldset
         //    previous_fs.show();
         //    //hide the current fieldset with style
         //    current_fs.animate({ opacity: 0 }, {
         //        step: function (now, mx) {
         //            //as the opacity of current_fs reduces to 0 - stored in "now"
         //            //1. scale previous_fs from 80% to 100%
         //            scale = 0.8 + (1 - now) * 0.2;
         //            //2. take current_fs to the right(50%) - from 0%
         //            left = ((1 - now) * 50) + "%";
         //            //3. increase opacity of previous_fs to 1 as it moves in
         //            opacity = 1 - now;
         //            current_fs.css({ 'left': left });
         //            previous_fs.css({ 'transform': 'scale(' + scale + ')', 'opacity': opacity });
         //        },
         //        duration: 800,
         //        complete: function () {
         //            current_fs.hide();
         //            animating = false;
         //        },
         //        //this comes from the custom easing plugin
         //        easing: 'easeInOutBack'
         //    });
         //});

         //$(".submit").click(function () {
         //    return false;
         //})


         //jQuery time
         var current_fs, next_fs, previous_fs; //fieldsets
         var left, opacity, scale; //fieldset properties which we will animate
         var animating; //flag to prevent quick multi-click glitches

         $(".next").click(function () {
             if (animating) return false;
             animating = true;

             current_fs = $(this).parent();
             next_fs = $(this).parent().next();

             //activate next step on progressbar using the index of next_fs
             $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

             //show the next fieldset
             next_fs.show();
             //hide the current fieldset with style
             current_fs.animate({ opacity: 0 }, {
                 step: function (now, mx) {
                     //as the opacity of current_fs reduces to 0 - stored in "now"
                     //1. scale current_fs down to 80%
                     scale = 1 - (1 - now) * 0.2;
                     //2. bring next_fs from the right(50%)
                     left = (now * 50) + "%";
                     //3. increase opacity of next_fs to 1 as it moves in
                     opacity = 1 - now;
                     current_fs.css({ 'transform': 'scale(' + scale + ')' });
                     next_fs.css({ 'left': left, 'opacity': opacity });
                 },
                 duration: 800,
                 complete: function () {
                     current_fs.hide();
                     animating = false;
                 },
                 //this comes from the custom easing plugin
                 easing: 'easeInOutBack'
             });
         });

         $(".previous").click(function () {
             if (animating) return false;
             animating = true;

             current_fs = $(this).parent();
             previous_fs = $(this).parent().prev();

             //de-activate current step on progressbar
             $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

             //show the previous fieldset
             previous_fs.show();
             //hide the current fieldset with style
             current_fs.animate({ opacity: 0 }, {
                 step: function (now, mx) {
                     //as the opacity of current_fs reduces to 0 - stored in "now"
                     //1. scale previous_fs from 80% to 100%
                     scale = 0.8 + (1 - now) * 0.2;
                     //2. take current_fs to the right(50%) - from 0%
                     left = ((1 - now) * 50) + "%";
                     //3. increase opacity of previous_fs to 1 as it moves in
                     opacity = 1 - now;
                     current_fs.css({ 'left': left });
                     previous_fs.css({ 'transform': 'scale(' + scale + ')', 'opacity': opacity });
                 },
                 duration: 800,
                 complete: function () {
                     current_fs.hide();
                     animating = false;
                 },
                 //this comes from the custom easing plugin
                 easing: 'easeInOutBack'
             });
         });

         $(".submit").click(function () {
             return false;
         })


    </script>
</body>
</html>
