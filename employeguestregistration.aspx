<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeguestregistration.aspx.cs" Inherits="employeguestregistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <script>
       




        //$(document).ready(function () {
           
        //    $("input[name='nat']:radio").click(function () { // attack a click event on all radio buttons with name 'radiogroup'
        //        if ($(this).val() == '0') {//check which radio button is clicked 
        //            alert("abc");
        //        } else if ($(this).val() == '1') {
        //            $("#s2").hide();
                    
        //        } else if ($(this).val() == '2') {
        //            $("s3").hide();
        //        }
        //    });
        //});








        $(document).ready(function(){
         
            $("#s2").hide();
            $("#s3").hide();
           

           
        });


        $(function () {
            $("#b1").click(function () {
                $("#s2").show();
                $("#s3").hide();
                
            });
        });

        $(function () {
            $("#b2").click(function () {
                $("#s3").show();
                $("#s2").hide();

            });
        });



        //$(function () {
        //    $("#submit").click(function () {
        //        var a = $("input[name=nat]:checked").val();
        //        if(a=='Pakistani')
        //        {
        //            $("#s2").show();
        //            $("#s3").hide();
        //        }
        //        if(a=='Foriegner')
        //        {
        //            $("#s3").show();
        //            $("#s2").hide();
        //        }
        //    });
        //});



        //$(function () { $("input:radio[name=nat][value=1]").trigger(function () { $("#s2").show(); }); });
     
         
            
                    
                  
       
        //$(document).ready(function () {



        //    $("#s2").hide();
        //    $("#s3").hide();

        //    $('input[type="radio" name="nat"]').click(function () {
        //        if ($(this).attr("value") == "Pakistani") {
                    
        //            $("#s2").show();
        //        }
        //        if ($(this).attr("value") == "Foriegner") {
        //            $("#s3").show();
            
        //        }
                
        //    });
        //});



        //$(function(){
        //    if ($('#Pakistani').is(':checked')) {
        //        $('#rbutton').click(function () { $("#s2").show(); });
        //    }
        //})




       


        //$("#Pakistani").click(function () {
        //    disp();
        //});

        //function disp() {
        //    alert('click');
        //}



        //$("#Pakistani input[name='nat']").click(function () {
        //    alert('You clicked radio!');
        //    if ($('input:radio[name=nat]:checked').val() == "Pakistani") {
        //        alert($('input:radio[name=nat]:checked').val());
        //        //$('#select-table > .roomNumber').attr('enabled',false);
        //    }
        //});


    //    $('input:radio[name="nats"]').change(
    //function () {
    //    if (this.checked && this.value == 'Pakistani') {
    //        alert("duz duz");
    //    }
    //});
     
        //$('input[type=radio][name=nat]').on('change', function () {
        //    switch ($(this).val()) {
        //        case 'Pakistani':
        //            alert("Allot Thai Gayo Bhai");
        //            break;
        //        case 'Foriegner':
        //            alert("Transfer Thai Gayo");
        //            break;
        //    }
        //});

    </script>




    <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Guest Registration</h3>
              </div>

            
            </div>
            <div class="clearfix"></div>

            <div class="row">
             <div class="col-md-12 col-sm-12 col-xs-12">
                

                      <div id="s1">
                      <div  class="form-horizontal form-label-left">
      <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Room No <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <input type="number" id="rno" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>
                                   <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Type Of Room</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <div id="type" class="btn-group" data-toggle="buttons">
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="rtype" value="business"/> &nbsp; S.G.L &nbsp;
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
                              <input type="number" id="noofpax" required="required" class="form-control col-md-7 col-xs-12"/>
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
                              <input type="number" id="rrent" required="required" class="form-control col-md-7 col-xs-12"/>
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
                                    <button id="b1">Pakistani</button>
                                    </div>
                               <div id="national1" class="btn-group" data-toggle="buttons">
                                    <button id="b2">Foriegner</button>
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

                        
</div>
</div>


<div id="s2">
 <div  class="form-horizontal form-label-left">

     <div class="form-group">
                            <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">Registration No <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="number" id="regno" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                          <div class="form-group">--%>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12" for="last-name">Arrival Date <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="date" id="Arrival" name="arrivaldate" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                          <div class="form-group">
                            <label for="arrival-time" class="control-label col-md-2 col-sm-2 col-xs-12">Arrival Time</label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input id="atime" class="form-control col-md-7 col-xs-12" type="time" name="middle-name"/>
                            </div>
                          <%--</div>
                            
                          <div class="form-group">--%>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12" for="first-name">Guest Name <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="Text" id="gname" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                          <div class="form-group">
                            <label class="control-label col-md-2 col-sm-2 col-xs-12">Gender</label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <div id="gender" class="btn-group" data-toggle="buttons">
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="gender" value="male"/> &nbsp; Male &nbsp;
                                </label>
                                <label class="btn btn-primary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="gender" value="female"/> Female
                                </label>
                              </div>
                            </div>
                          <%--</div>
                          <div class="form-group">--%>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12">Date Of Birth <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input id="birthday" class="date-picker form-control col-md-7 col-xs-12" required="required" type="date"/>
                            </div>
                          </div>
                            
                          <div class="form-group">
                            <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">N.I.C No <span class="required"/>*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="number" id="nicno" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                            <div class="form-group">--%>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12" for="first-name">Company Name <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="text" id="Cname" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                             <div class="form-group">
                            <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">Company Adress<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                             <textarea name="Caddress" required="required" class="form-control col-md-7 col-xs-12"></textarea>
                            </div>
                          <%--</div>

                            <div class="form-group">--%>
                             <label class="control-label col-md-1 col-sm-1 col-xs-12" for="first-name">Permanent Adress<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                             <textarea name="Paddress" required="required" class="form-control col-md-7 col-xs-12"></textarea>
                            </div>
                          </div>

                            <div class="form-group">
                             <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">Proffesion<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="text" id="proffesion" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                             <div class="form-group">--%>
                                
                          <label class="control-label col-md-1 col-sm-1 col-xs-12" for="first-name">Designation<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="text" id="designation" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                            <div class="form-group">
                            <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">PH: No Office <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="number" id="Poffice" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                            <div class="form-group">--%>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12" for="first-name">PH: No Residence <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="number" id="Presidence" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                            <div class="form-group">
                            <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">PH: No Cell<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="number" id="Pcell" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                             <div class="form-group">--%>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12" for="last-name">Departure Date <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="date" id="Depature" name="departure date" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                            <div class="form-group">
                            <label for="middle-name" class="control-label col-md-2 col-sm-2 col-xs-12">Departure Time</label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input id="Dtime" class="form-control col-md-7 col-xs-12" type="time" name="middle-name">
                            </div>
                          <%--</div>

                            <div class="form-group">--%>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12" for="first-name">Flight No<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="number" id="flightno" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

     </div>
    </div>

<div id="s3">
 <div class="form-horizontal form-label-left">
                             <div class="form-group">
                            <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">Passport/IC No <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="number" id="passno" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                               <div class="form-group">--%>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12" for="first-name">Nationality <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="text" id="nationality" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                               <div class="form-group">
                            <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">Place of Issue<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="text" id="placeofissue" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                               <div class="form-group">--%>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12" for="first-name">Date Of Issue <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="date" id="dateofissue" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                               <div class="form-group">
                            <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">Visa No <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="number" id="visano" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                               <div class="form-group">--%>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12" for="first-name">Valid Upto <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="date" id="validupto" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                              <div class="form-group">
                            <label class="control-label col-md-2 col-sm-2 col-xs-12">Purpose of Visit</label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                              <div id="purpose" class="btn-group" data-toggle="buttons">
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

                               <div class="form-group">
                            <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">Comming From <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="number" id="cfrom" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                               <div class="form-group">--%>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12" for="first-name">Going To <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="number" id="gto" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

       <div class="form-group">
                            <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">Registration No <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="number" id="regno" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                          <div class="form-group">--%>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12" for="last-name">Arrival Date <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="date" id="Arrival" name="arrivaldate" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                          <div class="form-group">
                            <label for="arrival-time" class="control-label col-md-2 col-sm-2 col-xs-12">Arrival Time</label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input id="atime" class="form-control col-md-7 col-xs-12" type="time" name="middle-name"/>
                            </div>
                          <%--</div>
                            
                          <div class="form-group">--%>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12" for="first-name">Guest Name <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="Text" id="gname" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                          <div class="form-group">
                            <label class="control-label col-md-2 col-sm-2 col-xs-12">Gender</label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <div id="gender" class="btn-group" data-toggle="buttons">
                                <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="gender" value="male"/> &nbsp; Male &nbsp;
                                </label>
                                <label class="btn btn-primary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                                  <input type="radio" name="gender" value="female"/> Female
                                </label>
                              </div>
                            </div>
                          <%--</div>
                          <div class="form-group">--%>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12">Date Of Birth <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input id="birthday" class="date-picker form-control col-md-7 col-xs-12" required="required" type="date"/>
                            </div>
                          </div>
                            
                          <div class="form-group">
                            <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">N.I.C No <span class="required"/>*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="number" id="nicno" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                            <div class="form-group">--%>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12" for="first-name">Company Name <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="text" id="Cname" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                             <div class="form-group">
                            <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">Company Adress<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                             <textarea name="Caddress" required="required" class="form-control col-md-7 col-xs-12"></textarea>
                            </div>
                          <%--</div>

                            <div class="form-group">--%>
                             <label class="control-label col-md-1 col-sm-1 col-xs-12" for="first-name">Permanent Adress<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                             <textarea name="Paddress" required="required" class="form-control col-md-7 col-xs-12"></textarea>
                            </div>
                          </div>

                            <div class="form-group">
                             <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">Proffesion<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="text" id="proffesion" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                             <div class="form-group">--%>
                                
                          <label class="control-label col-md-1 col-sm-1 col-xs-12" for="first-name">Designation<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="text" id="designation" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                            <div class="form-group">
                            <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">PH: No Office <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="number" id="Poffice" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                            <div class="form-group">--%>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12" for="first-name">PH: No Residence <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="number" id="Presidence" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                            <div class="form-group">
                            <label class="control-label col-md-2 col-sm-2 col-xs-12" for="first-name">PH: No Cell<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="number" id="Pcell" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                             <div class="form-group">--%>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12" for="last-name">Departure Date <span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="date" id="Depature" name="departure date" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                            <div class="form-group">
                            <label for="middle-name" class="control-label col-md-2 col-sm-2 col-xs-12">Departure Time</label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input id="Dtime" class="form-control col-md-7 col-xs-12" type="time" name="middle-name">
                            </div>
                          <%--</div>

                            <div class="form-group">--%>
                            <label class="control-label col-md-1 col-sm-1 col-xs-12" for="first-name">Flight No<span class="required">*</span>
                            </label>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                              <input type="number" id="flightno" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                          </div>
    </div>






                      </div>
                    </div>
                 </div>
                </div>
            
    


</asp:Content>

