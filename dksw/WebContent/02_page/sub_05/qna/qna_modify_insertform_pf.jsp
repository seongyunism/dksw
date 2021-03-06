<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ page import="javax.sql.DataSource"%> 

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">

<script type="text/javascript" >
	/*값이 입력 안된부분 알림*/
	function writeCheck()
	{
	var form = document.writeform;
	if(!form.qa_content.value)
	 {
	  alert( "내용을 적어주세요" );
	  form.qa_content.focus();
	  return;
	 }
	form.submit();
	}
	$(document).ready(function(){
		$("#insert_cancel").bind("click",function(){
			history.back();
		});
	
	});
	
</script>
<%
String qa_idx = request.getParameter("qa_idx");

Context InitContext = null;
Context envContext = null;
DataSource ds = null;
Connection conn = null;
java.sql.Statement stmt = null;
ResultSet rs = null;

String get_contents = null;
String get_title = null;

try {
	InitContext = new InitialContext();
	envContext = (Context) InitContext.lookup("java:comp/env");
	ds = (DataSource) envContext.lookup("jdbc/mysql");
	conn = ds.getConnection();
	stmt = conn.createStatement();
	rs = stmt.executeQuery("Select qa_title ,qa_contents from dksw_qna_board where qa_idx="+qa_idx+"");

if(rs.next()){
	get_contents = rs.getString("qa_contents");
	get_contents = get_contents.replaceAll("<br>", "\r\n");
 	get_contents = get_contents.replaceAll("&nbsp;", "\u0020");
	get_title = rs.getString("qa_title");
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



<head>
	<title>단국대학교 소프트웨어학과 | 질문게시판</title>

	<jsp:include page="../../commonHeader.jsp" flush="false" />

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
					<div class="panel panel-default">
						<!-- Default panel contents -->
						<div class="panel-heading">
							<h3>답변작성</h3>
						</div>
						<form class="form-horizontal" name=writeform method=post action="qna_modify_accept_pf.jsp?qa_idx=<%=qa_idx%>&qa_title=<%=get_title%>">
							<div class="form-group">
								<div class="col-sm-10">
										<h3><b><%=get_title %></b></h3>
								</div>
							</div>
							<div class="form-group">
						
								<div class="col-sm-10">
									<textarea class="col-md-8 form-control" rows="6" name ="qa_content"
										><%=get_contents%></textarea>
								</div>
							</div>
							<div class="form-group" >
								<div class="col-sm-5" style="float:right">
									<div class="btn-right group" role="group" aria-label="...">
										<button type="button" class="btn btn-success default" OnClick="javascript:writeCheck();">등록</button>
										<button type="button" class="btn btn-danger default" id="insert_cancel">취소</button>
										
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>


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
<script>
	var k;

	$(document).ready(function(){
		$("#insert_cancel").bind("click",function(){
			location.href= "./index.jsp";
		});
		$("#")
	});


</script>	

</body>


</html>