<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">

<head>
	<title>단국대학교 소프트웨어학과 | 학과장 인사</title>

	<jsp:include page="../../../commonHeader.jsp" flush="false" />
	
	<!-- Custom Scripts -->
	<script>
	$(document).ready(function() {
		initializeDepartmentGreeting();
	});

	$(window).load(function() {

	});
	
	$(function() {

	});
	</script>
</head>

<body>
    <!-- Navigation -->
	<jsp:include page="../../../commonNav.jsp" flush="false"/>

    <!-- Header Box -->
    <section class="background-bar-02-01 bg-center bg-cover">
        <div class="bg-filter">
            <div class="container section-lg">
                <h1 class="top-title font-NanumGothic">학과장 인사</h1>
            </div>
        </div>
    </section>

    <section class="section">
        <div class="container-sm">
        	<!-- 타이틀 -->
            <h2 class="big-title font-NanumGothic" id="dkswDepartmentGreetingTitle"></h2> 
            
            <div class="space-sm"></div>
            <div class="space-sm"></div>
            
            <!-- 학과장 사진 -->
			<div class="hover-content" style="width:180px; float:right;">
				<img class="img-responsive center-block" alt="학과장" id="dkswDepartmentGreetingPicture" />
				<div class="top-part hidden-xs">
					<i class="fa fa-eye"></i>
				</div>
				<div class="bottom-part hidden-xs">
					<h4>교수 박규식</h4>
				</div>
			</div>
            
            <!-- 내용 -->
            <p class="font-NanumGothic" id="dkswDepartmentGreetingContent" style="line-height:1.8em;"></p>      

            <div class="space-sm"></div>
            <div class="space-sm"></div>
            
			<!-- 수정일 -->
			<p class=" font-NanumGothic edit-date col-md-4" id="dkswDepartmentGreetingEditDate"></p>

            <div class="space-sm"></div>

            <hr class="hr">
            
            <ul class="list-unstyled info-list">
                <li><strong>학과장&nbsp;&nbsp;:&nbsp;&nbsp;</strong>교수 <span id="dkswDepartmentProfessorNameKo"></span></li>
                <li><strong>사무실 위치&nbsp;&nbsp;:&nbsp;&nbsp;</strong><span id="dkswDepartmentProfessorLabLocation"></span></li>
                <li><strong>전화번호&nbsp;&nbsp;:&nbsp;&nbsp;</strong><span id="dkswDepartmentProfessorContact"></span></li>
                <li><strong>이메일&nbsp;&nbsp;:&nbsp;&nbsp;</strong><span id="dkswDepartmentProfessorEmail"></span></li>
            </ul>

            <hr class="hr">
        </div>
    </section>

    <!--Back to top-->
	<a href="#" class="back-to-top" style="display: none;">
	    <i class="fa fa-angle-up"></i>
	</a>

	<!-- Side Menu -->
	<jsp:include page="../../../commonSidebar.jsp" flush="false"/>
	
    <!-- Footer-->
	<jsp:include page="../../../commonFooter.jsp" flush="false"/>

	<div id="ascrail2000" class="nicescroll-rails" style="width: 8px; z-index: 999999; position: fixed; top: 0px; height: 100%; right: 0px; cursor: default; opacity: 0; background: rgb(221, 221, 221);">
		<div style="position: relative; float: right; width: 8px; border: none; border-radius: 0px; height: 269px; top: 0px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>
	
	<div id="ascrail2000-hr" class="nicescroll-rails" style="height: 8px; z-index: 999999; position: fixed; left: 0px; width: 100%; bottom: 0px; cursor: default; opacity: 0; display: none; background: rgb(221, 221, 221);">
		<div style="position: relative; top: 0px; height: 8px; border: none; border-radius: 0px; width: 1391px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>
	
</body>
</html>