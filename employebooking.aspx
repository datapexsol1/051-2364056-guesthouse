<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employebooking.aspx.cs" Inherits="employebooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Booking</h3>
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Bookings</a>
                          </li>
                            </ul>
                            </div>
       
         
         
          <div style="overflow:auto;">
                             
         
         
 <asp:Repeater ID="rptCustomers" runat="server">
    <HeaderTemplate>
        <table cellspacing="0" rules="all" border="1">
            <tr>
                <th scope="col" style="width: 80px">
                   Image
                </th>
                <th scope="col" style="width: 120px">
                    Check In
                </th>
                <th scope="col" style="width: 100px">
                    Room No
                </th>
                <th scope="col" style="width: 80px">
                   No Of Persons
                </th>
                <th scope="col" style="width: 120px">
                   Reg No
                </th>
                <th scope="col" style="width: 100px">
                    N.I.C No
                </th>
                <th scope="col" style="width: 80px">
                   Date of birth
                </th>
                <th scope="col" style="width: 120px">
                    company Name
                </th>
                <th scope="col" style="width: 100px">
                      Profession
                </th>
                <th scope="col" style="width: 80px">
                   Designation
                </th>
                <th scope="col" style="width: 120px">
                    company address
                </th>
                <th scope="col" style="width: 100px">
                    Permanent Adress
                </th>
                <th scope="col" style="width: 100px">
                    Presenet Adress
                </th>
                <th scope="col" style="width: 100px">
                    Ph no office
                </th>
                <th scope="col" style="width: 100px">
                    Ph no residence
                </th>
            </tr>
            
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td>
                <asp:Label ID="lblCustomerId" runat="server" Text="sdfsdfasdfasdf" />
            </td>
            <td>
                <asp:Label ID="lblContactName" runat="server" Text="asdasdfasdfasdfasdfasdf" />
            </td>
            <td>
                <asp:Label ID="lblCountry" runat="server" Text="asdasdfasdfasdfasdf" />
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>
         
         
         
         
           </div>
         </div>
         </div>
        </div>
    </div>
    






</asp:Content>

