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
			var head = "<tr><td class='text-center text-bold' style='width:70px;'>년도</td><td class='text-center text-bold' style='width:50px;' >월</td><td class='text-center text-bold'>내용</td>";

			if(response.dkswLabModifyPermission == "OK") {
				head += "<td class='text-center text-bold' style='width:50px;'>관리</td></tr>";
			} else {
				head += "</tr>";
			}
			
			var achievement = "";
			
			for (i=0; i<response.dkswLabAchievements.length; i++) {
				achievement = "<tr name='" + response.dkswLabAchievements[i].dkswLabAchievementsNo + "'> <td class='text-center' style='line-height:2em;'>"
					+ response.dkswLabAchievements[i].dkswLabAchievementsYear
					+ "</td> <td class='text-center' style='line-height:2em;'>"
					+ response.dkswLabAchievements[i].dkswLabAchievementsMonth
					+ "</td> <td style='line-height:2em;'>"
					+ response.dkswLabAchievements[i].dkswLabAchievementsContent
					+ "</td>";

					if(response.dkswLabModifyPermission == "OK") {
						achievement += "<td class='text-center' style='width:50px;'><input type='button' value='삭제' onclick='deleteLabTable(0, " + response.dkswLabAchievements[i].dkswLabAchievementsNo + ")' /></td></tr>";
					} else {
						achievement += "</tr>";
					}
					
				achievements += achievement;
			}
			
			var achievementForm = "";
			
			if(response.dkswLabModifyPermission == "OK") {
				achievementForm += "<tr><td><input type='text' name='data1' maxlength='4' class='text-center' style='width:66px;' /></td><td><input type='text' name='data2' maxlength='2' class='text-center' style='width:46px;' /></td><td><input type='text' name='data3' style='width:100%;' /></td><td><input type='button' value='추가' onclick='writeLabTable(" + labCode + ", 0)' /></td></tr>";
			}
			
			$("#dkswLabAchievements").html(head + achievements + achievementForm);
			
			// Paper
			var paperHead = "<tr><td class='text-center text-bold'>논문명 및 저자</td></tr>";
			
			for(i=0; i<response.dkswLabPaper.length; i++){
					var paper ="<tr> <td style='line-height:2em;'><span class='text-bold'>"
					+ response.dkswLabPaper[i].dkswLabPaperTitle + "</span>&nbsp;(" + response.dkswLabPaper[i].dkswLabPaperContent
					+ ")<br /><span class='text-size-08'>" + response.dkswLabPaper[i].dkswLabPaperParticipants
					+ "</span></td></tr>";
				
				papers += paper;
			}
			$("#dkswLabPaper").html(paperHead + papers);
			
			// Project
			var projecthead = "<tr><td class='text-center text-bold' style='width:150px;'>진행기간</td><td class='text-center text-bold'>프로젝트명</td></tr>";
			
			for(i=0; i<response.dkswLabProject.length; i++){
				
				var project = "<tr> <td class='text-center' style='line-height:2em;'>"
					+ response.dkswLabProject[i].dkswLabProjectStartYear + "." + response.dkswLabProject[i].dkswLabProjectStartMonth
					+ " ~ "
					+ response.dkswLabProject[i].dkswLabProjectEndYear + "." + response.dkswLabProject[i].dkswLabProjectEndMonth
					+ "</td><td style='line-height:2em;'><span class='text-bold'>"
					+ response.dkswLabProject[i].dkswLabProjectContent + "</span>, " + response.dkswLabProject[i].dkswLabProjectName
					+ "</td></tr>";
				
				projects += project;
			}
			
			$("#dkswLabProject").html(projecthead + projects);
			
		},error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;	
}

function writeLabTable(labCode, item) {

	var action = "/dksw/lab?action=writeLabTableData";
	var itemStr = new Array('Achievements', 'Paper', 'Project');
	var form_data = {
			inputLabCode : labCode,
			inputLabItem : item,
			inputLabData1 : $("div[name='lab" + itemStr[item] + "'] input[name='data1']").val(),
			inputLabData2 : $("div[name='lab" + itemStr[item] + "'] input[name='data2']").val(),
			inputLabData3 : $("div[name='lab" + itemStr[item] + "'] input[name='data3']").val(),
	};
	
	$.ajax({
		type : "POST",
		url : action,
		data : form_data,
		dataType : "text",
		success: function(response) {
			if(response == "WriteOK") {
				location.reload(true);
			} else {
				alert("오류가 발생하였습니다.");
			}
		},error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
}

function deleteLabTable(item, record) {

	check = confirm("정말로 삭제하시겠습니까?");

	if(!check) {
		return false;
		
	} else {
	
		var action = "/dksw/lab?action=deleteLabTableData";
		var itemStr = new Array('Achievements', 'Paper', 'Project');
		var form_data = {
				inputLabItem : item,
				inputLabRecordNo : record
		};
		
		$.ajax({
			type : "POST",
			url : action,
			data : form_data,
			dataType : "text",
			success: function(response) {
				if(response == "deleteOK") {
					$("div[name='lab" + itemStr[item] + "'] tr[name='" + record + "']").remove();
				} else {
					alert("오류가 발생하였습니다.");
				}
			},error: function(xhr,status,error) {
				alert(error);
			}
		});
			
		return false;
	}
}