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
			var  intropicture = " <img src='"+response.dkswLabIntroPicture+ "' alt=>";
			$("#dkswLabIntroIntroduction").html(response.dkswLabIntroIntroduction);
			$("#dkswLabIntroPicture").html(intropicture);
			
			// Members
			for(i=0; i<response.dkswLabMembers.length; i++) {
				var member = "<div class='col-lg-3 col-md-3 col-sm-6'><div class='profile-circle'>" +
						"<div class='hover-content'><img class='img-responsive' src='" +response.dkswLabMembers[i].dkswLabMembersPicture+
						"' /><div class='content-circle content-center'></div>" +
						"</div><h3>" + response.dkswLabMembers[i].dkswLabMembersNameKo +"</span><small>" + response.dkswLabMembers[i].dkswLabMembersNameEn + "</small>" +
								"</h3><p>Admission Year: "+response.dkswLabMembers[i].dkswLabMembersAdmissionYear +
								"</p><p>E-mail: "+response.dkswLabMembers[i].dkswLabMembersEmail +
								"</p><p>Etc: "+ response.dkswLabMembers[i].dkswLabMembersEtc+"</p></div></div>";
				members += member;
			}
			$("#dkswLabMembers").html(members);
			
			// Achievements
			var head = "<tr><td class='history-head'>년도</td><td class='history-head'>월</td><td class='history-head'>내용</td></tr>";
			var achievement = "";
			
			for (i=0; i<response.dkswLabAchievements.length; i++) {
				achievement = "<tr> <td class='history-year' style='line-height:2em;'>"
					+ response.dkswLabAchievements[i].dkswLabAchievementsYear
					+ "</td> <td class='history-year' style='line-height:2em;'>"
					+ response.dkswLabAchievements[i].dkswLabAchievementsMonth
					+ "</td> <td style='line-height:2em;'>"
					+ response.dkswLabAchievements[i].dkswLabAchievementsContent
					+ "</td> </tr>";
				
				achievements += achievement;
			}
			
			$("#dkswLabAchievements").html(head + achievements);
			
			// Paper
			var paperhead = "<tr><td class='history-head'>TITLE</td><td class='history-head'>PARTICIPANTS</td><td class='history-head'>ETC</td></tr>";
			
			for(i=0; i<response.dkswLabPaper.length; i++){
					var paper ="<tr> <td class='history-year' style='line-height:2em;'>"
					+ response.dkswLabPaper[i].dkswLabPaperTitle
					+ "</td> <td class='history-year' style='line-height:2em;'>"
					+ response.dkswLabPaper[i].dkswLabPaperParticipants
					+ "</td> <td style='line-height:2em;'>"
					+ response.dkswLabPaper[i].dkswLabPaperContent
					+ "</td> </tr>";
				
				papers += paper;
			}
			$("#dkswLabPaper").html(paperhead + papers);
			
			// Project
			
			var projecthead = "<tr><td class='history-head'>TITLE</td><td class='history-head'>PROJECT TERM</td><td class='history-head'>SPONSER</td></tr>";
			
			for(i=0; i<response.dkswLabProject.length; i++){
				
				var project = "<tr> <td class='history-year' style='line-height:2em;'>"
					+ response.dkswLabProject[i].dkswLabProjectContent
					+ "</td> <td class='history-year' style='line-height:2em;'>"
					+ response.dkswLabProject[i].dkswLabProjectStartYear+"."+response.dkswLabProject[i].dkswLabProjectStartMonth+" ~ "
					+ response.dkswLabProject[i].dkswLabProjectEndYear+"."+response.dkswLabProject[i].dkswLabProjectEndMonth
					+ "</td> <td style='line-height:2em;'>"
					+ response.dkswLabProject[i].dkswLabProjectName
					+ "</td> </tr>";
				
				projects += project;
			}
			
			$("#dkswLabProject").html(projecthead + projects);
			
		},error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;	
}