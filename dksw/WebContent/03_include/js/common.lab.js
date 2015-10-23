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
			var  introPicture = "";
			
			if(response.dkswLabIntroPicture_0 != "") {
				introPicture = "<li class='sy-slide fade useCSS' style='transition-duration: 800ms; opacity:0;'><a href='#slide1'><div class=' image-slide'><img class='image-slide-crop' src='" + response.dkswLabIntroPicture_0 + "' /></div></a></li>";				
			}
			
			if(response.dkswLabIntroPicture_1 != null) {
				introPicture += "<li class='sy-slide fade useCSS' style='transition-duration: 800ms; opacity:0;'><a href='#slide2'><img src='" + response.dkswLabIntroPicture_1 + "' /></a></li>";				
			}
			
			if(response.dkswLabIntroPicture_2 != null) {
				introPicture += "<li class='sy-slide fade useCSS' style='transition-duration: 800ms; opacity:0;'><a href='#slide3'><img src='" + response.dkswLabIntroPicture_2 + "' /></a></li>";				
			}

			$("#dkswLabIntroIntroduction").html(response.dkswLabIntroIntroduction);
			$("#dkswLabIntroPicture").html(introPicture);
			jQuery("#dkswLabIntroPicture").slippry();
			
			// Members
			for(i=0; i<response.dkswLabMembers.length; i++) {
				var memberPicture = "";
				var admisisonYear = "";
				var workPlace = "";
				
				if(response.dkswLabMembers[i].dkswLabMembersPicture == "") {
					memberPicture = "/dksw/04_upload/files/sub_03/members/no-image.jpg";
				} else {
					memberPicture = "/dksw/04_upload/files/sub_03/members/" + labCode + "/" + response.dkswLabMembers[i].dkswLabMembersPicture;
				}
				
				var member = "<div class='col-lg-3 col-md-3 col-sm-6'><div class='profile-circle' style='margin-bottom:100px;'><div class='hover-content'><img class='img-responsive' src='" + memberPicture
					+ "' style='width:100%' /><div class='content-circle content-center text-center'><ul class='circle-icons icons-list'><li><a href='mailto://"
					+ response.dkswLabMembers[i].dkswLabMembersEmail
					+ "' title='Follow us'><i class='fa fa-envelope'></i></a></li><li><a href='#' title='Follow us'><i class='fa fa-twitter'></i></a></li><li><a href='#' title='Follow us'><i class='fa fa-facebook'></i></a></li></ul></div></div><h3 class='text-center'>" 
					+ response.dkswLabMembers[i].dkswLabMembersNameKo
					+ "</span><small>"
					+ response.dkswLabMembers[i].dkswLabMembersNameEn 
					+ "</small></h3><ul class='info-list-pro i-primary font-NanumGothic'>"
					+ "<li><i class='fa fa-caret-right'></i>입학년도 : " + response.dkswLabMembers[i].dkswLabMembersAdmissionYear + "</li>"
					+ "<li><i class='fa fa-caret-right'></i>이메일 : <a href='mailto://" + response.dkswLabMembers[i].dkswLabMembersEmail + "'>이메일 보내기</a></li>"
					+ "<li><i class='fa fa-caret-right'></i>근무지 : " + response.dkswLabMembers[i].dkswLabMembersWorkPlace + "</li>"
					+ "</ul></div></div>";
				
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