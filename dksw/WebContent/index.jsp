<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko"
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters"
	style="overflow: hidden;">

<head>
<title>단국대학교 소프트웨어학과</title>

<jsp:include page="./02_page/commonHeader.jsp" flush="false" />

<!-- Custom Scripts -->
<script>
	$(document).ready(function() {
		getNews();
	});

	$(window).load(function() {

	});

	$(function() {

	});

	function openSlideBar() {
		$("#sidebar").attr("class", "sidebar-on hidden-xs sidebar");
	}
</script>
</head>

<body>
	<!-- Navigation -->
	<jsp:include page="./02_page/commonNav.jsp" flush="false" />

	<!-- Header Section  -->
	<section class="background-bar-main bg-centerTop70 bg-cover">
		<div class="bg-filter sTop">
			<div class="container">
				<div class="jumbotron trn v-center">
					<div class="page-main-title">
						<span class="bg-color-black-20">DKU Department of Software</span>
					</div>

					<div class="page-main-subtitle">
						<span
							class="bg-color-black-20 padding_left_5 padding_right_5 padding_top_5 padding_bottom_5">단국대학교
							소프트웨어학과 홈페이지에 오신 것을 환영합니다.</span><br /> <span
							class="bg-color-black-20 padding_left_5 padding_top_5 padding_bottom_5">본교
							학과 학생들은 </span><span
							class="bg-color-black-20 page-main-subtitle-offline text-bold padding_top_5 padding_bottom_5"
							title="자연과학관 5층 학과 사무실 앞 게시판">학과 오프라인 게시판 확인</span><span
							class="bg-color-black-20 padding_right_5 padding_top_5 padding_bottom_5">
							후 필히 가입바랍니다.</span>
					</div>

					<div class="space-sm"></div>

					<ul class="list-inline">
						<li><a href="http://dksw.dankook.ac.kr:8080/app.apk"
							class="btn btn-default-trn btn-xlg scroll"><i
								class="fa fa-android"></i>애플리케이션 다운로드</a></li>
						<c:if test="${empty sessionScope.dkswMemberNo}">
							<li><a href="<%=request.getContextPath()%>/02_page/join/index.jsp" class="btn btn-primary btn-xlg scroll"><i class="fa fa-user-plus"></i>학과생 인증 및 회원 가입</a></li>
						</c:if>
						<c:if test="${empty sessionScope.dkswMemberNo}">
							<li><button class="btn btn-success btn-xlg scroll" onclick="openSlideBar()"><i class="fa fa fa-sign-in"></i>로그인</button></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<!-- Breaking news -->
	<section class="section">
		<div class="container">
			<h2 class="lg-title lg-title-border">Latest News</h2>
			<div class="row" id="dkswBoardNews"></div>
		</div>
	</section>


	<!-- Features section -->
	<!--<div id="learn-more"></div>
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
    </section>-->

	<!-- Services section -->
	<!--<section class="section-lg bg-grey">
        <div class="container">
            <div class="row">
                <h2 class="lg-title lg-title-border">What we do?</h2>
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
                    <img class="img-mw450" src="./01_image/temp/Showcase-Template-Flat-Presentation-Vol-3-portfolio.png" alt="Flat showcase presentation">
                </div>
            </div>
        </div>
    </section>-->

	<!-- Our works/ projects section -->
	<!--<section class="section-lg">
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
            
                <li class="col-md-4 col-sm-6 mix devices  mix_all" style="display: inline-block; opacity: 1;">
                    <a href="#" title="View portfolio item">
                        <div class="hover-content wow easeUp" data-wow-delay="0.5s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.5s; -moz-animation-delay: 0.5s; animation-delay: 0.5s;">
                            <img src="./01_image/temp/sign-up-sketch.jpg" class="img-responsive" alt="Portfolio - application">
                            <div class="top-part hidden-xs">
                                <i class="fa fa-eye"></i>
                            </div>
                            <div class="bottom-part hidden-xs">
                                <h3>Some Title</h3>
                            </div>
                        </div>
                    </a>
                </li>

                <li class="col-md-4 col-sm-6 mix apps web  mix_all" style="display: inline-block; opacity: 1;">
                    <a href="#" title="View portfolio item">
                        <div class="hover-content wow easeUp" data-wow-delay="0.25s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.25s; -moz-animation-delay: 0.25s; animation-delay: 0.25s;">
                            <img src="./01_image/temp/minimal-wireframe-assets.jpg" class="img-responsive" alt="Websites Layout">
                            <div class="top-part hidden-xs">
                                <i class="fa fa-eye"></i>
                            </div>
                            <div class="bottom-part hidden-xs">
                                <h3>Some Title</h3>
                            </div>
                        </div>
                    </a>
                </li>

                <li class="col-md-4 col-sm-6 mix apps  mix_all" style="display: inline-block; opacity: 1;">
                    <a href="http://bootstrapart.net/dragonfly/v1.5/portfolio-item-v2.php" title="View portfolio item">
                        <div class="hover-content wow easeUp" data-wow-delay="0.75s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.75s; -moz-animation-delay: 0.75s; animation-delay: 0.75s;">
                            <img src="./01_image/temp/App-Preview.jpg" class="img-responsive" alt="Portfolio - application">
                            <div class="top-part hidden-xs">
                                <i class="fa fa-eye"></i>
                            </div>
                            <div class="bottom-part hidden-xs">
                                <h3>Some Title</h3>
                            </div>
                        </div>
                    </a>
                </li>

                <li class="col-md-4 col-sm-6 mix devices  mix_all" style="display: inline-block; opacity: 1;">
                    <a href="http://bootstrapart.net/dragonfly/v1.5/portfolio-item-v2.php" title="View portfolio item">
                        <div class="hover-content wow easeUp" data-wow-delay="0.6s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.6s; -moz-animation-delay: 0.6s; animation-delay: 0.6s;">
                            <img src="./01_image/temp/macbook.jpg" class="img-responsive" alt="Apple Macbook Pro">
                            <div class="top-part hidden-xs">
                                <i class="fa fa-eye"></i>
                            </div>
                            <div class="bottom-part hidden-xs">
                                <h3>Some Title</h3>
                            </div>
                        </div>
                    </a>
                </li>

                <li class="col-md-4 col-sm-6 mix web  mix_all" style="display: inline-block; opacity: 1;">
                    <a href="http://bootstrapart.net/dragonfly/v1.5/portfolio-item-v2.php" title="View portfolio item">
                        <div class="hover-content wow easeUp" data-wow-delay="0.35s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.35s; -moz-animation-delay: 0.35s; animation-delay: 0.35s;">
                            <img src="./01_image/temp/webdesign.jpg" class="img-responsive" alt="Webdesign">
                            <div class="top-part hidden-xs">
                                <i class="fa fa-eye"></i>
                            </div>
                            <div class="bottom-part hidden-xs">
                                <h3>Some Title</h3>
                            </div>
                        </div>
                    </a>
                </li>

                <li class="col-md-4 col-sm-6 mix apps  mix_all" style="display: inline-block; opacity: 1;">
                    <a href="http://bootstrapart.net/dragonfly/v1.5/portfolio-item-v2.php" title="View portfolio item">
                        <div class="hover-content wow easeUp" data-wow-delay="0.85s" style="visibility: hidden; -webkit-animation-name: none; -moz-animation-name: none; animation-name: none;-webkit-animation-delay: 0.85s; -moz-animation-delay: 0.85s; animation-delay: 0.85s;">
                            <img src="./01_image/temp/app-screen.jpg" class="img-responsive" alt="application">
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
    </section>-->

	<!--<div class="bg-11 bg-cover bg-center">
        <div class="section-lg bg-filter-v2">
            <div class="container">
                <div id="testimonial" class="carousel slide" data-ride="carousel" data-interval="9000">
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
    </div>-->

	<!-- Pricing tables -->
	<!--<div id="get-started"></div>
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
    </section>-->

	<!-- Back to top-->
	<a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>

	<!-- Side Menu -->
	<jsp:include page="./02_page/commonSidebar.jsp" flush="false" />

	<!-- Footer-->
	<jsp:include page="./02_page/commonFooter.jsp" flush="false" />

	<div id="ascrail2000" class="nicescroll-rails"
		style="width: 8px; z-index: 999999; position: fixed; top: 0px; height: 100%; right: 0px; cursor: default; opacity: 0; background: rgb(221, 221, 221);">
		<div
			style="position: relative; float: right; width: 8px; border: none; border-radius: 0px; height: 137px; top: 0px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>

	<div id="ascrail2000-hr" class="nicescroll-rails"
		style="height: 8px; z-index: 999999; position: fixed; left: 0px; width: 100%; bottom: 0px; cursor: default; opacity: 0; display: none; background: rgb(221, 221, 221);">
		<div
			style="position: relative; top: 0px; height: 8px; border: none; border-radius: 0px; width: 1395px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>

</body>
</html>