<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
	<link href="../../../03_include/css/bootstrap.min.css" rel="stylesheet" />

	<!-- Google Fonts - Lato -->
	<link href="../../../03_include/css/lato.css" rel="stylesheet" />

	<!-- Font Awesome Icons -->
	<link href="../../../03_include/css/font-awesome.min.css" rel="stylesheet" />

	<!-- CSS Animations -->
	<link href="../../../03_include/css/animate.min.css" rel="stylesheet" />

	<!-- Common Style -->
	<link href="../../../03_include/css/style.css" rel="stylesheet" id="colors" />

	<!-- Slippry Slideshow -->
	<link href="../../../03_include/css/slippry.min.css" rel="stylesheet" />
	
    <!-- Script : Modernizr -->
    <script src="../../../03_include/js/modernizr.custom.min.js"></script>

    <!-- Script : jQuery -->
    <script src="../../../03_include/js/jquery.min.js"></script>
    <script src="../../../03_include/js/jquery-ui.min.js"></script>

    <!-- Script : Bootstrap JS -->
    <script src="../../../03_include/js/bootstrap.min.js"></script>

    <!-- Script : Bootstrap Plugin - open dropdown on hover -->
    <script src="../../../03_include/js/bootstrap-hover-dropdown.min.js"></script>

    <!-- Script : LESS preprocessor -->
    <script src="../../../03_include/js/less.min.js"></script>

    <!-- Script : WOW.js - loading animations -->
    <script src="../../../03_include/js/wow.min.js"></script>

    <!-- Script : Knobs - our skills -->
    <script src="../../../03_include/js/jquery.knob.min.js"></script>

    <!-- Script : Slippry - Slideshow -->
    <script src="../../../03_include/js/slippry.min.js"></script>

    <!-- Script : Mixitup plugin - Portfolio Filter Grid -->
    <script src="../../../03_include/js/jquery.mixitup.min.js"></script>

    <!-- Script : Make sticky whatever elements -->
    <script src="../../../03_include/js/jquery.sticky.min.js"></script>

    <!-- Script : Smooth sroll -->
    <script src="../../../03_include/js/jquery.nicescroll.min.js"></script>

    <!-- Script : Contact Form -->
    <script src="../../../03_include/js/contact-form.min.js"></script>

    <!-- Script : Must be last of all scripts -->
    <script src="../../../03_include/js/scripts.min.js"></script>

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
	<jsp:include page="../../commonNav.jsp" flush="false"/>

    <!-- Header Box -->
    <section class="bg-12 bg-center bg-cover">
        <div class="bg-filter">
            <div class="container section-lg">
                <h1 class="top-title">Services &amp; Features</h1>
            </div>
        </div>
    </section>

    <section class="container section-lg">
        <!-- Nav tabs -->
        <ul class="inline-tabs">
            <li class="active">
                <a href="http://bootstrapart.net/dragonfly/v1.5/services-v1.php#responsive" data-toggle="tab">Fully responsive</a>
            </li>
            <li>
                <a href="http://bootstrapart.net/dragonfly/v1.5/services-v1.php#ready" data-toggle="tab">Ready for use</a>
            </li>
            <li>
                <a href="http://bootstrapart.net/dragonfly/v1.5/services-v1.php#shortcodes" data-toggle="tab">Shortcodes</a>
            </li>
            <li>
                <a href="http://bootstrapart.net/dragonfly/v1.5/services-v1.php#fontawesome" data-toggle="tab">Font awesome</a>
            </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane active" id="responsive">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12 animated fadeInLeft">
                        <h2>We offer the best services</h2>
                        <div class="space-sm visible-lg"></div>
                        <p class="text-block">Aliquam eget ante non quam sagittis mollis. In nec varius nisi, nec pharetra nisi. Curabitur ut est velit. Aenean at molestie sem a mattis tellus est sit amet neque.</p>
                        <p class="text-block">Aenean commodo, ligula ut viverra eleifend, leo urna blandit arcu. Integer placerat tellus eget dolor facilisis, nec malesuada metus tempus.</p>
                        <div class="space-sm visible-lg"></div>
                        <ul class="list-inline">
                            <li>
                                <a href="http://bootstrapart.net/dragonfly/v1.5/services-v1.php#" class="btn btn-primary btn-xlg "><i class="fa fa-bolt"></i>Get started now</a>
                            </li>
                            <li>
                                <a href="http://bootstrapart.net/dragonfly/v1.5/services-v1.php#" class="btn btn-primary-trn btn-xlg "><i class="fa fa-paper-plane-o"></i>Learn more</a>
                            </li>

                        </ul>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 fadeInRight animated">
                        <div class="space-lg visible-xs visible-sm"></div>
                        <img class="img-responsive  center-block " alt="iMac" src="./Dragonfly - Services _ Version 1_files/mbp_retina2.png">
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="ready">
                <div class="row">
                    <div class="col-md-6 col-sm-12 animated fadeInLeft">
                        <h2>We offer the best services</h2>

                        <p class="text-block">Aliquam eget ante non quam sagittis mollis. In nec varius nisi, nec pharetra nisi. Curabitur ut est velit. Aenean at molestie sem a mattis tellus est sit amet neque.</p>
                        <p class="text-block">Aenean commodo, ligula ut viverra eleifend, leo urna blandit arcu. Integer placerat tellus eget dolor facilisis, nec malesuada metus tempus. Sed ullamcorper tincidunt odio, nec convallis sem iaculis vitae.</p>
                    </div>
                    <div class="col-md-6 col-sm-12 fadeInRight animated">
                        <div class="space-lg visible-xs visible-sm"></div>
                        <img class="img-responsive  center-block w450" alt="iMac" src="./Dragonfly - Services _ Version 1_files/rmbp-sm.png">
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="shortcodes">
                <div class="row">
                    <div class="col-md-6 col-sm-12 animated fadeInLeft">
                        <h2>We offer the best services</h2>

                        <p class="text-block">Aliquam eget ante non quam sagittis mollis. In nec varius nisi, nec pharetra nisi. Curabitur ut est velit. Aenean at molestie sem a mattis tellus est sit amet neque.</p>
                        <p class="text-block">Aenean commodo, ligula ut viverra eleifend, leo urna blandit arcu. Integer placerat tellus eget dolor facilisis, nec malesuada metus tempus. Sed ullamcorper tincidunt odio, nec convallis sem iaculis vitae.</p>
                    </div>
                    <div class="col-md-6 col-sm-12 fadeInRight animated">
                        <div class="space-lg visible-xs visible-sm"></div>
                        <img class="img-responsive  center-block w450" alt="iMac" src="./Dragonfly - Services _ Version 1_files/rmbp-sm.png">
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="fontawesome">
                <div class="row">
                    <div class="col-md-6 col-sm-12 animated fadeInLeft">
                        <h2>We offer the best services</h2>

                        <p class="text-block">Aliquam eget ante non quam sagittis mollis. In nec varius nisi, nec pharetra nisi. Curabitur ut est velit. Aenean at molestie sem a mattis tellus est sit amet neque.</p>
                        <p class="text-block">Aenean commodo, ligula ut viverra eleifend, leo urna blandit arcu. Integer placerat tellus eget dolor facilisis, nec malesuada metus tempus. Sed ullamcorper tincidunt odio, nec convallis sem iaculis vitae.</p>
                    </div>
                    <div class="col-md-6 col-sm-12 fadeInRight animated">
                        <div class="space-lg visible-xs visible-sm"></div>
                        <img class="img-responsive  center-block w450" alt="iMac" src="./Dragonfly - Services _ Version 1_files/rmbp-sm.png">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="bg-8 bg-center bg-cover">
        <div class="bg-filter-v1 section-lg">
            <div class="container">
                <h2 class="text-center big-title">We offer the best services</h2>
                <div class="row">
                    <div class="col-md-5 hidden-xs hidden-sm">
                        <img class="img-responsive iphone-black" alt="iPhone 5S Minimal Mock Up Black" src="./Dragonfly - Services _ Version 1_files/iPhone_5S_Minimal_Mock-up_black.png">
                        <img class="img-responsive iphone-white " alt="iPhone 5S Minimal Mock Up White" src="./Dragonfly - Services _ Version 1_files/iPhone_5S_Minimal_Mock-up.png">
                    </div>
                    <div class="col-md-7 col-sm-12 margin-b15">
                        <div class="space-lg visible-md visible-lg"></div>
                        <div class="space visible-sm visible-xs"></div>
                        <div class="float-box wow fadeInRight" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;">
                            <i class="fa fa-tint hovicon effect-1 sub-a text-primary"></i>
                            <div class="float-text-v1">
                                <h3>Awesome Colors</h3>
                                <p>Nulle omnis iste natus error sit voluptatem accusantium, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                            </div>
                        </div>
                        <div class="float-box wow fadeInRight" data-wow-delay="0.25s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.25s; -moz-animation-delay: 0.25s; animation-delay: 0.25s;">
                            <i class="fa fa-lightbulb-o hovicon effect-1 sub-a text-primary"></i>
                            <div class="float-text-v1">
                                <h3>Clean Design</h3>
                                <p>Nulle omnis iste natus error sit voluptatem accusantium, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                            </div>
                        </div>
                        <div class="float-box wow fadeInRight" data-wow-delay="0.5s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.5s; -moz-animation-delay: 0.5s; animation-delay: 0.5s;">
                            <i class="fa fa-wrench hovicon effect-1 sub-a text-primary"></i>
                            <div class="float-text-v1">
                                <h3>Easy Customization</h3>
                                <p>Nulle omnis iste natus error sit voluptatem accusantium, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section-lg bg-grey">
        <h3 class="sr-only">Our Customers</h3>
        <div class="container">
            <div class="row client-logo">
                <img alt="logo of client - Yahoo" src="./Dragonfly - Services _ Version 1_files/Yahoo.png">

                <img alt="logo of client - Coca-Cola" src="./Dragonfly - Services _ Version 1_files/Coca-Cola.png">

                <img alt="logo of client - Google" src="./Dragonfly - Services _ Version 1_files/Google.png">

                <img alt="logo of client - Nike" src="./Dragonfly - Services _ Version 1_files/Intel.png">
            </div>
        </div>
    </section>

    <section class="container section text-center">
        <h2 class="big-title">Join to us today, start a free trial</h2>
        <p class="big-subtitle">We bring our extensive experiences from others projects into this template for you.</p>
        <div class="space-md"></div>
        <a href="http://bootstrapart.net/dragonfly/v1.5/services-v1.php#" class="btn btn-success btn-xlg">Start a free trial</a>
    </section>

    <!--Back to top-->
	<a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>

	<!-- Side Menu -->
	<jsp:include page="../../commonSidebar.jsp" flush="false"/>
	
    <!-- Footer-->
	<jsp:include page="../../commonFooter.jsp" flush="false"/>

	<div id="ascrail2000" class="nicescroll-rails" style="width: 8px; z-index: 999999; position: fixed; top: 0px; height: 100%; right: 0px; cursor: default; opacity: 0; background: rgb(221, 221, 221);">
		<div style="position: relative; float: right; width: 8px; border: none; border-radius: 0px; height: 216px; top: 0px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>
	
	<div id="ascrail2000-hr" class="nicescroll-rails" style="height: 8px; z-index: 999999; position: fixed; left: 0px; width: 100%; bottom: 0px; cursor: default; display: none; opacity: 0; background: rgb(221, 221, 221);">
		<div style="position: relative; top: 0px; height: 8px; border: none; border-radius: 0px; width: 1396px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>

</body>
</html>