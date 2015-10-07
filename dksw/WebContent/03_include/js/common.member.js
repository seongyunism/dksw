/******************************************************
 * 회원 가입 페이지 공통 스크립트
 ******************************************************/

// 회원가입 처리
function joinMember() {
	var memberCategory = $("input[name='inputMemberCategory']:checked").val();

	// 학부생일 경우 오프라인 인증코드 입력
	if(memberCategory == 7 && checkOfflineAuthCode == false) {
		$(".join-form").slideUp();
		$(".offline-auth").slideDown();
		checkOfflineAuthCode = true;
		return;
	}
	
	var action = "/dksw/member?action=joinMember";	
	var form_data = {
		inputMemberCategory : memberCategory,
		inputMemberName : $("input[name='inputMemberName']").val(),
		inputMemberEmail : $("input[name='inputMemberEmail']").val(),
		inputMemberPassword : $("input[name='inputMemberPassword']").val(),
		inputMemberStudentNo : $("input[name='inputMemberStudentNo']").val(), 
		inputMemberOfflineAuthCode : $("div.offline-auth-code input").val()
	};
	
	$.ajax({
		type : "POST",
		url : action,
		data : form_data,
		dataType : "text",
		success: function(response) {
			if(response == "JoinOK") {
				checkOfflineAuthCode = false;
				$("div.offline-auth-code input").val("");
				location.reload(true);
			} else if(response == "Fail") {
				alert("회원가입에 실패하였습니다.");
			}
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
	
}

// 오프라인 인증코드 확인
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
				joinMember();
			} else if(response == "Fail") {
				alert("잘못된 코드입니다.\n학과 오프라인 게시판을 확인해주시기 바랍니다.");
			}
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
}
