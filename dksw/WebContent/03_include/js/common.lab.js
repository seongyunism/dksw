/******************************************************
 * 연구실 페이지 공통 스크립트
 ******************************************************/

// 연구실 페이지 로딩
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