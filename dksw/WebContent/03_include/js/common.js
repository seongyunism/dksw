/******************************************************
 * 전체 페이지 공통 스크립트
 ******************************************************/

// Google Analytics -->
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
ga('create', 'UA-68083185-1', 'auto');
ga('send', 'pageview');

//페이지 권한 정보 가져오기
function initializePermission(id) {

	var action = "/dksw/admin?action=getPermission";
	var inputAdminPermissionId = "inputAdminPermissionId=" + id;
	
	$.ajax({
		type : "POST",
		url : action,
		data : inputAdminPermissionId,
		dataType : "text",
		success: function(response) {
			if(response == "ApproveOK") {
				$("#writeBtn, #writeForm").show();				
			} else {
				$("#writeBtn, #writeForm").hide();								
			}
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
}

function nav() {
	
	location.href ="/dksw/02_page/sub_01/department_info/index.jsp"
	
	
}