<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">

<head>
	<title>단국대학교 소프트웨어학과 | 위치 및 연락처</title>

	<jsp:include page="../../commonHeader.jsp" flush="false" />
	
	<script>
	$(document).ready(function() {
		initializeDepartmentContact();
		initMap();
	});

	$(window).load(function() {

	});
	
	$(function() {

	});
	</script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDTYlYzpqYn7UtqgaWeTNhoY9Vzu5YH82c&sensor=SET_TO_TRUE_OR_FALSE" type="text/javascript"></script>
</head>

<body>
	<!-- Navigation -->
	<jsp:include page="../../commonNav.jsp" flush="false" />

	<!-- Header Box -->
	<section class="bg-16 bg-center bg-cover">
		<div class="bg-filter">
			<div class="container section-lg">
				<h1 class="top-title">위치 및 연락처</h1>
			</div>
		</div>
	</section>
		
	<!-- Contact Section -->
	<section class="section">
        <div class="container">
            <div class="row margin-b30-xs">
                
                <div class="col-sm-4">
                    <div class="float-box center">
                        <i class="fa fa-map-marker icon-c"></i>
                        <div class="float-text">
                            <h4>Our Location</h4>
                            <p style="line-height:1.75em; margin-top:10px;"><span style='letter-spacing:-0.5px;'>경기도 용인시 수지구 죽전로 152 단국대학교</span><br />자연과학관 501호(과사무실), 502호(과방)</p>
                        </div>
                    </div>
                </div>
                
                <div class="col-sm-4">
                    <div class="float-box center">
                        <i class="fa fa-envelope icon-c"></i>
                        <div class="float-text">
                            <h4>Email Us</h4>
                            <p style="line-height:1.75em; margin-top:10px;">
                                과사무실&nbsp;&nbsp;:&nbsp;&nbsp;<a href="mailto:dankook.sw@gmail.com">dankook.sw@gmail.com</a><br />
                                학과장&nbsp;&nbsp;:&nbsp;&nbsp;<a href="mailto:kspark@dankook.ac.kr">kspark@dankook.ac.kr</a>
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-sm-4">
                    <div class="float-box center">
                        <i class="fa fa-phone icon-c"></i>
                        <div class="float-text">
                            <h4>Call Us</h4>
                            <p style="line-height:1.75em; margin-top:10px;">전화&nbsp;&nbsp;:&nbsp;&nbsp;031&nbsp;)&nbsp;&nbsp;8005&nbsp;&nbsp;-&nbsp;&nbsp;3227<br />팩스&nbsp;&nbsp;:&nbsp;&nbsp;031&nbsp;)&nbsp;&nbsp;8021&nbsp;&nbsp;-&nbsp;&nbsp;7203</p>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </section>

	<div id="map"></div>

	<!-- 수정일 -->
	<p class=" font-NanumGothic edit-date col-md-4" id="dkswDepartmentHistoryEditDate"></p>

	<!--Back to top-->
	<a href="http://bootstrapart.net/dragonfly/v1.5/portfolio-item-v1.php#"
		class="back-to-top" style="display: none;"> <i
		class="fa fa-angle-up"></i>
	</a>

	<!-- Side Menu -->
	<jsp:include page="../../commonSidebar.jsp" flush="false" />

	<!-- Footer-->
	<jsp:include page="../../commonFooter.jsp" flush="false" />

	<div id="ascrail2000" class="nicescroll-rails" style="width: 8px; z-index: 999999; position: fixed; top: 0px; height: 100%; right: 0px; cursor: default; opacity: 0; background: rgb(221, 221, 221);">
		<div style="position: relative; float: right; width: 8px; border: none; border-radius: 0px; height: 269px; top: 0px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>

	<div id="ascrail2000-hr" class="nicescroll-rails" style="height: 8px; z-index: 999999; position: fixed; left: 0px; width: 100%; bottom: 0px; cursor: default; opacity: 0; display: none; background: rgb(221, 221, 221);">
		<div style="position: relative; top: 0px; height: 8px; border: none; border-radius: 0px; width: 1391px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>

</body>
</html>