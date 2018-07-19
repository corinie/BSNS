<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

    <!-- ==============================================
    Title and Meta Tags
    =============================================== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fluffs - Ultimate Bootstrap Social Network UI Kit</title>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta property="og:title" content="" />
    <meta property="og:url" content="" />
    <meta property="og:description" content="" />

    <!-- ==============================================
    Favicons
    =============================================== -->
    <link rel="icon" href="assets/img/logo.jpg">
    <link rel="apple-touch-icon" href="img/favicons/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="img/favicons/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="img/favicons/apple-touch-icon-114x114.png">

    <!-- ==============================================
    CSS
    =============================================== -->
    <link type="text/css" href="/resources/css/photo.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- ==============================================
    Feauture Detection
    =============================================== -->


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<!-- ==============================================
Header Section
=============================================== -->
<section class="login">
    <div class="container">
        <div class="banner-content">

            <h1><i class="fa fa-camera"></i> Fluffs</h1>
            <form method="post" class="form-signin">
                <h3 class="form-signin-heading">Please register</h3>
                <div class="form-group">
                    <input name="mid" type="text" class="form-control" placeholder="Id">
                </div>
                <div class="form-group">
                    <input name="mname" type="text" class="form-control" placeholder="Username">
                </div>
                <div class="form-group">
                    <input name="email" type="text" class="form-control" placeholder="Email">
                </div>
                <div class="form-group">
                    <input name="mprofile" type="text" class="form-control" placeholder="profile">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="mpw" placeholder="Password">
                </div>
                <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
                <button class="kafe-btn kafe-btn-mint btn-block" type="submit" name="subm">Sign Up</button>
                <br/>
                <a class="btn btn-dark " href="photo_login.html" role="button">Already have an account? Click Here.</a>
                <a class="btn btn-dark " href="photo_register.html" role="button">Forgot your password?</a>
            </form>

        </div><!--/. banner-content -->
    </div><!-- /.container -->
</section>



<!-- ==============================================
Scripts
=============================================== -->
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/base.js"></script>


</body>
</html>
