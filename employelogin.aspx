<%@ Page Language="C#" AutoEventWireup="true" CodeFile="employelogin.aspx.cs" Inherits="employelogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title></title>
    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="https://colorlib.com/polygon/gentelella/css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    <link href="Notifications/NotificationStyle.css" rel="stylesheet" />
        <script src="js/jquery-1.10.2.min.js"></script>
    <script src="js/NotificationJS.js"></script>

  </head>

  <body class="login">
      <div id="Notify"></div>
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
              <form runat="server" method="post">
                   
                <div class="messagealert" id="alert_container"  style=" opacity: 0;transition: visibility 0s 2s, opacity 2s linear;">  </div>  
             
              <h1>Employe Login</h1>
              <div>
                <input type="text" class="form-control" id="username" name="username" placeholder="Username" required="" />
              </div>
              <div>
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required="" />
              </div>
              <div>
<%--                  <asp:Button  ID="hello" Text =" hello" runat="server" OnClick="hello_Click"/>--%>
                  <asp:Button ID="login" runat="server" OnClick="login_Click" Text="Log in" class="btn btn-default submit"  />
                <a class="reset_pass" href="#">Lost your password?</a>
              </div>

              <div class="clearfix"></div>

  
            </form>
          </section>
        </div>

      </div>
    </div>
            
  </body>
  
</html>
