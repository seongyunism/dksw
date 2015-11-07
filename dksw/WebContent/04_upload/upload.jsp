<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String inputUploadCategory = request.getParameter("category").toString(); %>
<% String inputUploadPostNo = request.getParameter("no").toString(); %>

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">

<head>
	<title>단국대학교 소프트웨어학과 | 파일 업로드</title>

	<jsp:include page="../02_page/commonHeader.jsp" flush="false" />
	
	<!-- Custom Scripts -->
	<script>
	$(document).ready(function() {

	});

	$(window).load(function() {
		
	});
	
	$(function() {

	});
	</script>
</head>

<body>

	<section class="section">
		<div class="container">
			<form method="post" >
				<input type="hidden" name="inputUploadCategory" value="<%=inputUploadCategory %>" />
				<input type="hidden" name="inputUploadPostNo" value="<%=inputUploadPostNo %>" />
				
				<input type="file" class="btn btn-default btn-sm margin_right_2" value="" name="upload[]" multiple />
				<button type="button" class="btn btn-primary-trn btn-sm">업로드 완료</button>
			
			
			</form>
		</div>
	</section>

</body>
</html>