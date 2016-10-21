<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeeupdateemployeeinfo.aspx.cs" Inherits="employeeupdateemployeeinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">

    $(function () {
        $(":file").change(function () {
            if (this.files && this.files[0]) {
                var reader = new FileReader();
                reader.onload = imageIsLoaded;
                reader.readAsDataURL(this.files[0]);
                alert(this.files[0]);
            }
        });
    });

    function imageIsLoaded(e) {
        $('#clientimage').attr('src', e.target.result);

    };
    
   
</script>
    <style type="text/css">
#dvPreview
{
    filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
    height: 100px;
    width: 50px;
    display: none;
}
  .logo_image{
            margin-left:11%;
             float:left;
             display:block;
             width:200px;
             height:200px;
             border:2px solid black;
        }
        .logo_image img{
            width:100%;
            height:100%;
        }
        .client_image{
            margin-right:20px;
            float:right;
           
             width:200px;
             height:200px;
             margin-bottom:5px;
             
        }
        .client_image img{
            margin-top:1%;
             width:100%;
            height:100%;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Employee Info</h3>
          <div class="container">
                    <%
                  int branchid = employeeProfile.getEmployeBranch("kk");
                  int val = int.Parse(Request.QueryString["id"]);
                  employee emp = employeeProfile.getSelectedEmployeeInfo(val, branchid);
                         byte[] img1 = null;
                                          if (emp.image != null)
                                          {
                                               img1 = emp.image.ToArray();
                                          }
                   %>
             <%--<img src="images/user.png" class="avatar" alt="Avatar">--%>
              <div class="row">

                  <div class=" col-md-12">
                      <div class="client_image">
               
               <div class="logo_image">
                   <%-- <asp:Image ID="clientimage1" runat="server"   Height="100px" Width="100px" 
                            ImageUrl='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("image")) %>' />--%>

                <img src='data:image/jpg;base64,<%= Convert.ToBase64String(img1) %>'  id="clientimage"  alt="Select Photograph" />
                <asp:FileUpload ID="imageupload" runat="server" />
                </div>
            </div>
           <%--  <input id="fileupload" type="file" />
                    <hr />
                    <b>Live Preview</b>
                    <br />
                    <br />
                    <div id="dvPreview" style="width:100px;height:100px">
                    </div>--%>
                  </div></div><br />
              <div class="form-group">
              <div class="row">

                  <div class=" form-group col-md-6">
                      <b>Employee name</b>
                      <input id="inname" name="inname" value="<%=emp.name %>" type="text" class="form-control " data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter name"/>
                  </div>
              
                  <div class="form-group col-md-6">
                      <b>Email</b>
                      <input id="inemail" name="inemail" value="<%=emp.email %>" class="form-control " />
                  </div>
              </div>
              <div class="row">
                  <div class="form-group col-md-6">
                      <b>Employee no</b>
                      <input id="inempno" name="inempno" value="<%=emp.employee_no %>" class="form-control " data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter employee no"/>
                  </div>
              
                  <div class="form-group col-md-6">
                      <b>Cnic</b>
                       <input id="incnic" name="incnic" value="<%=emp.cnic %>" class="form-control" pattern="/^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$/" title="Enter correct format xxxxx-xxxxxxx-x"/>
                  </div>
              </div>
              <div class="row">
                  <div class="form-group col-md-6">
                      <b>Designation</b>
                      <input id="indesig" name="indesig" value="<%=emp.designation %>" class="form-control " data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter designation"/>
                  </div>
              
                  <div class="form-group col-md-6">
                      <b>Joining date</b>
                      <input id="injoiningdate" name="injoiningdate" runat="server" value="" type="text"  class="form-control " data-validation="required" 

		 data-validation-error-msg="Select date"/>
                  </div>
              </div>
              <div class="row">
                  <div class="form-group col-md-6">
                      <b>Address</b>
                      <input id="inaddress" name="inaddress" value="<%=emp.address %>" class="form-control " data-validation="length alphanumeric" 
		 data-validation-length="3-50" 
		 data-validation-error-msg="Enter Address"/>
                  </div>
              
                 
          
                  <div class="form-group col-md-6">
                      <b>Salary</b>
                      <input id="insalary" name="insalary" type="number" min="0" value="<%=emp.salary %>" class="form-control " data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter Salary"/>
                  </div>
              </div>
                                  
                                  
                                  
                                  
                         </div>         
                                 
                                 
                                    
                                    
              <a href="#" id="updatebutton" onserverclick="update_Click" runat="server" class="btn btn-success" >Update</a>
    

          </div>

     </div>

     </div>

     </div>

    </div>

    </div>
         <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
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

