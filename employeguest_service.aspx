<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeguest_service.aspx.cs" Inherits="employebranchbills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="Scripts/jquery-1.10.2.js"></script>
      <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <script>
           
        function activaTab(tab) {

            $('.nav-tabs a[href="#' + tab + '"]').tab('show');

            //alert("working");
        };
 

    </script>


</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="Notify"></div>


     <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Branch Services</h3>
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tab
                            
                            ">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Services</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false" onclick="setAddVal()">Update Services</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false" onclick="myfunction()">Add Services</a>
                          </li>
                            
                          
                        </ul>



     <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
  <div style="overflow:auto;">
       <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
<%--                                  <th>Bill Id</th>--%>
                                  <th>Service type</th>
                                  <th>Description</th>
                                  <th>Quantity</th>
                                    <th>Date & time</th>
                                    <th>Room no</th>
                                    <th>Cost</th>
                                 
                                </tr>
                              </thead>
                              <tbody>
                                     <%  int branchID = employeeProfile.getEmployeBranch(Session["loginName"].ToString());

                                         IQueryable<guest_service> gs=guestservice_class.getAllService(branchID);
                                         foreach (var r in gs)
                                         { %>
                                <tr>
<%--                                  <td><label id="bilid"><%=r.Id %></label></td>--%>
                                  <td><label id="bilamount"><%=r.type%></label></td>
                                  <td><label id="biltype"><%=r.description%></label></td>
                                  <td> <label id="bildate"><%=r.item_quantity%></label></td>
                                    <td> <label id="bildate1"><%=r.date_time%></label></td>
                                    <td> <label id="bildate2"><%=r.room_no%></label></td>
                                    <td> <label id="bildate3"><%=r.item_cost%></label></td>
                                  
                                </tr>
                               <%} %>
                              </tbody>
                            </table>

      </div>
                              </div>


           <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab" onselect="setAddVal()">
               <div id="updatePanel">
                   <div class="col-md-4">
                       <label >Select Service Type <span class="required">*</span></label>
                        <asp:DropDownList runat="server" ID="ddServiceType" AutoPostBack="true" OnSelectedIndexChanged="ddServiceTypeSelectedIndex" CssClass="form-control"></asp:DropDownList>
                    </div>
                   <div class="col-md-4">
                       <label >Select Room No <span class="required">*</span></label>
                        <asp:DropDownList runat="server" ID="ddRoomNo" AutoPostBack="true" OnSelectedIndexChanged="ddRoomNoTypeSelectedIndex" CssClass="form-control">
                            <asp:ListItem Value="Select"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                   <div class="col-md-4">
                       <label >Select Date <span class="required">*</span></label>
                        <asp:DropDownList runat="server" ID="ddDate" AutoPostBack="true"  OnSelectedIndexChanged="ddDateTypeSelectedIndex"  CssClass="form-control">
                            <asp:ListItem Value="Select"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                   <div class="col-md-4">
                       <label >Description <span class="required">*</span></label>
                       <input type="text" id="updesc" name="updesc" required="required" runat="server" aria-required="true" placeholder="Description" class="form-control"/>

                    </div>
                   <div class="col-md-4">
                       <label >Quantity <span class="required">*</span></label>
                       <input type="number" min="0" id="upqty" name="upqty" required="required" runat="server" aria-required="true"   class="form-control"/>

                    </div>
                   <div class="col-md-4">
                       <label >Cost <span class="required">*</span></label>
                       <input type="number" min="0" id="upcost" name="upcost" required="required" runat="server" aria-required="true"  value="0" class="form-control"/>

                    </div>
                </div>
<a href="" runat="server" onserverclick="Update_service" class="btn btn-success">Update service</a>
               <%--<asp:Button runat="server" Text="Update service" ID="UpdateId" CssClass="btn btn-success" OnClick="Update_service"/>--%>



           </div>


           <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                             
 
                              
                            <div class="col-md-4">
                             <label >Service type <span class="required">*</span></label>

                              <select id="serviceId" name="serviceId" class="form-control">
                                  <option value="" name="">Select</option>
                                  <option value="Car Rent">Car Rent</option>
                                  <option value="Laundry">Laundry</option>
                                  <option value="Other">Other</option>
                              </select>

                            </div>
                            <div class="col-md-4">
                             <label >Description <span class="required">*</span></label>

                              <input type="text" id="addesc" name="addesc" required="required" aria-required="true"  placeholder="Description" class="form-control"/>

                            </div>
               <div class="col-md-4">
                             <label >Quantity <span class="required">*</span></label>

                              <input type="number" min="0" id="adqty" name="adqty" required="required" aria-required="true"  value="0" class="form-control"/>

                            </div>
               <%--<div class="col-md-4">
                             <label >Date <span class="required">*</span></label>

                              <input type="text" id="abdate" name="abdate" required="required" aria-required="true" placeholder="Select date" class="form-control"/>

                            </div>--%>
               <div class="col-md-4">
                             <label >Room no <span class="required">*</span></label>
                    <select id="adroomno" name="adroomno" class="form-control" >
                        <option>Select Room</option>
                                <%
                                    IQueryable<room> rm = roomsclass.getBookedROoms(branchID);
                                    foreach (var x in rm)
                                    {
                                     %>
                        <option><%=x.room_no %></option>
                  <%} %>

                   </select>
                              <%--<input type="text" id="adroomno" name="adroomno" required="required" aria-required="true"  placeholder="Enter room no" class="form-control"/>--%>

                            </div>
               <div class="col-md-4">
                             <label >Item cost <span class="required">*</span></label>

                              <input type="number" id="adcost" name="adcost" required="required" aria-required="true"  value="0" class="form-control"/>

                            </div>




               <!------------------------------------------------------------------------------------>
                           <%-- <div class="col-md-4">
                             <label >Bill Amount <span class="required">*</span></label>

                              <input type="number" id="abamount" min="0" name="abamount" required="required" aria-required="true"  placeholder="Amount" class="form-control"/>

                            </div>
                                  --%>
                     
                                
                       <%-- <div class="col-md-4">
                            <label>Bill Type <span class="required">*</span></label>
                             <select class="form-control" id="abtype" name="abtype"  onchange="setHomeRent();" runat="server" required="required">
                                            <option value="0">Select</option>
                                        
                                 <option value="Electricity" id="abtype1">Electricity</option>
                                          <option value="Gas" id="abtype2">Gas</option>
                                          <option value="Water" id="abtype3">Water</option>
                                          <option value="Nayatel" id="abtype4">Nayatel</option>
                                          <option value="House Rent" id="abtype5">House Rent</option>
                                          <option value="Repair and Maintainence" id="abtype6">Repair and Maintainence</option>
                                          <option value="Petrol for Generator" id="abtype7">Petrol for Generator</option>
                                          <option value="Food Supplies" id="abtype8">Food Supplies</option>
                                          <option value="Other Supplies" id="abtype9">Other Supplies</option>
                                          <option value="Commission" id="abtype10">Commission</option>
                                          <option value="Misc." id="abtype11">Misc.</option>
                                          <option value="Communication" id="abtype12">Communication</option>
                                          <option value="Other" id="abtype13">Other</option>

                            </select>
                        </div>--%>
                      
                           

                        
                       <%-- <div class="col-md-4">
                            <label >Date <span class="required">*</span></label>
                          <input type="text" id="abdate" name="abdate" data-format="dd-mm-yyyy"  placeholder="Date" class="form-control " required="required"/>
                        </div>
                      
                <div class="form-group col-md-12">
                    <div class="row">
                        
                        <div class="col-md-12">
                        <label >Bill Description <span class="required">*</span>
                        </label>
                              <textarea  id="desc" name="desc"  placeholder="Description" rows="2" class="form-control "></textarea>
                        </div>
                 </div>
                    </div>--%>
                   
                           
                              <div class="form-group">
                        <div class="col-md-6 col-md-offset-11">
                            <%--<a href="#" onserverclick="Button1_Click" runat="server" class="btn btn-success" >Submit</a>--%>
                           <%--<button onserverclick="Button1_Click" runat="server" class="btn btn-success">Submit</button>--%>
                          <asp:Button ID="Button1" runat="server" Text="Submit"   class="btn btn-success"    OnClick="SaveServices" />
                            <%--<input type="submit" name="submit" onserverclick="Button1_Click" runat="server" class="btn btn-success"/>--%>
                        <input type="hidden" id="abcd" runat="server" />
                        </div>
                      </div>
                            </div>

         </div>
        </div>
         </div>
         </div>
         </div>
        </div>
         </div>
 

    <!-- bootstrap-daterangepicker -->
    <script src="js/moment/moment.min.js"></script>
    <script src="js/datepicker/daterangepicker.js"></script>
  
    <script>
      $(document).ready(function() {
      
          $('#abdate').daterangepicker({
          singleDatePicker: true,
          calender_style: "picker_2"
        }, function(start, end, label) {
          console.log(start.toISOString(), end.toISOString(), label);
        });
     
       
      });
    </script>
 <!-- bootstrap-daterangepicker -->
   


</asp:Content>

