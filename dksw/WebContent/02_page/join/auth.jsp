<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String inputMemberOnlineAuthCode = (request.getParameter("authCode") != null) ? request.getParameter("authCode") : null; %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<title>단국대학교 소프트웨어학과 | 회원가입</title>
	
	<jsp:include page="../commonHeader.jsp" flush="false" />
	
	<!-- Custom Scripts -->
	<script>
	$(document).ready(function() {
		onlineAuthCode('<%=inputMemberOnlineAuthCode%>');
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
    <section class="bg-8 bg-center bg-cover section-fxd">
        <div class="bg-filter">
            <div class="hv-center">
                
				<!-- 온라인 인증코드 관련 메시지 -->
	            <div class="sign-up" style="text-align:center; color:#555555;">
					<h4 class="txtStatus-onlineAuthCode">처리중입니다.</h4>
				</div>
	
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