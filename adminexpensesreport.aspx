<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.master" AutoEventWireup="true" CodeFile="adminexpensesreport.aspx.cs" Inherits="adminexpensesreport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Branch</h3>

         branches
     <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem>Electricity</asp:ListItem>
        <asp:ListItem>Gas</asp:ListItem>
        <asp:ListItem>Water</asp:ListItem>
        <asp:ListItem>Telephone</asp:ListItem>
        <asp:ListItem>Othere</asp:ListItem>
    </asp:DropDownList>
         bill type
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem>Electricity</asp:ListItem>
        <asp:ListItem>Gas</asp:ListItem>
        <asp:ListItem>Water</asp:ListItem>
        <asp:ListItem>Telephone</asp:ListItem>
        <asp:ListItem>Othere</asp:ListItem>
    </asp:DropDownList>
         datetime
         <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem>Electricity</asp:ListItem>
        <asp:ListItem>Gas</asp:ListItem>
        <asp:ListItem>Water</asp:ListItem>
        <asp:ListItem>Telephone</asp:ListItem>
        <asp:ListItem>Othere</asp:ListItem>
    </asp:DropDownList>
         <asp:Button ID="Button1" runat="server" Text="Search" />
    <asp:Table ID="expances" runat="server"></asp:Table>
         </div>
         </div>
         </div>
        </div>
          </div>
</asp:Content>

