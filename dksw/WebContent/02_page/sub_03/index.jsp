<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String labCode = request.getAttribute("labCode").toString();
%>



<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">

<head>
	<title>단국대학교 소프트웨어학과</title>

	<!-- Meta Tags -->
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Dankook University Department of Software" />
	<meta name="author" content="Seong-Gyun Jeon, Ji-Hoon Hwang, Jae-Seock Heo, Ha-Yarn Kim, Hong-Jun Jang" />

	<!-- Boostrap Framework  -->
	<link href="../../03_include/css/bootstrap.min.css" rel="stylesheet" />

	<!-- Google Fonts - Lato -->
	<link href="../../03_include/css/lato.css" rel="stylesheet" />

	<!-- Font Awesome Icons -->
	<link href="../../03_include/css/font-awesome.css" rel="stylesheet" />

	<!-- CSS Animations -->
	<link href="../../03_include/css/animate.min.css" rel="stylesheet" />

	<!-- Common Style -->
	<link href="../../03_include/css/style.css" rel="stylesheet" id="colors" />

	<!-- Slippry Slideshow -->
	<link href="../../03_include/css/slippry.min.css" rel="stylesheet" />
	
    <!-- Script : Modernizr -->
    <script src="../../03_include/js/modernizr.custom.min.js"></script>

    <!-- Script : jQuery -->
    <script src="../../03_include/js/jquery.min.js"></script>
    <script src="../../03_include/js/jquery-ui.min.js"></script>

    <!-- Script : Bootstrap JS -->
    <script src="../../03_include/js/bootstrap.min.js"></script>

    <!-- Script : Bootstrap Plugin - open dropdown on hover -->
    <script src="../../03_include/js/bootstrap-hover-dropdown.min.js"></script>

    <!-- Script : LESS preprocessor -->
    <script src="../../03_include/js/less.min.js"></script>

    <!-- Script : WOW.js - loading animations -->
    <script src="../../03_include/js/wow.min.js"></script>

    <!-- Script : Knobs - our skills -->
    <script src="../../03_include/js/jquery.knob.min.js"></script>

    <!-- Script : Slippry - Slideshow -->
    <script src="../../03_include/js/slippry.min.js"></script>

    <!-- Script : Mixitup plugin - Portfolio Filter Grid -->
    <script src="../../03_include/js/jquery.mixitup.min.js"></script>

    <!-- Script : Make sticky whatever elements -->
    <script src="../../03_include/js/jquery.sticky.min.js"></script>

    <!-- Script : Smooth sroll -->
    <script src="../../03_include/js/jquery.nicescroll.min.js"></script>

    <!-- Script : Contact Form -->
    <script src="../../03_include/js/contact-form.min.js"></script>

    <!-- Script : Must be last of all scripts -->
    <script src="../../03_include/js/scripts.min.js"></script>

    <!--[if lt IE 9]>
          <script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.min.js"></script>
          <script src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<!--  Google Analytics -->
	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	
	  ga('create', 'UA-68083185-1', 'auto');
	  ga('send', 'pageview');
	</script>

</head>

<body>
    <!-- Navigation -->
	<jsp:include page="../commonNav.jsp&labCode=" flush="false"/>
    
    <!-- Header Box -->
    <section class="bg-2 bg-center bg-cover">
        <div class="bg-filter">
            <div class="container section-lg">
                <h1 class="top-title">연구실</h1>
            </div>
        </div>
    </section>
    
	<!--  labIntro.jsp -->
	<jsp:include page="labIntro.jsp" flush="false" />
	
	<!-- labMembers.jsp -->
	<jsp:include page="labMembers.jsp" flush="false" />
		
    <section class="bg-grey section-lg team-grid">
        <div class="container">
            <h2 class="big-title text-center">Awesome people from our team</h2>
            <p class="big-subtitle text-center">Nullam sit amet magna in magna gravida vehicula. Proin pede metus, vulputate nec, fermentum fringilla.</p>
            <div class="space-lg"></div>
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="profile-circle">
                        <div class="hover-content ">
                            <img class="img-responsive" alt="Our team" src="./Dragonfly - Our team_files/face-16.jpg">
                            <div class="content-circle content-center">
                                <ul class="circle-icons icons-list">
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-google-plus"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-linkedin"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <h3>Larry Norrington
						<small>Designer</small>
					</h3>
                        <p>Cras vel urna iaculis orci pulvinar convallis ut eget nunc. Integer a mi ante. Sed ac urna commodo, volutpat justo a, mollis mi.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="profile-circle">
                        <div class="hover-content ">
                            <img class="img-responsive" alt="Our team" src="./Dragonfly - Our team_files/face-12.jpg">
                            <div class="content-circle content-center">
                                <ul class="circle-icons icons-list">
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-google-plus"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-linkedin"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <h3>George Clark
						<small>Creative Director</small>
					</h3>
                        <p>Cras vel urna iaculis orci pulvinar convallis ut eget nunc. Integer a mi ante. Sed ac urna commodo, volutpat justo a, mollis mi.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="profile-circle">
                        <div class="hover-content ">
                            <img class="img-responsive" alt="Our team" src="./Dragonfly - Our team_files/face-23.jpg">
                            <div class="content-circle content-center">
                                <ul class="circle-icons icons-list">
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-google-plus"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-linkedin"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <h3>Caroline Harrison
						<small>Marketing Director</small>
					</h3>
                        <p>Cras vel urna iaculis orci pulvinar convallis ut eget nunc. Integer a mi ante. Sed ac urna commodo, volutpat justo a, mollis mi.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="profile-circle">
                        <div class="hover-content">
                            <img class="img-responsive" alt="Our team" src="./Dragonfly - Our team_files/face-11.jpg">
                            <div class="content-circle content-center">
                                <ul class="circle-icons icons-list">
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-google-plus"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-linkedin"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <h3>Adele Taylor
						<small>Project Manager</small>
					</h3>
                        <p>Cras vel urna iaculis orci pulvinar convallis ut eget nunc. Integer a mi ante. Sed ac urna commodo, volutpat justo a, mollis mi.</p>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="profile-circle">
                        <div class="hover-content ">
                            <img class="img-responsive" alt="Our team" src="./Dragonfly - Our team_files/face-5.jpg">
                            <div class="content-circle content-center">
                                <ul class="circle-icons icons-list">
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-google-plus"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-linkedin"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <h3>Stephanie Morrison
						<small>Designer</small>
					</h3>
                        <p>Cras vel urna iaculis orci pulvinar convallis ut eget nunc. Integer a mi ante. Sed ac urna commodo, volutpat justo a, mollis mi.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="profile-circle">
                        <div class="hover-content ">
                            <img class="img-responsive" alt="Our team" src="./Dragonfly - Our team_files/face-14.jpg">
                            <div class="content-circle content-center">
                                <ul class="circle-icons icons-list">
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-google-plus"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-linkedin"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <h3>Jeremy Clarkson
						<small>Project Manager</small>
					</h3>
                        <p>Cras vel urna iaculis orci pulvinar convallis ut eget nunc. Integer a mi ante. Sed ac urna commodo, volutpat justo a, mollis mi.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="profile-circle">
                        <div class="hover-content ">
                            <img class="img-responsive" alt="Our team" src="./Dragonfly - Our team_files/face-10.jpg">
                            <div class="content-circle content-center">
                                <ul class="circle-icons icons-list">
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-google-plus"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-linkedin"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <h3>William Leavitt
						<small>Technical Director</small>
					</h3>
                        <p>Cras vel urna iaculis orci pulvinar convallis ut eget nunc. Integer a mi ante. Sed ac urna commodo, volutpat justo a, mollis mi.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="profile-circle">
                        <div class="hover-content">
                            <img class="img-responsive" alt="Our team" src="./Dragonfly - Our team_files/face-15.jpg">
                            <div class="content-circle content-center">
                                <ul class="circle-icons icons-list">
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-google-plus"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-linkedin"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://bootstrapart.net/dragonfly/v1.5/our-team.php#" title="Follow us">
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <h3>Jenny Jonson
						<small>Designer</small>
					</h3>
                        <p>Cras vel urna iaculis orci pulvinar convallis ut eget nunc. Integer a mi ante. Sed ac urna commodo, volutpat justo a, mollis mi.</p>

                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section-lg">
        <div class="container">
            <h2 class="big-title text-center">Our Customers</h2>
            <p class="big-subtitle text-center">Cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus.</p>
            <div class="space"></div>
            <div class="row client-logo">
                <img alt="logo of client - Yahoo" src="./Dragonfly - Our team_files/Yahoo.png">

                <img alt="logo of client - Coca-Cola" src="./Dragonfly - Our team_files/Coca-Cola.png">

                <img alt="logo of client - Google" src="./Dragonfly - Our team_files/Google.png">

                <img alt="logo of client - Nike" src="./Dragonfly - Our team_files/Intel.png">
            </div>
        </div>
    </section>

    <!--Back to top-->
	<a href="#" class="back-to-top" style="display: none;">
	    <i class="fa fa-angle-up"></i>
	</a>

	<!-- Side Menu -->
	<jsp:include page="../commonSidebar.jsp" flush="false"/>
	
    <!-- Footer-->
	<jsp:include page="../commonFooter.jsp" flush="false"/>

	<div id="ascrail2000" class="nicescroll-rails" style="width: 8px; z-index: 999999; position: fixed; top: 0px; height: 100%; right: 0px; cursor: default; opacity: 0; background: rgb(221, 221, 221);">
		<div style="position: relative; float: right; width: 8px; border: none; border-radius: 0px; height: 331px; top: 0px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>
	
	<div id="ascrail2000-hr" class="nicescroll-rails" style="height: 8px; z-index: 999999; position: fixed; left: 0px; width: 100%; bottom: 0px; cursor: default; opacity: 0; display: none; background: rgb(221, 221, 221);">
		<div style="position: relative; top: 0px; height: 8px; border: none; border-radius: 0px; width: 1920px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>
	
</body>
</html>