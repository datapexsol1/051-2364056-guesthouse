<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employecancelorder.aspx.cs" Inherits="employevieworders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>

        function checkfunction(value) {
            if ( $('#cb' + value).is(":checked"))
            {
                
                
                if ($('#<%=cancelids.ClientID%>').val() == "") {
                    $('#<%=cancelids.ClientID%>').val(value+",");
                }
                else {
                    var val = $('#<%=cancelids.ClientID%>').val();
                    val += value+",";
                    $('#<%=cancelids.ClientID%>').val(val);
                    
                }
               
            }
            else {
              var mystr = $('#<%=cancelids.ClientID%>').val();
                    var avoid = value + ',';
                   

                    var abc = mystr.replace(avoid, '');
                    abc = abc.replace(value, '');
                  
                    $('#<%=cancelids.ClientID%>').val(abc);
                   
                
                
            }
            
        }
       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="brachid" runat="server" />
    
    
     <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Menu items</h3>
              </div>

             
            </div>
      <</div>
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

                            <input type="hidden"  runat="server" id="cancelids"/>
           
                            <asp:Table ID="viewOrder" runat="server"  class="table table-bordered table-striped"></asp:Table>
                            <asp:Button ID="Button1" runat="server" Text="Delete" OnClick="Button1_Click" CssClass="btn btn-danger" />
    
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


