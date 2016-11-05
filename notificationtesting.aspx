<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="notificationtesting.aspx.cs" Inherits="notificationtesting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script src="js/jquery-1.10.2.min.js"></script>
    <link href="Notifications/NotificationStyle.css" rel="stylesheet" />
    <script src="js/NotificationJS.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="right_col" role="main">
          <div class="">
               <div class="messagealert" id="alert_container"  style=" 
  opacity: 0;
  transition: visibility 0s 2s, opacity 2s linear;">  </div>                	  

            <div class="page-title">
              <div class="title_left">
     <div id="Notify"> <!--<img id="icon" />-->
         </div>
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
  
        <%--<input type="button" value="Success" onClick="ShowNotification('Success', 'Operation completed successfully');"/>--%>

    <asp:Button  ID="hello" Text =" hello" runat="server" OnClick="hello_Click"/>
                  </div></div></div></div>
</asp:Content>

