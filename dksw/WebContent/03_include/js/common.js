// [회원 가입 페이지] 
function joinMember() {
	var memberCategory = $("input[name='inputMemberCategory']:checked").val();
	 
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
		inputMemberStudentNo : $("input[name='inputMemberStudentNo]").val()
	};
	
	$.ajax({
		type : "POST",
		url : action,
		data : form_data,
		dataType : "text",
		success: function(response) {
			if(response == "JoinOK") {
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

function navLab(num) {
	var src = "/dksw/02_page/sub_03/index.jsp?labCode=" + num;
	
	location.href = src;
}

function initializeDepartmentGreeting() {
	
	var action = "/dksw/department?action=getGreetingData";
	
	$.ajax({
		type : "POST",
		url : action,
		dataType : "json",
		success: function(response) {
			$("#dkswDepartmentGreetingTitle").text(response.dkswDepartmentGreetingTitle);
			$("#dkswDepartmentGreetingPicture").attr("src", "/dksw/04_upload/files/" + response.dkswDepartmentGreetingPicture);	
			$("#dkswDepartmentGreetingContent").html(response.dkswDepartmentGreetingContent.replace(/\n/g, "<br />"));	
			$("#dkswDepartmentGreetingEditDate").text(response.dkswDepartmentGreetingEditDate);
			
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
}

function initializeLab(labCode) {
	
	var members = "";
	var action = "/dksw/lab?action=getLabData";
	var inputLabCode = "inputLabCode=" + labCode;

	$.ajax({
		type : "POST",
		url : action,
		data : inputLabCode,
		dataType : "json",
		success: function(response) {
			// Intro
			$("#dkswLabIntroIntroduction").html(response.dkswLabIntroIntroduction);
			
			
			// Members
			for(i=0; i<response.dkswLabMembers.length; i++) {
				var member = "<div class='col-lg-3 col-md-3 col-sm-6'><div class='profile-circle'>" +
						"<div class='hover-content'><img class='img-responsive' src='' />" +
						"<div class='content-circle content-center'></div>" +
						"</div><h3>" + response.dkswLabMembers[i].dkswLabMembersNameKo +"</span><small>" + response.dkswLabMembers[i].dkswLabMembersNameEn + "</small>" +
								"</h3><p>Admission Year: "+response.dkswLabMembers[i].dkswLabMembersAdmissionYear +
								"</p><p>E-mail: "+response.dkswLabMembers[i].dkswLabMembersEmail +
								"</p><p>Etc: "+ response.dkswLabMembers[i].dkswLabMembersEtc+"</p></div></div>";
				members += member;
			}
			
			
			$("#dkswLabMembers").html(members)
			
			
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;	
}
