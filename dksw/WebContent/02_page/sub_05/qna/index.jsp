<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@ page import="javax.sql.DataSource"%>

<!DOCTYPE html>
<html lang="ko"
	class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters"
	style="overflow: hidden;">

<head>
<title>단국대학교 소프트웨어학과 | 질문게시판</title>

<jsp:include page="../../commonHeader.jsp" flush="false" />

<script>
	$(document).ready(function() {
		initializeLecture('${sessionScope.dkswMemberCategory}');
	});

	$(window).load(function() {

	});

	$(document).ready(function() {
		$("#btn_write").bind("click", function() {
			location.href = "./qna_inerstform.jsp";
		});
	});
</script>


</head>
<%
	// 질문 진행중

	// 질문 진행중 
	//dkswMemberNo

	//HttpSession session = request.getSession(false);
	//int mem_no = (int)session.getAttribute("dkswMemberNo");

	Context InitContext_ing = null;
	Context envContext_ing = null;
	DataSource ds_ing = null;
	Connection conn_ing = null;
	java.sql.Statement stmt_ing = null;
	ResultSet rs_ing = null;
	int num_ing = 0;

	//답변 완료
	Context InitContext_end = null;
	Context envContext_end = null;
	DataSource ds_end = null;
	Connection conn_end = null;
	java.sql.Statement stmt_end = null;
	ResultSet rs_end = null;
	int num_end = 0;

	//진행사항
	Context InitContext_ct = null;
	Context envContext_ct = null;
	DataSource ds_ct = null;
	Connection conn_ct = null;
	java.sql.Statement stmt_ct = null;
	ResultSet rs_ct = null;
	int num_ct = 0;
	
	int mem_no = 0;//멤버넘버 저장 변수
	HttpSession sessionMember = request.getSession();
%>


<body>
	<!-- Navigation -->
	<jsp:include page="../../commonNav.jsp" flush="false" />

	<!-- Header Section  -->
	<section class="background-bar-05-01 bg-center bg-cover">
		<div class="bg-filter">
			<div class="container section-lg">
				<h1 class="top-title">질문게시판</h1>
			</div>
		</div>
	</section>
	<c:if test="${sessionScope.dkswMemberCategory == '7' || sessionScope.dkswMemberCategory == '8' || sessionScope.dkswMemberCategory == '6'}">
		<!-- Content Section  -->
		<section class="section">
			<div class="container">
				<div class="row">
					<!-- Left Contents -->
					<!-- 학생 게시글 -->
					<c:if test="${sessionScope.dkswMemberCategory == '7' || sessionScope.dkswMemberCategory == '8'}">
						
						<div class="col-md-8 col-lg-9">
							<div class="bs-example"
								data-example-id="panel-without-body-with-table">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3>
											진행 및 완료사항
											<button type="button" class="btn btn-default btn-sm"
												aria-label="Right Align" style="float: right">
												<li id="btn_write"><span
													class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
													<span class="glyphicon-class">글쓰기</span></li>
											</button>
										</h3>
									</div>
									<div class="panel-body">
										<div class="panel panel-primary">
											<div class="panel-heading">
												<h3 class="panel-title">진행사항</h3>
											</div>
											<div class="panel-body">
												<%
													try {
																mem_no  = Integer.parseInt(sessionMember.getAttribute("dkswMemberNo").toString());
																InitContext_ct = new InitialContext();
																envContext_ct = (Context) InitContext_ct
																		.lookup("java:comp/env");
																ds_ct = (DataSource) envContext_ct.lookup("jdbc/mysql");
																conn_ct = ds_ct.getConnection();
																stmt_ct = conn_ct.createStatement();
																rs_ct = stmt_ct
																		.executeQuery("SELECT (SELECT count( * ) FROM dksw_qna_board WHERE qa_endCheck = 'N' and qa_QA = 'Q' and qa_writer = "+mem_no+ ") ing_ct, (SELECT count( * ) FROM dksw_qna_board WHERE qa_endCheck = 'Y'  and qa_writer = " +mem_no+" and qa_QA = 'Q')end_ct");

																while (rs_ct.next()) {
																	int ct_ing = rs_ct.getInt(1);
																	int ct_end = rs_ct.getInt(2);
																	float bar = (float) ct_end / ((float) ct_ing + (float) ct_end) * 100;
												%>
												<a href="./qna_ing.jsp?index_num=1">진행중 <span class="badge"><%=ct_ing%></span></a>
												<a href="./qna_end.jsp?index_num=1">완료 <span class="badge"><%=ct_end%></span></a>
											</div>
											<div class="progress">
												<div class="progress-bar" role="progressbar"
													aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
													style="width: <%=bar%>%;">
													<span class="sr-only"><%=bar%>% Complete</span>
												</div>
											</div>
											<%
												}
															rs_ct.close();
															stmt_ct.close();

														} catch (Exception e) {

														} finally {
															try {
																if (stmt_ct != null)
																	stmt_ct.close();
															} catch (Exception e) {
															}
															try {
																if (conn_ct != null)
																	conn_ct.close();
															} catch (Exception e) {
															}
														}
											%>
										</div>
										<div class="bs-example"
											data-example-id="panel-without-body-with-table">
											<div class="panel panel-warning">
												<!-- Default panel contents -->
												<div class="panel-heading">
													<h3 class="panel-title">답변 진행중</h3>
												</div>
												<!-- Table -->
												<table class="table">
													<thead>
														<tr>
															<th>#</th>
															<th>제목</th>
															<th>담당교수</th>
															<th>작성일</th>
														</tr>
													</thead>
													<tbody>
														<%
															try {
																		num_ing = 1;
																		InitContext_ing = new InitialContext();
																		envContext_ing = (Context) InitContext_ing
																				.lookup("java:comp/env");
																		ds_ing = (DataSource) envContext_ing
																				.lookup("jdbc/mysql");
																		conn_ing = ds_ing.getConnection();
																		stmt_ing = conn_ing.createStatement();
																		rs_ing = stmt_ing
																				.executeQuery("Select qa_title,(select dkswDepartmentProfessorNameKo from dksw_department_professor where qa_b.qa_pIdx=dkswMemberNo ) qa_pIdx, qa_regDate,qa_qIdx, qa_udtCheck_stu from dksw_qna_board qa_b where qa_endCheck = 'N' and qa_QA = 'Q' and qa_writer="+mem_no+" order by qa_qIdx DESC");

																		while ((rs_ing.next()) && (num_ing < 4)) {
																			String qa_title_ing = rs_ing.getString("qa_title");
																			String qa_pIdx_ing = rs_ing.getString("qa_pIdx");
																			String qa_regDate_ing = rs_ing.getString("qa_regDate");
																			String qa_qIdx_ing = rs_ing.getString("qa_qIdx");
																			String qa_udtCheck_stu = rs_ing.getString("qa_udtCheck_stu");
																			
																			if(qa_udtCheck_stu.equals("Y")){
														%>
														<tr>
															<th scope="row"><%=num_ing%></th>
															<td><i class="fa fa-commenting-o"></i><a href="./qna_viewcontent.jsp?aPIdx=<%=qa_qIdx_ing%>">&nbsp&nbsp<%=qa_title_ing%></a></td>
															<td><%=qa_pIdx_ing%></td>
															<td><%=qa_regDate_ing%></td>
														</tr>
														<%				
																			}
																			else if(qa_udtCheck_stu.equals("N")){
																				
																				
														%>
														<tr>
															<th scope="row"><%=num_ing%></th>
															<td><a href="./qna_viewcontent.jsp?aPIdx=<%=qa_qIdx_ing%>"><%=qa_title_ing%></a></td>
															<td><%=qa_pIdx_ing%></td>
															<td><%=qa_regDate_ing%></td>
														</tr>
														
														<%
																			}
														
																		num_ing++;
															}
																		rs_ing.close();
																		stmt_ing.close();

																	} catch (Exception e) {
																		out.println(e);

																	} finally {
																		try {
																			if (stmt_ing != null) {
																				if (num_ing == 1) {
														%>
														<tr>
															<th scope="row"><%=num_ing%></th>
															<td>해당 글이 없습니다.</td>

														</tr>
														<%
															}
																				stmt_ing.close();
																			}
																		} catch (Exception e) {
																		}
																		try {
																			if (conn_ing != null)
																				conn_ing.close();
																		} catch (Exception e) {
																		}
																	}

																	if (num_ing >= 4) {
														%>
														<button type="button"
															class="btn btn-primary btn-lg btn-block" onclick ="window.location ='qna_ing.jsp?index_num=1'">게시글 더 보기</button>
														<%
															}
														%>
													</tbody>

												</table>
											</div>
										</div>
										<div class="bs-example"
											data-example-id="panel-without-body-with-table">
											<div class="panel panel-success">
												<!-- Default panel contents -->
												<div class="panel-heading">
													<h3 class="panel-title">답변 완료</h3>
												</div>

												<!-- Table -->
												<table class="table">
													<thead id="end_table">
														<tr>
															<th>#</th>
															<th>제목</th>
															<th>담당교수</th>
															<th>작성일</th>
														</tr>
													</thead>
													<tbody>
														<%
															try {
																		num_end = 1; //변수 초기화
																		InitContext_end = new InitialContext();
																		envContext_end = (Context) InitContext_end
																				.lookup("java:comp/env");
																		ds_end = (DataSource) envContext_end
																				.lookup("jdbc/mysql");
																		conn_end = ds_end.getConnection();
																		stmt_end = conn_end.createStatement();
																		rs_end = stmt_end.executeQuery("Select qa_title,(select dkswDepartmentProfessorNameKo from dksw_department_professor where qa_b.qa_pIdx=dkswMemberNo ) qa_pIdx, qa_regDate,qa_qIdx from dksw_qna_board qa_b where qa_endCheck = 'Y' and qa_writer="+mem_no+" and qa_QA = 'Q' order by qa_qIdx DESC");	
														%>
														<%
															while ((rs_end.next())&&(num_end < 4)) {
																			String qa_title_end = rs_end.getString("qa_title");
																			String qa_pIdx_end = rs_end.getString("qa_pIdx");
																			String qa_regDate_end = rs_end.getString("qa_regDate");
																			String qa_qIdx_end = rs_end.getString("qa_qIdx");
																			
														%>

														<tr>
															<th scope="row"><%=num_end%></th>
															<td><a href="./qna_viewcontent_end.jsp?aPIdx=<%=qa_qIdx_end%>&"><%=qa_title_end%></a></td>
															<td><%=qa_pIdx_end%></td>
															<td><%=qa_regDate_end%></td>
														</tr>
														<%
															num_end++;
															}
																		rs_end.close();
																		stmt_end.close();

																	} catch (Exception e) {

																	} finally {
																		try {
																			if (stmt_end != null) {
																				if (num_end == 1) {
														%>
														<tr>
															<th scope="row"><%=num_end%></th>
															<td>해당 글이 없습니다.</td>

														</tr>
														<%
															}
																				stmt_end.close();
																			}
																		} catch (Exception e) {
																		}
																		try {
																			if (conn_end != null)
																				conn_end.close();
																		} catch (Exception e) {
																		}
																	}
																	if (num_end >= 4) {
														%>
														<tr>
															<button type="button" class="btn btn-info btn-block" onclick="window.location = 'qna_end.jsp?index_num=1'">게시글
																더 보기</button>
														</tr>
													</tbody>

													<%
														}
													%>

												</table>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<!-- 교수님 게시글 -->
					<c:if test="${sessionScope.dkswMemberCategory == '6'}">
						<div class="col-md-8 col-lg-9">
							<div class="bs-example"
								data-example-id="panel-without-body-with-table">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3>
											진행 및 완료사항
											
										</h3>
									</div>
									<div class="panel-body">
										<div class="panel panel-primary">
											<div class="panel-heading">
												<h3 class="panel-title">진행사항</h3>
											</div>
											<div class="panel-body">
												<%
													try {
																mem_no  = Integer.parseInt(sessionMember.getAttribute("dkswMemberNo").toString());
																InitContext_ct = new InitialContext();
																envContext_ct = (Context) InitContext_ct
																		.lookup("java:comp/env");
																ds_ct = (DataSource) envContext_ct.lookup("jdbc/mysql");
																conn_ct = ds_ct.getConnection();
																stmt_ct = conn_ct.createStatement();
																rs_ct = stmt_ct
																		.executeQuery("SELECT (SELECT count( * ) FROM dksw_qna_board WHERE qa_endCheck = 'N' and qa_QA = 'Q' and qa_PIdx = "+mem_no+ ") ing_ct, (SELECT count( * ) FROM dksw_qna_board WHERE qa_endCheck = 'Y' and qa_pIdx = " +mem_no+" and qa_QA = 'Q')end_ct");

																while (rs_ct.next()) {
																	int ct_ing = rs_ct.getInt(1);
																	int ct_end = rs_ct.getInt(2);
																	float bar = (float) ct_end
																			/ ((float) ct_ing + (float) ct_end) * 100;
												%>
												<a href="./qna_ing.jsp?index_num=1">진행중 <span class="badge"><%=ct_ing%></span></a>
												<a href="./qna_end.jsp?index_num=1">완료 <span class="badge"><%=ct_end%></span></a>
											</div>
											<div class="progress">
												<div class="progress-bar" role="progressbar"
													aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
													style="width: <%=bar%>%;">
													<span class="sr-only"><%=bar%>% Complete</span>
												</div>
											</div>
											<%
												}
															rs_ct.close();
															stmt_ct.close();

														} catch (Exception e) {

														} finally {
															try {
																if (stmt_ct != null)
																	stmt_ct.close();
															} catch (Exception e) {
															}
															try {
																if (conn_ct != null)
																	conn_ct.close();
															} catch (Exception e) {
															}
														}
											%>
										</div>
										<div class="bs-example"
											data-example-id="panel-without-body-with-table">
											<div class="panel panel-warning">
												<!-- Default panel contents -->
												<div class="panel-heading">
													<h3 class="panel-title">답변 진행중</h3>
												</div>
												<!-- Table -->
												<table class="table">
													<thead>
														<tr>
															<th>#</th>
															<th>제목</th>
															<th>작성학생</th>
															<th>작성일</th>
														</tr>
													</thead>
													<tbody>
														<%
															try {
																		num_ing = 1; //변수 초기화
																		InitContext_ing = new InitialContext();
																		envContext_ing = (Context) InitContext_ing
																				.lookup("java:comp/env");
																		ds_ing = (DataSource) envContext_ing
																				.lookup("jdbc/mysql");
																		conn_ing = ds_ing.getConnection();
																		stmt_ing = conn_ing.createStatement();
																		rs_ing = stmt_ing.executeQuery("Select Qa_title,(select dkswMemberName from dksw_member where qa_b.qa_writer=dkswMemberNo ) qa_writer, qa_regDate, qa_aPIdx, qa_udtCheck_pf from dksw_qna_board qa_b where qa_endCheck = 'N' and qa_QA = 'Q' and qa_pIdx="+mem_no+" order by qa_aPIdx DESC");
																				

																		while ((rs_ing.next()) && (num_ing < 4)) {
																			String qa_title_ing = rs_ing.getString("qa_title");
																			String qa_writer_ing = rs_ing.getString("qa_writer");
																			String qa_regDate_ing = rs_ing.getString("qa_regDate");
																			String qa_aPIdx_ing = rs_ing.getString("qa_aPIdx");
																			String qa_udtCheck_pf = rs_ing.getString("qa_udtCheck_pf");
																			
																			if(qa_udtCheck_pf.equals("Y")){
																			
														%>
														<tr>
															<th scope="row"><%=num_ing%></th>
															<td><i class="fa fa-commenting-o"></i><a href="./qna_viewcontent.jsp?aPIdx=<%=qa_aPIdx_ing%>">&nbsp&nbsp<%=qa_title_ing%></a></td>
															<td><%=qa_writer_ing%></td>
															<td><%=qa_regDate_ing%></td>
														</tr>
														<%
																			}
																			else if(qa_udtCheck_pf.equals("N")){
														%>
														<tr>
															<th scope="row"><%=num_ing%></th>
															<td><a href="./qna_viewcontent.jsp?aPIdx=<%=qa_aPIdx_ing%>"><%=qa_title_ing%></a></td>
															<td><%=qa_writer_ing%></td>
															<td><%=qa_regDate_ing%></td>
														</tr>
														<%
																			}
															num_ing++;
															}
																		rs_ing.close();
																		stmt_ing.close();

																	} catch (Exception e) {
																		out.println(e);

																	} finally {
																		try {
																			if (stmt_ing != null) {
																				if (num_ing == 1) {
														%>
														<tr>
															<th scope="row"><%=num_ing%></th>
															<td>해당 글이 없습니다.</td>

														</tr>
														<%
															}
																				stmt_ing.close();
																			}
																		} catch (Exception e) {
																		}
																		try {
																			if (conn_ing != null)
																				conn_ing.close();
																		} catch (Exception e) {
																		}
																	}
																	if (num_ing >= 4) {
														%>
														<tr>
															<button type="button" class="btn btn-info btn-block" onclick="window.location = 'qna_ing.jsp?index_num=1'">게시글
																더 보기</button>
														</tr>
													</tbody>

													<%
														}
													%>


												</table>
											</div>
										</div>
										<div class="bs-example"
											data-example-id="panel-without-body-with-table">
											<div class="panel panel-success">
												<!-- Default panel contents -->
												<div class="panel-heading">
													<h3 class="panel-title">답변 완료</h3>
												</div>

												<!-- Table -->
												<table class="table">
													<thead id="end_table">
														<tr>
															<th>#</th>
															<th>제목</th>
															<th>작성학생</th>
															<th>작성일</th>
														</tr>
													</thead>
													<tbody>
														<%
															try {
																		num_end = 1; //변수초기화
																		InitContext_end = new InitialContext();
																		envContext_end = (Context) InitContext_end
																				.lookup("java:comp/env");
																		ds_end = (DataSource) envContext_end
																				.lookup("jdbc/mysql");
																		conn_end = ds_end.getConnection();
																		stmt_end = conn_end.createStatement();
																		rs_end = stmt_end.executeQuery("Select qa_title,(select dkswMemberName from dksw_member where qa_b.qa_writer=dkswMemberNo ) qa_writer, qa_regDate, qa_aPIdx from dksw_qna_board qa_b where qa_endCheck = 'Y' and qa_pIdx="+mem_no+" and qa_QA = 'Q' order by qa_aPIdx DESC");
																				
														%>
														<%
															while ((rs_end.next())&&(num_end < 4)) {
																			String qa_title_end = rs_end.getString("qa_title");
																			String qa_pIdx_end = rs_end.getString("qa_writer");
																			String qa_regDate_end = rs_end.getString("qa_regDate");
																			String qa_aPIdx_end = rs_end.getString("qa_aPIdx");
																			
														%>

														<tr>
															<th scope="row"><%=num_end%></th>
															<td><a href="./qna_viewcontent_end.jsp?aPIdx=<%=qa_aPIdx_end%>"><%=qa_title_end%></a></td>
															<td><%=qa_pIdx_end%></td>
															<td><%=qa_regDate_end%></td>
														</tr>
														<%
															num_end++;
															}
																		rs_end.close();
																		stmt_end.close();

																	} catch (Exception e) {

																	} finally {
																		try {
																			if (stmt_end != null) {
																				if (num_end == 1) {
														%>
														<tr>
															<th scope="row"><%=num_end%></th>
															<td>해당 글이 없습니다.</td>

														</tr>
														<%
															}
																				stmt_end.close();
																			}
																		} catch (Exception e) {
																		}
																		try {
																			if (conn_end != null)
																				conn_end.close();
																		} catch (Exception e) {
																		}
																	}
																	if (num_end >= 4) {
														%>
														<tr>
															<button type="button" class="btn btn-info btn-block" onclick="window.location = 'qna_end.jsp?index_num=1'">게시글
																더 보기</button>
														</tr>
													</tbody>

													<%
														}
													%>

												</table>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>


					<!-- Right Contents -->
					<div class="col-md-4 col-lg-3 hidden-sm hidden-xs">
						<!-- Search Box -->
					<form  method=post action="qna_search.jsp?index_num=1" class="form-inline">
						<div class="simple-box ">
							<div class="input-group form-lg " role="search">
									<input type="text" class="form-control"
										placeholder="Search Word" name="word" /> <span class="input-group-btn">
										<button class="btn btn-primary" title="Search" type="submit">
											<i class="fa fa-search"></i>
										</button>
										</span>
							</div>
						</div>
					</form>
						<div class="categories simple-box">
							<h3>Categories</h3>
							<ul class="list-unstyled">
								<li><i class="fa fa-angle-right fa-fw"></i><a
									href="./index.jsp" title="Category Business">메인</a></li>
								<li><i class="fa fa-angle-right fa-fw"></i><a
									href="./qna_ing.jsp?index_num=1" title="Category Business">답변 진행중</a></li>
								<li><i class="fa fa-angle-right fa-fw"></i><a
									href="./qna_end.jsp?index_num=1" title="Category photos">답변 완료</a></li>
							</ul>
						</div>

					</div>
				</div>

			</div>
		</section>
	</c:if>
	<!--Back to top-->
	<a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>

	<!-- Side Menu -->
	<jsp:include page="../../commonSidebar.jsp" flush="false" />

	<!-- Footer-->
	<jsp:include page="../../commonFooter.jsp" flush="false" />

	<div id="ascrail2000" class="nicescroll-rails"
		style="width: 8px; z-index: 999999; position: fixed; top: 0px; height: 100%; right: 0px; cursor: default; opacity: 0; background: rgb(221, 221, 221);">
		<div
			style="position: relative; float: right; width: 8px; border: none; border-radius: 0px; height: 218px; top: 0px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>

	<div id="ascrail2000-hr" class="nicescroll-rails"
		style="height: 8px; z-index: 999999; position: fixed; left: 0px; width: 100%; bottom: 0px; cursor: default; display: none; opacity: 0; background: rgb(221, 221, 221);">
		<div
			style="position: relative; top: 0px; height: 8px; border: none; border-radius: 0px; width: 1396px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>

</body>
</html>

