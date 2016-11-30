<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.master" AutoEventWireup="true" CodeFile="adminvieworder.aspx.cs" Inherits="adminvieworder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <asp:HiddenField ID="brachid" runat="server" />
    
   
     <div class="right_col" role="main">
          <div class="">
    <div class="page-title">
              <div class="title_left">
                   <h3>Guests Order</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                      <span class="input-group-btn">
                              <button class="btn btn-default" type="button" disabled="disabled">Select branch!</button>
                          </span>
                  <asp:DropDownList ID="branch" runat="server" OnSelectedIndexChanged="branchIndexChange"  AutoPostBack="true" ClientIDMode="Static"  CssClass="form-control"></asp:DropDownList>

                    
                  </div>
                </div>
              </div>
            </div>
     
        
            <div class="clearfix"></div>  
     <div class="">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                    
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">


                   <div class="" role="tabpanel" data-example-id="togglable-tabs">
                     <%-- <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#tab_view" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Place order</a>
                        </li>--%>


                    
                      </ul>
                         <!-- start view activity -->
                      <div id="myTabContent" class="tab-content">
                        <div role="tabpanel" class="tab-pane fade active in" id="tab_view" aria-labelledby="home-tab">
                           <%-- <asp:Button ID="getsummary" runat="server" Text="Place Order" OnClick="getsummary_click" />
                             <asp:Button ID="savetodb" runat="server" Text="PrintBill"  />--%>
                            <b>Select Room</b>
                             <asp:DropDownList ID="ddrooms" runat="server" CssClass="form-control " AutoPostBack="True" OnSelectedIndexChanged="ddrooms_SelectedIndexChanged"></asp:DropDownList>
                                        
                            <asp:Table ID="viewOrder" runat="server"  class="table table-bordered table-striped"></asp:Table>
                            <asp:Label ID="grandtotal" runat="server"  Text=""></asp:Label>
    
                          <div role="tabpanel" class="tab-pane fade" id="tab_delete" aria-labelledby="profile-tab">
                          <p>delete content</p>
                        </div>
                      </div>
                    </div>

                  </div>
                </div>
              </div>


             


           


              

         </div></div>   </div>




</asp:Content>

