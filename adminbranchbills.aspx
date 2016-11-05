<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.master" AutoEventWireup="true" CodeFile="adminbranchbills.aspx.cs" Inherits="adminbranchbills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function activaTab(tab) {

            $('.nav-tabs a[href="#' + tab + '"]').tab('show');

            //alert("working");
        };
 
        function myfunction() {
         
            var d = new Date();
            d.setDate(0);
            document.getElementById('<%=ddBillType.ClientID %>').value = 'Water';
            document.getElementById('<%=ddDate.ClientID %>').value =  '123' ;
            document.getElementById('<%=ubamount.ClientID %>').value = 123;


        }
        function setAddVal() {
        
            document.getElementById('abamount').value = 123;
            document.getElementById('<%=abtype.ClientID %>').value = "Water";
            document.getElementById('abdate').value = '01-10-1991';
            document.getElementById('desc').value = "123";

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Branch Bills</h3>
                             <asp:DropDownList ID="branch" runat="server"  AutoPostBack="true" ClientIDMode="Static"></asp:DropDownList>

    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tab
                            
                            ">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Bills</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false" onclick="setAddVal()">Update Bills</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false" onclick="myfunction()">Add Bills</a>
                          </li>
                            
                          
                        </ul>



     <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
  <div style="overflow:auto;">
     <%  if (branch.SelectedValue == "Select Branch")
    {
            //show all branch bills details 
    }
    else
    {
        int branchid = branchClass.getBranchID(branch.SelectedValue);
                 %>
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
                                     <%  bill b = new bill();
    IQueryable<bill> bill = billclass.getAllbills(branchid);
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
      <%} %>

      </div>
                              </div>


                                <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab" onselect="setAddVal()">


                                     <div style="overflow:auto;white-space:nowrap;">
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
                                    <td> <asp:DropDownList  runat="server" class="form-control" clientIdMode="static" ID="ddBillType" name="ddBillType" AutoPostBack="True" OnSelectedIndexChanged="billTypeSelectedIndexChange" required>
                                      <Items>
                                           <asp:ListItem Text="Select" Value="" />
                                          <asp:ListItem value="Electricity" Text="Electricity"></asp:ListItem>
                                          <asp:ListItem value="Gas" Text="Gas"></asp:ListItem>
                                          <asp:ListItem value="Water" Text="Water"></asp:ListItem>
                                          <asp:ListItem value="Other" Text="Other"></asp:ListItem>
                                       </Items>
                                      </asp:DropDownList>
                                       </td>
                               
                                  <td>

                                      <asp:DropDownList  runat="server" class="form-control" ID="ddDate" name="ddDate" OnSelectedIndexChanged="branchBillSelectedIndexChange" AutoPostBack="True"  >
                                      <Items>
                                           <asp:ListItem Text="Select" Value="" />
                                          
                                           
                                       </Items>
                                      </asp:DropDownList>
                                      
                                      
                                      
                                         <%--<input type="date" id="ubdate" name="ubdate"  placeholder="Date" class="form-control "/>--%></td>
                                                                    <td> <input type="number" id="ubamount" name="ubamount" runat="server" placeholder="Bill Amount" class="form-control " required="required"/></td>

                                    <td>
                                        <%--<input type="submit" runat="server" id="send" onserverclick="Update_bills" causesvalidation="false" />--%>
                                <asp:Button ID="send" runat="server" Text="Update" class="btn btn-success" OnClick="Update_bills"  />

                                    </td>
                                </tr>
                               
                              </tbody>
                            </table>

      </div>


                              </div>


           <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                             
 
                              
                            <div class="col-md-4">
                             <label >Bill Amount <span class="required">*</span></label>

                              <input type="number" id="abamount" min="0" name="abamount" required="required" 
                                  aria-required="true"  placeholder="Amount" class="form-control"/>

                            </div>
                                  
                     
                                
                        <div class="col-md-4">
                            <label>Bill Type <span class="required">*</span></label>
                             <select class="form-control" id="abtype" name="abtype" runat="server" required="required">
                                            <option value="0">Select</option>
                                              <option value="Electricity" id="abtype1">Electricity</option>
                                              <option value="Gas" id="abtype2">Gas</option>
                                              <option value="Water" id="abtype3">Water</option>
                                             <option value="Other" id="abtype4">Other</option>

                            </select>
                        </div>
                      
                           

                        
                        <div class="col-md-4">
                            <label >Date <span class="required">*</span></label>
                          <input type="text" id="abdate" name="abdate"  placeholder="Date" class="form-control " required="required"/>
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
                   
                           
                              <div class="form-group">
                        <div class="col-md-6 col-md-offset-11">
                            <%--<a href="#" onserverclick="Button1_Click" runat="server" class="btn btn-success" >Submit</a>--%>
                           <%--<button onserverclick="Button1_Click" runat="server" class="btn btn-success">Submit</button>--%>
                          <asp:Button ID="Button1" runat="server" Text="Submit"   class="btn btn-success"    OnClick="Button1_Click" />
                            <%--<input type="submit" name="submit" onserverclick="Button1_Click" runat="server" class="btn btn-success"/>--%>
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
    <!-- jQuery -->
   

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

     
</asp:Content>

