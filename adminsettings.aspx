 <%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel.master" AutoEventWireup="true" CodeFile="adminsettings.aspx.cs" Inherits="adminsettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <script src="../vendors/validator/validator.js"></script>
    <script>
      // initialize the validator function
      validator.message.date = 'not a real date';

      // validate a field on "blur" event, a 'select' on 'change' event & a '.reuired' classed multifield on 'keyup':
      $('form')
        .on('blur', 'input[required], input.optional, select.required', validator.checkField)
        .on('change', 'select.required', validator.checkField)
        .on('keypress', 'input[required][pattern]', validator.keypress);

      $('.multi.required').on('keyup blur', 'input', function() {
        validator.checkField.apply($(this).siblings().last()[0]);
      });

      //$('form').submit(function(e) {
      //  e.preventDefault();
      //  var submit = true;

      //  // evaluate the form using generic validaing
      //  if (!validator.checkAll($(this))) {
      //    submit = false;
      //  }

      //  if (submit)
      //    this.submit();

      //  return false;
      //});
    </script>
  
</asp:Content>






<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  
     <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Change Personal Info</h3>
              </div>

             
            </div>
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                 
                  <div class="x_content">

                    <div class="form-horizontal form-label-left">

                      
                      <span class="section"></span>
                        <% employee emp = employeeProfile.getAdminInfo(Session["adminLogin"].ToString()); %>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Name <span class="required">*</span>
                        </label>
                        <div class="item col-md-6 col-sm-6 col-xs-12">
                          <input id="name" class="form-control col-md-7 col-xs-12" value="<%=emp.name %>" data-validate-length-range="6" data-validate-words="1" name="name"  required="required" type="text">
                        </div>
                      
                      </div>
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Email <span class="required">*</span>
                        </label>
                        <div class="item col-md-6 col-sm-6 col-xs-12">
                          <input type="email" id="email" name="email" required="required" value="<%=emp.email %>" class="form-control col-md-7 col-xs-12">
                        </div>
                     </div>
                           
                         
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Confirm Email <span class="required">*</span>
                        </label>
                        <div class="item col-md-6 col-sm-6 col-xs-12">
                          <input type="email" id="email2" name="confirm_email" data-validate-linked="email" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                     
                       
                        
                          <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="website">Password <span class="required">*</span>
                        </label>
                        <div class="item col-md-6 col-sm-6 col-xs-12">
                          <input type="password" id="password" name="password" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                        <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="website">Upload Picture <span class="required">*</span>
                        </label>
                        <div class="item col-md-6 col-sm-6 col-xs-12">
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </div>
                      </div>
                          
                        
                      <div style="margin-top:20px;">
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            
                          <input  id="send" type="submit" runat="server" onserverclick="saveclick" class="btn btn-success" value="Submit Changes" />
                        </div>
                      </div>
                       </div>
                       
                       </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->




    
</asp:Content>

