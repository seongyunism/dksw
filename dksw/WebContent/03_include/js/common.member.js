/******************************************************
 * 회원 가입 페이지 공통 스크립트
 ******************************************************/

// 회원가입 처리
function joinMember() {
	
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
	
	var action = "/dksw/member?action=checkOnlineAuthCode";	
	var inputOnlineAuthCode = "inputOnlineAuthCode=" + inputCode;
	
	$.ajax({
		type : "POST",
		url : action,
		data : inputOnlineAuthCode,
		dataType : "text",
		success: function(response) {
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
	
	var action = "member?action=loginMember";	
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

