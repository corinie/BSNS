<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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

<sec:authentication property="principal" var="pinfo"/>
<!-- ==============================================
Navigation Section
=============================================== -->
<header class="header-bar">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"><i class="fab fa fa-camera"></i> Fluffs</a>
            </div><!-- /.navbar-header -->
            <div class="navbar-left">
                <div class="collapse navbar-collapse" id="navbar-collapse">
                    <ul class="nav navbar-nav">
                    </ul>
                </div>
            </div><!-- /.navbar-left -->
            <div class="navbar-right">
                <ul class="nav navbar-nav">
                    <li>
                        <div class="search-dashboard">
                            <form>
                                <input placeholder="Search here" type="text">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                    </li>

                    <li class="dropdown notification-list">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            <i class="fa fa-bell noti-icon"></i>
                            <!-- <span class="badge badge-danger badge-pill noti-icon-badge">4</span> -->
                        </a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-lg">

                            <div class="dropdown-item noti-title">
                                <h6 class="m-0">
			   <span class="pull-right">
			    <a href="" class="text-dark"><small>Clear All</small></a> 
			   </span>Notification
                                </h6>
                            </div>

                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 416.983px;">
                                <div class="slimscroll" style="max-height: 230px; overflow: hidden; width: auto; height: 416.983px;">
                                    <div id="Slim">
                                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                                            <div class="notify-icon bg-success"><i class="fa fa-comment"></i></div>
                                            <p class="notify-details">Caleb Flakelar commented on Admin<small class="text-muted">1 min ago</small></p>
                                        </a><!--/ dropdown-item-->
                                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                                            <div class="notify-icon bg-success"><i class="fa fa-user-plus"></i></div>
                                            <p class="notify-details">Grace Flake followed you.<small class="text-muted">5 hours ago</small></p>
                                        </a><!--/ dropdown-item-->
                                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                                            <div class="notify-icon bg-success"><i class="fa fa-heart"></i></div>
                                            <p class="notify-details">Carlos Crouch liked your photo.<small class="text-muted">3 days ago</small></p>
                                        </a><!--/ dropdown-item-->
                                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                                            <div class="notify-icon bg-success"><i class="fa fa-comment"></i></div>
                                            <p class="notify-details">Caleb Flakelar commented on Admin<small class="text-muted">4 days ago</small></p>
                                        </a><!--/ dropdown-item-->
                                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                                            <div class="notify-icon bg-success"><i class="fa fa-user-plus"></i></div>
                                            <p class="notify-details">Maureen Hilda followed you.<small class="text-muted">7 days ago</small></p>
                                        </a><!--/ dropdown-item-->
                                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                                            <div class="notify-icon bg-success"><i class="fa fa-heart"></i></div>
                                            <p class="notify-details">Carlos Crouch liked your photo.<small class="text-muted">13 days ago</small></p>
                                        </a><!--/ dropdown-item-->
                                    </div><!--/ .Slim-->
                                    <div class="slimScrollBar" style="background: rgb(158, 165, 171) none repeat scroll 0% 0%; width: 8px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div>
                                    <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51) none repeat scroll 0% 0%; opacity: 0.2; z-index: 90; right: 1px;"></div>
                                </div><!--/ .slimscroll-->
                            </div><!--/ .slimScrollDiv-->
                            <a href="photo_notifications.html" class="dropdown-item text-center notify-all">
                                View all <i class="fa fa-arrow-right"></i>
                            </a><!-- All-->
                        </div><!--/ dropdown-menu-->
                    </li>

                    <li class="dropdown notification-list">
                        <a class="nav-link dropdown-toggle arrow-none waves-effect" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            <i class="fa fa-envelope noti-icon"></i>
                            <!-- <span class="badge badge-success badge-pill noti-icon-badge">6</span> -->
                        </a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-lg dropdown-new">
                            <div class="dropdown-item noti-title">
                                <h6 class="m-0">
			   <span class="float-right">
			    <a href="" class="text-dark"><small>Clear All</small></a> 
			   </span>Chat
                                </h6>
                            </div>

                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 416.983px;">
                                <div class="slimscroll" style="max-height: 230px; overflow: hidden; width: auto; height: 416.983px;">
                                    <div id="Slim2">
                                        <a href="javascript:void(0);" class="dropdown-item notify-item nav-user">
                                            <div class="notify-icon"><img src="assets/img/users/1.jpg" class="img-responsive img-circle" alt=""> </div>
                                            <p class="notify-details">Cristina Pride</p>
                                            <p class="text-muted font-13 mb-0 user-msg">Hi, How are you? What about our next meeting</p>
                                        </a><!--/ dropdown-item-->
                                        <a href="javascript:void(0);" class="dropdown-item notify-item nav-user">
                                            <div class="notify-icon"><img src="assets/img/users/2.jpg" class="img-responsive img-circle" alt=""> </div>
                                            <p class="notify-details">Sam Garret</p>
                                            <p class="text-muted font-13 mb-0 user-msg">Yeah everything is fine</p>
                                        </a><!--/ dropdown-item-->
                                        <a href="javascript:void(0);" class="dropdown-item notify-item nav-user">
                                            <div class="notify-icon"><img src="assets/img/users/3.jpg" class="img-responsive img-circle" alt=""> </div>
                                            <p class="notify-details">Karen Robinson</p>
                                            <p class="text-muted font-13 mb-0 user-msg">Wow that's great</p>
                                        </a><!--/ dropdown-item-->
                                        <a href="javascript:void(0);" class="dropdown-item notify-item nav-user">
                                            <div class="notify-icon"><img src="assets/img/users/4.jpg" class="img-responsive img-circle" alt=""> </div>
                                            <p class="notify-details">Sherry Marshall</p>
                                            <p class="text-muted font-13 mb-0 user-msg">Hi, How are you? What about our next meeting</p>
                                        </a><!--/ dropdown-item-->
                                        <a href="javascript:void(0);" class="dropdown-item notify-item nav-user">
                                            <div class="notify-icon"><img src="assets/img/users/5.jpg" class="img-responsive img-circle" alt=""> </div>
                                            <p class="notify-details">Shawn Millard</p>
                                            <p class="text-muted font-13 mb-0 user-msg">Yeah everything is fine</p>
                                        </a><!--/ dropdown-item-->
                                    </div><!--/ .Slim-->
                                    <div class="slimScrollBar" style="background: rgb(158, 165, 171) none repeat scroll 0% 0%; width: 8px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div>
                                    <div class="slimScrollRail" style="width: 8px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51) none repeat scroll 0% 0%; opacity: 0.2; z-index: 90; right: 1px;"></div>
                                </div><!--/ slimscroll-->
                            </div> <!--/ slimScrollDiv-->
                            <a href="photo_chat.html" class="dropdown-item text-center notify-all">
                                View all <i class="fa fa-arrow-right"></i>
                            </a>
                        </div><!--/ dropdown-menu-->
                    </li>

                    <li class="dropdown mega-avatar">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                            
                            <!-- hidden-xs hides the username on small devices so only the image appears. -->
                            <span class="hidden-xs">
			${pinfo.username}
		   </span>
                        </a>
                        <div class="dropdown-menu w dropdown-menu-scale pull-right">
                            <a class="dropdown-item" href="#"><span>New Story</span></a>
                            <a class="dropdown-item" href="#"><span>Become a Member</span></a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#"><span>Profile</span></a>
                            <a class="dropdown-item" href="#"><span>Settings</span></a>
                            <a class="dropdown-item" href="#">Need help?</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Sign out</a>
                        </div>
                    </li><!-- /navbar-item -->

                </ul><!-- /.sign-in -->
            </div><!-- /.nav-right -->
        </div><!-- /.container -->
    </nav><!-- /.navbar -->
</header><!-- Page Header -->