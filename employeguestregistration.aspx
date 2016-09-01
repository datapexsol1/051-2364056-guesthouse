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
                
            });
        });

        $(function () {
            $("#foriegner").click(function () {
                $("#s3").show();
                $("#s2").hide();
                $("#guestType").val("foriegner");
                alert($("#guestType").val());

            });
        });
    </script>

</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                                <%  int bid = employeeProfile.getEmployeBranch("kk");//get from session %>
                               <input type="hidden" name="branch" id="branch" value=<%= bid%> />
                                    <input type="hidden" name="guestType" id="guestType" value="xyz" />
                              <select  id="rno" name="rno" required="required" class="form-control col-md-7 col-xs-12">
                                     <option>Select Room</option>
                                      <%  

                                          IQueryable<room> r = roomsclass.getAvailableRooms(bid);
                                          foreach (var x in r)
                                          { %>
                                         <option><%= x.room_no %></option>
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
                              <input type="number" id="noofpax" name="noofpax" required="required" class="form-control col-md-7 col-xs-12"/>
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
                              <input type="number" id="rrent" name="rrent" required="required" class="form-control col-md-7 col-xs-12"/>
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
                              <input type="number" id="regno" name="regno"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                          <div class="form-group">--%>
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >Arrival Date <span class="required">*</span>
                            </label>
                              <input type="date" id="Arrival" name="arrivaldate"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                          <div class="form-group">
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Arrival Time</label>
                              <input id="atime"  class="form-control col-md-7 col-xs-12" type="time" name="atime"/>
                            </div>
                          <%--</div>
                            
                          <div class="form-group">--%>
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label>Guest Name <span class="required">*</span>
                            </label>
                              <input type="Text" id="gname" name="gname"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                          <div class="form-group">
                          
                          <%--</div>
                          <div class="form-group">--%>
                           


                                  <div class="col-md-4 col-sm-4 col-xs-12">
                                                            <label>N.I.C No <span class="required"/>*</span>
                            </label>
                              <input type="number" id="cnicno" name="cnicno"  class="form-control col-md-7 col-xs-12"/>
                            </div>


                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label>Date Of Birth <span class="required">*</span>
                            </label>
                              <input id="dob" name="dob" class="date-picker form-control col-md-7 col-xs-12"  type="date"/>
                            </div>
                          </div>
                            
                          <div class="form-group">

                        
                          <%--</div>

                            <div class="form-group">--%>
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >Company Name <span class="required">*</span>
                            </label>
                              <input type="text" id="cname" name="cname"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                           

                            <div class="form-group">
                             
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Proffesion<span class="required">*</span>
                            </label>
                              <input type="text" id="proffesion" name="proffesion"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                             <div class="form-group">--%>
                                
                        
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                  <label>Designation<span class="required">*</span>
                            </label>
                              <input type="text" id="designation" name="designation"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                            <div class="form-group">
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >PH: No Office <span class="required">*</span>
                            </label>
                              <input type="number" id="poffice" name="poffice"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                            <div class="form-group">--%>
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >PH: No Residence <span class="required">*</span>
                            </label>
                              <input type="number" id="presidence" name="presidence"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                            <div class="form-group">
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >PH: No Cell<span class="required">*</span>
                            </label>
                              <input type="number" id="pcell" name="pcell"   class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                             <div class="form-group">--%>

                            <div class="col-md-4 col-sm-4 col-xs-12">
                             <label>Departure Date <span class="required">*</span>
                            </label>
                              <input type="date" id="Depature" name="departure"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                            <div class="form-group">
                          
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                  <label>Departure Time</label>
                              <input id="dtime" name="dtime" class="form-control col-md-7 col-xs-12" type="time" />
                            </div>
                          <%--</div>

                            <div class="form-group">--%>

                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                            <label>Flight No<span class="required">*</span>
                            </label>
                              <input type="number" id="flightno" name="flightno"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>



       <div class="form-group">
                            
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <label >Company Adress<span class="required">*</span>
                            </label>
                             <textarea  id="caddress" name="caddress"  class="form-control col-md-7 col-xs-12"></textarea>
                            </div>
                          <%--</div>

                            <div class="form-group">--%>
                            
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                 <label >Permanent Adress<span class="required">*</span>
                            </label>
                             <textarea id="paddress" name="paddress"  class="form-control col-md-7 col-xs-12"></textarea>
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
                              <input type="number" id="fregno"  name="fregno"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >Arrival Date <span class="required">*</span>
                            </label>
                              <input type="date" id="farrival" name="farrivaldate"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                          <div class="form-group">
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Arrival Time</label>
                              <input id="fatime" class="form-control col-md-7 col-xs-12" type="time" name="fatime"/>
                            </div>
                          <%--</div>
                            
                          <div class="form-group">--%>
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label>Guest Name <span class="required">*</span>
                            </label>
                              <input type="Text" id="fgname" name="fgname"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                          <div class="form-group">
                          
                          <%--</div>
                          <div class="form-group">--%>
                           


                                  <div class="col-md-4 col-sm-4 col-xs-12">
                                                            <label>N.I.C No <span class="required"/>*</span>
                            </label>
                              <input type="number" id="fcnicno" name="fcnicno"  class="form-control col-md-7 col-xs-12"/>
                            </div>


                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label>Date Of Birth <span class="required">*</span>
                            </label>
                              <input id="fdob"  name="fdob" class="date-picker form-control col-md-7 col-xs-12"  type="date"/>
                            </div>
                          </div>
                            
                          <div class="form-group">

                        
                          <%--</div>

                            <div class="form-group">--%>
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >Company Name <span class="required">*</span>
                            </label>
                              <input type="text" id="fcname" name="fcname"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                           

                            <div class="form-group">
                             
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Proffesion<span class="required">*</span>
                            </label>
                              <input type="text" id="fproffesion" name="fproffesion"  class="form-control col-md-7 col-xs-12"/>
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
                              <input type="number" id="fpcell" name="fpcell"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                             <div class="form-group">--%>

                            <div class="col-md-4 col-sm-4 col-xs-12">
                             <label>Departure Date <span class="required">*</span>
                            </label>
                              <input type="date" id="fdeparture" name="fdeparture"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                            <div class="form-group">
                          
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                  <label>Departure Time</label>
                              <input id="fdtime" name="fdtime"class="form-control col-md-7 col-xs-12" type="time" />
                            </div>
                          <%--</div>

                            <div class="form-group">--%>

                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                            <label>Flight No<span class="required">*</span>
                            </label>
                              <input type="number" id="fflightno" name="fflightno"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>



       <div class="form-group">
                            
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <label >Company Adress<span class="required">*</span>
                            </label>
                             <textarea name="fcaddress" id="fcaddress"  class="form-control col-md-7 col-xs-12"></textarea>
                            </div>
                          <%--</div>

                            <div class="form-group">--%>
                            
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                 <label >Permanent Adress<span class="required">*</span>
                            </label>
                             <textarea name="fpaddress" id="fpaddress"  class="form-control col-md-7 col-xs-12"></textarea>
                            </div>
                          </div>

                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label >Passport/IC No <span class="required">*</span>
                            </label>
                              <input type="number" id="fpassno" name="fpassno"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                               <div class="form-group">--%>
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Nationality <span class="required">*</span>
                            </label>
                              <input type="text" id="nationality" name="nationality"  class="form-control col-md-7 col-xs-12"/>
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
                              <input type="date" id="dateofissue" name="fdateofissue"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          </div>

                               <div class="form-group">
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label>Visa No <span class="required">*</span>
                            </label>
                              <input type="number" id="visano" name="visano"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                          <%--</div>

                               <div class="form-group">--%>
                           
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                 <label>Valid Upto <span class="required">*</span>
                            </label>
                              <input type="date" id="validupto" name="validupto"  class="form-control col-md-7 col-xs-12"/>
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
                              <input type="number" id="fcfrom" name="fcfrom"  class="form-control col-md-7 col-xs-12"/>
                            </div>
                            
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <label >Going To <span class="required">*</span>
                            </label>
                              <input type="number" id="fgoto" name="fgoto"  class="form-control col-md-7 col-xs-12"/>
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
      <asp:Button ID="Save" runat="server" Text="Register Guest" OnClick="Save_Click"  CausesValidation="false" />
         
     </div>






                      </div>
                    </div>
                 </div>
                
    


</asp:Content>

