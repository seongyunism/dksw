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
		$("#insert_cancel").bind("click",function(){
			history.back();
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
int qa_idx = 0;


int num = 0;
String qa_title = null;
String qa_pIdx = null;
String qa_regDate = null;
int qa_qIdx = 0;
String qa_writer = null;
String qa_contents = null;


HttpSession sessionMember = request.getSession();
num = Integer.parseInt(request.getParameter("aPIdx"));

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
<c:if test="${sessionScope.dkswMemberCategory == '7' || sessionScope.dkswMemberCategory == '8' || sessionScope.dkswMemberCategory == '6'}">
    <!-- Content Section  -->
    <section class="section">
        <div class="container">
            <div class="row">
                <c:if test="${sessionScope.dkswMemberCategory == '7' || sessionScope.dkswMemberCategory == '8'}">
                <!-- Left Contents -->
                <%
        		try {
    				mem_no  = Integer.parseInt(sessionMember.getAttribute("dkswMemberNo").toString());
    				InitContext = new InitialContext();
    				envContext = (Context) InitContext.lookup("java:comp/env");
    				ds = (DataSource) envContext.lookup("jdbc/mysql");
    				conn = ds.getConnection();
    				stmt = conn.createStatement();
    				rs = stmt.executeQuery("SELECT qa_idx, (select dkswMemberName from dksw_member where qa_b.qa_writer=dkswMemberNo) qa_writer,(select dkswDepartmentProfessorNameKo from dksw_department_professor where qa_b.qa_pIdx=dkswMemberNo) qa_pIdx, qa_regDate, qa_qIdx, qa_title, qa_contents FROM dksw_qna_board qa_b WHERE qa_writer =" +mem_no+ " and qa_qIdx= "+num);
    					
    				if(rs.next()){
    				qa_idx = rs.getInt("qa_idx");
    				qa_title = rs.getString("qa_title");
    				qa_pIdx = rs.getString("qa_pIdx");
    				qa_regDate = rs.getString("qa_regDate");
    				qa_qIdx = rs.getInt("qa_qIdx");
    				qa_writer = rs.getString("qa_writer");
    				qa_contents = rs.getString("qa_contents");

    					
                %>  
                 <div class="col-md-8 col-lg-9">
				<div class="row">
					<div class="col-md-2">
						<p class="bg-primary text-center">작성자</p>
					</div>
					<div class="col-md-2"><%=qa_writer %></div>
					<div class="col-md-2" ><p class="bg-primary text-center">담당교수</p></div>
					<div class="col-md-2"><%=qa_pIdx %></div>
					<div class="col-md-2" ><p class="bg-primary text-center">작성날짜</p></div>
					<div class="col-md-2"><%=qa_regDate %></div>
				</div>
				<div class="row">
					<div class="col-md-12"><h4><b><%=qa_title %></b></h4></div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="bs-example" data-example-id="body-copy">
						<%=qa_contents %>
						</div>
					</div>
				</div>
				<div><br/></div>
				<div><br/></div>
			<%
	
				
			}
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
			
			try {
				mem_no  = Integer.parseInt(sessionMember.getAttribute("dkswMemberNo").toString());
				InitContext = new InitialContext();
				envContext = (Context) InitContext.lookup("java:comp/env");
				ds = (DataSource) envContext.lookup("jdbc/mysql");
				conn = ds.getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery("SELECT qa_idx, (select dkswMemberName from dksw_member where qa_b.qa_writer=dkswMemberNo) qa_writer,(select dkswDepartmentProfessorNameKo from dksw_department_professor where qa_b.qa_pIdx=dkswMemberNo) qa_pIdx, qa_regDate, qa_qIdx, qa_title, qa_contents FROM dksw_qna_board qa_b WHERE qa_writer =" +mem_no+ " and qa_qIdx= "+num+" and qa_QA = 'A' order by qa_idx");
					
				while(rs.next()){
				qa_idx = rs.getInt("qa_idx");
				qa_title = rs.getString("qa_title");
				qa_pIdx = rs.getString("qa_pIdx");
				qa_regDate = rs.getString("qa_regDate");
				qa_qIdx = rs.getInt("qa_qIdx");
				qa_writer = rs.getString("qa_writer");
				qa_contents = rs.getString("qa_contents");
				
				%>
					<div class="panel panel-default">
						<!-- Default panel contents -->
						<div class="panel-heading"><%=qa_title %></div>
						<div class="panel-body">
							<p><%=qa_contents %></p>
						</div>
						<!-- Table -->
						<table class="table">
							<tr>
								<th>작성자&nbsp&nbsp:&nbsp&nbsp<%=qa_writer %></th>
								<th>작성일&nbsp&nbsp:&nbsp&nbsp<%=qa_regDate %></th>
							</tr>
						</table>
					</div>
				<%
							
				}
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
					
					<div class="row">
					<div class="form-group" >
								<div class="col-sm-1" style="float:right">
									<div class="btn-right group" role="group" aria-label="...">
										<button type="button" class="btn btn-danger default btn-sm" id="insert_cancel">취소</button>
									</div>
								</div>
					</div>
				</div>
				
		</div>
		</c:if>
		<c:if test="${sessionScope.dkswMemberCategory == '6'}">
                <!-- Left Contents -->
                <%
                try {
    				mem_no  = Integer.parseInt(sessionMember.getAttribute("dkswMemberNo").toString());
    				InitContext = new InitialContext();
    				envContext = (Context) InitContext.lookup("java:comp/env");
    				ds = (DataSource) envContext.lookup("jdbc/mysql");
    				conn = ds.getConnection();
    				stmt = conn.createStatement();
    				rs = stmt.executeQuery("SELECT qa_idx, (select dkswMemberName from dksw_member where qa_b.qa_writer=dkswMemberNo) qa_writer,(select dkswDepartmentProfessorNameKo from dksw_department_professor where qa_b.qa_pIdx=dkswMemberNo) qa_pIdx, qa_regDate, qa_qIdx, qa_title, qa_contents FROM dksw_qna_board qa_b WHERE qa_pIdx =" +mem_no+ " and qa_aPIdx= "+num);
    					
    				if(rs.next()){
    				qa_idx = rs.getInt("qa_idx");
    				qa_title = rs.getString("qa_title");
    				qa_pIdx = rs.getString("qa_pIdx");
    				qa_regDate = rs.getString("qa_regDate");
    				qa_qIdx = rs.getInt("qa_qIdx");
    				qa_writer = rs.getString("qa_writer");
    				qa_contents = rs.getString("qa_contents");
                
                %>
                 <div class="col-md-8 col-lg-9">
				<div class="row">
					<div class="col-md-2">
						<p class="bg-primary text-center">작성자</p>
					</div>
					<div class="col-md-2"><%=qa_writer %></div>
					<div class="col-md-2" ><p class="bg-primary text-center">담당교수</p></div>
					<div class="col-md-2"><%=qa_pIdx %></div>
					<div class="col-md-2" ><p class="bg-primary text-center">작성날짜</p></div>
					<div class="col-md-2"><%=qa_regDate %></div>
					<div></div>
					<div></div>
					<div></div>
				</div>
				<div class="row">
					<div class="col-md-12"><h4><b><%=qa_title %></b></h4></div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="bs-example" data-example-id="body-copy">
						<%=qa_contents %>
						</div>
					</div>
				</div>
				<div><br/></div>
				<div><br/></div>
			<%
				
			}
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
			
			try {
				mem_no  = Integer.parseInt(sessionMember.getAttribute("dkswMemberNo").toString());
				InitContext = new InitialContext();
				envContext = (Context) InitContext.lookup("java:comp/env");
				ds = (DataSource) envContext.lookup("jdbc/mysql");
				conn = ds.getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery("SELECT qa_idx, (select dkswMemberName from dksw_member where qa_b.qa_writer=dkswMemberNo) qa_writer,(select dkswDepartmentProfessorNameKo from dksw_department_professor where qa_b.qa_pIdx=dkswMemberNo) qa_pIdx, qa_regDate, qa_qIdx, qa_title, qa_contents FROM dksw_qna_board qa_b WHERE qa_pIdx =" +mem_no+ " and qa_aPIdx= "+num+" and qa_QA = 'A' order by qa_idx");
					
				while(rs.next()){
				qa_idx = rs.getInt("qa_idx");
				qa_title = rs.getString("qa_title");
				qa_pIdx = rs.getString("qa_pIdx");
				qa_regDate = rs.getString("qa_regDate");
				qa_qIdx = rs.getInt("qa_qIdx");
				qa_writer = rs.getString("qa_writer");
				qa_contents = rs.getString("qa_contents");
				
				%>
					<div class="panel panel-default">
						<!-- Default panel contents -->
						<div class="panel-heading"><%=qa_title %></div>
						<div class="panel-body">
							<p><%=qa_contents %></p>
						</div>
						<!-- Table -->
						<table class="table">
							<tr>
								<th>작성자&nbsp&nbsp:&nbsp&nbsp<%=qa_writer %></th>
								<th>작성일&nbsp&nbsp:&nbsp&nbsp<%=qa_regDate %></th>
							</tr>
						</table>
					</div>
				<%
							
				}
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
					
					<div class="row">
					<div class="form-group" >
								<div class="col-sm-1" style="float:right">
									<div class="btn-right group" role="group" aria-label="...">
										<button type="button" class="btn btn-danger default btn-sm" id="insert_cancel">취소</button>
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
					    	<li><i class="fa fa-angle-right fa-fw"></i><a href="./index.jsp" title="Category Business">메인</a></li>
					        <li><i class="fa fa-angle-right fa-fw"></i><a href="./qna_ing.jsp?index_num=1" title="Category Business">답변 진행중</a></li>
					        <li><i class="fa fa-angle-right fa-fw"></i><a href="./qna_end.jsp?index_num=1" title="Category photos">답변 완료</a></li>
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