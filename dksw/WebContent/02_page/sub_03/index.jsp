<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String labCode = request.getParameter("labCode").toString();
String labId = "";
String labName = "";

switch(labCode) {
	case "1":
		labName = "데이터베이스 연구실";
		labId = "db";
		break;
	case "2":
		labName = "임베디드 연구실";
		labId = "em";
		break;
	case "3":
		labName = "모바일콘텐츠 연구실";
		labId = "mo";
		break;
	case "4":
		labName = "멀티미디어 연구실";
		labId = "mu";
		break;
	case "5":
		labName = "운영체제/보안 연구실";
		labId = "se";
		break;
}
%>

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">

<head>
	<title>단국대학교 소프트웨어학과 | 연구실</title>
	
	<jsp:include page="../commonHeader.jsp" flush="false" />
	
	<!-- Custom Scripts -->
	<script>
	$(document).ready(function() {
		initializePermission("page_lab_" + "<%=labId%>");		
		
		initializeLab(<%=labCode%>);
	});

	$(window).load(function() {

	});
	
	$(function() {

	});
	</script>
</head>

<body>
    <!-- Navigation -->
	<jsp:include page="../commonNav.jsp" flush="false"/>
    
    <!-- Header Box -->
    <section class="background-bar-03-01 bg-center bg-cover">
        <div class="bg-filter">
            <div class="container section-lg">
                <h1 class="top-title"><%=labName %></h1>
            </div>
        </div>
    </section>
    
	<!-- labIntro.jsp -->
	<jsp:include page="labIntro.jsp" flush="false">
		<jsp:param name="labCode" value="<%=labCode%>" />	
	</jsp:include>
	
	<!-- labMembers.jsp -->
	<jsp:include page="labMembers.jsp" flush="false">
		<jsp:param name="labCode" value="<%=labCode%>" />	
	</jsp:include>

	<!-- labMembers.jsp -->
	<jsp:include page="labAchievement.jsp" flush="false">
		<jsp:param name="labCode" value="<%=labCode%>" />	
	</jsp:include>
	
	<!-- labPaper.jsp -->
	<jsp:include page="labPaper.jsp" flush="false">
		<jsp:param name="labCode" value="<%=labCode%>" />	
	</jsp:include>
	
	<!-- labProject.jsp -->
	<jsp:include page="labProject.jsp" flush="false">
		<jsp:param name="labCode" value="<%=labCode%>" />	
	</jsp:include>
	
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