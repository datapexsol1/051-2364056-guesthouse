<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employesettings.aspx.cs" Inherits="employesettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
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
            margin-left:50%;
            float:left;
           
             width:200px;
             height:200px;
             
        }
        .client_image img{
            margin-top:1%;
             width:100%;
            height:100%;
        }
        .messagealert {
            width: 100%;
            position: fixed;
             top:0px;
            z-index: 100000;
            padding: 0;
            font-size: 15px;
        }

    </style>
    <script language="javascript" type="text/javascript">
        function activaTab(tab) {
            $('.nav-tabs a[href="#' + tab + '"]').tab('show');
            //alert("working");
        };
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
        }

        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="right_col" role="main">
    <div class="row">
             <div class="messagealert" id="alert_container">  </div>
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-12 col-sm-12 col-xs-12">
         <h3>Employee Info</h3>
          <div class="container">
  

                         <%--     <div style="overflow:auto">  
                               <asp:Table class="data table table-striped no-margin" ID="empInfoViewTable"  runat="server">
                         
                             
                           </asp:Table>
                                 
                                 
                                 
                               <div id="divTitle" runat="server">
               <input type="hidden" class="input_Text" id="Title"  name="Title"  /> 
   </div> </div>--%>
               <%
                    int branchid = employeeProfile.getEmployeBranch(Session["loginName"].ToString());
                      int employID =  int.Parse(Session["loginId"].ToString());
                      employee x = employeeProfile.getSelectedEmployeeInfo(employID, branchid);
                   //IQueryable<employee> em = employeeProfile.getAllEmployee(branchid);//branchAssetsClass.getAllBranchAssets(branchid);

                                       %>
              <div class="table-responsive">
               <table class="table table-hover">
                                      <thead>
                                          <tr>
                                              <th>Image</th>
                                              <th>Name</th>
                                              <th>Email</th>
                                              <th>Employee no</th>
                                              <th>Cnic</th>
                                              <th>Designation</th>
                                              <th>Date of joining</th>
                                              <th>Address</th>
                                              <th>Employee type</th>
                                              <th>Salary</th>
                                              <th></th>
                                          </tr>

                                      </thead>
                                      <tbody>
                                      <%
                                           byte[] img1 = null;
                                            if (x.image != null)
                                            {
                                                img1 = x.image.ToArray();
                                            }   
                                             else
                                            {
                                               img1 = System.Text.Encoding.UTF8.GetBytes ("images/images.png");
                                            }
                                             %>
                                          <tr>
                                              <td><img src='data:image/jpg;base64,<%= Convert.ToBase64String(img1) %>' width="70px" height="70px" /></td>
                                              <td><%=x.name %></td>
                                              <td><%=x.email %></td>
                                              <td><%=x.employee_no %></td>
                                              <td><%=x.cnic %></td>
                                              <td><%=x.designation %></td>
                                              <td><%=x.dateofjoining %></td>
                                              <td><%=x.address %></td>
                                              <td><%=x.login_type %></td>
                                              <td><%=x.salary %></td>
                                              <td><a href="employeupdatesetting.aspx?id=<%=x.Id %>"  onserverclick='update_Click' class='btn btn-success' >Update</ a ></td>
                                          </tr>
                                         
                                      </tbody>
                                  </table>
                  </div>
                            <!-- start recent activity -->
                           <div>
                            
                       

          </div>

  

     </div>

     </div>

    </div>

 </div></div></div>

</asp:Content>



