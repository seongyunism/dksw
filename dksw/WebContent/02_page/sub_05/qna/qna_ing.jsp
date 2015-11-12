<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ page import="javax.sql.DataSource"%> 

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">

<head>
	<title>단국대학교 소프트웨어학과 | 질문게시판</title>

	<jsp:include page="../../commonHeader.jsp" flush="false" />
	


	
</head>
<%
Context InitContext = null;
Context envContext = null;
DataSource ds = null;
int num = 0;

Connection conn = null;
java.sql.Statement stmt = null;
ResultSet rs = null;
String sql = "";

	try {
		InitContext = new InitialContext();
		envContext = (Context) InitContext.lookup("java:comp/env");
		ds = (DataSource) envContext.lookup("jdbc/mysql");
		conn = ds.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery("Select qa_title,(select dkswDepartmentProfessorNameKo from dksw_department_professor where qa_b.qa_pIdx=dkswMemberNo ) qa_pIdx, qa_regDate from dksw_qna_board qa_b where qa_answerYN = 'N'");
	
%>

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
					<div class="bs-example"
						data-example-id="panel-without-body-with-table">
						<div class="panel panel-default">
							<!-- Default panel contents -->
							<div class="panel-heading"><h3>답변 진행중</h3></div>

							<!-- Table -->
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>제목</th>
										<th>담당교수</th>
										<th>등록날짜</th>
									</tr>
								</thead>
								<tbody>
								<%
								while (rs.next()) {
									String qa_title = rs.getString("qa_title");
									String qa_pIdx = rs.getString("qa_pIdx");
									String qa_regDate = rs.getString("qa_regDate");
									num++;
										
								%>
									<tr>
										<th scope="row"><%=num %></th>
										<td><a href="./qna_viewcontent.jsp" ><%=qa_title %></a></td>
										<td><a href="./qna_viewcontent.jsp" ><%=qa_pIdx %></a></td>
										<td><a href="./qna_viewcontent.jsp" ><%=qa_regDate %></a></td>
									</tr>
									<%
									}
										rs.close();
										stmt.close();
		

									} catch (Exception e) {
										out.println(e);
										
									} finally {
										try {
											if (stmt != null)
												stmt.close();
										} catch (Exception e) {
										}
										try {
											if (conn != null)
												conn.close();
										} catch (Exception e) {
										}
									}
								 %>
								</tbody>
							</table>
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