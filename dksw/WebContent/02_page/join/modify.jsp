<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String inputMemberEmail = (request.getParameter("inputMemberEmail") != null) ? request.getParameter("inputMemberEmail") : null; %>
<%
	if(inputMemberEmail.isEmpty()) {
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<title>단국대학교 소프트웨어학과 | 초기 비밀번호 변경</title>
	
	<jsp:include page="../commonHeader.jsp" flush="false" />
	
	<!-- Custom Scripts -->
	<script>
	$(document).ready(function() {

	});

	$(window).load(function() {

	});
	
	$(function() {

	});
	</script>
</head>

<body>
    <!-- Navigation -->
	<jsp:include page="../commonNav.jsp" flush="false"/>

	<!-- Sign Up Section -->
    <section class="background-bar-join bg-center bg-cover section-fxd">
        <div class="bg-filter">
            <div class="hv-center">
                
                <form method="post">
                	<input type="hidden" name="inputMemberEmail" value="<%=inputMemberEmail%>" />
                
		            <div class="sign-up" style="text-align:center; color:#555555;">
		            	<div class="col-md-9" style="padding:0px;"><input type="password" name="inputMemberPassword" class="form-control text-center" placeholder="변경할 비밀번호를 입력하시오." /></div>
		            	<div class="col-me-3"><button type="button" class="btn btn-success" onclick="modifyInitialPassword()"><i class="fa fa-check"></i>서버로 전송</button></div>
					</div>
				</form>
            </div>
        </div>
    </section>

    <!-- Back to top-->
	<a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>

	<!-- Side Menu -->
	<jsp:include page="../commonSidebar.jsp" flush="false"/>
	
	<div id="ascrail2000" class="nicescroll-rails" style="width: 8px; z-index: 999999; position: fixed; top: 0px; height: 100%; right: 0px; cursor: default; display: none; background: rgb(221, 221, 221);">
		<div style="position: relative; top: 0px; float: right; width: 8px; height: 0px; border: none; border-radius: 0px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>
	
	<div id="ascrail2000-hr" class="nicescroll-rails" style="height: 8px; z-index: 999999; position: fixed; left: 0px; width: 100%; bottom: 0px; cursor: default; display: none; background: rgb(221, 221, 221);">
		<div style="position: relative; top: 0px; height: 8px; width: 0px; border: none; border-radius: 0px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>

</body>
</html>