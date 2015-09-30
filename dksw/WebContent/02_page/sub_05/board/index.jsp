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
	<link href="../../../03_include/css/font-awesome.css" rel="stylesheet" />

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

    <!-- Script : Custom scripts -->
    <script src="../../../03_include/js/common.js"></script>

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

    <!-- Header Section  -->
    <section class="bg-15 bg-center bg-cover">
        <div class="bg-filter">
            <div class="container section-lg">
                <h1 class="top-title">자유게시판</h1>
            </div>
        </div>
    </section>

    <!-- Content Section  -->
    <section class="section">
        <div class="container">
            <div class="row">
                
                <!-- Left Contents -->
                <div class="col-md-8 col-lg-9">
 					<!-- Posts -->
                    <div class="row blog-post">

                        <div class="col-sm-6">
                            <a href="#" title="Read all article">
                                <h2>Mauris quis nibh ut</h2>
                            </a>
                            <p>Mauris quis nibh ut odio ullamcorper volutpat. Aenean quam ante, tristique et euismod faucibus, mollis in elit. Nulla sollicitudin hendrerit sapien vel accumsan.</p>
                            <a href="#" title="Read all article" class="btn btn-default-trn-v2">
                                <i class="fa fa-angle-right"></i>Read More
                            </a>
                        </div>

                    </div>
                    <div class="row blog-post">
                        <div class="col-sm-6">
                            <div class="hover-content">
                                <div class="part-a">
                                    <h3>5</h3>
                                    <h3>March</h3>
                                </div>
                                <div class="part-c">
                                    <img class="img-responsive" src="./Dragonfly - Blog Page_files/face-1.jpg" alt="Blog Post Author" title="Nicole Perry">
                                </div>
                                <div class="part-b">
                                    <ul>
                                        <li>
                                            <i class="fa fa-user fa-fw"></i>
                                            <a href="#" title="View Profile">Nicole Perry</a>
                                        </li>
                                        <li>
                                            <i class="fa fa-clock-o fa-fw"></i>5 March 2014
                                        </li>
                                        <li>
                                            <i class="fa fa-comments fa-fw">

											</i>
                                            <a href="#" title="Read Comments">7 Comments</a>
                                        </li>
                                        <li>
                                            <i class="fa fa-tags fa-fw"></i>
                                            <a href="#">Nature,</a>
                                            <a href="#">Photo,</a>
                                            <a href="#">Sea</a>

                                        </li>
                                    </ul>
                                </div>
                                <img class="img-responsive" alt="Blog Image" src="./Dragonfly - Blog Page_files/011.jpg">
                            </div>

                        </div>
                        <div class="col-sm-6">
                            <a href="#" title="Read all article">
                                <h2>Mauris quis nibh ut</h2>
                            </a>
                            <p>Mauris quis nibh ut odio ullamcorper volutpat. Aenean quam ante, tristique et euismod faucibus, mollis in elit. Nulla sollicitudin hendrerit sapien vel accumsan.</p>
                            <a href="#" title="Read all article" class="btn btn-default-trn-v2">
                                <i class="fa fa-angle-right"></i>Read More
                            </a>
                        </div>

                    </div>
                    <div class="row blog-post wow fadeInUp" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;">
                        <div class="col-sm-6 ">
                            <div class="hover-content">
                                <div class="part-a">
                                    <h3>2</h3>
                                    <h3>January</h3>
                                </div>
                                <div class="part-c">
                                    <img class="img-responsive" src="./Dragonfly - Blog Page_files/face-2.jpg" alt="Blog Post Author" title="Nicole Perry">
                                </div>
                                <div class="part-b">
                                    <ul>
                                        <li>
                                            <i class="fa fa-user fa-fw"></i>
                                            <a href="#" title="View Profile">James Smith</a>
                                        </li>
                                        <li>
                                            <i class="fa fa-clock-o fa-fw"></i>2 January 2014
                                        </li>
                                        <li>
                                            <i class="fa fa-comments fa-fw">

											</i>
                                            <a href="#" title="Read Comments">40 Comments</a>
                                        </li>
                                        <li>
                                            <i class="fa fa-tags fa-fw"></i>
                                            <a href="#">Nature,</a>
                                            <a href="#">Photo,</a>
                                            <a href="#">Sea</a>

                                        </li>
                                    </ul>
                                </div>
                                <img class="img-responsive" alt="Blog Image" src="./Dragonfly - Blog Page_files/kitsune-3.jpg">
                            </div>

                        </div>
                        <div class="col-sm-6">
                            <a href="#" title="Read all article">
                                <h2>Mauris quis nibh ut</h2>
                            </a>
                            <p>Mauris quis nibh ut odio ullamcorper volutpat. Aenean quam ante, tristique et euismod faucibus, mollis in elit. Nulla sollicitudin hendrerit sapien vel accumsan.</p>
                            <a href="#" title="Read all article" class="btn btn-default-trn-v2">
                                <i class="fa fa-angle-right"></i>Read More
                            </a>
                        </div>

                    </div>
                    <div class="row blog-post wow fadeInUp" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;">
                        <div class="col-sm-6">
                            <div class="hover-content">
                                <div class="part-a">
                                    <h3>18</h3>
                                    <h3>April</h3>
                                </div>
                                <div class="part-c">
                                    <img class="img-responsive" src="./Dragonfly - Blog Page_files/face-25.jpg" alt="Blog Post Author" title="Nicole Perry">
                                </div>
                                <div class="part-b">
                                    <ul>
                                        <li>
                                            <i class="fa fa-user fa-fw"></i>
                                            <a href="#" title="View Profile">Nicole Perry</a>
                                        </li>
                                        <li>
                                            <i class="fa fa-clock-o fa-fw"></i>18 April 2014
                                        </li>
                                        <li>
                                            <i class="fa fa-comments fa-fw">

											</i>
                                            <a href="#" title="Read Comments">27 Comments</a>
                                        </li>
                                        <li>
                                            <i class="fa fa-tags fa-fw"></i>
                                            <a href="#">Nature,</a>
                                            <a href="#">Photo,</a>
                                            <a href="#">Sea</a>

                                        </li>
                                    </ul>
                                </div>
                                <img class="img-responsive" alt="Blog Image" src="./Dragonfly - Blog Page_files/kitsune-4.jpg">
                            </div>

                        </div>
                        <div class="col-sm-6">
                            <a href="#" title="Read all article">
                                <h2>Mauris quis nibh ut</h2>
                            </a>
                            <p>Mauris quis nibh ut odio ullamcorper volutpat. Aenean quam ante, tristique et euismod faucibus, mollis in elit. Nulla sollicitudin hendrerit sapien vel accumsan.</p>
                            <a href="#" class="btn btn-default-trn-v2" title="Read all article">
                                <i class="fa fa-angle-right"></i>Read More
                            </a>
                        </div>

                    </div>
                    <div class="row blog-post wow fadeInUp" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;">
                        <div class="col-sm-6">
                            <div class="hover-content">
                                <div class="part-a">
                                    <h3>5</h3>
                                    <h3>March</h3>
                                </div>
                                <div class="part-c">
                                    <img class="img-responsive" src="./Dragonfly - Blog Page_files/face-1.jpg" alt="Blog Post Author" title="Nicole Perry">
                                </div>
                                <div class="part-b">
                                    <ul>
                                        <li>
                                            <i class="fa fa-user fa-fw"></i>
                                            <a href="#" title="View Profile">Nicole Perry</a>
                                        </li>
                                        <li>
                                            <i class="fa fa-clock-o fa-fw"></i>5 March 2014
                                        </li>
                                        <li>
                                            <i class="fa fa-comments fa-fw">

											</i>
                                            <a href="#" title="Read Comments">7 Comments</a>
                                        </li>
                                        <li>
                                            <i class="fa fa-tags fa-fw"></i>
                                            <a href="#">Nature,</a>
                                            <a href="#">Photo,</a>
                                            <a href="#">Sea</a>

                                        </li>
                                    </ul>
                                </div>
                                <img class="img-responsive" alt="Blog Image" src="./Dragonfly - Blog Page_files/picjumbo.com.jpg">
                            </div>

                        </div>
                        <div class="col-sm-6">
                            <a href="#" title="Read all article">
                                <h2>Mauris quis nibh ut</h2>
                            </a>
                            <p>Mauris quis nibh ut odio ullamcorper volutpat. Aenean quam ante, tristique et euismod faucibus, mollis in elit. Nulla sollicitudin hendrerit sapien vel accumsan.</p>
                            <a href="#" title="Read all article" class="btn btn-default-trn-v2">
                                <i class="fa fa-angle-right"></i>Read More
                            </a>
                        </div>

                    </div>

					<!-- Number -->
                    <div class="text-center">
                        <ul class="pagination ">
                            <li>
                                <a href="#">«</a>
                            </li>
                            <li class="active">
                                <a href="#">1</a>
                            </li>
                            <li>
                                <a href="#">2</a>
                            </li>
                            <li>
                                <a href="#">3</a>
                            </li>
                            <li>
                                <a href="#">4</a>
                            </li>
                            <li>
                                <a href="#">5</a>
                            </li>
                            <li>
                                <a href="#">»</a>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <!-- Right Contents -->
                <div class="col-md-4 col-lg-3 hidden-sm hidden-xs">
                	<!-- Search Box -->
                    <div class="simple-box ">
					    <div class="input-group form-lg " role="search">
					        <input type="text" class="form-control" placeholder="Find answer" />
					        <span class="input-group-btn">
					            <button class="btn btn-primary" title="Search" type="button">
					                <i class="fa fa-search"></i>
					            </button>
					        </span>
					    </div>
					</div>

					<!-- Category Box -->
					<div class="categories simple-box">
					    <h3>Categories</h3>
					    <ul class="list-unstyled">
					        <li><i class="fa fa-angle-right fa-fw"></i><a href="#" title="Category Business">교수님</a></li>
					        <li><i class="fa fa-angle-right fa-fw"></i><a href="#" title="Category photos">과사무실</a></li>
					        <li><i class="fa fa-angle-right fa-fw"></i><a href="#" title="Category Education">학부생</a></li>
					        <li><i class="fa fa-angle-right fa-fw"></i><a href="#" title="Category Music">졸업생</a></li>
					        <li><i class="fa fa-angle-right fa-fw"></i><a href="#" title="Category Movies">기타</a></li>
					    </ul>
					</div>

					<!-- Tag Box -->
					<!--<div class="tags simple-box">
					    <h3>Tags</h3>
					    <ul class="list-unstyled">
					        <li><i class="fa fa-tags"></i><a href="#">Music</a></li>
					        <li><i class="fa fa-tags"></i><a href="#">Movies</a> </li>
					        <li><i class="fa fa-tags"></i><a href="#">Radio</a></li>
					        <li><i class="fa fa-tags"></i><a href="#">Internet</a></li>
					    </ul>
					</div>-->

					<!-- Subscribe Box -->
					<!--<div class="simple-box">
					    <h3>Subscribe Us</h3>
					    <div class="input-group icon">
					        <div class="control">
					            <input type="text" class="form-control" placeholder="Email Address">
					            <i class="fa fa-bullhorn"></i>
					        </div>
					        <span class="input-group-btn">
					            <button class="btn btn-primary only-icon " type="button">
					                <i class="fa fa-check"></i>
					            </button>
					        </span>
					    </div>
					</div>-->
                </div>
            </div>

        </div>
    </section>


    <!--Back to top-->
    <a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>

	<!-- Side Menu -->
	<jsp:include page="../../commonSidebar.jsp" flush="false"/>
	
    <!-- Footer-->
	<jsp:include page="../../commonFooter.jsp" flush="false"/>

	<div id="ascrail2000" class="nicescroll-rails" style="width: 8px; z-index: 999999; position: fixed; top: 0px; height: 100%; right: 0px; cursor: default; opacity: 0; background: rgb(221, 221, 221);">
		<div style="position: relative; float: right; width: 8px; border: none; border-radius: 0px; height: 218px; top: 0px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>
	
	<div id="ascrail2000-hr" class="nicescroll-rails" style="height: 8px; z-index: 999999; position: fixed; left: 0px; width: 100%; bottom: 0px; cursor: default; display: none; opacity: 0; background: rgb(221, 221, 221);">
		<div style="position: relative; top: 0px; height: 8px; border: none; border-radius: 0px; width: 1396px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>
	
</body>
</html>