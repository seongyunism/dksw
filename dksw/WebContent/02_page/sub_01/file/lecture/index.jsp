<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">

<head>
	<title>단국대학교 소프트웨어학과 | 강의자료</title>

	<jsp:include page="../../../commonHeader.jsp" flush="false" />
	
	<!-- Custom Scripts -->
	<script>
	$(document).ready(function() {
		$(".lecture-year, .lecture-semester").selectpicker();
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
    <section class="bg-center bg-cover" >
        <div class="bg-filter">
            <div class="container section-lg">
                <h1 class="top-title font-NanumGothic">강의자료</h1>
            </div>
        </div>
    </section>

    <section class="section"  style="min-height:500px;">
        <div class="container">
        
	        <ul class="inline-tabs">
	            <li class="active">
	                <a href="#lecture-open" data-toggle="tab">강의 개설</a>
	            </li>
	            <li class="">
	                <a href="#lecture-list" data-toggle="tab">강의 관리</a>
	            </li>

	            <li class="">
	                <a href="#lecture-close" data-toggle="tab">강의 닫기</a>
	            </li>
	        </ul>
        
        	<div class="tab-content">
            	<div class="tab-pane active" id="lecture-open">
            		<div class="col-md-2"></div>
            		<div class="col-md-8">
						<div style="width:125px; float:left;">
							<select class="lecture-year" style="text-align:center;">				
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
							<select class="lecture-semester">
								<option>학기</option>
								<option value="1">1학기</option>
								<option value="2">2학기</option>
							</select>
						</div>				
						<div style="width:230px; float:left; margin-right:5px;"><input type="text" class="form-control" style="text-align:center; box-shadow:none; padding:5px 12px 6px 12px;" placeholder="강의명" /></div>
						<div style="width:100px; float:left; margin-right:5px;">
							<input type="text" class="form-control" style="text-align:center; box-shadow:none; padding:5px 12px 6px 12px;" placeholder="분반수" maxlength="2" />
						</div>
							
						<div style="width:120px; float:left; text-align:left;">
							<div class="btn btn-primary-trn">
								<i class="fa fa-check-circle"></i>강의 개설
							</div>
						</div>
					</div>
					
					<div class="col-md-2"></div>
				</div>
				
				<div class="tab-pane" id="lecture-list">
				
					<div class="panel-group">
					    <div class="panel panel-default">
					        <a data-toggle="collapse" href="#lecture-01-01">
					            <div class="panel-heading"><h4 class="panel-title font-NanumGothic"><i class="fa fa-th-list"></i>(2015-2) SW종합설계2</h4></div>
					        </a>
					        
					        <div id="lecture-01-01" class="panel-collapse collapse">
					            <div class="panel-body">
					            	<button type="button" class="btn btn-primary btn-xs">강의 공지하기</button>
					            	<button type="button" class="btn btn-primary btn-xs">과제물 공지하기</button>
					            	<button type="button" class="btn btn-primary btn-xs">수강중인 학생보기</button>
					            
					            	<div class="space-sm"></div>
					            
					            	<table class="table table-striped">
					            		<tr><td class="text-center text-bold" style="width:70px;">No</td><td class="text-center text-bold">단원명</td><td class="text-center text-bold" style="width:190px;">관리</td></tr>
					            		<tr><td class="text-center" style="line-height:31px;">#1</td><td style="line-height:31px;">Course Overview</td><td><button type="button" class="btn btn-success btn-sm margin_right_2 ">푸시알림</button><button type="button" class="btn btn-warning btn-sm margin_right_2 ">수정</button><button type="button" class="btn btn-danger btn-sm">삭제</button></td></tr>
					            		<tr><td class="text-center" style="line-height:31px;">#2</td><td style="line-height:31px;">Introduction to System Programming</td><td><button type="button" class="btn btn-success btn-sm margin_right_2 ">푸시알림</button><button type="button" class="btn btn-warning btn-sm margin_right_2 ">수정</button><button type="button" class="btn btn-danger btn-sm">삭제</button></td></tr>
					            		<tr><td class="text-center" style="line-height:31px;">#3</td><td style="line-height:31px;">Course Overview</td><td><button type="button" class="btn btn-success btn-sm margin_right_2 ">푸시알림</button><button type="button" class="btn btn-warning btn-sm margin_right_2 ">수정</button><button type="button" class="btn btn-danger btn-sm">삭제</button></td></tr>
					            		<tr><td class="text-center" style="line-height:31px;">#4</td><td style="line-height:31px;">Course Overview</td><td><button type="button" class="btn btn-success btn-sm margin_right_2 ">푸시알림</button><button type="button" class="btn btn-warning btn-sm margin_right_2 ">수정</button><button type="button" class="btn btn-danger btn-sm">삭제</button></td></tr>
					            		<tr><td class="text-center" style="line-height:31px;">#5</td><td style="line-height:31px;">Course Overview</td><td><button type="button" class="btn btn-success btn-sm margin_right_2 ">푸시알림</button><button type="button" class="btn btn-warning btn-sm margin_right_2 ">수정</button><button type="button" class="btn btn-danger btn-sm">삭제</button></td></tr>
					            		<tr><td class="text-center" style="line-height:31px;">#6</td><td style="line-height:31px;"><input type="text" class="form-control" placeholder="단원명" style="padding:0px 5px;"/></td><td class="text-center"><button type="button" class="btn btn-default btn-sm margin_right_2">파일 선택</button><button type="button" class="btn btn-primary-trn btn-sm">업로드 완료</button></td></tr>
					            	</table>
					            </div>
					        </div>
					    </div>
					     
					    <div class="panel panel-default">
					        <a data-toggle="collapse" data-parent="#accordion" href="#lecture-01-02">
					            <div class="panel-heading"><h4 class="panel-title font-NanumGothic"><i class="fa fa-th-list"></i>(2015-2) 운영체제및보안</h4></div>
					        </a>
					        
					        <div id="lecture-01-02" class="panel-collapse collapse">
					            <div class="panel-body">
					            
					            	<button type="button" class="btn btn-primary btn-xs">강의 공지하기</button>
					            	<button type="button" class="btn btn-primary btn-xs">과제물 공지하기</button>
					            	<button type="button" class="btn btn-primary btn-xs">수강중인 학생보기</button>
					            
					            	<div class="space-sm"></div>
					            
					            	<table class="table table-striped">
					            		<tr><td class="text-center text-bold" style="width:70px;">No</td><td class="text-center text-bold">단원명</td><td class="text-center text-bold" style="width:190px;">관리</td></tr>
					            		<tr><td class="text-center" style="line-height:31px;">#1</td><td style="line-height:31px;">Course Overview</td><td><button type="button" class="btn btn-success btn-sm margin_right_2 ">푸시알림</button><button type="button" class="btn btn-warning btn-sm margin_right_2 ">수정</button><button type="button" class="btn btn-danger btn-sm">삭제</button></td></tr>
					            		<tr><td class="text-center" style="line-height:31px;">#2</td><td style="line-height:31px;">Introduction to System Programming</td><td><button type="button" class="btn btn-success btn-sm margin_right_2 ">푸시알림</button><button type="button" class="btn btn-warning btn-sm margin_right_2 ">수정</button><button type="button" class="btn btn-danger btn-sm">삭제</button></td></tr>
					            		<tr><td class="text-center" style="line-height:31px;">#3</td><td style="line-height:31px;">Course Overview</td><td><button type="button" class="btn btn-success btn-sm margin_right_2 ">푸시알림</button><button type="button" class="btn btn-warning btn-sm margin_right_2 ">수정</button><button type="button" class="btn btn-danger btn-sm">삭제</button></td></tr>
					            		<tr><td class="text-center" style="line-height:31px;">#4</td><td style="line-height:31px;">Course Overview</td><td><button type="button" class="btn btn-success btn-sm margin_right_2 ">푸시알림</button><button type="button" class="btn btn-warning btn-sm margin_right_2 ">수정</button><button type="button" class="btn btn-danger btn-sm">삭제</button></td></tr>
					            		<tr><td class="text-center" style="line-height:31px;">#5</td><td style="line-height:31px;">Course Overview</td><td><button type="button" class="btn btn-success btn-sm margin_right_2 ">푸시알림</button><button type="button" class="btn btn-warning btn-sm margin_right_2 ">수정</button><button type="button" class="btn btn-danger btn-sm">삭제</button></td></tr>
					            		<tr><td class="text-center" style="line-height:31px;">#6</td><td style="line-height:31px;"><input type="text" class="form-control" placeholder="단원명" style="padding:0px 5px;"/></td><td class="text-center"><button type="button" class="btn btn-default btn-sm margin_right_2">파일 선택</button><button type="button" class="btn btn-primary-trn btn-sm">업로드 완료</button></td></tr>
					            	</table>
					            
					            </div>
					        </div>
					    </div>
					</div>
				</div>
				
				<div class="tab-pane" id="lecture-close"></div>

			</div>

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