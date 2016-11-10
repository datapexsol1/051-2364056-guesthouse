<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.master" AutoEventWireup="true" CodeFile="adminexpensesreport.aspx.cs" Inherits="adminexpensesreport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/jquery-ui.css" rel="stylesheet" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#datewincome").datepicker();
            $("#datewincome").datepicker('setDate', new Date());
             $('#<%=date.ClientID%>').val($("#datewincome").val()); 
            <%-- __doPostBack('<%=date.ClientID%>');--%>
            $("#datewincome").change(function () {
                $('#<%=date.ClientID%>').val($("#datewincome").val()); 
                __doPostBack('<%=date.ClientID%>');
            });
            <%--$('#<%=date.ClientID%>').change(function () {
               
            });--%>
        });
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="date" runat="server" OnValueChanged="Button1_Click" CLientIDMode="Static"/>
     <div class="right_col" role="main">
          <div class="">
    <div class="page-title">
              <div class="title_left">
         <h3>Expense report of branches</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                      <span class="input-group-btn">
                              <button class="btn btn-default" type="button" disabled="disabled">Select branch!</button>
                          </span>
     <asp:DropDownList ID="branches" runat="server" AutoPostBack="True" OnSelectedIndexChanged="branches_SelectedIndexChanged" CssClass="form-control">
         </asp:DropDownList>
                    
                  </div>
                </div>
              </div>
            </div>
      <div class="clearfix"></div>
  
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">


         <div class="row">
        <div class="col-md-4">
             Select bill type
    <asp:DropDownList ID="employe" runat="server" AutoPostBack="True" OnSelectedIndexChanged="employe_SelectedIndexChanged" CssClass="form-control">
       
    </asp:DropDownList>
        </div>
    
        <div class="col-md-4">
         Select date
       
      <input id="datewincome" class="form-control"/>
            </div>
             </div>
         <div class="row">
         <%--asp:Button ID="Button1"  Text="Search" OnClick="Button1_Click"  />--%>
         <div class="table-responsive">
                      <asp:Table ID="expance" class="table" runat="server"></asp:Table>

                       <asp:Table ID="Salary" class="table" runat="server"></asp:Table>
             </div>
             </div>
         </div>
         </div>
         </div>
        </div>
          </div></div>
</asp:Content>

