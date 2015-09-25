<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;"><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>단국대학교 소프트웨어학과</title>

	<!-- Meta Tags -->
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Dankook University Department of Software">
	<meta name="author" content="Seong-Gyun Jeon, Jae-Seock Heo, Ji-Hoon Hwang, Ha-Yarn Kim, Hong-Jun Jang" />

	<!--  Boostrap Framework  -->
	<link href="./03_include/css/bootstrap.min.css" rel="stylesheet" />

	<link href="./03_include/css/style.css" rel="stylesheet" id="colors" />

	<!-- Google Fonts - Lato -->
	<link href="./03_include/css/lato.css" rel="stylesheet" />

	<!-- Font Awesome Icons -->
	<link href="./03_include/css/font-awesome.min.css" rel="stylesheet" />

	<!-- CSS Animations -->
	<link href="./03_include/css/animate.min.css" rel="stylesheet" />

	<!--  Slippry Slideshow -->
	<link href="./03_include/css/slippry.min.css" rel="stylesheet" />

	<script async="" src="./03_include/js/analytics.js"></script>
	<script>
		(function (i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function () {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o),
			m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-51308611-2', 'auto');
		ga('send', 'pageview');
	</script>
</head>

<body>
    <!-- Navigation -->
    <nav class="navbar navbar-trn navbar-fixed-top" role="navigation" id="navbarSettings">
	    <div class="container">
	        <div class="navbar-header">
	            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-navbar-collapse-1">
	                <span class="sr-only">Toggle navigation</span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	            </button>
	            <a class="navbar-brand" href="./index.jsp">DKU<span class="text-primary">SOFTWARE</span></a>
	        </div>

	        <div class="collapse navbar-collapse" id="bs-navbar-collapse-1">
	            <ul class="nav navbar-nav navbar-right ">
	                <li class="dropdown">
	                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0">HOME</a>
	                </li>
	
	                <!-- 공지사항 -->
	                <li class="dropdown">
	                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0">공지사항</a>
	                    <ul class="dropdown-menu">
	                        <li><a href="#">학부 공지</a></li>
	                        <li><a href="#">학생회 공지</a></li>
	                        <li class="divider"></li>
	                        <li><a href="#">채용 정보</a></li>
	                        <li class="dropdown-submenu">
	                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">자료실</a>
	                            <ul class="dropdown-menu">
	                                <li><a href="#">일반 자료실</a></li>
	                                <li><a href="#">강의자료</a></li>
	                                <li><a href="#">과제물 공지</a></li>              
	                            </ul>
	                        </li>
	                    </ul>
	                </li>
	
	                <!-- 학과소개 -->
	                <li class="dropdown">
	                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0">학과소개</a>
	                    <ul class="dropdown-menu">
	                        <li class="dropdown-submenu">
	                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">학과 소개</a>
	                            <ul class="dropdown-menu">
	                                <li><a href="#">학과장 인사</a></li>
	                                <li><a href="#">학과 연혁</a></li>
	                                <li><a href="#">학과 내규</a></li>
	                            </ul>
	                        </li>
	
	                        <li><a href="#">교수 소개</a></li>
	
	                        <li class="dropdown-submenu">
	                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">동아리 소개</a>
	                            <ul class="dropdown-menu">
	                                <li><a href="#">AEGIS</a></li>
	                                <li><a href="#">DMAP'S</a></li>
	                            </ul>
	                        </li>
	
	                        <li class="divider"></li>
	
	                        <li><a href="#">위치 및 연락처</a></li>
	
	                    </ul>
	                </li>
	
	                <!-- 연구 -->
	                <li class="dropdown">
	                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0">연구
	                    </a>
	                    <ul class="dropdown-menu">
	
	                        <li class="dropdown-submenu">
	                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Database Lab.</a>
	                            <ul class="dropdown-menu">
	                                <li>
	                                    <a href="#">소개 및 연구목표</a>
	                                </li>
	                                <li>
	                                    <a href="#">포트폴리오</a>
	                                </li>
	                                <li>
	                                    <a href="#">연구원</a>
	                                </li>
	                            </ul>
	                        </li>
	
	                        <li class="dropdown-submenu">
	                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Embedded Lab.</a>
	                            <ul class="dropdown-menu">
	                                <li>
	                                    <a href="#">소개 및 연구목표</a>
	                                </li>
	                                <li>
	                                    <a href="#">포트폴리오</a>
	                                </li>
	                                <li>
	                                    <a href="#">연구원</a>
	                                </li>
	                            </ul>
	                        </li>
	
	                        <li class="dropdown-submenu">
	                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Mobile Contents Lab.</a>
	                            <ul class="dropdown-menu">
	                                <li>
	                                    <a href="#">소개 및 연구목표</a>
	                                </li>
	                                <li>
	                                    <a href="#">포트폴리오</a>
	                                </li>
	                                <li>
	                                    <a href="#">연구원</a>
	                                </li>
	                            </ul>
	                        </li>
	
	                        <li class="dropdown-submenu">
	                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Multimedia DSP Lab.</a>
	                            <ul class="dropdown-menu">
	                                <li>
	                                    <a href="#">소개 및 연구목표</a>
	                                </li>
	                                <li>
	                                    <a href="#">포트폴리오</a>
	                                </li>
	                                <li>
	                                    <a href="#">연구원</a>
	                                </li>
	                            </ul>
	                        </li>
	
	                        <li class="dropdown-submenu">
	                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">OS/Security Lab.</a>
	                            <ul class="dropdown-menu">
	                                <li>
	                                    <a href="#">소개 및 연구목표</a>
	                                </li>
	                                <li>
	                                    <a href="#">포트폴리오</a>
	                                </li>
	                                <li>
	                                    <a href="#">연구원</a>
	                                </li>
	                            </ul>
	                        </li>
	                    </ul>
	                </li>
	
	                <li class="dropdown">
	                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0">교육
	                    </a>
	                    <ul class="dropdown-menu">
	                        <li>
	                            <a href="#">입학안내</a>
	                        </li>
	
	                        <li>
	                            <a href="#">산학협력</a>
	                        </li>
	                    </ul>
	                </li>
	
	
	                <li class="dropdown">
	                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0">게시판
	                    </a>
	                    <ul class="dropdown-menu">
	                        <li>
	                            <a href="#">자유게시판</a>
	                        </li>
	
	                        <li>
	                            <a href="#">질문게시판</a>
	                        </li>
	                    </ul>
	                </li>
	
	                <!-- 사이드바 -->
	                <li class="dropdown hidden-xs">
	                    <a href="javascript:void(0);" id="sidebar-btn">
	                        <i class="fa fa-bars"></i>
	                    </a>
	                </li>
	
	            </ul>
	        </div>
	    </div>
	</nav>
	<div id="navbarSpaceBottom"></div>

    <!-- Header Section  -->
    <section class="bg-7 bg-centerTop70 bg-cover">
        <div class="bg-filter sTop">
            <div class="container">
                <div class="jumbotron trn v-center">
                    <h1>DKU Department of Software</h1>
                    
                    <div class="space-sm"></div>
                    
                    <p>소프트웨어학과 홈페이지에 오신 것을 환영합니다.<br />소프트웨어학과 학생들은 학과 오프라인 게시판 확인 후 필히 가입부탁드립니다.</p>
                    
                    <div class="space-sm"></div>
                    
                    <ul class="list-inline">
                        <li>
                            <a href="#" class="btn btn-default-trn btn-xlg scroll"><i class="fa fa-bolt"></i>애플리케이션 다운로드</a>
                        </li>
                        <li>
                            <a href="" class="btn btn-primary btn-xlg scroll"><i class="fa fa-paper-plane-o"></i>학과생 인증</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Features section -->
    <div id="learn-more"></div>
    <section class="section">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="text-center">
                        <i class="fa fa-laptop hovicon effect-3 sub-b easePulse wow" data-wow-delay="0.2s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.2s; -moz-animation-delay: 0.2s; animation-delay: 0.2s;"></i>
                        <h3 class="wow fadeIn m-10-top" data-wow-delay="0.4s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.4s; -moz-animation-delay: 0.4s; animation-delay: 0.4s;">Fully responsive</h3>
                        <p class="wow fadeIn" data-wow-delay="0.4s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.4s; -moz-animation-delay: 0.4s; animation-delay: 0.4s;">Nulle omnis iste natus error sit voluptatem accusantium.</p>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="text-center">
                        <i class="fa fa-globe hovicon effect-3 sub-b easePulse wow" data-wow-delay="0.4s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.4s; -moz-animation-delay: 0.4s; animation-delay: 0.4s;"></i>
                        <h3 class="wow fadeIn m-10-top" data-wow-delay="0.6s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.6s; -moz-animation-delay: 0.6s; animation-delay: 0.6s;">HTML5 &amp; CSS3</h3>
                        <p class="wow fadeIn" data-wow-delay="0.6s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.6s; -moz-animation-delay: 0.6s; animation-delay: 0.6s;">Nulle omnis iste natus error sit voluptatem accusantium.</p>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="text-center">
                        <i class="fa fa-plane hovicon effect-3 sub-b easePulse wow" data-wow-delay="0.6s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.6s; -moz-animation-delay: 0.6s; animation-delay: 0.6s;"></i>
                        <h3 class="wow fadeIn m-10-top" data-wow-delay="0.8s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.8s; -moz-animation-delay: 0.8s; animation-delay: 0.8s;">Ready for use</h3>
                        <p class="wow fadeIn" data-wow-delay="0.8s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.8s; -moz-animation-delay: 0.8s; animation-delay: 0.8s;">Nulle omnis iste natus error sit voluptatem accusantium.</p>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="text-center">
                        <i class="fa fa-lightbulb-o hovicon effect-3 sub-b easePulse wow" data-wow-delay="0.8s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.8s; -moz-animation-delay: 0.8s; animation-delay: 0.8s;"></i>
                        <h3 class="wow fadeIn m-10-top" data-wow-delay="1s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 1s; -moz-animation-delay: 1s; animation-delay: 1s;">Shortcodes</h3>
                        <p class="wow fadeIn" data-wow-delay="1s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 1s; -moz-animation-delay: 1s; animation-delay: 1s;">Nulle omnis iste natus error sit voluptatem accusantium.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Services section -->
    <section class="section-lg bg-grey">
        <div class="container">
            <div class="row">
                <h2 class="lg-title lg-title-border">What we do?</h2>
                <!--fadeInLeft-->
                <div class=" col-sm-6 wow fadeInLeft" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;">
                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam sapien elit, consequat eget, tristique non. Venenatis quis ante. Curabitur ligula sapien.</p>
                    <p>Pulvinar a vestibulum quis, facilisis vel sapien. Cum sociis natoque penatibus et magnis dis parturient montes.</p>
                    <div class="space-sm"></div>
                    <ul class="info-list md-list style i-primary">
                        <li>
                            <i class="fa fa-play"></i>Pellentesque pretium lectus id.</li>
                        <li>
                            <i class="fa fa-play"></i>Excepteur sint occaecat cupidatat non.</li>
                        <li>
                            <i class="fa fa-play"></i>Aliquam erat volutpat ufsce.</li>
                        <li>
                            <i class="fa fa-play"></i>Vestibulum fermentum tortor id mi.</li>
                    </ul>
                    <div class="space visible-xs"></div>
                </div>

                <div class="col-sm-6 wow fadeInRight" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;">
                    <img class="img-mw450" src="./source/Showcase-Template-Flat-Presentation-Vol-3-portfolio.png" alt="Flat showcase presentation">
                </div>
            </div>
        </div>
    </section>

    <!-- Our works/ projects section -->
    <section class="section-lg">
        <div class="container">

            <h2 class="lg-title lg-title-border">Our work</h2>

            <ul class="filter-tabs">
                <li class="filter active" data-filter="mix"><span>All</span>
                </li>
                <li class="filter" data-filter="apps"><span>Application</span>
                </li>
                <li class="filter" data-filter="devices"><span>Devices</span>
                </li>
                <li class="filter" data-filter="web"><span>Webdesign</span>
                </li>
            </ul>

            <ul class="row  filter-grid-v2" id="Grid">
                <!-- Item 1 -->
                <li class="col-md-4 col-sm-6 mix devices  mix_all" style="display: inline-block; opacity: 1;">
                    <a href="#" title="View portfolio item">
                        <div class="hover-content wow easeUp" data-wow-delay="0.5s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.5s; -moz-animation-delay: 0.5s; animation-delay: 0.5s;">
                            <img src="./source/sign-up-sketch.jpg" class="img-responsive" alt="Portfolio - application">
                            <div class="top-part hidden-xs">
                                <i class="fa fa-eye"></i>
                            </div>
                            <div class="bottom-part hidden-xs">
                                <h3>Some Title</h3>
                            </div>
                        </div>
                    </a>
                </li>
                <!-- mix - select all, devices - filter only devices -->

                <!-- Item 2 -->
                <li class="col-md-4 col-sm-6 mix apps web  mix_all" style="display: inline-block; opacity: 1;">
                    <a href="#" title="View portfolio item">
                        <div class="hover-content wow easeUp" data-wow-delay="0.25s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.25s; -moz-animation-delay: 0.25s; animation-delay: 0.25s;">
                            <img src="./source/minimal-wireframe-assets.jpg" class="img-responsive" alt="Websites Layout">
                            <div class="top-part hidden-xs">
                                <i class="fa fa-eye"></i>
                            </div>
                            <div class="bottom-part hidden-xs">
                                <h3>Some Title</h3>
                            </div>
                        </div>
                    </a>
                </li>

                <!-- Item 3 -->
                <li class="col-md-4 col-sm-6 mix apps  mix_all" style="display: inline-block; opacity: 1;">
                    <a href="http://bootstrapart.net/dragonfly/v1.5/portfolio-item-v2.php" title="View portfolio item">
                        <div class="hover-content wow easeUp" data-wow-delay="0.75s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.75s; -moz-animation-delay: 0.75s; animation-delay: 0.75s;">
                            <img src="./source/App-Preview.jpg" class="img-responsive" alt="Portfolio - application">
                            <div class="top-part hidden-xs">
                                <i class="fa fa-eye"></i>
                            </div>
                            <div class="bottom-part hidden-xs">
                                <h3>Some Title</h3>
                            </div>
                        </div>
                    </a>
                </li>

                <!-- Item 4 -->
                <li class="col-md-4 col-sm-6 mix devices  mix_all" style="display: inline-block; opacity: 1;">
                    <a href="http://bootstrapart.net/dragonfly/v1.5/portfolio-item-v2.php" title="View portfolio item">
                        <div class="hover-content wow easeUp" data-wow-delay="0.6s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.6s; -moz-animation-delay: 0.6s; animation-delay: 0.6s;">
                            <img src="./source/macbook.jpg" class="img-responsive" alt="Apple Macbook Pro">
                            <div class="top-part hidden-xs">
                                <i class="fa fa-eye"></i>
                            </div>
                            <div class="bottom-part hidden-xs">
                                <h3>Some Title</h3>
                            </div>
                        </div>
                    </a>
                </li>

                <!-- Item 5 -->
                <li class="col-md-4 col-sm-6 mix web  mix_all" style="display: inline-block; opacity: 1;">
                    <a href="http://bootstrapart.net/dragonfly/v1.5/portfolio-item-v2.php" title="View portfolio item">
                        <div class="hover-content wow easeUp" data-wow-delay="0.35s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.35s; -moz-animation-delay: 0.35s; animation-delay: 0.35s;">
                            <img src="./source/webdesign.jpg" class="img-responsive" alt="Webdesign">
                            <div class="top-part hidden-xs">
                                <i class="fa fa-eye"></i>
                            </div>
                            <div class="bottom-part hidden-xs">
                                <h3>Some Title</h3>
                            </div>
                        </div>
                    </a>
                </li>

                <!-- Item 6 -->
                <li class="col-md-4 col-sm-6 mix apps  mix_all" style="display: inline-block; opacity: 1;">
                    <a href="http://bootstrapart.net/dragonfly/v1.5/portfolio-item-v2.php" title="View portfolio item">
                        <div class="hover-content wow easeUp" data-wow-delay="0.85s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.85s; -moz-animation-delay: 0.85s; animation-delay: 0.85s;">
                            <img src="./source/app-screen.jpg" class="img-responsive" alt="application">
                            <div class="top-part hidden-xs">
                                <i class="fa fa-eye"></i>
                            </div>
                            <div class="bottom-part hidden-xs">
                                <h3>Some Title</h3>
                            </div>
                        </div>
                    </a>
                </li>
            </ul>

        </div>
    </section>

    <div class="bg-11 bg-cover bg-center">
        <div class="section-lg bg-filter-v2">
            <div class="container">
                <div id="testimonial" class="carousel slide" data-ride="carousel" data-interval="9000">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <div class="testimonial">

                                <p>"It’s just brilliant. I will recommend the product to everyone I know!"</p>
                                <div class="space-sm"></div>
                                <em>- Nicola Perry</em>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimonial">
                                <p>
                                    "What a product. Why didn’t someone think of it sooner?"
                                </p>
                                <div class="space-sm"></div>
                                <em>- Jack Brown</em>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimonial">
                                <p>
                                    "I’ve bought it and now think perhaps I should have invested!""
                                </p>
                                <div class="space-sm"></div>
                                <em>- Ben Berry</em>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimonial">
                                <p>
                                    "What a product. Why didn’t someone think of it sooner?"
                                </p>
                                <div class="space-sm"></div>
                                <em>- Adele Taylor</em>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Pricing tables -->
    <div id="get-started"></div>
    <section class="section">
        <div class="container">
            <h2 class="lg-title lg-title-border">Our plans</h2>
            <div class="space-sm"></div>
            <div class="row">
                <div class="col-sm-4 wow fadeIn" data-wow-delay="0.2s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.2s; -moz-animation-delay: 0.2s; animation-delay: 0.2s;">
                    <div class="panel panel-default prices first">
                        <div class="panel-body">
                            <i class="fa fa-paper-plane icon-u"></i>

                            <h2 class="val">$15<small>/month</small></h2>

                            <ul class="info-list md-list primary">
                                <li>
                                    <span>5Gb</span>Storage</li>
                                <li>
                                    <span>1</span>Email account</li>
                                <li>
                                    <span>2</span>Hosted domains</li>
                                <li>
                                    <span>24/7</span>Email support</li>
                            </ul>
                            <div class="space-md"></div>
                            <a href="#" class="btn btn-default">Start Trial</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 wow fadeIn" data-wow-delay="0.4s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.4s; -moz-animation-delay: 0.4s; animation-delay: 0.4s;">
                    <div class="panel panel-default prices  bg-primary">
                        <div class="panel-body ">
                            <div class="ribbon">Favorite</div>

                            <i class="fa fa-plane icon-u"></i>

                            <h2 class="val">$30<small>/month</small></h2>

                            <ul class="info-list md-list default">
                                <li>
                                    <span>20Gb</span>Storage</li>
                                <li>
                                    <span>10</span>Email account</li>
                                <li>
                                    <span>15</span>Hosted domains</li>
                                <li>
                                    <span>24/7</span>Email support</li>
                            </ul>
                            <div class="space-md"></div>
                            <a href="#" class="btn btn-default-trn">Start Trial</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 wow fadeIn" data-wow-delay="0.6s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.6s; -moz-animation-delay: 0.6s; animation-delay: 0.6s;">
                    <div class="panel panel-default prices last">
                        <div class="panel-body">
                            <i class="fa fa-rocket icon-u"></i>

                            <h2 class="val">$50<small>/month</small></h2>

                            <ul class="info-list md-list primary">
                                <li>
                                    <span>100Gb</span>Storage</li>
                                <li>
                                    <span>20</span>Email account</li>
                                <li>
                                    <span>25</span>Hosted domains</li>
                                <li>
                                    <span>24/7</span>Email support</li>
                            </ul>
                            <div class="space-md"></div>
                            <a href="#" class="btn btn-default">Start Trial</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- Breaking news -->
    <section class="section bg-grey">
        <div class="container">
            <h2 class="lg-title lg-title-border">Breaking news</h2>
            <div class="row">
                <div class="col-md-3 col-lg-3 col-sm-6 wow fadeInLeft" data-wow-delay="0.8s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.8s; -moz-animation-delay: 0.8s; animation-delay: 0.8s;">
                    <div class="news">
                        <img class="img-responsive" src="./source/011.jpg" alt="camera">
                        <h3>Post title</h3>
                        <em>January 26, 2014 by John</em>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis condimentum augue id magna semper rutrum. In enim a arcu imperdiet malesuada.</p>
                        <a href="http://bootstrapart.net/dragonfly/v1.5/blog-page.php" class="btn btn-default-trn-v2">Read more
                            <i class="fa fa-angle-double-right"></i>
						</a>
                    </div>
                </div>
                <div class="col-md-3 col-lg-3 col-sm-6 wow fadeInLeft" data-wow-delay="0.6s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.6s; -moz-animation-delay: 0.6s; animation-delay: 0.6s;">
                    <div class="news">
                        <img class="img-responsive" src="./source/31f6.JPG" alt="macbook">
                        <h3>Post title</h3>
                        <em>January 10, 2014 by Ben</em>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis condimentum augue id magna semper rutrum. In enim a arcu imperdiet malesuada.</p>
                        <a href="http://bootstrapart.net/dragonfly/v1.5/blog-page.php" class="btn btn-default-trn-v2">Read more
							<i class="fa fa-angle-double-right"></i>
						</a>
                    </div>
                </div>
                <div class="col-md-3 col-lg-3 col-sm-6 wow fadeInLeft" data-wow-delay="0.4s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.4s; -moz-animation-delay: 0.4s; animation-delay: 0.4s;">
                    <div class="news">
                        <img class="img-responsive" src="./source/picjumbo.com.jpg" alt="devices">
                        <h3>Post title</h3>
                        <em>December 27, 2013 by Nicole</em>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis condimentum augue id magna semper rutrum. In enim a arcu imperdiet malesuada.</p>
                        <a href="http://bootstrapart.net/dragonfly/v1.5/blog-page.php" class="btn btn-default-trn-v2">Read more
                            <i class="fa fa-angle-double-right"></i>
                        </a>
                    </div>
                </div>
                <div class="col-md-3 col-lg-3 col-sm-6 wow fadeInLeft" data-wow-delay="0.2s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.2s; -moz-animation-delay: 0.2s; animation-delay: 0.2s;">
                    <div class="news">
                        <img class="img-responsive" src="./source/macbook-air.jpg" alt="macbook">
                        <h3>Post title</h3>
                        <em>December 13, 2013 by Adele</em>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis condimentum augue id magna semper rutrum. In enim a arcu imperdiet malesuada.</p>
                        <a href="http://bootstrapart.net/dragonfly/v1.5/blog-page.php" class="btn btn-default-trn-v2">Read more
                            <i class="fa fa-angle-double-right"></i>
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!--Back to top-->
    <a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>

    <!-- Scripts-->

    <!-- Modernizr -->
    <script src="./03_include/js/modernizr.custom.min.js"></script>

    <!-- jQuery -->
    <script src="./03_include/js/jquery.min.js"></script>
    <script src="./03_include/js/jquery-ui.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="./03_include/js/bootstrap.min.js"></script>

    <!-- Bootstrap Plugin - open dropdown on hover -->
    <script src="./03_include/js/bootstrap-hover-dropdown.min.js"></script>

    <!-- LESS preprocessor -->
    <script src="./03_include/js/less.min.js"></script>

    <!-- WOW.js - loading animations -->
    <script src="./03_include/js/wow.min.js"></script>

    <!-- Knobs - our skills -->
    <script src="./03_include/js/jquery.knob.min.js"></script>

    <!-- Slippry - Slideshow -->
    <script src="./03_include/js/slippry.min.js"></script>

    <!-- Mixitup plugin - Portfolio Filter Grid -->
    <script src="./03_include/js/jquery.mixitup.min.js"></script>

    <!-- Make sticky whatever elements -->
    <script src="./03_include/js/jquery.sticky.min.js"></script>

    <!-- Smooth sroll -->
    <script src="./03_include/js/jquery.nicescroll.min.js"></script>

    <!-- Contact Form -->
    <script src="./03_include/js/contact-form.min.js"></script>

    <!-- Must be last of all scripts -->
    <script src="./03_include/js/scripts.min.js"></script>

    <!--[if lt IE 9]>
          <script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.min.js"></script>
          <script src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Side Menu -->
    <div class="sidebar-off hidden-xs sidebar">
        <div class="wrap">

            <!--<a id="sidebar-close" title="Close sidebar">
    			<div class="clearfix">
    				<h2 class="title">Side Menu</h2>
    				<div class="close-icon">
    					<span class="close-a"></span>
    					<span class="close-b"></span>
    				</div>
    			</div>
    		</a>-->

            <div class="form-lg">
                <div class="input-group all-trn" role="search">
                    <input type="text" class="form-control" placeholder="Search" />
                    <span class="input-group-btn">
    					<button class="btn btn-all-trn" title="Search" type="button">
    						<i class="fa fa-search"></i>
                        </button>
                	</span> 
                </div>
            </div>

            <div class="space-sm"></div>

            <h4>Languages</h4>
            <ul class="info-list sm-list lang">
                <li class="active">
                    <i class="fa fa-angle-right fa-fw"></i>
                    <a href="#">English</a>
                    <i class="fa fa-check fa-fw"></i>
                </li>
                <li>
                    <i class="fa fa-angle-right fa-fw"></i>
                    <a href="#">Germany</a>
                    <i class="fa fa-check fa-fw"></i>
                </li>
                <li>
                    <i class="fa fa-angle-right fa-fw"></i>
                    <a href="#">Spanish</a>
                    <i class="fa fa-check fa-fw"></i>
                </li>
                <li>
                    <i class="fa fa-angle-right fa-fw"></i>
                    <a href="#">French</a>
                    <i class="fa fa-check fa-fw"></i>
                </li>
            </ul>

            <div class="space"></div>

            <h4>Social Media</h4>
            <ul class="icons-list circle-icons m-no-bottom">
                <li>
                    <a href="#" title="Follow us">
                        <i class="fa fa-google-plus"></i>
                    </a>
                </li>
                <li>
                    <a href="#" title="Follow us">
                        <i class="fa fa-twitter"></i>
                    </a>
                </li>
                <li>
                    <a href="#" title="Follow us">
                        <i class="fa fa-tumblr"></i>
                    </a>
                </li>
                <li>
                    <a href="#" title="Follow us">
                        <i class="fa fa-facebook"></i>
                    </a>
                </li>
                <li>
                    <a href="#" title="Follow us">
                        <i class="fa fa-youtube-play"></i>
                    </a>
                </li>
            </ul>

            <div class="space"></div>

            <h4>Contact</h4>
            <ul class="info-list sm-list">
                <li>
                    <i class="fa fa-envelope fa-fw"></i>
                    <a class="text-muted" href="mailto:influence.bootstrap@gmail.com">support@example.com</a>
                </li>
                <li>
                    <i class="fa fa-phone fa-fw"></i>
                    +21 902 920 889
                </li>
                <li>
                    <i class="fa fa-map-marker fa-fw"></i>
                    885 3rd Ave, NY 10022
                </li>
            </ul>
        </div>
    </div>


    <!-- Style Switcher -->
    <!--<div class="style-switcher">
        <i class="fa fa-gear switcher-icon"></i>
        <div class="body">
            <h4>Change Color</h4>
            <ul class="list-unstyled colors">
                <li class="blue"></li>
                <li class="light-blue"></li>
                <li class="green"></li>
                <li class="red"></li>
                <li class="yellow"></li>
            </ul>
            <div class="space-md"></div>
            <h4>Navigation</h4>
            <div class="row">
                <div class="col-xs-6">
                    <div class="btn-group  btn-block">
                        <button type="button" class="btn btn-default btn-sm dropdown-toggle btn-block" data-toggle="dropdown">
                            Theme <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="javascript:void(0);" id="navDark">Dark</a>
                            </li>
                            <li><a href="javascript:void(0);" id="navLight">Light</a>
                            </li>
                            <li><a href="javascript:void(0);" id="navTrn">Transparent</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="btn-group  btn-block">
                        <button type="button" class="btn btn-default btn-sm dropdown-toggle btn-block" data-toggle="dropdown">
                            Postion <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="javascript:void(0);" id="navRelative">Relative</a>
                            </li>
                            <li><a href="javascript:void(0);" id="navFixed">Fixed</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="space-md"></div>

        </div>
    </div>-->


    <!-- Footer-->
    <footer class="footer">
	    <div class="footer-top">
	        <div class="container">
	            <div class="row">
	                <div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
	                    <h4>Contact</h4>
	                    <ul class="info-list md-list i-primary">
	                        <li>
	                            <i class="fa fa-envelope fa-fw"></i>
	                            <a href="mailto:influence.bootstrap@gmail.com">influence.bootstrap@gmail.com</a>
	                        </li>
	                        <li>
	                            <i class="fa fa-phone fa-fw"></i>
	                            +21 902 920 889
	                        </li>
	                        <li>
	                            <i class="fa fa-map-marker fa-fw"></i>
	                            885 3rd Ave, NY 10022
	                        </li>
	                    </ul>
	                </div>
	                <div class="space-sm visible-sm visible-xs"></div>
	                <div class="col-md-4 col-lg-4 col-xs-12">
	                    <h4>Quick Links</h4>
	                    <ul class="info-list md-list i-primary">
	                        <li>
	                            <i class="fa fa-angle-right fa-fw"></i>
	                            <a href="#">
	                                <span class="link-title">About Us</span>- Who we are</a>
	                        </li>
	                        <li>
	                            <i class="fa fa-angle-right fa-fw"></i>
	                            <a href="#">
	                                <span class="link-title">Services</span>- What we do</a>
	                        </li>
	                        <li>
	                            <i class="fa fa-angle-right fa-fw"></i>
	                            <a href="#">
	                                <span class="link-title">Our Team</span>- Meet our team</a>
	                        </li>
	                        <li>
	                            <i class="fa fa-angle-right fa-fw"></i>
	                            <a href="#">
	                                <span class="link-title">Portfolio</span>- Our work</a>
	                        </li>
	                        <li>
	                            <i class="fa fa-angle-right fa-fw"></i>
	                            <a href="#">
	                                <span class="link-title">Blog</span>- Breaking news</a>
	                        </li>
	                    </ul>
	                </div>
	                <div class="space-sm visible-sm visible-xs"></div>
	                <div class="col-md-4 col-lg-4  col-xs-12">
	                    <h4>About Us</h4>
	                    <p>Temporibus autem quibusdam et aut officiis debitis ut et voluptates repudiandae sint et molestiae non recusandae.</p>
	                    <div class="space-sm"></div>
	                    <h4>Follow Us</h4>
	                    <ul class="circle-icons icons-list">
	                        <li>
	                            <a href="#" title="Follow us">
	                                <i class="fa fa-google-plus"></i>
	                            </a>
	                        </li>
	                        <li>
	                            <a href="#" title="Follow us">
	                                <i class="fa fa-twitter"></i>
	                            </a>
	                        </li>
	                        <li>
	                            <a href="#" title="Follow us">
	                                <i class="fa fa-tumblr"></i>
	                            </a>
	                        </li>
	                        <li>
	                            <a href="#" title="Follow us">
	                                <i class="fa fa-facebook"></i>
	                            </a>
	                        </li>
	                        <li>
	                            <a href="#" title="Follow us">
	                                <i class="fa fa-youtube-play"></i>
	                            </a>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>
	
	    <div class="footer-bottom">
	        <div class="container">
	            <p>© 2015 Dankook University Department of Software. All rights reserved.</p>
	        </div>
	    </div>
	</footer>

	<div id="ascrail2000" class="nicescroll-rails" style="width: 8px; z-index: 999999; position: fixed; top: 0px; height: 100%; right: 0px; cursor: default; opacity: 0; background: rgb(221, 221, 221);">
		<div style="position: relative; float: right; width: 8px; border: none; border-radius: 0px; height: 137px; top: 0px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>
	
	<div id="ascrail2000-hr" class="nicescroll-rails" style="height: 8px; z-index: 999999; position: fixed; left: 0px; width: 100%; bottom: 0px; cursor: default; opacity: 0; display: none; background: rgb(221, 221, 221);">
		<div style="position: relative; top: 0px; height: 8px; border: none; border-radius: 0px; width: 1395px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>
	
</body>
</html>