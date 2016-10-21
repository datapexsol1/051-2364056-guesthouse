<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        @import url(http://fonts.googleapis.com/css?family=Roboto);

/****** LOGIN MODAL ******/
.loginmodal-container {
  padding: 30px;
  max-width: 350px;
  width: 100% !important;
  background-color: #F7F7F7;
  margin: 0 auto;
  border-radius: 2px;
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  overflow: hidden;
  font-family: roboto;
}

.loginmodal-container h1 {
  text-align: center;
  font-size: 1.8em;
  font-family: roboto;
}

.loginmodal-container input[type=submit] {
  width: 100%;
  display: block;
  margin-bottom: 10px;
  position: relative;
}

.loginmodal-container input[type=text], input[type=password] {
  height: 44px;
  font-size: 16px;
  width: 100%;
  margin-bottom: 10px;
  -webkit-appearance: none;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  /* border-radius: 2px; */
  padding: 0 8px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}

.loginmodal-container input[type=text]:hover, input[type=password]:hover {
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
}

.loginmodal {
  text-align: center;
  font-size: 14px;
  font-family: 'Arial', sans-serif;
  font-weight: 700;
  height: 36px;
  padding: 0 8px;
/* border-radius: 3px; */
/* -webkit-user-select: none;
  user-select: none; */
}

.loginmodal-submit {
  /* border: 1px solid #3079ed; */
  border: 0px;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1); 
  background-color: #4d90fe;
  padding: 17px 0px;
  font-family: roboto;
  font-size: 14px;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
}

.loginmodal-submit:hover {
  /* border: 1px solid #2f5bb7; */
  border: 0px;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #357ae8;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
}

.loginmodal-container a {
  text-decoration: none;
  color: #666;
  font-weight: 400;
  text-align: center;
  display: inline-block;
  opacity: 0.6;
  transition: opacity ease 0.5s;
} 

.login-help{
  font-size: 12px;
}
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="tm-gray-bg">
    <!-- Banner -->
	<section class="tm-banner">
		<!-- Flexslider -->
		<div class="flexslider flexslider-banner">
		  <ul class="slides">
		    <li>
			    <div class="tm-banner-inner">
					<h1 class="tm-banner-title">Find <span class="tm-yellow-text">The Best</span> Place</h1>
					<p class="tm-banner-subtitle">For Your Holidays</p>
					<a href="#more" class="tm-banner-link">Learn More</a>	
				</div>
				<img src="img/banner-1.jpg" alt="Image" />	
		    </li>
		    <li>
			    <div class="tm-banner-inner">
					<h1 class="tm-banner-title">Lorem <span class="tm-yellow-text">Ipsum</span> Dolor</h1>
					<p class="tm-banner-subtitle">Wonderful Destinations</p>
					<a href="#more" class="tm-banner-link">Learn More</a>	
				</div>
		      <img src="img/banner-2.jpg" alt="Image" />
		    </li>
		    <li>
			    <div class="tm-banner-inner">
					<h1 class="tm-banner-title">Proin <span class="tm-yellow-text">Gravida</span> Nibhvell</h1>
					<p class="tm-banner-subtitle">Velit Auctor</p>
					<a href="#more" class="tm-banner-link">Learn More</a>	
				</div>
		      <img src="img/banner-3.jpg" alt="Image" />
		    </li>
		  </ul>
		</div>	
	</section>

	<!-- gray bg -->	
	<section class="container tm-home-section-1" id="more">
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-6">
				<!-- Nav tabs -->
				<div class="tm-home-box-1">
					<ul class="nav nav-tabs tm-white-bg" role="tablist" id="hotelCarTabs">
					    <li role="presentation" class="active">
					    	<a href="#hotel" aria-controls="hotel" role="tab" data-toggle="tab">Guest house</a>
					    </li>
					    <li role="presentation">
					    	<a href="#comingsoonpanel" aria-controls="car" role="tab" data-toggle="tab">Coming soon</a>
					    </li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
                        <%
                            IQueryable<branch> br = branchClass.getBrachesinfo() ;
                             %>
					    <div role="tabpanel" class="tab-pane fade in active tm-white-bg" id="hotel">
					    	<div class="tm-search-box effect2">
								<div class="hotel-search-form">
									<div class="tm-form-inner">
										<div class="form-group">

							            	 <select class="form-control" id="branchcity" name="branchcity">
                                                 
							            	 	<option value="">Select Branch</option>
							            	 	<%
                                                     foreach (var x in br)
                                                     {
                                                      %>
                                                 <option value="<%=x.city %>" ><%=x.city %></option>

                                                 <%
                                                     }
                                                      %>
											</select> 
							          	</div>
							          	<div class="form-group">
							                <div class='input-group date' id='datetimepicker1'>
							                    <input type='text' class="form-control" name="gcheckindate" id="gcheckindate" placeholder="Check-in Date" />
							                    <span class="input-group-addon">
							                        <span class="fa fa-calendar"></span>
							                    </span>
							                </div>
							            </div>
							          	<div class="form-group">
							                <div class='input-group date' id='datetimepicker2'>
							                    <input type='text' class="form-control" name="gcheckoutdate" id="gcheckoutdate" placeholder="Check-out Date" />
							                    <span class="input-group-addon">
							                        <span class="fa fa-calendar"></span>
							                    </span>
							                </div>
							            </div>
							            <div class="form-group margin-bottom-0">
							                <select class="form-control" name="gnoofguest" id="gnoofguest">
							            	 	<option value=""> Select no of Guests</option>
							            	 	<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5p">5+</option>
											</select> 
							            </div>
									</div>							
						            <div class="form-group tm-yellow-gradient-bg text-center">
						            	<%--<button type="submit" name="submit" class="tm-yellow-btn" >Check Now</button>--%>
                                        <a href="#" data-toggle="modal" data-target="#login-modal" style="display: block; padding-top: 15px; text-align: center;line-height: 1em;" class="tm-yellow-btn">Check Now</a>
						            </div>  
								</div>
							</div>
					    </div>
                      <!--popup start-->
                          <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	  <div class="modal-dialog">
				<div class="loginmodal-container">
					<h1>Online Booking</h1><br>
				  <div>
					<input type="text" name="gname" id="gname" placeholder="Enter name..." class="form-control"/>
					<input type="text" name="gcnic" id="gcnic" placeholder="Enter Cnic/ Passport no..." class="form-control"/>
                      <input type="number" name="gcontact" id="gcontact" placeholder="Enter Contact no..." class="form-control"/>
                      <br />
                      <input type="email" name="gemail" id="gemail" placeholder="Enter Email..." class="form-control"/>
                      <br />
                      <select class="form-control" name="noofrooms" id="noofrooms">
							            	 	<option value="">Select no. of rooms</option>
							            	 	<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5p">5+</option>
					    </select>
                      <br />
                      <select class="form-control" name="roomtype" id="roomtype">
						    <option value="">Select Room Type</option>
							<option value="S.G.L">S.G.L</option>
                          <option value="B.D.L">B.D.L</option>
                          <option value="JR SUITE">JR SUITE</option>
                          <option value="EXEC. SUITE">EXEC. SUITE</option>
                          <option value="ROYAL SUITE">ROYAL SUITE</option>
												
					    </select> 
                      <br />
                      
                      <input type="checkbox" id="termcheck" name="termcheck"/><a href="#" style="color: black" ><u> I accept all the terms and conditions !</u></a>
                      <asp:Button runat="server" ID="gbooking" OnClick="gbooking_click" Text="Book Room" class="tm-yellow-btn"/>
					<%--<input type="submit" name="gbook" class="tm-yellow-btn" value="Book room">--%>
				  </div>
				</div>
			</div>
		  </div>
                         <!--popup end-->
					    <div role="tabpanel" class="tab-pane fade tm-white-bg" id="comingsoonpanel">
							<div class="tm-search-box effect2">
								<div class="hotel-search-form">
									<div class="tm-form-inner">
                                         <h2  class="form-group" style="text-align:center;color:red;min-height:100px">Coming soon ! </h2>
									<%--	<div class="form-group">
                                           
							            	 <select class="form-control">
							            	 	<option value="">-- Select Model -- </option>
							            	 	<option value="shangrila">BMW</option>
												<option value="chatrium">Mercedes-Benz</option>
												<option value="fourseasons">Toyota</option>
												<option value="hilton">Honda</option>
											</select> 
							          	</div>
							          	<div class="form-group">
							                <div class='input-group date-time' id='datetimepicker3'>
							                    <input type='text' class="form-control" placeholder="Pickup Date" />
							                    <span class="input-group-addon">
							                        <span class="fa fa-calendar"></span>
							                    </span>
							                </div>
							            </div>
							          	<div class="form-group">
							                <div class='input-group date-time' id='datetimepicker4'>
							                    <input type='text' class="form-control" placeholder="Return Date" />
							                    <span class="input-group-addon">
							                        <span class="fa fa-calendar"></span>
							                    </span>
							                </div>
							            </div>
							            <div class="form-group">
							            	 <select class="form-control">
							            	 	<option value="">-- Options -- </option>
							            	 	<option value="">Child Seat</option>
												<option value="">GPS Navigator</option>
												<option value="">Insurance</option>
											</select> 
							          	</div>--%>							           
									</div>							
						            <div class="form-group tm-yellow-gradient-bg text-center">
						            	<button type="submit" name="submit" class="tm-yellow-btn">Check Now</button>
						            </div>  
								</div>
							</div>
					    </div>				    
					</div>
				</div>								
			</div>

			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="tm-home-box-1 tm-home-box-1-2 tm-home-box-1-center">
					<img src="img/index-01.jpg" alt="image" class="img-responsive">
					<a href="#">
						<div class="tm-green-gradient-bg tm-city-price-container">
							<span>New York</span>
							<span>$6,600</span>
						</div>	
					</a>			
				</div>				
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="tm-home-box-1 tm-home-box-1-2 tm-home-box-1-right">
					<img src="img/index-02.jpg" alt="image" class="img-responsive">
					<a href="#">
						<div class="tm-red-gradient-bg tm-city-price-container">
							<span>Paris</span>
							<span>$4,200</span>
						</div>	
					</a>					
				</div>				
			</div>
		</div>
	
		
	</section>		
	
	<!-- white bg -->
	<section class="tm-white-bg section-padding-bottom">
		<div class="container">
			<div class="row">
				<div class="tm-section-header section-margin-top">
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">Popular Packages</h2></div>
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>	
				</div>
				<div class="col-lg-6">
					<div class="tm-home-box-3">
						<div class="tm-home-box-3-img-container">
							<img src="img/index-07.jpg" alt="image" class="img-responsive">	
						</div>						
						<div class="tm-home-box-3-info">
							<p class="tm-home-box-3-description">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description box-3">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
						</div>						
					</div>					
			     </div>
			     <div class="col-lg-6">
			        <div class="tm-home-box-3">
						<div class="tm-home-box-3-img-container">
							<img src="img/index-08.jpg" alt="image" class="img-responsive">	
						</div>						
						<div class="tm-home-box-3-info">
							<p class="tm-home-box-3-description">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description box-3">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
						</div>						
					</div>
				</div>
				<div class="col-lg-6">
				    <div class="tm-home-box-3">
						<div class="tm-home-box-3-img-container">
							<img src="img/index-09.jpg" alt="image" class="img-responsive">	
						</div>						
						<div class="tm-home-box-3-info">
							<p class="tm-home-box-3-description">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description box-3">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
						</div>						
					</div>
			    </div>
			    <div class="col-lg-6">
			        <div class="tm-home-box-3">
						<div class="tm-home-box-3-img-container">
							<img src="img/index-10.jpg" alt="image" class="img-responsive">	
						</div>						
						<div class="tm-home-box-3-info">
							<p class="tm-home-box-3-description">Proin gravida nibhvell velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum</p>
					        <div class="tm-home-box-2-container">
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
							<a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description box-3">Travel</span></a>
							<a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
						</div>
						</div>						
					</div>
			   	</div>
			</div>		
		</div>
	</section>



        <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      		<!-- jQuery -->
  	<script type="text/javascript" src="js/moment.js"></script>							<!-- moment.js -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>					<!-- bootstrap js -->
	<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>	<!-- bootstrap date time picker js, http://eonasdan.github.io/bootstrap-datetimepicker/ -->
	<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
<!--
	<script src="js/froogaloop.js"></script>
	<script src="js/jquery.fitvid.js"></script>
-->
   	<script type="text/javascript" src="js/templatemo-script.js"></script>      		<!-- Templatemo Script -->
	<script>
	    // HTML document is loaded. DOM is ready.
	    $(function () {

	        $('#hotelCarTabs a').click(function (e) {
	            e.preventDefault()
	            $(this).tab('show')
	        })

	        $('.date').datetimepicker({
	            format: 'DD/MM/YYYY'
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
	        // Vimeo API nonsense

	        /*
                          var player = document.getElementById('player_1');
                          $f(player).addEvent('ready', ready);
                         
                          function addEvent(element, eventName, callback) {
                            if (element.addEventListener) {
                              element.addEventListener(eventName, callback, false)
                            } else {
                              element.attachEvent(eventName, callback, false);
                            }
                          }
                         
                          function ready(player_id) {
                            var froogaloop = $f(player_id);
                            froogaloop.addEvent('play', function(data) {
                              $('.flexslider').flexslider("pause");
                            });
                            froogaloop.addEvent('pause', function(data) {
                              $('.flexslider').flexslider("play");
                            });
                          }
            */



	        // Call fitVid before FlexSlider initializes, so the proper initial height can be retrieved.
	        /*
            
                          $(".flexslider")
                            .fitVids()
                            .flexslider({
                              animation: "slide",
                              useCSS: false,
                              animationLoop: false,
                              smoothHeight: true,
                              controlNav: false,
                              before: function(slider){
                                $f(player).api('pause');
                              }
                          });
            */




	        //	For images only
	        $('.flexslider').flexslider({
	            controlNav: false
	        });


	    });
	</script>


        </div>







</asp:Content>

