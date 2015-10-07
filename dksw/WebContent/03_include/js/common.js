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

function initializeBoard(board) {
	
	var action = "/dksw/board?action=getBoardData";
	var inputBoardCategory = "inputBoardCategory=" + board;
	
	$.ajax({
		type : "POST",
		url : action,
		data : inputBoardCategory,
		dataType : "json",
		success: function(response) {

//			response.dkswBoard[i].dkswBoardNo
//			response.dkswBoard[i].dkswBoardCategory
//			response.dkswBoard[i].dkswBoardTitle
//			response.dkswBoard[i].dkswMemberNo
//			response.dkswBoard[i].dkswBoardWriteDate
//			response.dkswBoard[i].dkswBoardReadnum
//			response.dkswBoard[i].dkswBoardContent
//			response.dkswBoard[i].dkswBoardPicture
			
			var posts = null;
			var post = null;
			
			for(i=0; i<response.dkswBoard.length; i++) {
				post = "<div class=\"row blog-post wow fadeInUp\"><div class=\"col-sm-6\"><img class=\"img-responsive\" src=\"그림주소\">" +
						"</div><div class=\"col-sm-6\"><a href=\"<%=request.getContextPath() %>/02_page/sub_01/notice/view.jsp\">" +
						"<h2>" + response.dkswBoard[i].dkswBoardTitle + "</h2></a><p>" + response.dkswBoard[i].dkswBoardContent + "</p>" +
						"<a href=\"<%=request.getContextPath() %>/02_page/sub_01/notice/view.jsp\" class=\"btn btn-default-trn-v2\">" +
						"<i class=\"fa fa-angle-right\"></i>Read More</a></div></div>";
				posts += post;
			}
			
			$("#dkswBoard").html(posts);
			
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
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

//학과 연혁
function initializeDepartmentHistory() {

	var action = "/dksw/department?action=getHistoryData";

	$.ajax({
				type : "POST",
				url : action,
				dataType : "json",
				success : function(response) {

					var histories = "";
					var history = "";

					for (i = 0; i <response.dkswDepartmentHistory.length; i++) {
						var history = "<tr> <td>"
								+ response.dkswDepartmentHistory[i].dkswDepartmentHistoryYear
								+ "</td> <td>"
								+ response.dkswDepartmentHistory[i].dkswDepartmentHistoryMonth
								+ "</td> <td>"
								+ response.dkswDepartmentHistory[i].dkswDepartmentHistoryContent
								+ "</td> </tr>";

						histories += history;
					}

					$("#dkswDepartmentHistory").html(histories);

				},
				error : function(xhr, status, error) {
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


function initializeLab(labCode) {
	
	var action = "/dksw/lab?action=getLabData";
	var inputLabCode = "inputLabCode=" + labCode;

	$.ajax({
		type : "POST",
		url : action,
		data : inputLabCode,
		dataType : "json",
		success: function(response) {
	
			var members = "";
			var achievements = "";
			var papers = "";
			var projects = "";
			
			// Introduction
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
			$("#dkswLabMembers").html(members);
			
			// Achievements
			for(i=0; i<response.dkswLabAchievements.length; i++){
				
				var achievement = "<li><div class='timeline-panel'><div class='timeline-heading'>" +
								"<h4>"+response.dkswLabAchievements[i].dkswLabAchievementsYear +
								"." + response.dkswLabAchievements[i].dkswLabAchievementsMonth +
								"</h4><h4 class='subheading'>"+response.dkswLabAchievements[i].dkswLabAchievementsContent+
								"</h4></div></div></li>";
				
				achievements += achievement;
			}
			
			$("#dkswLabAchievements").html(achievements);
			
			// Paper
			for(i=0; i<response.dkswLabPaper.length; i++){
				
				var paper = "<li><div class='timeline-panel'><div class='timeline-heading'>" +
								"<h4>"+response.dkswLabPaper[i].dkswLabPaperTitle +
								"</h4><h4 class='subheading'>"+ response.dkswLabPaper[i].dkswLabPaperParticipants+
								"</h4><h4 class='text-muted'>"+ response.dkswLabPaper[i].dkswLabPaperContent+
								"</h4></div></div></li>";
				
				papers += paper;
			}
			
			$("#dkswLabPaper").html(papers);
			
			// Project
			for(i=0; i<response.dkswLabProject.length; i++){
				
				var project = "<li><div class='timeline-panel'><div class='timeline-heading'>" +
								"<h4>"+response.dkswLabProject[i].dkswLabProjectName +
								"</h4><h4 class='subheading'>"+ response.dkswLabProject[i].dkswLabProjectStartYear+
								"." + response.dkswLabProject[i].dkswLabProjectStartMonth+
								"~" + response.dkswLabProject[i].dkswLabProjectEndYear+
								"." + response.dkswLabProject[i].dkswLabProjectEndMonth+
								"</h4><h4 class='text-muted'>"+ response.dkswLabPaper[i].dkswLabPaperContent+
								"</h4></div></div></li>";
				
				projects += project;
			}
			
			$("#dkswLabProject").html(projects);
			
		},error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;	
}


