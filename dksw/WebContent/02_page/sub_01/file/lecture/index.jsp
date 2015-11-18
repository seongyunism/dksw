<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">

<head>
	<title>단국대학교 소프트웨어학과 | 강의자료</title>

	<jsp:include page="../../../commonHeader.jsp" flush="false" />
	
	<!-- Custom Scripts -->
	<script>
	var lectureCounter = false;

	$(document).ready(function() {
		initializeLecture('${sessionScope.dkswMemberCategory}');
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
    <section class="background-bar-01-04 bg-center bg-cover" >
        <div class="bg-filter">
            <div class="container section-lg">
                <h1 class="top-title font-NanumGothic">강의자료</h1>
            </div>
        </div>
    </section>

	<section class="section"  style="min-height:500px;">

		<!-- 교수 페이지 -->
       	<c:if test="${sessionScope.dkswMemberCategory == '1' || sessionScope.dkswMemberCategory == '6'}">   
	        <div class="container">
	        
		        <ul class="inline-tabs">
		            <li class="active">
		                <a href="#lecture-open" data-toggle="tab">강의 개설</a>
		            </li>
		            <li class="">
		                <a href="#lecture-list" data-toggle="tab" onclick="getLectureListByProfessor()">강의 관리</a>
		            </li>
		        </ul>

	        	<div class="tab-content">
	        		<!-- 강의 개설 -->
	            	<div class="tab-pane active" id="lecture-open">
	            		<div class="col-md-2"></div>
	            		<div class="col-md-8">
							<div style="width:125px; float:left;">
								<select name="inputLectureYear" class="lecture-year" style="text-align:center;">	
									<option>년도</option>
									<option value="2015">2015년</option>
									<option value="2016">2016년</option>
									<option value="2017">2017년</option>
									<option value="2018">2018년</option>
									<option value="2019">2019년</option>
									<option value="2020">2020년</option>
								</select>
							</div>
								
							<div style="width:125px; float:left; margin-right:0px;">
								<select name="inputLectureSemester" class="lecture-semester">
									<option>학기</option>
									<option value="1">1학기</option>
									<option value="2">2학기</option>
								</select>
							</div>				
							<div style="width:330px; float:left; margin-right:5px;"><input type="text" name="inputLectureName" name="lecture-name" class="form-control" style="text-align:center; box-shadow:none; padding:5px 12px 6px 12px;" placeholder="강의명" /></div>
								
							<div style="width:120px; float:left; text-align:left;">
								<div class="btn btn-primary-trn" onclick="addLecture()">
									<i class="fa fa-check-circle"></i>강의 개설
								</div>
							</div>
						</div>
						
						<div class="col-md-2"></div>
					</div>
					
					<!-- 강의 관리 -->
					<div class="tab-pane" id="lecture-list">
						<div class="panel-group">
							<div id="getLectureListByProfessor"></div>
						</div>
					</div>
	
				</div>
			</div>
		</c:if>
		
		<!-- 학생 페이지 -->
       	<c:if test="${sessionScope.dkswMemberCategory == '1' || sessionScope.dkswMemberCategory == '7'}">   
			<div class="container">
			
		        <ul class="inline-tabs">
		            <li class="active">
		                <a href="#lecture-register" data-toggle="tab" onclick="getLectureList()">수강 신청</a>
		            </li>
		            <li class="">
		                <a href="#lecture-list" data-toggle="tab" onclick="getLectureListByStudent()">수강 리스트</a>
		            </li>
		        </ul>
			
				<div class="tab-content">
        			<!-- 수강 신청 -->
	            	<div class="tab-pane active" id="lecture-register">
	            		<div class="panel-group" id="getLectureList"></div>
	            	</div>
	            	
	            	<!-- 수강 리스트 -->
					<div class="tab-pane" id="lecture-list">
						<div class="panel-group">
							<div id="getLectureListByStudent"></div>
						</div>
					</div>

				</div>
			</div>
		</c:if>
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