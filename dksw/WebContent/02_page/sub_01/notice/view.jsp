<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String category = (request.getParameter("category") != null) ? (request.getParameter("category").toString()) : null; %>
<% String postNo = request.getParameter("postNo").toString(); %>

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">

<head>
	<title>단국대학교 소프트웨어학과 | 공지사항</title>

	<jsp:include page="../../commonHeader.jsp" flush="false" />
		
	<!-- Custom Scripts -->
	<script>
	var category = "<%=category%>";
	
	$(document).ready(function() {
		initializeBoardView(<%=postNo%>);
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

	<!-- Content Section -->
    <section class="section">
        <div class="container">

			<div class="article-info">
				<ul class="tags list-unstyled pull-left">
					<li><i class="fa fa-user fa-fw"></i><a href="#" id="dkswMemberName"></a></li>
					<li><i class="fa fa-user fa-clock-o"></i><a href="#" id="dkswBoardWriteDate"></a></li>
                    <!--<li><i class="fa fa-comments fa-fw"></i><a href="#" title="Read Comments">27 Comments</a></li> -->
                </ul>
                
                <!--<ul class="square-icons share-icons-list pull-right">
                    <li><a href="#" title="Share"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#" title="Share"><i class="fa fa-facebook"></i></a></li>
                </ul>-->
            </div>
            
			<div class="view">
	
	            <div class="post-header">
	                <h2 class="font-NanumGothic" id="dkswBoardTitle"></h2>
	            </div>
	
	            <div class="text-block font-NanumGothic" id="dkswBoardSubTitle"></div>
	            <div class="space"></div>
	            
	            <div class="text-block font-NanumGothic" id="dkswBoardContent" style="line-height:2em;"></div>
	            <div class="space"></div>
	            
	            <c:if test="${sessionScope.dkswMemberCategory == '1' || sessionScope.dkswMemberCategory == '2' || sessionScope.dkswMemberCategory == '5'}">        
		            <div class="btn btn-primary pull-left margin_left_5" onclick="sendPush('<%=postNo%>')">
		            	<i class="fa fa-bell"></i>푸시 발송
		            </div>
		            <div class="btn btn-primary pull-right margin_left_5" onclick="deletePost()">
		            	<i class="fa fa-trash-o"></i>삭제
		            </div>
		            
		            <div class="btn btn-primary-trn pull-right" onclick="modifyMode()">
		                <i class="fa fa-wrench"></i>수정
		            </div>
				</c:if>
	
	            <div class="space"></div>
	
				<c:if test="${not empty sessionScope.dkswMemberNo}">
		            <div class="comment-box-1 icon">
		                <h4>덧글 남기기</h4>
		                <div class="row">
							<div class="col-md-12">
								<form>
		                            <div class="control">
		                                <textarea class="form-control" style="line-height:1.5em;" rows="5"></textarea>
		                                <i class="fa fa-comment"></i>
		                            </div>
								
									<button type="submit" class="hidden-xs hidden-sm btn btn-primary btn-block">
										<i class="fa fa-pencil"></i>서버로 전송
									</button>
		
		                        </form>
		                    </div>
		                    
		                </div>
		            </div>
	            </c:if>
	            
		       	<!--<div class="comment-box-3">
	                <div class="media">
	                    <a class="pull-left" href="#">
	                        <img class="media-object" alt="64x64" src="./Dragonfly - Blog Item_files/face-23.jpg">
	                    </a>
	                    <div class="media-body">
	                        <div class="media-header">
	                            <h4 class="media-heading">
									<a href="#">Caroline Harrison</a>
								</h4>
	                            <small>
									<em class="media-body-time six" title="6:46 p.m.">5 minutes</em>
								</small>
	
	                        </div>
	                        <div class="media-body-text">
	                            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
	                        </div>
	                        <div class="media-footer">
	                            <em>12</em>
	                            <a href="#">
	                                <i title="Like" class="fa  fa-thumbs-o-up"></i>
	                            </a>
	                            <a href="#" class="pull-right comment-box-3-reply" title="Reply">
	                                <i class="fa fa-reply"></i>Reply</a>
	                        </div>
	                    </div>
	
	                </div>
	                <hr>
	                <div class="media">
	                    <a class="pull-left" href="#">
	                        <img class="media-object" alt="64x64" src="./Dragonfly - Blog Item_files/face-17.jpg">
	                    </a>
	                    <div class="media-body">
	                        <div class="media-header">
	                            <h4 class="media-heading">
									<a href="#">Adele Taylor</a>
								</h4>
	                            <small>
									<em class="media-body-time six" title="May 2, 2013">May 2, 2013</em>
								</small>
	
	                        </div>
	                        <div class="media-body-text">
	                            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
	                        </div>
	                        <div class="media-footer">
	                            <em>3</em>
	                            <a href="#">
	                                <i title="Like" class="fa  fa-thumbs-o-up"></i>
	                            </a>
	                            <a href="#" class="pull-right comment-box-3-reply" title="Reply">
	                                <i class="fa fa-reply"></i>Reply</a>
	                        </div>
	                    </div>
	
	                </div>
	                <hr>
	                <div class="media">
	                    <a class="pull-left" href="#">
	                        <img class="media-object" alt="64x64" src="./Dragonfly - Blog Item_files/face-12.jpg">
	                    </a>
	                    <div class="media-body">
	                        <div class="media-header">
	                            <h4 class="media-heading ">
									<a href="#">Ben Berry</a>
								</h4>
	                            <small>
									<em class="media-body-time six" title="May 2, 2013">May 2, 2013</em>
								</small>
	
	                        </div>
	                        <div class="media-body-text">
	                            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
	                        </div>
	                        <div class="media-footer">
	                            <em>9</em>
	                            <a href="#">
	                                <i title="Like" class="fa  fa-thumbs-o-up"></i>
	                            </a>
	                            <a href="#" class="pull-right comment-box-3-reply" title="Reply">
	                                <i class="fa fa-reply"></i>Reply</a>
	                        </div>
	
	                        <div class="media">
	                            <a class="pull-left" href="#">
	                                <img class="media-object" alt="64x64" src="./Dragonfly - Blog Item_files/face-24.jpg">
	                            </a>
	                            <div class="media-body">
	                                <div class="media-header">
	                                    <h4 class="media-heading ">
											<a href="#">Jack Brown</a>
										</h4>
	                                    <small>
											<em class="media-body-time six" title="May 2, 2013">May 2, 2013</em>
										</small>
	
	                                </div>
	                                <div class="media-body-text">
	                                    Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
	                                </div>
	                                <div class="media-footer">
	                                    <em>2</em>
	                                    <a href="#">
	                                        <i title="Like" class="fa  fa-thumbs-o-up"></i>
	                                    </a>
	                                    <a href="#" class="pull-right comment-box-3-reply" title="Reply">
	                                        <i class="fa fa-reply"></i>Reply</a>
	                                </div>
	                                
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>-->
	            
			</div>
			
			<c:if test="${sessionScope.dkswMemberCategory == '1' || sessionScope.dkswMemberCategory == '2' || sessionScope.dkswMemberCategory == '5'}"> 
				<div id="#writeForm" class="write-form">
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

						<iframe class="uploadFrame" src="../../../04_upload/upload.jsp?mode=update&category=board_<%=category%>&no=<%=postNo%>"></iframe>
						<div class="space-sm"></div>
 
			            <div class="btn btn-primary pull-right margin_left_5" onclick="writePost('<%=category%>')">
			            	<i class="fa fa-trash-o"></i>완료
			            </div>
			            
			            <div class="btn btn-primary-trn pull-right" onclick="modifyModeCancel()">
			                <i class="fa fa-wrench"></i>취소
			            </div>
					</form>
				</div>
			</c:if>
 
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