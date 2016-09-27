<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeguestregistration.aspx.cs" Inherits="employeguestregistration" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
         
            $("#s2").hide();
            $("#s3").hide();
           

           
        });


        $(function () {
            $("#pakistani").click(function () {
                $("#s2").show();
                $("#s3").hide();
                $("#guestType").val("pakistani") ;
                alert($("#guestType").val());
                    //    $('input[name=regno]').val("0") ;

                $("input[name=fregno]").val("000");
                $("input[name=farrivaldate]").val("2016-01-01");
                $("input[name=fatime]").val("18:01");
                $("input[name=fgname]").val("00");
                $("input[name=fcnicno]").val("000");
                $("input[name=fdob]").val("2016-01-01");
                $("input[name=fcname]").val("000");
                $("input[name=fproffesion]").val("abc");
                $("input[name=fdesignation]").val("abc");
                $("input[name=fpoffice]").val("000");
                $("input[name=fpresidence]").val("000");
                $("input[name=fpcell]").val("000");
                $("input[name=fdeparture]").val("2016-01-01");
                $("input[name=fdtime]").val("18:01");
                $("input[name=fflightno]").val("000");
                $("input[name=fcaddress]").val("000");
                $("input[name=fpaddress]").val("000");
                $("input[name=fpassno]").val("000");
                $("input[name=nationality]").val("000");
                $("input[name=placeofissue]").val("18:01");
                $("input[name=fdateofissue]").val("2016-01-01");
                $("input[name=visano]").val("000");
                $("input[name=validupto]").val("2016-01-01");
                $("input[name=fcfrom]").val("00");
                $("input[name=fgoto]").val("00");
            });
        });

        $(function () {
            $("#foriegner").click(function () {
                $("#s3").show();
                $("#s2").hide();
                $("#guestType").val("foriegner");
                
                alert($("#guestType").val());
                $("input[name=regno]").val("00");
                $("input[name=arrivaldate]").val("2016-01-01");
                $("input[name=atime]").val("18:01");
                $("input[name=gname]").val("00");
                $("input[name=cnicno]").val("00000-0000000-0");
                $("input[name=dob]").val("2016-01-01");
                $("input[name=cname]").val("00");
                $("input[name=proffesion]").val("00");
                $("input[name=designation]").val("00");
                $("input[name=poffice]").val("00");
                $("input[name=presidence]").val("00");
                $("input[name=pcell]").val("00");
                $("input[name=departure]").val("2016-01-01");
                $("input[name=dtime]").val("18:01");
                $("input[name=flightno]").val("00");
                $("input[name=caddress]").val("00");
                $("input[name=paddress]").val("00");
            });
        });
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
            $('#alert_container').append('<div id="alert_div" style="margin-top:40px;margin-left:10px;width:90%; -webkit-box-shadow: 3px 4px 6px #999;" class="alert fade in ' + cssclass + '"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><strong>' + messagetype + '!</strong> <span>' + message + '</span></div>');
        };



    </script>
    <style>
         .messagealert {
             text-align:center;
             font-size:xx-large;
            width: 50%;
            position: fixed;
             top:0px;
            z-index: 100000;
            padding: 0;
            font-size: 15px;
        }
    </style>
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="right_col" role="main">
          <div class="">
               <div class="messagealert" id="alert_container"  style=" 
  opacity: 0;
  transition: visibility 0s 2s, opacity 2s linear;">  </div>                	  

            <div class="page-title">
              <div class="title_left">

                <h3>Guest Registration</h3>
              </div>

            
            </div>
            <div class="clearfix"></div>

            <div class="row">
             <div class="col-md-12 col-sm-12 col-xs-12">
                

                      <div id="s1">
                      <div  class="form-horizontal form-label-left" >
                        <div class="col-md-12">
                             <div class="form-group">
                            
                            <label>Room No <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <%  int bid = employeeProfile.getEmployeBranch("kk");//get from session %>
                               <input type="hidden" name="branch" id="branch" value=<%= bid%> />
                                    <input type="hidden" name="guestType" id="guestType" value="xyz" />
                                <asp:TextBox ID="selectedrooms" runat="server" ></asp:TextBox>
                            </div>
                          </div>
                        </div>
     



                                   <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Type Of Room</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <div id="type" class="btn-group" data-toggle="buttons">
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="rtype" value="business" /> &nbsp; S.G.L &nbsp;
                                </label>
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="rtype" value="transit"/> B.D.L
                                </label>
                                  <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="rtype" value="vacation"/> Jr,Suite
                                </label>
                                  <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="rtype" value="vacation"/> Exec. Suite
                                </label>
                                  <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="rtype" value="vacation"/> Royal Suite
                                </label>
                              </div>
                            </div>
                          </div>

                               <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">No Of Pax <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="number" id="noofpax" name="noofpax" required="required" class="form-control col-md-7 col-xs-12" data-validation="required" 
		 data-validation-error-msg="Enter no. of PAX" min="0"/>
                            </div>
                          </div>
                              

                                 <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Mode Of Payment</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <div id="Pay" class="btn-group" data-toggle="buttons">
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="mode" value="business"/> &nbsp; Cash &nbsp;
                                </label>
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="mode" value="transit"/> Credit Card
                                </label>
                                  <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="mode" value="vacation"/> Company Account
                                </label>
                             
                              </div>
                            </div>
                          </div>
                               <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Room Rent <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="number" id="rrent" name="rrent" required="required" class="form-control col-md-7 col-xs-12" data-validation="required" 
		 data-validation-error-msg="Enter Room rent" min="0"/>
                            </div>
                          </div>

                               <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">F.D.O <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="text" id="fdo" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
</div>
                          
                              <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">You are?</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">

                                <div id="national" class="btn-group" data-toggle="buttons">
                                    <button id="pakistani">Pakistani</button>
                                    </div>
                               <div id="national1" class="btn-group" data-toggle="buttons">
                                    <button id="foriegner">Foriegner</button>
                                    </div>

                              <%--<div id="national" class="btn-group" data-toggle="buttons">
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input id="Pakistani" type="radio" name="nat" value="Pakistani"/> &nbsp; Pakistani &nbsp;
                                </label>
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" id="Foriegner" name="nat" value="Foriegner"/> Foriegner
                                </label>--%>
                              </div>
                            </div>
                          </div>

            <hr style="border:solid">              
</div>
</div>


<br />
                 


               







<div id="s2">
 <div  class="form-vertical">

     <div class="form-group">
                            <h3>Local Guest</h3>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Registration No <span class="required">*</span>
                            </label>
                              <input type="number" id="regno" name="regno"  class="form-control col-md-7 col-xs-12" min="0" data-validation="required" 
		 data-validation-error-msg="Enter registration no."/>
                            </div>
                          <%--</div>

                          <div class="form-group">--%>
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >Arrival Date <span class="required">*</span>
                            </label>
                              <input type="date" id="Arrival" name="arrivaldate"  class="form-control col-md-7 col-xs-12" required="required"/>
                            </div>
                          </div>

                          <div class="form-group">
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Arrival Time</label>
                              <input id="atime"  class="form-control col-md-7 col-xs-12" type="time" name="atime" required="required"/>
                            </div>
                          <%--</div>
                            
                          <div class="form-group">--%>
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label>Guest Name <span class="required">*</span>
                            </label>
                              <input type="text" id="gname" name="gname"  class="form-control col-md-7 col-xs-12" data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter guest name"/>
                            </div>
                          </div>

                          <div class="form-group">
                          
                          <%--</div>
                          <div class="form-group">--%>
                           


                                  <div class="col-md-4 col-sm-4 col-xs-12">
                                                            <label>N.I.C No <span class="required"/>*</span>
                            </label>
                              <input type="text" id="cnicno" name="cnicno"  class="form-control col-md-7 col-xs-12" required="required" pattern="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$" title="Enter correct cnic"/>
                            </div>


                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label>Date Of Birth <span class="required">*</span>
                            </label>
                              <input id="dob" name="dob" class="date-picker form-control col-md-7 col-xs-12"  type="date" required="required"/>
                            </div>
                          </div>
                            
                          <div class="form-group">

                        
                          <%--</div>

                            <div class="form-group">--%>
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >Company Name <span class="required">*</span>
                            </label>
                              <input type="text" id="cname" name="cname"  class="form-control col-md-7 col-xs-12" data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter Company name"/>
                            </div>
                          </div>

                           

                            <div class="form-group">
                             
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Profession<span class="required">*</span>
                            </label>
                              <input type="text" id="proffesion" name="proffesion"  class="form-control col-md-7 col-xs-12" data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter profession"/>
                            </div>
                          <%--</div>

                             <div class="form-group">--%>
                                
                        
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                  <label>Designation<span class="required">*</span>
                            </label>
                              <input type="text" id="designation" name="designation"  class="form-control col-md-7 col-xs-12" data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter designation"/>
                            </div>
                          </div>

                            <div class="form-group">
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >PH: No Office <span class="required">*</span>
                            </label>
                              <input type="number" id="poffice" name="poffice"  class="form-control col-md-7 col-xs-12" pattern="\d*" title="Enter Phone no"/>
                            </div>
                          <%--</div>

                            <div class="form-group">--%>
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >PH: No Residence <span class="required">*</span>
                            </label>
                              <input type="number" id="presidence" name="presidence"  class="form-control col-md-7 col-xs-12" pattern="\d*" title="Enter residence no"/>
                            </div>
                          </div>

                            <div class="form-group">
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >PH: No Cell<span class="required">*</span>
                            </label>
                              <input type="number" id="pcell" name="pcell"   class="form-control col-md-7 col-xs-12" pattern="\d*" title="Enter Mobile no"/>
                            </div>
                          <%--</div>

                             <div class="form-group">--%>

                            <div class="col-md-4 col-sm-4 col-xs-12">
                             <label>Departure Date <span class="required">*</span>
                            </label>
                              <input type="date" id="Depature" name="departure" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                            <div class="form-group">
                          
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                  <label>Departure Time</label>
                              <input id="dtime" name="dtime" class="form-control col-md-7 col-xs-12" type="time" required="required"/>
                            </div>
                          <%--</div>

                            <div class="form-group">--%>

                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                            <label>Flight No<span class="required">*</span>
                            </label>
                              <input type="text" id="flightno" name="flightno"  class="form-control col-md-7 col-xs-12" data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter Flight no."/>
                            </div>
                          </div>



       <div class="form-group">
                            
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <label >Company Adress<span class="required">*</span>
                            </label>
                             <input  id="caddress" name="caddress"  class="form-control col-md-7 col-xs-12" data-validation="length alphanumeric" 
		 data-validation-length="3-50" 
		 data-validation-error-msg="Enter Company address"/>
                            </div>
                          <%--</div>

                            <div class="form-group">--%>
                            
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                 <label >Permanent Adress<span class="required">*</span>
                            </label>
                             <input id="paddress" name="paddress"  class="form-control col-md-7 col-xs-12" data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter permanent address"/>
                            </div>
                          </div>
     <div style="padding-top:15px;" class="alignright col-md-2 col-sm-2 col-xs-12">

       
     </div>
                           <%-- <div class="col-md-4 col-sm-4 col-xs-12">
                                <label>Gender</label>
                              <div id="gender" class="btn-group" data-toggle="buttons">
                                
                                   <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  
                                    <input type="radio" name="gender" value="male"/> &nbsp; Male &nbsp;
                                </label>
                                <label class="btn btn-primary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="gender" value="female"/> Female
                                </label>
                              </div>
                            </div>--%>

     </div>
    </div>
<br />
                <br />
             

<div id="s3" style="padding-top:10px;">
 <div class="form-vertical form-label-left">
                             <div class="form-group">


                                 <h3>Foriegn Guest</h3>

                                 <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Registration No <span class="required">*</span>
                            </label>
                              <input type="number" id="fregno"  name="fregno"  class="form-control col-md-7 col-xs-12" data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter Reg#"/>
                            </div>
                          
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >Arrival Date <span class="required">*</span>
                            </label>
                              <input type="date" id="farrival" name="farrivaldate"  class="form-control col-md-7 col-xs-12" required="required"/>
                            </div>
                          </div>

                          <div class="form-group">
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Arrival Time</label>
                              <input id="fatime" class="form-control col-md-7 col-xs-12" type="time" name="fatime" required="required"/>
                            </div>
                          <%--</div>
                            
                          <div class="form-group">--%>
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label>Guest Name <span class="required">*</span>
                            </label>
                              <input type="Text" id="fgname" name="fgname"  class="form-control col-md-7 col-xs-12" data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter guest name"/>
                            </div>
                          </div>

                          <div class="form-group">
                          
                          <%--</div>
                          <div class="form-group">--%>
                           


                                  <div class="col-md-4 col-sm-4 col-xs-12">
                                                            <label>N.I.C No <span class="required"/>*</span>
                            </label>
                              <input type="number" id="fcnicno" name="fcnicno"  class="form-control col-md-7 col-xs-12" />
                            </div>


                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label>Date Of Birth <span class="required">*</span>
                            </label>
                              <input id="fdob"  name="fdob" class="date-picker form-control col-md-7 col-xs-12"  type="date" required="required"/>
                            </div>
                          </div>
                            
                          <div class="form-group">

                        
                          <%--</div>

                            <div class="form-group">--%>
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >Company Name <span class="required">*</span>
                            </label>
                              <input type="text" id="fcname" name="fcname"  class="form-control col-md-7 col-xs-12" data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter company name"/>
                            </div>
                          </div>

                           

                            <div class="form-group">
                             
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Profession<span class="required">*</span>
                            </label>
                              <input type="text" id="fproffesion" name="fproffesion"  class="form-control col-md-7 col-xs-12" data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter profession"/>
                            </div>
                          <%--</div>

                             <div class="form-group">--%>
                                
                        
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                  <label>Designation<span class="required">*</span>
                            </label>
                              <input type="text" id="fdesignation" name="fdesignation"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                            <div class="form-group">
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >PH: No Office <span class="required">*</span>
                            </label>
                              <input type="number" id="fpoffice" name="fpoffice"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                            <div class="form-group">--%>
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >PH: No Residence <span class="required">*</span>
                            </label>
                              <input type="number" id="fpresidence" name="fpresidence"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                            <div class="form-group">
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >PH: No Cell<span class="required">*</span>
                            </label>
                              <input type="number" id="fpcell" name="fpcell"  class="form-control col-md-7 col-xs-12" required/>
                            </div>
                          <%--</div>

                             <div class="form-group">--%>

                            <div class="col-md-4 col-sm-4 col-xs-12">
                             <label>Departure Date <span class="required">*</span>
                            </label>
                              <input type="date" id="fdeparture" name="fdeparture"  class="form-control col-md-7 col-xs-12" required/>
                            </div>
                          </div>

                            <div class="form-group">
                          
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                  <label>Departure Time</label>
                              <input id="fdtime" name="fdtime"class="form-control col-md-7 col-xs-12" type="time" required/>
                            </div>
                          <%--</div>

                            <div class="form-group">--%>

                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                            <label>Flight No<span class="required">*</span>
                            </label>
                              <input type="number" id="fflightno" name="fflightno"  class="form-control col-md-7 col-xs-12"
                                  data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter flight no"/>
                            </div>
                          </div>



       <div class="form-group">
                            
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <label >Company Adress<span class="required">*</span>
                            </label>
                             <input name="fcaddress" id="fcaddress"  class="form-control col-md-7 col-xs-12" data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter company address"></input>
                            </div>
                          <%--</div>

                            <div class="form-group">--%>
                            
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                 <label >Permanent Adress<span class="required">*</span>
                            </label>
                             <input name="fpaddress" id="fpaddress"  class="form-control col-md-7 col-xs-12" data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter permanen address"></input>
                            </div>
                          </div>

                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >Passport/IC No <span class="required">*</span>
                            </label>
                              <input type="number" id="fpassno" name="fpassno"  class="form-control col-md-7 col-xs-12" data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter Passport no"/>
                            </div>
                          <%--</div>

                               <div class="form-group">--%>
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Nationality <span class="required">*</span>
                            </label>
                              <input type="text" id="nationality" name="nationality"  class="form-control col-md-7 col-xs-12" data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter nationality"/>
                            </div>
                          </div>

                               <div class="form-group">
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Place of Issue<span class="required">*</span>
                            </label>
                              <input type="text" id="placeofissue" name="placeofissue"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                               <div class="form-group">--%>
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label>Date Of Issue <span class="required">*</span>
                            </label>
                              <input type="date" id="dateofissue" name="fdateofissue"  class="form-control col-md-7 col-xs-12" required/>
                            </div>
                          </div>

                               <div class="form-group">
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label>Visa No <span class="required">*</span>
                            </label>
                              <input type="number" id="visano" name="visano"  class="form-control col-md-7 col-xs-12" data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter visa no"/>
                            </div>
                          <%--</div>

                               <div class="form-group">--%>
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label>Valid Upto <span class="required">*</span>
                            </label>
                              <input type="date" id="validupto" name="validupto"  class="form-control col-md-7 col-xs-12" required/>
                            </div>
                          </div>

                              <div class="form-group">
                            
<%--                        
                          </div>

                               <div class="form-group">
                           
                           
                          <%--</div>

                               <div class="form-group">--%>
                                   <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >Comming From <span class="required">*</span>
                            </label>
                              <input type="number" id="fcfrom" name="fcfrom"  class="form-control col-md-7 col-xs-12" required/>
                            </div>
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Going To <span class="required">*</span>
                            </label>
                              <input type="number" id="fgoto" name="fgoto"  class="form-control col-md-7 col-xs-12" required/>
                            </div>
                          </div>
    

       <div style="padding-top:10px;" class="form-horizontal form-label-left col-md-6 col-sm-6 col-xs-12">
                                <label class="col-md-4 col-sm-4 col-xs-12">Purpose of Visit</label>
                              <div id="purpose" style="padding-left:5px;" data-toggle="buttons">
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="visit" value="business"/> &nbsp; Business &nbsp;
                                </label>
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="visit" value="transit"/> Transit
                                </label>
                                  <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="visit" value="vacation"/> Leasure/Vacation
                                </label>
                              </div>
                            </div>
    </div>
                  <div style="padding-top:15px;" class="alignright col-md-2 col-sm-2 col-xs-12">
      <asp:Button ID="Save" runat="server" Text="Register Guest" OnClick="Save_Click"  CausesValidation="false" class="btn btn-success"/>
         
     </div>






                      </div>
                    </div>
                 </div>
                
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script>

  $.validate({
    modules : 'location, date, security, file',
    onModulesLoaded : function() {
      $('#country').suggestCountry();
    }
  });

  // Restrict presentation length
  $('#presentation').restrictLength( $('#pres-max-length') );

</script>


</asp:Content>

