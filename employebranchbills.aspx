﻿<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employebranchbills.aspx.cs" Inherits="employebranchbills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function activaTab(tab) {

            $('.nav-tabs a[href="#' + tab + '"]').tab('show');

            //alert("working");
        };
    </script>
     
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



     <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Branch Bills</h3>
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Bills</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Update Bills</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Add Bills</a>
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
                                     <%  bill b = new bill();
                                         IQueryable<bill> bill=billclass.getAllbills(b.Id);
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


                                <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">


                                     <div style="overflow:auto;white-space:nowrap;">
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
                                <tr>
<%--                                  <td> <input type="number" id="ubno" name="ubno"  placeholder="Bill Id" class="form-control" /></td>--%>
                                   
                                  <td> <input type="text" id="ubamount" name="ubamount" runat="server" placeholder="Bill Amount" class="form-control "/></td>
                                <td> <asp:DropDownList  runat="server" class="form-control" clientIdMode="static" ID="ddBillType" name="ddBillType" AutoPostBack="True" OnSelectedIndexChanged="billTypeSelectedIndexChange" required>
                                      <Items>
                                           <asp:ListItem Text="Select" Value="" />
                                       </Items>
                                      </asp:DropDownList>
                                    
                                    <%--<select class="form-control" id="ddBillType" name="ubtype" runat="server">
                                        <option value="0">Select</option>
                                    <option value="Electricity" id="ubtype1">Electricity</option>
                              <option value="Gas" id="ubtype2">Gas</option>
                              <option value="Water" id="ubtype3">Water</option>


                                        </select>--%></td>
                                  <td>

                                      <asp:DropDownList  runat="server" class="form-control" clientIdMode="static" ID="ddDate" name="ddDate" OnSelectedIndexChanged="branchBillSelectedIndexChange" AutoPostBack="True"  required>
                                      <Items>
                                           <asp:ListItem Text="Select" Value="" />
                                       </Items>
                                      </asp:DropDownList>
                                      
                                      
                                      
                                         <%--<input type="date" id="ubdate" name="ubdate"  placeholder="Date" class="form-control "/>--%></td>
                                  <td>
                                        <asp:Button ID="send" runat="server" Text="Update"  class="btn btn-success" OnClick="Update_bills" /></td>
                                </tr>
                               
                              </tbody>
                            </table>

      </div>


                              </div>


           <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                             
 
                              <div class="form-group col-md-6">
                                <label class="control-label col-md-4 " >Bill Amount <span class="required">*</span></label>
                            <div class="col-md-8">
                              <input type="number" id="abamount" name="abamount"  placeholder="Amount" class="form-control "/>
                            </div>
                                  </div>
                     

                               <div class="form-group col-md-6">
                                <label class="control-label col-md-4 ">Bill Type <span class="required">*</span>
                                </label>
                        <div class="col-md-8">

                             <select class="form-control" id="abtype" name="abtype" runat="server">
                                            <option value="0">Select</option>
                                              <option value="Electricity" id="abtype1">Electricity</option>
                                              <option value="Gas" id="abtype2">Gas</option>
                                              <option value="Water" id="abtype3">Water</option>
                                             <option value="Water" id="abtype4">Other</option>

                            </select>
                        </div>
                      </div>
                <div class="form-group col-md-6">
                               <label class="control-label col-md-4 " >Bill Description <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="text" id="desc" name="desc"  placeholder="Description" style="height:100px" class="form-control "/>
                        </div>
                 </div>
                               <div class="form-group col-md-6">
                        <label class="control-label col-md-4" >Date <span class="required">*</span>
                        </label>
                        <div class="col-md-8">
                          <input type="date" id="abdate" name="abdate"  placeholder="Date" class="form-control "/>
                        </div>
                      </div>
                           
                              <div class="form-group">
                        <div class="col-md-6 col-md-offset-11">
                            <a href="#" onserverclick="Button1_Click" runat="server" class="btn btn-success" >Submit</a>
                          <%--<asp:Button ID="Button1" runat="server" Text="Submit"  class="btn btn-success" OnClick="Button1_Click" />--%>
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



</asp:Content>

