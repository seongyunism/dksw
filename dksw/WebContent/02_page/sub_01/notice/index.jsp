<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">

<head>
	<title>단국대학교 소프트웨어학과 | 공지사항</title>

	<jsp:include page="../../commonHeader.jsp" flush="false" />
	
	<!-- Custom Scripts -->
	<script>
	$(document).ready(function() {
		initializeBoard(1);
	});

	$(window).load(function() {

	});
	
	$(function() {

	});
	</script>
</head>

<body>
    <!-- Navigation -->
	<jsp:include page="../../commonNav.jsp" flush="false"/>

    <!-- Header Section  -->
    <section class="background-bar-01-01 bg-center bg-cover">
        <div class="bg-filter">
            <div class="container section-lg">
                <h1 class="top-title">공지사항</h1>
            </div>
        </div>
    </section>


    <!-- Content Section  -->       
    <section class="container section-lg">
		<!-- Button -->
		<c:if test="${sessionScope.dkswMemberCategory == '1'}">
			<div class="writePost">새글작성</div>
			<div class="space-sm"></div>
		</c:if>

        <!-- Nav tabs -->
        <ul class="inline-tabs"> 
            <li class="active"> 
             	<a href="#responsive" data-toggle="tab">학과 공지</a> 
           	</li> 
          	<li class=""> 
               	<a href="#ready" data-toggle="tab">학생회 공지</a> 
           	</li> 
           	<li class=""> 
               	<a href="#shortcodes" data-toggle="tab">채용 정보</a> 
           	</li> 
       	</ul> 
       			
        <!-- Tab panes -->
		<div class="tab-content">
		
			<!-- 학과 공지 -->
            <div class="tab-pane active" id="responsive">
            	<div id="dkswBoard"></div>
            </div>
            
			<!-- 학생회 공지 -->            
            <div class="tab-pane" id="ready">
                <div class="row">
				학생회 공지
                </div>
            </div>
            
            <!-- 채용 정보 -->
            <div class="tab-pane" id="shortcodes">
                <div class="row">
				채용정보
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