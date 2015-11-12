<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ page import="javax.sql.DataSource"%> 

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">
<%
Context InitContext_pfN = null;
Context envContext_pfN = null;
DataSource ds_pfN = null;
Connection conn_pfN = null;
java.sql.Statement stmt_pfN = null;
ResultSet rs_pfN = null;
int num_pfN = 0;


try {
	InitContext_pfN = new InitialContext();
	envContext_pfN = (Context) InitContext_pfN.lookup("java:comp/env");
	ds_pfN = (DataSource) envContext_pfN.lookup("jdbc/mysql");
	conn_pfN = ds_pfN.getConnection();
	stmt_pfN = conn_pfN.createStatement();
	rs_pfN = stmt_pfN.executeQuery("SELECT dkswDepartmentProfessorNameKo FROM `dksw_department_professor` ORDER BY`dkswDepartmentProfessorNo` ASC ");
%>
<script type="text/javascript" >
	/*값이 입력 안된부분 알림*/
	function writeCheck()
	{
	 var form = document.writeform;
	 if( !form.title.value )   // form 에 있는 name 값이 없을 때
	 {
	  alert( "제목을 적어주세요" ); // 경고창 띄움
	  form.title.focus();   // form 에 있는 name 위치로 이동
	  return;
	 }
	 
	 if(form.pf.value=="교수님" )
	 {
	  alert( "담당교수님을 선택해주세요" );
	  form.pf.focus();
	  return;
	 }
	 
	if(!form.qa_content.value)
	 {
	  alert( "내용을 적어주세요" );
	  form.qa_content.focus();
	  return;
	 }
	form.submit();
	}
</script>




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
							<h3>질문작성</h3>
						</div>
						<form class="form-horizontal" name=writeform method=post action="qna_insert_accept.jsp">
							<div class="form-group">
								<select class="lecture-year"  name="pf" style="text-align:center;"
											>
											<option >교수님</option>
											<%
											while (rs_pfN.next()) {
														String pfN = rs_pfN.getString("dkswDepartmentProfessorNameKo");
											%>
											
											<option role="presentation"><a role="menuitem" tabindex="-1"
												href="#" name="pf_sel" alt="<%=pfN%>>"><%=pfN %></a></option>

											<%
											num_pfN++;
											}
											rs_pfN.close();
											stmt_pfN.close();
			

											} catch (Exception e) {
												out.println(e);
												
											} finally {
												try {
													if (stmt_pfN != null)
														stmt_pfN.close();
												} catch (Exception e) {
												}
												try {
													if (conn_pfN != null)
														conn_pfN.close();
												} catch (Exception e) {
												}
											}
											%>
											
								</select>
								<div class="col-sm-10">
										<input type="text" class="form-control" id="inputTitle" name ="title"
										placeholder="제목">
								</div>
							</div>
							<div class="form-group">
						
								<div class="col-sm-10">
									<textarea class="col-md-8 form-control" rows="6" name ="qa_content"
										placeholder="내용을입력해주세요"></textarea>
								</div>
							</div>
							<div class="form-group" >
								<div class="col-sm-5" style="float:right">
									<div class="btn-right group" role="group" aria-label="...">
										<button type="button" class="btn btn-success default" OnClick="javascript:writeCheck();">등록</button>
										<button type="button" class="btn btn-danger default" id="insert_cancel">취소</button>
										<button type="button" class="btn btn-warning default" id="insert_cancel">임시보관</button>
									</div>
								</div>
							</div>
						</form>
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