<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Center.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <!-- <link rel="stylesheet" href="/asset/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="/asset/css/1234.css">
    <script src="/asset/js/bootstrap.bundle.min.js"></script>
    <script src="/asset/js/main.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">
   
    <style>
        .crt-login-form {
/*            min-height: 100vh;
           
            background: linear-gradient(135deg,#f6f9fc,#eef3f7);*/
            padding: 20px;
             display: flex;

        }

        @media screen and (max-width:768px) {
            .crt-login-form {
                padding-top: 60px;
                align-items: start;
                height: 100vh;
            }
        }
        /* CARD DESIGN */
        .crt-login-form .card {
            width: 420px;
            border-radius: 20px !important;
            border: none;
            box-shadow: 0 20px 50px rgba(0,0,0,0.08);
            transition: .3s;
        }

            .crt-login-form .card:hover {
                /*    transform:translateY(-5px);*/
            }

        /* FORM BODY */

        .crt-login-form form {
            padding: 40px 35px !important;
        }

        /* LOGO */

        .crt-login-form img {
            max-width: 180px !important;
            margin-bottom: 20px;
        }

        /* INPUT GROUP */

        .crt-login-form .input-group {
            display: flex;
            align-items: center;
            background: #f7f9fb;
            border-radius: 30px;
            padding: 10px 15px;
            margin-bottom: 18px;
            border: 1px solid #e4e9f0;
            transition: all .25s ease;
        }

            .crt-login-form .input-group:focus-within {
                border-color: #007388;
                /*            box-shadow:0 0 0 3px rgba(0,115,136,0.1);*/
            }

        /* ICON */

        .crt-login-form .input-group-addon {
            color: #007388;
            font-size: 20px;
            margin-right: 8px;
        }

        /* INPUT */

        .crt-login-form .form-control {
            border: none !important;
            background: transparent;
            box-shadow: none !important;
            font-size: 14px;
            width: 100%;
        }

            /* PLACEHOLDER */

            .crt-login-form .form-control::placeholder {
                color: #8a96a3;
            }

        /* LOGIN BUTTON */

        .crt-login-form .loginbutton {
            margin-top: 10px;
            background: linear-gradient(135deg,#007388,#0099b3);
            border: none;
            color: white;
            font-weight: 600;
            letter-spacing: .5px;
            padding: 12px;
            border-radius: 30px;
            transition: all .3s ease;
        }

            .crt-login-form .loginbutton:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 18px rgba(0,115,136,0.3);
            }

        /* ERROR ALERT */

        .crt-login-form .alert {
            border-radius: 10px;
            font-size: 14px;
            margin-bottom: 10px;
        }

        /* RESPONSIVE */

        @media (max-width:480px) {

            .crt-login-form .card {
                width: 100%;
            }

            .crt-login-form form {
                padding: 30px 20px !important;
            }
        }
        .login-section-wrapper{
            display: flex;

        }

        .login-img-warpper img {
    max-width: 100%;
    height: 100%;
}

.login-img-warpper {
    position: absolute;
    left: -22%;
    max-width: 100%;
    overflow: hidden;
    height: 100%;
}

.form-column {
    position: absolute;
    right: 126px;
    top: 50%;
    transform: translateY(-50%);
}
    </style>
</head>
<body>
    <div class="backgound">
        <div class="login-section-wrapper"> 
        <div class="image-column">
            <div class="login-img-warpper">
                <img src="asset/img/login-portal-left-img1.png" alt="" class="img-fluid" />
            </div>
        </div>
  

        <div class="form-column">
            <div class="crt-login-form">
    <div class="card">
        <form runat="server">

            <div class="body">

                <div style="display: flex; justify-content: center;">
                    <img src="/asset/img/cert-logo.png" alt="">
                </div>

                <div class="alert alert-danger" id="error" runat="server" visible="false">
                    <asp:Label ID="lbl_error_login" runat="server" Text="" />
                </div>

                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="material-icons">person</i>
                    </span>

                    <div class="form-line" style="min-width: 80%">
                        <asp:TextBox ID="txt_username" runat="server"
                            class="form-control"
                            placeholder="Test Center Code"
                            autofocus="autofocus" />
                    </div>
                </div>

                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="material-icons">lock</i>
                    </span>

                    <div class="form-line" style="min-width: 80%">
                        <asp:TextBox ID="txt_password" runat="server"
                            TextMode="Password"
                            class="form-control"
                            placeholder="Password" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <asp:Button ID="btn_Signin"
                            runat="server"
                            Text="LOGIN"
                            class="btn btn-block loginbutton waves-effect"
                            OnClick="Login_Check" />
                    </div>
                </div>

            </div>
        </form>
    </div>
</div>
        </div>
      </div>

        <div class="container">
            <div class="row gy-4">
 
                <div class="col-lg-6 col-12 d-flex align-items-center">
                    
                </div>
                
            </div>

        </div>

        

        <%--   <div class="login-box position-absolute top-0 start-50 translate-middle">
        </div>--%>
    </div>

</body>
<!-- <script src="/asset/js/bootstrap.bundle.min.js"></script> -->
<!-- <script src="/asset/js/main.js"></script>
<script src="/asset/js/admin.js"></script> -->
<!-- <script src="https://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script> -->
</html>
