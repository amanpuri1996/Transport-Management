<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Transport Manager</title>
   
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.4 -->
        <link href="AdminTool/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Font Awesome Icons -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="AdminTool/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
        <!-- iCheck -->
        <link href="AdminTool/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />

        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
 <style>
       .back_img1 {
           display:none;
             background-image: url(transport_back_mobile.jpg);
             background-repeat: no-repeat, repeat;
         }
     @media only screen and (max-width: 640px) {
         .back_img {
             display:none;
         }
         .back_img1 {
             display: block;
              background-image: url(transport_back_mobile.jpg);
             background-repeat: no-repeat, repeat;
         }
     }
     @media only screen and (min-width: 1200px) {
         .back_img {
             display: block;
             background-image: url(transport_back.jpg);
             background-repeat: no-repeat, repeat;
         }
     }
 </style>
</head>
<body class="login-page  back_img back_img1">
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="login-box" style="    margin: 9% 23px 2px auto; ">
            <div class="login-logo">
                <b style="color:white;">Transport Manager</b>
            </div>
            <!-- /.login-logo -->
            <div class="login-box-body">
                <p class="login-box-msg">Sign in to start your session</p>
                    <div class="form-group has-feedback">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Username" ></asp:TextBox>
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtEmail" Display="Dynamic" ValidationGroup="ln" runat="server" Font-Size="11px" Font-Names="Arial" ForeColor="Red" ErrorMessage="Please enter your Username."></asp:RequiredFieldValidator>
                    <div class="form-group has-feedback">
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password" ></asp:TextBox>
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtPassword" Display="Dynamic" ValidationGroup="ln" runat="server" Font-Size="11px" Font-Names="Arial" ForeColor="Red" ErrorMessage="Please enter your password."></asp:RequiredFieldValidator>
                <div class="form-group has-feedback">
                    <asp:UpdatePanel ID="updmsg" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblMessage" runat="server" Visible="false">
                            </asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="row">
                     <!-- /.col -->
                        <div class="col-xs-4">
                            <asp:Button ID="btnSubmit" CssClass="btn btn-primary btn-block btn-flat" runat="server" Text="Sign In" OnClick="btnSubmit_Click" ValidationGroup="ln"/>
                        </div>
                        <!-- /.col -->
                    </div>

                <!-- /.social-auth-links -->

                <%--<a href="#">I forgot my password</a><br>
                <a href="register.html" class="text-center">Register a new membership</a>--%>

            </div>
            <!-- /.login-box-body -->
        </div>
        <!-- /.login-box -->
        <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Forgot Password</h4>
      </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div clas="modal-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <asp:TextBox ID="txtFEmail" runat="server" CssClass="form-control" placeholder="Enter your registered mail id"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtFEmail" Display="Dynamic" ValidationGroup="fp" runat="server" Font-Size="11px" Font-Names="Arial" ForeColor="Red" ErrorMessage="Please enter your email id."></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Username</label>
                        <asp:TextBox ID="txtFUserName" runat="server" CssClass="form-control" placeholder="valid username"> </asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtFUserName" Display="Dynamic" ValidationGroup="fp" runat="server" Font-Size="11px" Font-Names="Arial" ForeColor="Red" ErrorMessage="Please enter your username."></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">

                        <asp:Label ID="lblForgotMsg" ForeColor="Red" runat="server" Visible="false">
                        </asp:Label>

                    </div>
                    <div class="form-group">
                        <small>Note: Your new passord has been sent into your registered mail id.</small>
                    </div>
                    <div class="form-group">
                        <asp:UpdateProgress ID="progress" runat="server">
                            <ProgressTemplate>
                                <span class="fa fa-circle-o-notch fa-spin fa-2x"></span>Please Wait...
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnForgot" CssClass="btn btn-primary" runat="server" Visible="false" Text="Submit" OnClick="btnForgot_Click" ValidationGroup="fp" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
  </div>
</div>

    </form>
    <!-- jQuery 2.1.4 -->
    <script src="AdminTool/plugins/jQuery/jQuery-2.1.4.min.js" type="text/javascript"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="AdminTool/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="AdminTool/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <script>
        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
    </script>
</body>
</html>