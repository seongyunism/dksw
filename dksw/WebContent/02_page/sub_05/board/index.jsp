<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">

<head>
	<title>단국대학교 소프트웨어학과 | 자유게시판</title>

	<jsp:include page="../../commonHeader.jsp" flush="false" />
	
	<!-- Custom Scripts -->
	<script>
	var category = "4";
	
	$(document).ready(function() {
		initializePermission("board_free");
		
		initializeBoard(4);	
		
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
    <section class="background-bar-05-01 bg-center bg-cover">
        <div class="bg-filter">
            <div class="container section-lg">
                <h1 class="top-title">자유게시판</h1>
            </div>
        </div>
    </section>

    <!-- Content Section  -->
    <section class="section">
        <div class="container">
            <div class="row">
            			
                <!-- Left Contents -->
                <div class="col-md-8 col-lg-9">
					<div class="list">
		                <!-- Button -->
						<c:if test="${not empty sessionScope.dkswMemberNo}">
							<div id="writeBtn" class="btn btn-primary-trn pull-right" onclick="writeMode()">
								<i class="fa fa-pencil"></i>새글작성
							    </div>
							<div class="space-sm"></div>
						</c:if>
					
						<div id="dkswBoard_4"></div>
					</div>
                
					<c:if test="${not empty sessionScope.dkswMemberNo}">
						<div class="write-form">
							<form method="post">
								<input type="hidden" name="inputMode" value="1" />
								<input type="hidden" name="inputMemberNo" value="" />
								<input type="hidden" name="inputBoardCategory" value="4" />
								
								<input type="text" name="inputBoardTitle" class="form-control font-NanumGothic margin_bottom_5" placeholder="제목" style="font-weight:bold;" />
								<textarea name="inputBoardContent" class="form-control font-NanumGothic" style="min-height:500px;"></textarea> 
								<div class="space"></div>
						                        
								<div class="btn btn-primary pull-right margin_left_5" onclick="writePost('board_free')">
									<i class="fa fa-trash-o"></i>완료
								</div>
						            
								<div class="btn btn-primary-trn pull-right" onclick="writeModeCancel()">
									<i class="fa fa-wrench"></i>취소
								</div>
							</form>
						</div>
					</c:if>
                </div>
                
                
                <!-- Right Contents -->
                <div class="col-md-4 col-lg-3 hidden-sm hidden-xs">
                	<!-- Search Box -->
                    <div class="simple-box ">
					    <div class="input-group form-lg " role="search">
					        <input type="text" class="form-control" placeholder="Find answer" />
					        <span class="input-group-btn">
					            <button class="btn btn-primary" title="Search" type="button">
					                <i class="fa fa-search"></i>
					            </button>
					        </span>
					    </div>
					</div>
					
					<!-- Category Box -->
					<div class="categories simple-box">
					    <h3>Categories</h3>
					    <ul class="list-unstyled">
					        <li><i class="fa fa-angle-right fa-fw"></i><a href="#" title="Category Business">교수님</a></li>
					        <li><i class="fa fa-angle-right fa-fw"></i><a href="#" title="Category photos">과사무실</a></li>
					        <li><i class="fa fa-angle-right fa-fw"></i><a href="#" title="Category Education">학부생</a></li>
					        <li><i class="fa fa-angle-right fa-fw"></i><a href="#" title="Category Music">졸업생</a></li>
					        <li><i class="fa fa-angle-right fa-fw"></i><a href="#" title="Category Movies">기타</a></li>
					    </ul>
					</div>

					<!-- Tag Box -->
					<!--<div class="tags simple-box">
					    <h3>Tags</h3>
					    <ul class="list-unstyled">
					        <li><i class="fa fa-tags"></i><a href="#">Music</a></li>
					        <li><i class="fa fa-tags"></i><a href="#">Movies</a> </li>
					        <li><i class="fa fa-tags"></i><a href="#">Radio</a></li>
					        <li><i class="fa fa-tags"></i><a href="#">Internet</a></li>
					    </ul>
					</div>-->

					<!-- Subscribe Box -->
					<!--<div class="simple-box">
					    <h3>Subscribe Us</h3>
					    <div class="input-group icon">
					        <div class="control">
					            <input type="text" class="form-control" placeholder="Email Address">
					            <i class="fa fa-bullhorn"></i>
					        </div>
					        <span class="input-group-btn">
					            <button class="btn btn-primary only-icon " type="button">
					                <i class="fa fa-check"></i>
					            </button>
					        </span>
					    </div>
					</div>-->
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