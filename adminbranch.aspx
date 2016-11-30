<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.master" AutoEventWireup="true" CodeFile="adminbranch.aspx.cs" Inherits="adminbranch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script>

  $.validate({
    modules : 'location, date, security, file',
    onModulesLoaded : function() {
      $('#country').suggestCountry();
    }
  });

  // Restrict presentation length
  $('#presentation').restrictLength( $('#pres-max-length') );

</script>     
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <div id="Notify"></div>
      <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Branch</h3>
    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                          <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">All Branches</a>
                          </li>
                          <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Add Branch</a>
                          </li>
                          
                        </ul>
                        
    
    <!-- start recent activity -->
        <div id="myTabContent" class="tab-content">
                          <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                               <table class="data table table-striped no-margin">
                              <thead>
                                <tr>
                                  <th>Branch No</th>
                                  <th>Name</th>
                                  <th>City</th>
                                  <th class="hidden-phone">Country</th>
                                  <th>Adress</th>
                                </tr>
                              </thead>
                              <tbody>
                                  <% IQueryable<branch> branch_data = branchClass.getBrachesinfo();
                                      foreach (var b in branch_data)
                                      {%>
                                <tr>
                                    
                                  <td><label id="vbno"><%=b.brachno %></label></td>
                                  <td><label id="vbname"><%=b.name %></label></td>
                                  <td><label id="vbcity"><%=b.city %></label></td>
                                  <td><label id="vbcountry"><%=b.country %></label></td>
                                  <td><label id="vbadress"><%=b.address %></label></td>
                                </tr>
                                  <%}
                                       %>
                            </tbody>
                                  </table>
                              </div>
            
                            <!-- end recent activity -->




                               <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                               <div class="table-responsive">
                                   <table class=" data table table-striped no-margin">
                              <thead>
                                <tr>
                                  <th>Branch NO</th>
                                  <th>Branch Name</th>
                                  <th>Branch City</th>
                                  <th>Branch Country</th>
                                  <th>Branch Adress</th>
                                
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td><input type="text" name="bno" id="bno"  data-validation="required" data-validation-error-msg="Branch no is required !" /></td>
                                  <td><input type="text" name="bname" id="abname" data-validation="required" data-validation-error-msg="Branch name is required !"/></td>
                                    <td><input type="text" name="bcity" id="abcity" data-validation="required" data-validation-error-msg="Branch city is required !"/></td>
                                  <td><input type="text" name="bcountry" id="abcountry" data-validation="required" data-validation-error-msg="Branch country is required !"/></td>
                                  <td><input type="text" name="badress" id="abadress" data-validation="required" data-validation-error-msg="Branch full address is required !"/></td>
                                    
                                 
                                </tr>  
                              </tbody>
                            </table>
                                   </div>
                            <asp:Button ID="savebranch" runat="server" Text="Save Branch" onclick="savebranch_click" CssClass="btn btn-primary"/>

                        </div>
                            
        
        </div>
       </div>
         </div>
         </div>
        </div>
        </div>
    </div>
                          
                              
</asp:Content>

