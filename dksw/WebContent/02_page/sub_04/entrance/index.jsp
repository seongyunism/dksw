<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">

<head>
	<title>단국대학교 소프트웨어학과 | 입학 안내</title>
	
	<jsp:include page="../../commonHeader.jsp" flush="false" />

	<!-- Custom Scripts -->
	<script>
	$(document).ready(function() {
		initializeDepartmentProfessor();
	});

	$(window).load(function() {

	});
	
	$(function() {

	});
	</script>
	
</head>

<body>
	<!-- Navigation -->
	<jsp:include page="../../commonNav.jsp" flush="false" />
	
    <!-- Header Section  -->
	<section class="background-bar-04-01 bg-center bg-cover">
		<div class="bg-filter">
			<div class="container section-lg">
				<h1 class="top-title">입학 안내</h1>
			</div>
		</div>
	</section>

    <!-- Content Section --> 
    <section class="section-lg">
		<div class="container-sm">
		
			<p class="page-law-title text-center text-bold">수시 모집</p>
			<div class="space"></div>
			

			<div class="page-law-content">
				<p class="page-law-content-jo">모집시기</p>
				<ul class="page-law-content-hang">
					<li>매년 9월 초에 서류접수가 시작됩니다. 자세한 공지는 단국대학교 홈페이지에서 확인 가능 합니다.</li>
				</ul>
			</div>
			<div class="space-sm"></div>
			
			<div class="page-law-content">
				<p class="page-law-content-jo">지원자격</p>
				<ul class="page-law-content-hang">
					<li>지원자격에 따라 학생부교과우수자, 특성화고졸재직자, 고른기회학생, 특성화고졸재직자 등에 지원할 수 있습니다.</li>
				</ul>
			</div>
			<div class="space-sm"></div>
			
			<div class="page-law-content">
				<p class="page-law-content-jo">지원서 접수</p>
				<ul class="page-law-content-hang">
					<li>온라인이나 팩스를 통해 접수되며 전형에따라 제출서류들을 제출하여야합니다. 제출서류는 단국대학교 홈페이지 수시란을 참고하시기 바랍니다.</li>
				</ul>
			</div>
			<div class="space-sm"></div>
			
			<div class="page-law-content">
				<p class="page-law-content-jo">선발 방식</p>
				<ul class="page-law-content-hang">
					<li>항목에 따라, 서류, 논술, 면접 등을 통하여 이루어집니다.</li>
				</ul>
			</div>
			<div class="space-sm"></div>
			
			<div class="page-law-content">
				<p class="page-law-content-jo">합격자 발표</p>
				<ul class="page-law-content-hang">
					<li>단국대학교 홈페이지를 통해 각 전형별로 11~12월에 발표됩니다.</li>
				</ul>
			</div>
			
			<div class="space"></div>
			<div class="space"></div>
			<div class="space"></div>
			
			<p class="page-law-title text-center text-bold">정시 모집</p>
			<div class="space"></div>
			

			<div class="page-law-content">
				<p class="page-law-content-jo">모집시기</p>
				<ul class="page-law-content-hang">
					<li>매년 12월 중순쯤에 서류접수가 시작됩니다. 자세한 공지는 단국대학교 홈페이지에서 확인 가능 합니다.</li>
				</ul>
			</div>
			<div class="space-sm"></div>
			
			<div class="page-law-content">
				<p class="page-law-content-jo">지원자격</p>
				<ul class="page-law-content-hang">
					<li>지원자격에 따라 일반학생(수능, 실기), 특수교육대상자, 기회균형선발, 농어촌 학생 등에 지원할 수 있습니다.</li>
				</ul>
			</div>
			<div class="space-sm"></div>
			
			<div class="page-law-content">
				<p class="page-law-content-jo">지원서 접수</p>
				<ul class="page-law-content-hang">
					<li>온라인이나 팩스를 통해 접수되며 전형에따라 제출서류들을 제출하여야합니다. 제출서류는 단국대학교 홈페이지 정시란을 참고하시기 바랍니다.</li>
				</ul>
			</div>
			<div class="space-sm"></div>
			
			<div class="page-law-content">
				<p class="page-law-content-jo">선발 방식</p>
				<ul class="page-law-content-hang">
					<li>항목에 따라, 서류, 논술, 면접 등을 통하여 이루어집니다.</li>
				</ul>
			</div>
			<div class="space-sm"></div>
			
			<div class="page-law-content">
				<p class="page-law-content-jo">합격자 발표</p>
				<ul class="page-law-content-hang">
					<li>합격자 발표, 충원합격자발표로 나누어 발표됩니다.</li>
				</ul>
			</div>
			
			<div class="space"></div>
			<div class="space"></div>
			<div class="space"></div>
			
			<p class="page-law-title text-center text-bold">편입학 안내</p>
			<div class="space"></div>
			

			<div class="page-law-content">
				<p class="page-law-content-jo">모집시기</p>
				<ul class="page-law-content-hang">
					<li>매년 12월 초에 서류접수가 시작됩니다. 자세한 공지는 단국대학교 홈페이지에서 확인 가능 합니다.</li>
				</ul>
			</div>
			<div class="space-sm"></div>
			
			<div class="page-law-content">
				<p class="page-law-content-jo">지원자격</p>
				<ul class="page-law-content-hang">
					<li>일반편입은 국내외 4년제 대학 2학년 수료(예정), 국내외 전문대학 졸업(예정), (전문)학사학위취득(예정)자 등의 경우 지원 가능 합니다. 학사편입은 학사학위취득(예정)자에 한해 지원 가능합니다.</li>
				</ul>
			</div>
			<div class="space-sm"></div>
			
			<div class="page-law-content">
				<p class="page-law-content-jo">지원서 접수</p>
				<ul class="page-law-content-hang">
					<li>필요한 서류는 단국대학교 홈페이지 편입학전용란을 참고하시기 바랍니다.</li>
				</ul>
			</div>
			<div class="space-sm"></div>
			
			<div class="page-law-content">
				<p class="page-law-content-jo">선발 방식</p>
				<ul class="page-law-content-hang">
					<li>항목에 따라, 서류, 논술, 면접 등을 통하여 이루어집니다.</li>
				</ul>
			</div>
			<div class="space-sm"></div>
			
			<div class="page-law-content">
				<p class="page-law-content-jo">합격자 발표</p>
				<ul class="page-law-content-hang">
					<li>단국대학교 홈페이지를 통해 매년 2월경에 발표됩니다.</li>
				</ul>
			</div>
		
		</div>
    </section>
	
	<!--Back to top-->
	<a href="#" class="back-to-top" style="display: none;">
		<i class="fa fa-angle-up"></i>
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