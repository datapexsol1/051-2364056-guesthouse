<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reg2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <link href="../build/css/custom.min.css" rel="stylesheet">
</head>
<body>
    <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Form Wizards</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                              <button class="btn btn-default" type="button">Go!</button>
                          </span>
                  </div>
                </div>
              </div>
            </div>
            <div class="clearfix"></div>

            <div class="row">

              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Form Wizards <small>Sessions</small></h2>
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


                    <!-- Smart Wizard -->
                    <p>This is a basic form wizard example that inherits the colors from the selected scheme.</p>
                    <div id="wizard" class="form_wizard wizard_horizontal">
                      <ul class="wizard_steps">
                        <li>
                          <a href="#step-1">
                            <span class="step_no">1</span>
                            <span class="step_descr">
                                              Step 1<br />
                                              <small>Step 1 description</small>
                                          </span>
                          </a>
                        </li>
                        <li>
                          <a href="#step-2">
                            <span class="step_no">2</span>
                            <span class="step_descr">
                                              Step 2<br />
                                              <small>Step 2 description</small>
                                          </span>
                          </a>
                        </li>
                        <li>
                          <a href="#step-3">
                            <span class="step_no">3</span>
                            <span class="step_descr">
                                              Step 3<br />
                                              <small>Step 3 description</small>
                                          </span>
                          </a>
                        </li>
                       
                       
                      </ul>
                      <div id="step-1">
                        <div class="form-horizontal form-label-left">

                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Registration No <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="number" id="regno" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Arrival Date <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="date" id="Arrival" name="arrivaldate" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Arrival Time</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input id="atime" class="form-control col-md-7 col-xs-12" type="time" name="middle-name">
                            </div>
                          </div>
                            
                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Guest Name <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="Text" id="gname" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Gender</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <div id="gender" class="btn-group" data-toggle="buttons">
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="gender" value="male"> &nbsp; Male &nbsp;
                                </label>
                                <label class="btn btn-primary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="gender" value="female"> Female
                                </label>
                              </div>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Date Of Birth <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input id="birthday" class="date-picker form-control col-md-7 col-xs-12" required="required" type="date">
                            </div>
                          </div>
                            
                          <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">N.I.C No <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="number" id="nicno" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                            <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Company Name <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="text" id="Cname" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                             <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Company Adress<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                             <textarea name="Caddress" required="required" class="form-control col-md-7 col-xs-12"></textarea>
                            </div>
                          </div>

                            <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Proffesion<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="text" id="proffesion" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                            <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Designation<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="text" id="designation" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                             <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Permanent Adress<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                             <textarea name="Paddress" required="required" class="form-control col-md-7 col-xs-12"></textarea>
                            </div>
                          </div>

                            <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">PH: No Office <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="number" id="Poffice" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                            <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">PH: No Residence <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="number" id="Presidence" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                            <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">PH: No Cell<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="number" id="Pcell" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                             <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Departure Date <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="date" id="Depature" name="departure date" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                            <div class="form-group">
                            <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">Departure Time</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input id="Dtime" class="form-control col-md-7 col-xs-12" type="time" name="middle-name">
                            </div>
                          </div>

                            <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Flight No<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="number" id="flightno" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                        </div>

                      </div>
                      <div id="step-2">
                          <div class="form-horizontal form-label-left">
                        <h2 class="StepTitle">Step 2 Content</h2>

                            <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Passport/IC No <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="number" id="passno" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                               <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Nationality <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="text" id="nationality" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                               <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Place of Issue<span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="text" id="placeofissue" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                               <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Date Of Issue <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="date" id="dateofissue" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                               <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Visa No <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="number" id="visano" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                               <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Valid Upto <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="date" id="validupto" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                              <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Purpose of Visit</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <div id="purpose" class="btn-group" data-toggle="buttons">
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="visit" value="business"> &nbsp; Business &nbsp;
                                </label>
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="visit" value="transit"> Transit
                                </label>
                                  <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="visit" value="vacation"> Leasure/Vacation
                                </label>
                              </div>
                            </div>
                          </div>

                               <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Comming From <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="number" id="cfrom" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                               <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Going To <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="number" id="gto" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                      </div>
                          </div>

                      <div id="step-3">
                          <div class="form-horizontal form-label-left">

                               <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Room No <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="number" id="rno" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>
                                   <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Type Of Room</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <div id="type" class="btn-group" data-toggle="buttons">
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="rtype" value="business"> &nbsp; S.G.L &nbsp;
                                </label>
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="rtype" value="transit"> B.D.L
                                </label>
                                  <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="rtype" value="vacation"> Jr,Suite
                                </label>
                                  <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="rtype" value="vacation"> Exec. Suite
                                </label>
                                  <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="rtype" value="vacation"> Royal Suite
                                </label>
                              </div>
                            </div>
                          </div>

                               <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">No Of Pax <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="number" id="noofpax" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>
                              

                                 <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Mode Of Payment</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <div id="Pay" class="btn-group" data-toggle="buttons">
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="mode" value="business"> &nbsp; Cash &nbsp;
                                </label>
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="mode" value="transit"> Credit Card
                                </label>
                                  <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="mode" value="vacation"> Company Account
                                </label>
                             
                              </div>
                            </div>
                          </div>
                               <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Room Rent <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="number" id="rrent" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>

                               <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">F.D.O <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="text" id="fdo" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                          </div>


                              </div>



                         



                         



                       
                    </div>
                      

                    </div>
                    <!-- End SmartWizard Content -->


                         <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- jQuery Smart Wizard -->
    <script src="../vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>

    <!-- jQuery Smart Wizard -->
    <script>
        $(document).ready(function () {
            $('#wizard').smartWizard();

            $('#wizard_verticle').smartWizard({
                transitionEffect: 'slide'
            });

            $('.buttonNext').addClass('btn btn-success');
            $('.buttonPrevious').addClass('btn btn-primary');
            $('.buttonFinish').addClass('btn btn-default');
        });
    </script>
    <!-- /jQuery Smart Wizard -->
</body>
</html>
