/******************************************************
 * 회원 가입 페이지 공통 스크립트
 ******************************************************/

// 회원가입 처리
function joinMember() {
	
	// 입력폼 검사
	if(!checkInputForm()) {
		return false;
	}

	var memberCategory = $("input[name='inputMemberCategory']:checked").val();
	
	// 학부생일 경우 오프라인 인증 후 온라인 인증 처리
	if(memberCategory == 7) {
		if(checkOfflineAuthCode == true) { // 오프라인 인증코드가 입력된 경우 온라인 인증
			onlineAuth();
		} else { // 오프라인 인증코드 입력폼 열기			
			$(".join-form").slideUp();
			$(".offline-auth").slideDown();
			return;
		}
		
	// 교수, 졸업생, 일반인일 경우 온라인 인증 처리
	} else if(memberCategory == 6 || memberCategory == 8 || memberCategory == 9) {
		onlineAuth();
		
	// 예외처리
	} else {
		alert("잘못된 접근입니다.");
	}
}

// 입력폼 검사
function checkInputForm() {
	
	if($("input[name='inputMemberName']").val() == "") {
		alert("이름(실명)을 입력하세요.");
		return false;
	}
	
	switch(checkEmailAddr) {
		case 1:
			break;
		case 2:
			alert("이미 등록된 이메일 주소입니다.");
			return false;
		case 3:
			alert("올바른 형식의 이메일 주소가 아닙니다.");
			return false;
		case 4:
			alert("잘못 입력하셨습니다.");
			return false;
		default:
			alert("잘못 입력하셨습니다.");
			return false;
	}	
	
	if($("input[name='inputMemberPassword']").val() == "") {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	
	if($("input[name='inputMemberCategory']:checked").val() == '7' && $("input[name='inputMemberStudentNo']").val() < 10000000) {
		alert("올바른 학번을 입력하세요.");	
		return false;
	}
	
	if($("input[name='inputMemberCategory']:checked").val() == '8' && $("input[name='inputMemberStudentNo']").val() < 10000000) {
		alert("올바른 학번을 입력하세요.");	
		return false;
	}
	
	return true;
}

// 실시간 이메일 중복 체크
function checkEmail() {
	
	var action = "/dksw/member?action=checkEmail";
	var inputMemberEmail = "inputMemberEmail=" + $("input[name='inputMemberEmail']").val();

	$.ajax({
		type : "POST",
		url : action,
		data : inputMemberEmail,
		dataType : "text",
		success: function(response) {
			if(response == "EmailOK") { // 사용 가능
				checkEmailAddr = 1;
				$(".txtStatus").html("<span class='txtStatus-yellow'>사용 가능한 이메일 주소입니다.</span>");
			} else if(response == "Redundancy") { // 중복된 이메일 주소
				checkEmailAddr = 2;
				$(".txtStatus").html("<span class='txtStatus-red'>이미 등록된 이메일 주소입니다.</span>");
			} else if(response == "NotEmail") { // 잘못된 이메일 주소
				checkEmailAddr = 3;
				$(".txtStatus").html("<span class='txtStatus-red'>올바른 형식의 이메일 주소가 아닙니다.</span>");
			} else {
				checkEmailAddr = 4;
				$(".txtStatus").html("<span class='txtStatus-red'>잘못 입력하셨습니다.</span>");
			}
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
	
}

// 오프라인 인증
function offlineAuthCode() {
	
	var action = "/dksw/member?action=checkOfflineAuthCode";
	var inputOfflineAuthCode = "inputOfflineAuthCode=" + $("div.offline-auth-code input").val();
	
	$.ajax({
		type : "POST",
		url : action,
		data : inputOfflineAuthCode,
		dataType : "text",
		success: function(response) {
			if(response == "offlineAuthChecked") {
				checkOfflineAuthCode = true;
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

// 온라인 인증
function onlineAuth() {
	
	var action = "/dksw/member?action=checkOnlineAuth";	
	var form_data = {
		inputMemberCategory : $("input[name='inputMemberCategory']:checked").val(),
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
			if(response == "onlineAuthChecked") {
				checkOfflineAuthCode = false;
				$("div.offline-auth-code input").val("");

				$(".join-form").slideUp();
				$(".offline-auth").slideUp();
				$(".online-auth").slideDown();
			} else if(response == "Fail") {
				alert("회원가입에 실패하였습니다.");
			}
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
	
	return false;
}

function onlineAuthCode(inputCode) {
	
	if(inputCode == "null") {
		$(".txtStatus-onlineAuthCode").text("잘못된 접근입니다.");
		return false;
	}
	
	var action = "/dksw/member?action=checkOnlineAuthCode";	
	var inputOnlineAuthCode = "inputOnlineAuthCode=" + inputCode;
	
	$.ajax({
		type : "POST",
		url : action,
		data : inputOnlineAuthCode,
		dataType : "text",
		success: function(response) {
			$(".txtStatus-onlineAuthCode").text("처리중입니다.");
			
			if(response == "onlineAuthCodeChecked_6") { // 교수
				alert("가입이 완료되었습니다.\n교수님 전용 게시판은 조교의 승인 후 이용 가능합니다.");
			} else if(response == "onlineAuthCodeChecked_7") { // 학부생
				alert("가입이 완료되었습니다."); 
			} else if(response == "onlineAuthCodeChecked_8") { // 졸업생
				alert("가입이 완료되었습니다.\n글 작성은 조교의 승인 후 가능합니다.");
			} else if(response == "onlineAuthCodeChecked_9") { // 일반인
				alert("가입이 완료되었습니다.\n글 작성은 조교의 승인 후 가능합니다.");
			} else if(response == "Fail_Already") {
				alert("이미 인증이 완료된 회원입니다.");	
			} else if(response == "Fail_DB") {
				alert("정상적으로 처리되지 않았습니다.");
			} else if(response == "Fail_Category") {
				alert("잘못된 인증코드입니다.");
			} else if(response == "Fail_Null") {
				alert("잘못된 인증코드입니다.");
			} else {
				alert("잘못된 접근입니다.");
			}				
		
			location.href = "../../index.jsp";
			
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
	
	return false;
}

// 로그인 처리
function loginMember() {
	
	var action = "/dksw/member?action=loginMember";	
	var form_data = {
		inputMemberEmail : $("#inputMemberEmail").val(),
		inputMemberPassword : $("#inputMemberPassword").val()
	};

	$.ajax({
		type : "POST",
		url : action,
		data : form_data,
		dataType : "text",
		success: function(response) {
			if(response == "LoginOK") {
				location.reload(true);
			} else if(response == "Fail") {
				alert("로그인에 실패하였습니다.");
			}
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
			
	return false;	
}

// 로그아웃 처리
function logoutMember() {
	$.ajax({
		type : "POST",
		url : "member?action=logoutMember",
		dataType : "text",
		success: function(response) {
			if(response == "LogoutOK") {
				location.reload(true);
			}
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
}

