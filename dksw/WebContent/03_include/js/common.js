// [회원 가입 페이지] 오프라인 인증코드 확인
function offlineAuthCode() {
	
	var action = "/dksw/member?action=checkOfflineAuthCode";
	var inputOfflineAuthCode = "inputOfflineAuthCode=" + $("div.offline-auth-code input").val();
	
	$.ajax({
		type : "POST",
		url : action,
		data : inputOfflineAuthCode,
		dataType : "text",
		success: function(response) {
			if(response == "Checked") {
				$(".offline-auth").slideUp();
				$("form.icon").slideDown();
			} else if(response == "Fail") {
				alert("잘못된 코드입니다.\n학과 오프라인 게시판을 확인해주시기 바랍니다.");
			}
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
}

function navLab(num) {
	var src = "/dksw/02_page/sub_03/index.jsp?labCode=" + num;
	
	location.href = src;
}