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
                              <select  id="rno" name="rno" required="required" class="form-control col-md-7 col-xs-12">
                                     <option>Select Room</option>
                                      <%  int bid = employeeProfile.getEmployeBranch("kk");
                                          IQueryable<room> r = roomsclass.getAvailableRooms(bid);
                                          foreach (var room in r)
                                          { %>
                                         <option><%=room.room_no %></option>
                                       <%} %>
                                  </select>
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
                              <input type="number" id="regno" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                          <div class="form-group">--%>
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >Arrival Date <span class="required">*</span>
                            </label>
                              <input type="date" id="Arrival" name="arrivaldate" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                          <div class="form-group">
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Arrival Time</label>
                              <input id="atime" class="form-control col-md-7 col-xs-12" type="time" name="middle-name"/>
                            </div>
                          <%--</div>
                            
                          <div class="form-group">--%>
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label>Guest Name <span class="required">*</span>
                            </label>
                              <input type="Text" id="gname" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                          <div class="form-group">
                          
                          <%--</div>
                          <div class="form-group">--%>
                           


                                  <div class="col-md-4 col-sm-4 col-xs-12">
                                                            <label>N.I.C No <span class="required"/>*</span>
                            </label>
                              <input type="number" id="nicno" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>


                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label>Date Of Birth <span class="required">*</span>
                            </label>
                              <input id="birthday" class="date-picker form-control col-md-7 col-xs-12" required="required" type="date"/>
                            </div>
                          </div>
                            
                          <div class="form-group">

                        
                          <%--</div>

                            <div class="form-group">--%>
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >Company Name <span class="required">*</span>
                            </label>
                              <input type="text" id="Cname" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                           

                            <div class="form-group">
                             
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Proffesion<span class="required">*</span>
                            </label>
                              <input type="text" id="proffesion" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                             <div class="form-group">--%>
                                
                        
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                  <label>Designation<span class="required">*</span>
                            </label>
                              <input type="text" id="designation" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                            <div class="form-group">
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >PH: No Office <span class="required">*</span>
                            </label>
                              <input type="number" id="Poffice" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                            <div class="form-group">--%>
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >PH: No Residence <span class="required">*</span>
                            </label>
                              <input type="number" id="Presidence" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                            <div class="form-group">
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >PH: No Cell<span class="required">*</span>
                            </label>
                              <input type="number" id="Pcell" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                             <div class="form-group">--%>

                            <div class="col-md-4 col-sm-4 col-xs-12">
                             <label>Departure Date <span class="required">*</span>
                            </label>
                              <input type="date" id="Depature" name="departure date" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                            <div class="form-group">
                          
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                  <label>Departure Time</label>
                              <input id="Dtime" class="form-control col-md-7 col-xs-12" type="time" name="middle-name">
                            </div>
                          <%--</div>

                            <div class="form-group">--%>

                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                            <label>Flight No<span class="required">*</span>
                            </label>
                              <input type="number" id="flightno" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>



       <div class="form-group">
                            
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <label >Company Adress<span class="required">*</span>
                            </label>
                             <textarea name="fCaddress" required="required" class="form-control col-md-7 col-xs-12"></textarea>
                            </div>
                          <%--</div>

                            <div class="form-group">--%>
                            
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                 <label >Permanent Adress<span class="required">*</span>
                            </label>
                             <textarea name="Paddress" required="required" class="form-control col-md-7 col-xs-12"></textarea>
                            </div>
                          </div>

      <div class="col-md-12 col-sm-12 col-xs-12">
                                 <label >Present Adress<span class="required">*</span>
                            </label>
                             <textarea id="presentaddress" name="presentaddress" required="required" class="form-control col-md-7 col-xs-12"></textarea>
                            </div>
                          </div>


     <div style="padding-top:15px;" class="alignright col-md-2 col-sm-2 col-xs-12">

         <button >Save </button>
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
                              <input type="number" id="fregno" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                          <div class="form-group">--%>
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >Arrival Date <span class="required">*</span>
                            </label>
                              <input type="date" id="fArrival" name="arrivaldate" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                          <div class="form-group">
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Arrival Time</label>
                              <input id="fatime" class="form-control col-md-7 col-xs-12" type="time" name="middle-name"/>
                            </div>
                          <%--</div>
                            
                          <div class="form-group">--%>
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label>Guest Name <span class="required">*</span>
                            </label>
                              <input type="Text" id="fgname" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                          <div class="form-group">
                          
                          <%--</div>
                          <div class="form-group">--%>
                           


                                  <div class="col-md-4 col-sm-4 col-xs-12">
                                                            <label>N.I.C No <span class="required"/>*</span>
                            </label>
                              <input type="number" id="fnicno" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>


                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label>Date Of Birth <span class="required">*</span>
                            </label>
                              <input id="fbirthday" class="date-picker form-control col-md-7 col-xs-12" required="required" type="date"/>
                            </div>
                          </div>
                            
                          <div class="form-group">

                        
                          <%--</div>

                            <div class="form-group">--%>
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >Company Name <span class="required">*</span>
                            </label>
                              <input type="text" id="fCname" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                           

                            <div class="form-group">
                             
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Proffesion<span class="required">*</span>
                            </label>
                              <input type="text" id="fproffesion" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                             <div class="form-group">--%>
                                
                        
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                  <label>Designation<span class="required">*</span>
                            </label>
                              <input type="text" id="fdesignation" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                            <div class="form-group">
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >PH: No Office <span class="required">*</span>
                            </label>
                              <input type="number" id="fPoffice" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                            <div class="form-group">--%>
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >PH: No Residence <span class="required">*</span>
                            </label>
                              <input type="number" id="fPresidence" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                            <div class="form-group">
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >PH: No Cell<span class="required">*</span>
                            </label>
                              <input type="number" id="fPcell" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                             <div class="form-group">--%>

                            <div class="col-md-4 col-sm-4 col-xs-12">
                             <label>Departure Date <span class="required">*</span>
                            </label>
                              <input type="date" id="fDepature" name="departure date" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                            <div class="form-group">
                          
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                  <label>Departure Time</label>
                              <input id="fDtime" class="form-control col-md-7 col-xs-12" type="time" name="middle-name">
                            </div>
                          <%--</div>

                            <div class="form-group">--%>

                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                            <label>Flight No<span class="required">*</span>
                            </label>
                              <input type="number" id="fflightno" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>



       <div class="form-group">
                            
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <label >Company Adress<span class="required">*</span>
                            </label>
                             <textarea name="fCaddress" required="required" class="form-control col-md-7 col-xs-12"></textarea>
                            </div>
                          <%--</div>

                            <div class="form-group">--%>
                            
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                 <label >Permanent Adress<span class="required">*</span>
                            </label>
                             <textarea name="fPaddress" required="required" class="form-control col-md-7 col-xs-12"></textarea>
                            </div>
                          </div>



      <div class="col-md-12 col-sm-12 col-xs-12">
                                 <label >Present Adress<span class="required">*</span>
                            </label>
                             <textarea id="fpresentaddress" name="fpresentaddress" required="required" class="form-control col-md-7 col-xs-12"></textarea>
                            </div>
                          </div>
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >Passport/IC No <span class="required">*</span>
                            </label>
                              <input type="number" id="fpassno" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                               <div class="form-group">--%>
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Nationality <span class="required">*</span>
                            </label>
                              <input type="text" id="nationality" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                               <div class="form-group">
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Place of Issue<span class="required">*</span>
                            </label>
                              <input type="text" id="placeofissue" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                               <div class="form-group">--%>
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label>Date Of Issue <span class="required">*</span>
                            </label>
                              <input type="date" id="dateofissue" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                               <div class="form-group">
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label>Visa No <span class="required">*</span>
                            </label>
                              <input type="number" id="visano" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                               <div class="form-group">--%>
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label>Valid Upto <span class="required">*</span>
                            </label>
                              <input type="date" id="validupto" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                              <div class="form-group">
                            
<%--                          
                          </div>

                               <div class="form-group">
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >Comming From <span class="required">*</span>
                            </label>
                              <input type="number" id="cfrom" required="required" class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                               <div class="form-group">--%>
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Going To <span class="required">*</span>
                            </label>
                              <input type="number" id="gto" required="required" class="form-control col-md-7 col-xs-12"/>
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

     <div style="padding-top:15px;" class="alignright col-md-2 col-sm-2 col-xs-12">

         <button >Save </button>
     </div>

    </div>






                      </div>
                    </div>
                 </div>
                
    


</asp:Content>

