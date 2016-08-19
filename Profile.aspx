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
    





     <!--------------------------- Modal Detail Information -->
       <%-- <div id="DetailInformation" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Update Detail Information</h4>
                    </div>
                    <div class="modal-body">

                        <%--<form class="form-inline" runat="server" id="f2" >--%>
                      <%--  <asp:Panel ID="panel5" runat="server">      <%-- OnPreRender="panel5_PreRender"--%>

                         <%--   <table class="table table-hover">

                                <tr>
                                    <th>Name</th>
                                    <td>
                                        <asp:TextBox ID="tb_Nam" runat="server"></asp:TextBox></td>
                                    <th>Father Name</th>
                                    <td>
                                        <asp:TextBox ID="tb_FatherName" runat="server"></asp:TextBox></td>

                                </tr>


                                <tr>
                                    <th>Gender</th>
                                    <td>
                                        <select id="dd_Gender" runat="server">
                                            <option value="Male">Male </option>
                                            <option value="Female">Female</option>
                                        </select></td>
                                    <th>Date of Birth</th>
                                    <td>
                                        <asp:TextBox ID="tb_DOB" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <th>City</th>
                                    <td>
                                        <asp:TextBox ID="tb_City" runat="server"></asp:TextBox></td>
                                    <th>Nationality</th>
                                    <td>
                                        <asp:TextBox ID="tb_Nationality" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <th>Contact</th>
                                    <td colspan="3">
                                        <asp:TextBox ID="tb_Contact" runat="server"></asp:TextBox></td>


                                </tr>
                                <tr>
                                    <th colspan="2">Upload Profile Picture</th>
                                    <td colspan="2">
                                        <asp:FileUpload ID="ProfileImage" runat="server" />--%>
                                        <%--<input type="file" class="form-control-file" id="UploadProfilePic" />--%></td>


                              <%--  </tr>

                            </table>


                            <asp:Button ID="Button1" class="btn btn-primary btn-lg1 btn-block" runat="server" Text="Update"  UseSubmitBehavior="False" />
                        </asp:Panel>
                        <%--</form>--%>
                   <%-- </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                    </div>
                </div>

            </div>
        </div>--%>
        <!-------------------------/ Modal Detail Information -->

</asp:Content>

