<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeplaceorder.aspx.cs" Inherits="employemenuservice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function xyz(value) {
            if ( $('#tbox' + value).is(":checked"))
            {
                
                if ($('#<%=itemid.ClientID%>').val() == "") {
                    $('#<%=itemid.ClientID%>').val(value);
                    alert($('#<%=itemid.ClientID%>').val());
                }
                else {
                    var val = $('#<%=itemid.ClientID%>').val();
                    val += "," + value;
                    $('#<%=itemid.ClientID%>').val(val);
                    alert($('#<%=itemid.ClientID%>').val());
                }
                var x = $('#noitem' + value).val();
                alert("id of item :" + value + "Value of item :" + x);
            }
            else {
                var mystr = $('#<%=itemid.ClientID%>').val();
                    var avoid = value + ',';
                   

                    var abc = mystr.replace(avoid, '');
                    abc = abc.replace(value, '');
                  
                    $('#<%=itemid.ClientID%>').val(abc);
                    alert($('#<%=itemid.ClientID%>').val());
                
                
            }
            
        }
        function getchangedvalue() {
            alert( $('#<%=roombranch.ClientID%>').val());
        
            $('#<%=roomno.ClientID%>').val($('#<%=roombranch.ClientID%>').val()); 
                alert($('#<%=roomno.ClientID%>').val());
           
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <input type="hidden" id="itemid" runat="server" />
    <input type="hidden" id="nofitem" runat="server" />
    <input type="hidden" id="bookingid" runat="server" />
     <input type="hidden" id="roomno" runat="server" />
     <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Menu items</h3>
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
                            <asp:Button ID="getsummary" runat="server" Text="Place Order" OnClick="getsummary_click" />
                             <asp:Button ID="savetodb" runat="server" Text="PrintBill"  />

                             <asp:DropDownList  runat="server" class="form-control" ID="roombranch" name="roombranch" required="required" onchange="getchangedvalue()">
                                                      
                                                   
                                         
                                               </asp:DropDownList> 
                                        
                           <asp:Table class="data table table-striped no-margin"  ID="menuview"  runat="server">
                             
                            
                             
                               
                             
                           </asp:Table>
                             <asp:Table class="data table table-striped no-margin" ID="ordersummery"  runat="server">
                             
                            
                             
                               
                             
                           </asp:Table>
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

