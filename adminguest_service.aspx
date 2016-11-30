<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.master" AutoEventWireup="true" CodeFile="adminguest_service.aspx.cs" Inherits="adminguest_service" %>

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
         
    <div class="page-title">
              <div class="title_left">
                 <h3>Branch Services</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                      <span class="input-group-btn">
                              <label class="btn btn-default" >Select branch!</label>
                          </span>
                  <asp:DropDownList ID="bid" runat="server" OnSelectedIndexChanged="branchindexchange"  AutoPostBack="true" ClientIDMode="Static"  CssClass="form-control"></asp:DropDownList>

                    
                  </div>
                </div>
              </div>
            </div>
      <div class="clearfix"></div>
 
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
        
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
                                     <% if (bid.SelectedValue != "Select Branch")
                                         {
                                             int branchID = branchClass.getBranchID(bid.SelectedValue);//employeeProfile.getEmployeBranch(Session["loginName"].ToString());

                                             IQueryable<guest_service> gs = guestservice_class.getAllService(branchID);
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
                               <%}
                                               %>
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
                       <input type="text" id="updesc" name="updesc"  runat="server" aria-required="true" placeholder="Description" class="form-control"/>

                    </div>
                   <div class="item col-md-4">
                       <label >Quantity <span class="required">*</span></label>
                       <input type="number" min="0" id="upqty" name="upqty" required="required"  runat="server" aria-required="true"   class="form-control"/>

                    </div>
                   <div class="item col-md-4">
                       <label >Cost <span class="required">*</span></label>
                       <input type="number" min="0" id="upcost" required="required" name="upcost"  runat="server" aria-required="true"   class="form-control"/>

                    </div>
                </div>
<%--<a href="" runat="server" onserverclick="Update_service" class="btn btn-success">Update service</a>--%>
               <asp:Button runat="server" Text="Update service" ID="UpdateId" CssClass="btn btn-success" OnClick="Update_service"/>



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

                              <input type="text" id="addesc" name="addesc" aria-required="true"  placeholder="Description" class="form-control"/>

                            </div>
               <div class="col-md-4">
                             <label >Quantity <span class="required">*</span></label>

                              <input type="number" min="0" id="adqty" name="adqty"  aria-required="true"  value="0" class="form-control"/>

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
                  <%}
                      } %>

                   </select>
                              <%--<input type="text" id="adroomno" name="adroomno" required="required" aria-required="true"  placeholder="Enter room no" class="form-control"/>--%>

                            </div>
               <div class="col-md-4">
                             <label >Item cost <span class="required">*</span></label>

                              <input type="number" id="adcost" name="adcost"  aria-required="true"  value="0" class="form-control"/>

                            </div>




              
                   
                           
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

