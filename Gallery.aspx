<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!--
Holiday Template
http://www.templatemo.com/tm-475-holiday
-->
    <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
     <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      		<!-- jQuery -->
  	<script type="text/javascript" src="js/moment.js"></script>							<!-- moment.js -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>					<!-- bootstrap js -->
	<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>	<!-- bootstrap date time picker js, http://eonasdan.github.io/bootstrap-datetimepicker/ -->
	<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
   	<script type="text/javascript" src="js/templatemo-script.js"></script>      		<!-- Templatemo Script -->
	<script>
	    // HTML document is loaded. DOM is ready.
	    $(function () {

	        $('#hotelCarTabs a').click(function (e) {
	            e.preventDefault()
	            $(this).tab('show')
	        })

	        $('.date').datetimepicker({
	            format: 'MM/DD/YYYY'
	        });
	        $('.date-time').datetimepicker();

	        // https://css-tricks.com/snippets/jquery/smooth-scrolling/
	        $('a[href*=#]:not([href=#])').click(function () {
	            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
	                var target = $(this.hash);
	                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
	                if (target.length) {
	                    $('html,body').animate({
	                        scrollTop: target.offset().top
	                    }, 1000);
	                    return false;
	                }
	            }
	        });
	    });

	    // Load Flexslider when everything is loaded.
	    $(window).load(function () {
	        $('.flexslider').flexslider({
	            controlNav: false
	        });
	    });
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
  


  
    <section class="container tm-home-section-1" id="more">
    <div class="section-margin-top">
			<div class="row">				
				<div class="tm-section-header">
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-6 col-md-6 col-sm-6"><h2 class="tm-section-title">Gallery</h2></div>
					<div class="col-lg-3 col-md-3 col-sm-3"><hr></div>	
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="tm-tours-box-1">
						<img src="img/tours-03.jpg" alt="image" class="img-responsive">
						<div class="tm-tours-box-1-info">
							<div class="tm-tours-box-1-info-left">
								<p class="text-uppercase margin-bottom-20">Proin Gravida Nibhvel Lorem Quis Bind</p>	
								<p class="gray-text">28 March 2084</p>
							</div>
							<div class="tm-tours-box-1-info-right">
								<p class="gray-text tours-1-description">Lorem quis bibendum auctor, nisi elit consequat ipsum, sec sagittis sem nibh id elit.</p>	
							</div>							
						</div>
						<div class="tm-tours-box-1-link">
							<div class="tm-tours-box-1-link-left">
								Duration: 8 days
							</div>
							<a href="#" class="tm-tours-box-1-link-right">
								$2,200								
							</a>							
						</div>
					</div>					
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="tm-tours-box-1">
						<img src="img/tours-04.jpg" alt="image" class="img-responsive">
						<div class="tm-tours-box-1-info">
							<div class="tm-tours-box-1-info-left">
								<p class="text-uppercase margin-bottom-20">Proin Gravida Nibhvel Lorem Quis Bind</p>	
								<p class="gray-text">26 March 2084</p>
							</div>
							<div class="tm-tours-box-1-info-right">
								<p class="gray-text tours-1-description">Lorem quis bibendum auctor, nisi elit consequat ipsum, sec sagittis sem nibh id elit.</p>	
							</div>							
						</div>
						<div class="tm-tours-box-1-link">
							<div class="tm-tours-box-1-link-left">
								Duration: 9 days
							</div>
							<a href="#" class="tm-tours-box-1-link-right">
								$1,800								
							</a>							
						</div>
					</div>					
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="tm-tours-box-1">
						<img src="img/tours-05.jpg" alt="image" class="img-responsive">
						<div class="tm-tours-box-1-info">
							<div class="tm-tours-box-1-info-left">
								<p class="text-uppercase margin-bottom-20">Proin Gravida Nibhvel Lorem Quis Bind</p>	
								<p class="gray-text">24 March 2084</p>
							</div>
							<div class="tm-tours-box-1-info-right">
								<p class="gray-text tours-1-description">Lorem quis bibendum auctor, nisi elit consequat ipsum, sec sagittis sem nibh id elit.</p>	
							</div>							
						</div>
						<div class="tm-tours-box-1-link">
							<div class="tm-tours-box-1-link-left">
								Duration: 8 days
							</div>
							<a href="#" class="tm-tours-box-1-link-right">
								$1,600								
							</a>							
						</div>
					</div>					
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="tm-tours-box-1">
						<img src="img/tours-06.jpg" alt="image" class="img-responsive">
						<div class="tm-tours-box-1-info">
							<div class="tm-tours-box-1-info-left">
								<p class="text-uppercase margin-bottom-20">Proin Gravida Nibhvel Lorem Quis Bind</p>	
								<p class="gray-text">22 March 2084</p>
							</div>
							<div class="tm-tours-box-1-info-right">
								<p class="gray-text tours-1-description">Lorem quis bibendum auctor, nisi elit consequat ipsum, sec sagittis sem nibh id elit.</p>	
							</div>							
						</div>
						<div class="tm-tours-box-1-link">
							<div class="tm-tours-box-1-link-left">
								Duration: 5 days
							</div>
							<a href="#" class="tm-tours-box-1-link-right">
								$1,200								
							</a>							
						</div>
					</div>					
				</div>
			</div>		
		</div>
	</section>		
	
	<!-- white bg -->

	
        	
       
 
</asp:Content>

