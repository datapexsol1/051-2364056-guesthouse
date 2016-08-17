<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <form class="form-inline" id="f1" runat="server">


        <div class="container">
            <section style="padding-bottom: 50px; padding-top: 50px;">
                <div class="row">
                    <div class="col-md-4">



\                        <div>
                            <asp:Image ID="tg_ProImg" runat="server" class="img-circle" Style="height: 300px; width: 300px;" />

                        </div>

                        <br />

                       

                        <br />

                    

                        <br />
                        <br />
                    </div>









                    <!--Content Div--------------------------->
                    <div class="col-md-8">
                        <div class="alert alert-info">
                            <h2>
                                <asp:Label ID="lb_HeadName" runat="server" Text="Name"></asp:Label>
                            </h2>
                            <h4>
                                <asp:Label ID="lb_Email" runat="server" Text="Email@mail.com"></asp:Label></h4>



                        </div>

                        <div class="alert alert-info">
                            <asp:LinkButton ID="DetailInfoEdit" class="btn btn-primary pull-right btn-sm"  data-toggle="modal" data-target="#DetailInformation" runat="server">Edit</asp:LinkButton>
                            <%--<button  class="btn btn-primary pull-right btn-sm" data-toggle="modal" data-target="#DetailInformation" type="button">Edit</button>--%>
                            <h2>Detail information</h2>

                            <!--table-->



                            <table class="table table-hover">

                                <tr>
                                    <th>Name</th>
                                    <td>
                                        <asp:Label ID="lb_DetailName" runat="server" Text="N/A"></asp:Label></td>
                                    <th>Father Name</th>
                                    <td>
                                        <asp:Label ID="lb_FatherName" runat="server" Text="N/A"></asp:Label></td>
                                </tr>


                                <tr>
                                    <th>Gender</th>
                                    <td>
                                        <asp:Label ID="lb_Gender" runat="server" Text="N/A"></asp:Label></td>
                                    <th>Date of Birth</th>
                                    <td>
                                        <asp:Label ID="lb_DateOfBirth" runat="server" Text="N/A"></asp:Label></td>
                                </tr>
                                <tr>
                                    <th>City</th>
                                    <td>
                                        <asp:Label ID="lb_City" runat="server" Text="N/A"></asp:Label></td>
                                    <th>Nationalty</th>
                                    <td>
                                        <asp:Label ID="lb_Nationalty" runat="server" Text="N/A"></asp:Label></td>
                                </tr>
                                <tr>
                                    <th>Contact</th>
                                    <td>
                                        <asp:Label ID="lb_Contact" runat="server" Text="N/A"></asp:Label></td>
                                    <th>Email</th>
                                    <td>
                                        <asp:Label ID="lb_UserEmail" runat="server" Text="N/A"></asp:Label></td>
                                </tr>

                            </table>

                            <!--table-->

                        </div>

                        </div>
                    </div>
                </section>
                </div>
            
            </form>
    

</asp:Content>

