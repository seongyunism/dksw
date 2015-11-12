<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.http.HttpSession" %>
<% String category = request.getParameter("category").toString(); %>

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">

<head>
	<title>단국대학교 소프트웨어학과 | 공지사항</title>

	<jsp:include page="../../commonHeader.jsp" flush="false" />
	
	<!-- Custom Scripts -->
	<script>
	var category = "<%=category%>";
	
	$(document).ready(function() {
		initializePermission('board_' + category);
		
		initializeBoard(1);
		initializeBoard(2);
		initializeBoard(3);		
		
		$("ul.inline-tabs a[href='#" + category + "']").parent("li").attr("class", "active");
		$("#" + category).attr("class", "tab-pane active");
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

		<div class="list">
			<!-- Button -->
			<c:if test="${sessionScope.dkswMemberCategory == '1' || sessionScope.dkswMemberCategory == '2' || sessionScope.dkswMemberCategory == '5'}">  
				<div id="writeBtn" class="btn btn-primary-trn pull-right" onclick="writeMode()">
					<i class="fa fa-pencil"></i>새글작성
				</div>
				<div class="space-sm"></div>
			</c:if>
	
	        <!-- Nav tabs -->
	        <ul class="inline-tabs"> 
	            <li> 
	             	<a href="#department" data-toggle="tab">학과 공지</a> 
	           	</li> 
	          	<li class=""> 
	               	<a href="#student" data-toggle="tab">학생회 공지</a> 
	           	</li> 
	           	<li class=""> 
	               	<a href="#job" data-toggle="tab">채용 정보</a> 
	           	</li> 
	       	</ul> 
	       			
	        <!-- Tab panes -->
			<div class="tab-content">
			
				<!-- 학과 공지 -->
	            <div class="tab-pane" id="department">
	            	<div id="dkswBoard_1"></div>
	            </div>
	            
				<!-- 학생회 공지 -->            
	            <div class="tab-pane" id="student">
	            	<div id="dkswBoard_2"></div>
	            </div>
	            
	            <!-- 채용 정보 -->
	            <div class="tab-pane" id="job">
	            	<div id="dkswBoard_3"></div>
				</div>
	        </div>
		</div>
		
		<c:if test="${sessionScope.dkswMemberCategory == '1' || sessionScope.dkswMemberCategory == '2' || sessionScope.dkswMemberCategory == '5'}">
			<div class="write-form">
				<form method="post">
					<input type="hidden" name="inputMode" value="1" />
					<input type="hidden" name="inputMemberNo" value="${sessionScope.dkswMemberNo}" />
					
					<div class="col-md-12 btn-radio">
						<div class="input-radio"><input type="radio" name="inputBoardCategory" id="radio-01" value="1" checked /></div>
						<div class="label-radio"><label for="radio-01">학과 공지</label></div>
						<div class="input-radio"><input type="radio" name="inputBoardCategory" id="radio-02" value="2" /></div>
					    <div class="label-radio"><label for="radio-02">학생회 공지</label></div>
					    <div class="input-radio"><input type="radio" name="inputBoardCategory" id="radio-03" value="3" /></div>
					    <div class="label-radio"><label for="radio-03">채용 정보</label></div>
					</div>
					
					<input type="text" name="inputBoardTitle" class="form-control font-NanumGothic margin_bottom_5" placeholder="제목" style="font-weight:bold;" />
					<textarea name="inputBoardContent" class="form-control font-NanumGothic" style="min-height:500px;"></textarea> 
					<div class="space-sm"></div>

					<iframe class="uploadFrame" src="../../../04_upload/upload.jsp?mode=new&category=board_<%=category%>"></iframe>
					<div class="space-sm"></div>
			                        
					<div class="btn btn-primary pull-right margin_left_5" onclick="writePost('<%=category%>')">
						<i class="fa fa-trash-o"></i>완료
					</div>
			            
					<div class="btn btn-primary-trn pull-right" onclick="writeModeCancel()">
						<i class="fa fa-wrench"></i>취소
					</div>
				</form>
			</div>
		</c:if>

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