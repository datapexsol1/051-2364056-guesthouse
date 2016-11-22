<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employebranchbills.aspx.cs" Inherits="employebranchbills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="Scripts/jquery-1.10.2.js"></script>
      <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <script>
           
        function activaTab(tab) {

            $('.nav-tabs a[href="#' + tab + '"]').tab('show');

            //alert("working");
        };
       
        function myfunction() {
            alert("adsa");
            var d = new Date();
            d.setDate(0);
            document.getElementById('<%=ddBillType.ClientID %>').value = 'Water';
            document.getElementById('<%=ddDate.ClientID %>').value =  '123' ;
            document.getElementById('<%=ubamount.ClientID %>').value = 123;

<%--            document.getElementById('abamount').value = "";
                document.getElementById('<%=abtype.ClientID %>').value = "";
                document.getElementById('abdate').value = '';
                document.getElementById('desc').value = "";--%>
        }
        function setAddVal() {
                <%try
        {%>
            //$("input[name=abamount]").val("123");
            document.getElementById('abamount').value = 123;
            document.getElementById('<%=abtype.ClientID %>').value = "Water";
            document.getElementById('abdate').value = '01-10-1991';
            document.getElementById('desc').value = "123";

          <%-- document.getElementById('<%=ddBillType.ClientID %>').value = '';
            document.getElementById('<%=ddDate.ClientID %>').value =  '' ;
            document.getElementById('<%=ubamount.ClientID %>').value = "";--%>

        }
        function setHomeRent() {
            if(document.getElementById('<%=abtype.ClientID %>').value  == "House Rent")
            {

                //document.getElementById('abamount').value = 242000;
                <%
        int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
        bill b = billclass.latestcheckHouseRentYear(bid);//latest bill year
        bill oldyeardate = billclass.oldestcheckHouseRentYear(bid);//oldest bill year

        int y1 = oldyeardate.Date.Year; //old year
        int y2 = b.Date.Year; ///new year
        // DateTime.Subtract(DateTime);
        int d3 = y2 - y1;
        if (d3 == 0)
        {
            %>
                document.getElementById('abamount').value = 242000;
                <%
        }
        else
        {
            double increment = 242000 * 10 / 100;

             %>
                
                document.getElementById('abamount').value = 242000 + <%=increment * d3 %> ;
        <%
        }
        // var newDate = myDate.AddYears(-1);
        if (b != null)
        {
            abcd.Value = b.Date.ToShortDateString();
        }
        else
        {
            abcd.Value = "";
        }

        %>
            }
            else
            {
                document.getElementById('abamount').value = '';
            }
        }
        <%}
        catch (Exception ex)
        {

        }%>
       
    </script>


</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="Notify"></div>


     <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Branch Bills</h3>
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tab
                            
                            ">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Bills</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false" onclick="setAddPanelVal()">Update Bills</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false" onclick="setUpdatePanelVal()">Add Bills</a>
                          </li>
                            
                          
                        </ul>



     <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
  <div style="overflow:auto;">
       <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
<%--                                  <th>Bill Id</th>--%>
                                  <th>Bill Amount</th>
                                  <th>Bill Type</th>
                                  <th>Bill Date</th>
                                 
                                </tr>
                              </thead>
                              <tbody>
                                     <%  int branchID = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
                                         bill b = new bill();
                                         IQueryable<bill> bill=billclass.getAllbills(branchID);
                                         foreach (var r in bill)
                                         { %>
                                <tr>
<%--                                  <td><label id="bilid"><%=r.Id %></label></td>--%>
                                  <td><label id="bilamount"><%=r.BillAmount%></label></td>
                                  <td><label id="biltype"><%=r.BillType%></label></td>
                                  <td> <label id="bildate"><%=r.Date%></label></td>
                                  
                                </tr>
                               <%} %>
                              </tbody>
                            </table>

      </div>
                              </div>


                                <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab" >
                                    

                                     <div style="overflow:auto;white-space:nowrap;">
                                         <div id="updatePanelID">
                                                    <table class="data table table-striped no-margin">
                              <thead>
                                 <tr>
<%--                                  <th>Bill Id</th>--%>
                                     <th>Bill Type</th>
                                     <th>Bill Date</th>
                                  <th>Bill Amount</th>
                                  
                                  
                                 
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                    <td> <asp:DropDownList  runat="server" class="form-control" clientIdMode="static" ID="ddBillType" name="ddBillType" AutoPostBack="true" OnSelectedIndexChanged="billTypeSelectedIndexChange" required>
                                      <Items>
                                           <asp:ListItem Text="Select" Value="Select" />
                                          <asp:ListItem value="Electricity" Text="Electricity"></asp:ListItem>
                                          <asp:ListItem value="Gas" Text="Gas"></asp:ListItem>
                                          <asp:ListItem value="Water" Text="Water"></asp:ListItem>
                                          <asp:ListItem value="Nayatel" Text="Nayatel"></asp:ListItem>
                                          <asp:ListItem value="House Rent" Text="House Rent"></asp:ListItem>
                                          <asp:ListItem value="Repair and Maintainence" Text="Repair and Maintainence"></asp:ListItem>
                                          <asp:ListItem value="Petrol for Generator" Text="Petrol for Generator"></asp:ListItem>
                                          <asp:ListItem value="Food Supplies" Text="Food Supplies"></asp:ListItem>
                                          <asp:ListItem value="Other Supplies" Text="Other Supplies"></asp:ListItem>
                                          <asp:ListItem value="Commission" Text="Commission"></asp:ListItem>
                                          <asp:ListItem value="Misc." Text="Misc."></asp:ListItem>
                                          <asp:ListItem value="Communication" Text="Communication"></asp:ListItem>
                                          <asp:ListItem value="Other" Text="Other"></asp:ListItem>
                                       </Items>
                                      </asp:DropDownList>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddBillType" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>--%>
                                    <%--<select class="form-control" id="ddBillType" name="ubtype" runat="server">
                                        <option value="0">Select</option>
                                    <option value="Electricity" id="ubtype1">Electricity</option>
                              <option value="Gas" id="ubtype2">Gas</option>
                              <option value="Water" id="ubtype3">Water</option>


                                        </select>--%></td>
                               
                                  <td>

                                      <asp:DropDownList  runat="server" class="form-control" ID="ddDate" name="ddDate" OnSelectedIndexChanged="branchBillSelectedIndexChange" AutoPostBack="True"  >
                                      <Items>
                                           <asp:ListItem Text="Select" Value="" />
                                          
                                           
                                       </Items>
                                      </asp:DropDownList>
                                      
                                      
                                      
                                         <%--<input type="date" id="ubdate" name="ubdate"  placeholder="Date" class="form-control "/>--%></td>
                                                                    <td> <input type="number" id="ubamount" name="ubamount" runat="server" placeholder="Bill Amount" class="form-control " data-validation="required" 
		 data-validation-error-msg="Bill Amount is required !"/></td>

                                    <td>
                                        <%--<input type="submit" runat="server" id="send" onserverclick="Update_bills" causesvalidation="false" />--%>
                                <asp:Button ID="send" runat="server" Text="Update" class="btn btn-success" OnClick="Update_bills"  />
                                        <%--<a href ="" id="send" onserverclick="Update_bills" runat="server" class="btn btn-success">Update</a>--%>

                                    </td>
                                </tr>
                               
                              </tbody>
                            </table>
                                         </div>

      </div>


                              </div>


           <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                             
 
                         <div id="addpanelid">     
                            <div class="col-md-4">
                             <label >Bill Amount <span class="required">*</span></label>

                              <input type="number" id="abamount" min="0" name="abamount" 
                                  aria-required="true"  placeholder="Amount" data-validation="required" 
		 data-validation-error-msg="Bill amount is required !" class="form-control"/>

                            </div>
                                  
                     
                                
                        <div class="col-md-4">
                            <label>Bill Type <span class="required">*</span></label>
                             <select class="form-control" id="abtype" name="abtype"  onchange="setHomeRent();" runat="server">
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
                        </div>
                      
                           

                        
                        <div class="col-md-4">
                            <label >Date <span class="required">*</span></label>
                          <input type="text" id="abdate" name="abdate" data-format="dd-mm-yyyy"  placeholder="Date" class="form-control " data-validation="required" 
		 data-validation-error-msg="Bill Date is required !"/>
                        </div>
                      
                <div class="form-group col-md-12">
                    <div class="row">
                        
                        <div class="col-md-12">
                        <label >Bill Description <span class="required">*</span>
                        </label>
                              <textarea  id="desc" name="desc"  placeholder="Description" rows="2" class="form-control "></textarea>
                        </div>
                 </div>
                    </div>
                   
                           </div>
                              <div class="form-group">
                        <div class="col-md-6 col-md-offset-11">
                            <%--<a href="#" onserverclick="Button1_Click" runat="server" class="btn btn-success" >Submit</a>--%>
                           <%--<button onserverclick="Button1_Click" runat="server" class="btn btn-success">Submit</button>--%>
                          <asp:Button ID="Button1" runat="server" Text="Submit"  CausesValidation="true" class="btn btn-success" OnClick="Button1_Click" />
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
        function setUpdatePanelVal(){ 

           // alert("hello");
            document.getElementById('<%=ddBillType.ClientID %>').value = 'Electricity';
            document.getElementById('<%=ubamount.ClientID %>').value = '123';


             $("#addpanelid").find("input[type=text]").val('');
          document.getElementById('<%=abtype.ClientID %>').value = 'Select';
          $("#addpanelid").find("input[type=number]").val('');
        };
        
      function setAddPanelVal(){ 

        //  alert("setting updatepanel");
          $("#addpanelid").find("input[type=text]").val('01-10-2016');
          document.getElementById('<%=abtype.ClientID %>').value = 'Electricity';
          $("#addpanelid").find("input[type=number]").val(1);
         
          document.getElementById('<%=ddBillType.ClientID %>').value = 'Select';
            document.getElementById('<%=ubamount.ClientID %>').value = '';

      };
        function mybillfunction(){
            <%
        int bid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
        var bType = ddBillType.SelectedValue;

        ////date dropdownlist
        List<bill> bs = billclass.getBillItem(bType, bid);

        string[] billType = new string[bs.Count() + 1];
        billType[0] = "Select";
        int i = 1;
        foreach (var x in bs)
        {
            //int result = int.Parse((DateTime.Now.Day - x.Date.Day).ToString());
            //if (result == 1 || result == 0)
            //{

            billType[i] = x.Date.ToShortDateString();
            i++;
            //}

        }
        ddDate.DataSource = billType;
        ddDate.DataBind();


        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "activaTab('tab_content2');", true);
        %>
        }
        function activaTab(tab) {

            $('.nav-tabs a[href="#' + tab + '"]').tab('show');

            //alert("working");
        };
    </script>
 <!-- bootstrap-daterangepicker -->
   
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

      <!-- jQuery -->

</asp:Content>

