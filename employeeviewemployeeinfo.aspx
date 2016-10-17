<%@ Page Title="" Language="C#" MasterPageFile="~/EmployePanel.master" AutoEventWireup="true" CodeFile="employeeviewemployeeinfo.aspx.cs" Inherits="employeeviewemployeeinfo" %>

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

        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="right_col" role="main">
    <div class="row">
     <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="x_content">
     <div class="col-md-9 col-sm-9 col-xs-12">
         <h3>Employee Info</h3>
          <div class="container">
  

                              <div style="overflow:auto">  
                               <asp:Table class="data table table-striped no-margin" ID="empInfoViewTable"  runat="server">
                         
                             
                           </asp:Table>
                               <div id="divTitle" runat="server">
               <input type="hidden" class="input_Text" id="Title"  name="Title"  /> 
   </div> </div>


                            <!-- start recent activity -->
                           <div>
                            
                       

          </div>

  

     </div>

     </div>

    </div>

 </div></div></div>

</asp:Content>

