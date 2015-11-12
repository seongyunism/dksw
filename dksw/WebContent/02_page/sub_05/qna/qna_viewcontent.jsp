<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ page import="javax.sql.DataSource"%>

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">

<head>
	<title>단국대학교 소프트웨어학과 | 질문게시판</title>

	<jsp:include page="../../commonHeader.jsp" flush="false" />
	<script>
		$(document).ready(function(){
			$("#view_return").bind("click",function(){
				location.href= "./index.jsp";
			});
		
		});
		
	</script>
<%

Context InitContext = null;
Context envContext = null;
DataSource ds = null;
Connection conn = null;
java.sql.Statement stmt = null;
ResultSet rs = null;
int mem_no = 0;

int num = 0;

HttpSession sessionMember = request.getSession();
num = Integer.parseInt(request.getParameter("num"));
try {
	mem_no  = Integer.parseInt(sessionMember.getAttribute("dkswMemberNo").toString());
	InitContext = new InitialContext();
	envContext = (Context) InitContext.lookup("java:comp/env");
	ds = (DataSource) envContext.lookup("jdbc/mysql");
	conn = ds.getConnection();
	stmt = conn.createStatement();
	rs = stmt.executeQuery("");
			
	//	String qa_title_ing = rs_ing.getString("qa_title");
	//	String qa_pIdx_ing = rs_ing.getString("qa_pIdx");
	//	String qa_regDate_ing = rs_ing.getString("qa_regDate");
	//	String qa_qIdx_ing = rs_ing.getString("qa_qIdx");
	//	num_ing++;
	
	rs.close();
	stmt.close();

} catch (Exception e) {
	out.println(e);

} finally {
	try {
		if (stmt != null) {
			stmt.close();
		}
	} catch (Exception e) {
	}
	try {
		if (conn!= null)
			conn.close();
	} catch (Exception e) {
	}
}


%>

	
</head>


<body>
    <!-- Navigation -->
	<jsp:include page="../../commonNav.jsp" flush="false"/>

    <!-- Header Section  -->
    <section class="background-bar-05-01 bg-center bg-cover">
        <div class="bg-filter">
            <div class="container section-lg">
                <h1 class="top-title">질문게시판</h1>
            </div>
        </div>
    </section>

    <!-- Content Section  -->
    <section class="section">
        <div class="container">
            <div class="row">
                <!-- Left Contents -->
                 <div class="col-md-8 col-lg-9">
				<div class="row">
					<div class="col-md-2">
						<p class="bg-primary text-center">작성자</p>
					</div>
					<div class="col-md-2">홍길동</div>
					<div class="col-md-2" ><p class="bg-primary text-center">담당교수</p></div>
					<div class="col-md-2">테스트교수님</div>
					<div class="col-md-2" ><p class="bg-primary text-center">작성날짜</p></div>
					<div class="col-md-2">2015년8월2일</div>
				</div>
				<div class="row">
					<div class="col-md-12"><h4>제목입니다.</h4></div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="bs-example" data-example-id="body-copy">
						안녕하세요동해물과백 두산이 마르고 닳도록 하느님이 보우하사 우리 나라만세 무궁화 삼천리 화려 강산 대한사람 대한으로 길이 보전하세
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group" >
								<div class="col-sm-2" style="float:right">
									<div class="btn-right group" role="group" aria-label="...">
										<button type="button" class="btn btn-success default btn-sm">수정</button>
										<button type="button" class="btn btn-danger default btn-sm" id="insert_cancel">취소</button>
									</div>
								</div>
					</div>
				</div>
				
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
					<div class="categories simple-box">
					    <h3>Categories</h3>
					    <ul class="list-unstyled">
					        <li><i class="fa fa-angle-right fa-fw"></i><a href="./qna_ing.jsp" title="Category Business">답변 진행중</a></li>
					        <li><i class="fa fa-angle-right fa-fw"></i><a href="./qna_end.jsp" title="Category photos">답변 완료</a></li>
					    </ul>
					</div>

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