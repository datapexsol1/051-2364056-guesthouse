<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeeupdateemployeeinfo.aspx.cs" Inherits="employeeupdateemployeeinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <!-- Ion.RangeSlider -->
    <link href="../vendors/normalize-css/normalize.css" rel="stylesheet">
    <link href="../vendors/ion.rangeSlider/css/ion.rangeSlider.css" rel="stylesheet">
    <link href="../vendors/ion.rangeSlider/css/ion.rangeSlider.skinFlat.css" rel="stylesheet">
    <link href="build/css/style.css" rel="stylesheet" />
   <%--  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>
    <link href="Notifications/NotificationStyle.css" rel="stylesheet" />
       <%-- <script src="js/jquery-1.10.2.min.js"></script>--%>
    <script src="js/NotificationJS.js"></script>
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
    
    function ShowMessage(message, messagetype) {
        var cssclass;
        switch (messagetype) {
            case 'Success':
                cssclass = 'alert-success'
                break;
            case 'Error':
                cssclass = 'alert-danger'
                break;
            case 'Warning':
                cssclass = 'alert-warning'
                break;
            default:
                cssclass = 'alert-info'
        }
        $('#alert_container').append('<div id="alert_div" style="margin-top:40px;margin-left:100px;width:50%; -webkit-box-shadow: 3px 4px 6px #999;" class="alert fade in ' + cssclass + '"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><strong>' + messagetype + '!</strong> <span>' + message + '</span></div>');
        $('#alert_container').fadeIn("slow");
       var timer = setTimeout(function () {
           $('#alert_container').fadeOut();
        }, 4000);
    }
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
     <div id="Notify"></div>
    <div class="right_col" role="main">
       <div class="messagealert" id="alert_container"  style=" opacity: 0;transition: visibility 0s 2s, opacity 2s linear;">  </div>  
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         
         <h3>Employee Info</h3>
          <div class="container">
                    <%
                            int branchid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
                            int val = int.Parse(Request.QueryString["id"]);
                            employee emp = employeeProfile.getSelectedEmployeeInfo(val, branchid);
                            byte[] img1 = null;
                            if (emp.image != null)
                            {
                                img1 = emp.image.ToArray();
                            }
                            else
                            {
                               img1 = System.Text.Encoding.UTF8.GetBytes ("images/images.png");
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
                <asp:FileUpload ID="imageupload" runat="server"  />
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

                  <div class="item form-group col-md-6">
                      <b>Employee name</b>
                      <input id="inname" name="inname"  data-validate-length-range="6"  data-validate-words="2" value="<%=emp.name %>" type="text" class="form-control " required="required"/>
                  </div>
              
                  <div class="item form-group col-md-6">
                      <b>Email</b>
                      <input type="email" id="inemail" name="inemail" value="<%=emp.email %>" required="required" class="form-control " />
                  </div>
              </div>
              <div class="row">
                  <div class="form-group col-md-6">
                      <b>Employee Contact</b>
                      <input id="inempno" name="inempno" value="<%=emp.employee_no %>" class="form-control " data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter employee no"/>
                  </div>
              
                  <div class="form-group col-md-6">
                      <b>Cnic</b>
                       <input id="incnic" name="incnic" type="text" value="<%=emp.cnic %>" readonly="true" data-inputmask="'mask' : '99999-9999999-9'" class="form-control" data-validation="required" 
		  
		 data-validation-error-msg="Enter Cnic xxxxx-xxxxxxx-x" />
                  </div>
              </div>
              <div class="row">
                  <div class="form-group col-md-6">
                      <b>Designation</b>
                      <input id="indesig" name="indesig" value="<%=emp.designation %>" readonly="true" class="form-control " data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter designation"/>
                  </div>
              
                  <div class="form-group col-md-6">
                      <b>Joining date</b>

                      <input id="injoiningdate" name="injoiningdate"  value="<%=emp.dateofjoining  %>" type="" readonly="true" class="form-control " data-validation="required" 

		 data-validation-error-msg="Select date"/>
                  </div>
              </div>
              <div class="row">
                  <div class="form-group col-md-6">
                      <b>Address</b>
                      <input id="inaddress" name="inaddress" value="<%=emp.address %>" readonly="true" class="form-control " data-validation="required" 
		 data-validation-length="3-50" 
		 data-validation-error-msg="Enter Address"/>
                  </div>
              
                 
          
                  <div class="form-group col-md-6">
                      <b>Salary</b>
                      <input id="insalary" name="insalary" type="number" min="0" value="<%=emp.salary %>" readonly="true" class="form-control " data-validation="length alphanumeric" 
		 data-validation-length="3-25" 
		 data-validation-error-msg="Enter Salary"/>
                  </div>
              </div>
                                  
                                  
                                  
                                  
                         </div>         
              <%--<asp:Button ID="updatebutton" runat="server" Text="Submit" class="btn btn-success" OnClick="update_Click" CausesValidation="false"/>--%>
                                 
                            <%--<button id="updatebutton" type="submit" class="btn btn-success" onserverclick="update_Click" runat="server">Submit</button>--%>        
                                    
              <a href="#" id="updatebutton" onserverclick="update_Click" runat="server" class="btn btn-success" >Update</a>
    

          </div>

     </div>

     </div>

     </div>

    </div>

    </div>
        <%-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>--%>
<%--<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script>

  $.validate({
    modules : 'location, date, security, file',
    onModulesLoaded : function() {
      $('#country').suggestCountry();
    }
  });

  // Restrict presentation length
  $('#presentation').restrictLength( $('#pres-max-length') );

</script>--%>   
<%--     <!-- jQuery -->
   <%-- <script src="../vendors/jquery/dist/jquery.min.js"></script>--%>
    <!-- Bootstrap -->
  <%--  <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>--%>
    <!-- FastClick -->
   <%-- <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="js/moment/moment.min.js"></script>
    <script src="js/datepicker/daterangepicker.js"></script>
    <!-- Ion.RangeSlider -->
    <script src="../vendors/ion.rangeSlider/js/ion.rangeSlider.min.js"></script>
    <!-- Bootstrap Colorpicker -->
    <script src="../vendors/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
    <!-- jquery.inputmask -->
    <script src="../vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
    --%>











  


  

    <script>
      $(document).ready(function() {
        $('#single_cal1').daterangepicker({
          singleDatePicker: true,
          calender_style: "picker_1"
        }, function(start, end, label) {
          console.log(start.toISOString(), end.toISOString(), label);
        });
        $('#injoiningdate').daterangepicker({
          singleDatePicker: true,
          calender_style: "picker_2"
        }, function(start, end, label) {
          console.log(start.toISOString(), end.toISOString(), label);
        });
        $('#single_cal3').daterangepicker({
          singleDatePicker: true,
          calender_style: "picker_3"
        }, function(start, end, label) {
          console.log(start.toISOString(), end.toISOString(), label);
        });
        $('#single_cal4').daterangepicker({
          singleDatePicker: true,
          calender_style: "picker_4"
        }, function(start, end, label) {
          console.log(start.toISOString(), end.toISOString(), label);
        });
      });
    </script>

   
  

   
</asp:Content>

