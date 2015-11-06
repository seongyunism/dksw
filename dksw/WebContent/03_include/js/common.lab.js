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
			var addMember = "";
			// Introduction
			var  introPicture = "";
			var modifyBtn = "";
			var modifyIntro = "";
			
			if(response.dkswLabIntroPicture_0 != "") {
				introPicture = "<li class='sy-slide fade useCSS' style='transition-duration: 800ms; opacity:0;'><a href='#slide1'><div class=' image-slide'><img class='image-slide-crop' src='" + response.dkswLabIntroPicture_0 + "' /></div></a></li>";				
			}
			
			if(response.dkswLabIntroPicture_1 != null) {
				introPicture += "<li class='sy-slide fade useCSS' style='transition-duration: 800ms; opacity:0;'><a href='#slide2'><div class=' image-slide'><img class='image-slide-crop' src='" + response.dkswLabIntroPicture_1 + "' /></div></a></li>";				
			}
			
			if(response.dkswLabIntroPicture_2 != null) {
				introPicture += "<li class='sy-slide fade useCSS' style='transition-duration: 800ms; opacity:0;'><a href='#slide3'><div class=' image-slide'><img class='image-slide-crop' src='" + response.dkswLabIntroPicture_2 + "' /></div></a></li>";			
			}
			if(response.dkswLabModifyPermission == "OK")
			{
				modifyBtn = "<div class='btn btn-primary-trn pull-right' onclick='modifyIntroMode(" + labCode + ")'><i class='fa fa-wrench'></i>수정</div>";
				modifyIntro ="<div class='write-form'><textarea name='inputIntroContent' class='form-control font-NanumGothic' style='min-height:500px;'></textarea>" +
						"<div class='btn btn-primary pull-right margin_left_5' onclick='modifyIntro("+ labCode+ ")'><i class='fa fa-trash-o'></i>완료</div>" +
						"<div class='btn btn-primary-trn pull-right' onclick='modifyModeCancel()'><i class='fa fa-wrench'></i>취소</div></div>"
			}

			$("#dkswLabIntroIntroduction").html("<div class='view'>" + response.dkswLabIntroIntroduction + modifyBtn + "</div>" + modifyIntro);
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
										
				var member = "<div class='col-lg-3 col-md-3 col-sm-6' name=" + response.dkswLabMembers[i].dkswLabMembersNo + "><div class='profile-circle' style='margin-bottom:100px;'><div class='hover-content'><img class='img-responsive' src='" + memberPicture
					+ "' style='width:100%' /><div class='content-circle content-center text-center'><ul class='circle-icons icons-list'><li><a href='mailto://"
					+ response.dkswLabMembers[i].dkswLabMembersEmail
					+ "' title='Follow us'><i class='fa fa-envelope'></i></a></li><li><a href='#' title='Follow us'><i class='fa fa-twitter'></i></a></li><li><a href='#' title='Follow us'><i class='fa fa-facebook'></i></a></li></ul></div></div><h3 class='text-center'>" 
					+ response.dkswLabMembers[i].dkswLabMembersNameKo
					+ "</span><small>"
					+ response.dkswLabMembers[i].dkswLabMembersNameEn 
					+ "</small></h3><ul class='info-list-pro i-primary font-NanumGothic'>"
					+ "<li><i class='fa fa-caret-right'></i>입학년도 : " + response.dkswLabMembers[i].dkswLabMembersAdmissionYear + "</li>"
					+ "<li><i class='fa fa-caret-right'></i>이메일 : <a href='mailto://" + response.dkswLabMembers[i].dkswLabMembersEmail + "'>이메일 보내기</a></li>"
					+ "<li><i class='fa fa-caret-right'></i>근무지 : " + response.dkswLabMembers[i].dkswLabMembersWorkPlace + "</li>";
				
					if(response.dkswLabModifyPermission == "OK") {
						member += "<input type='button' class ='btn btn-danger btn-sm' value='삭제' onclick='deleteLabTable(3, " + response.dkswLabMembers[i].dkswLabMembersNo + ")' />"
								+ "</ul></div></div>";
					} else{
						member +=  "</ul></div></div>"
					}
				
					members += member;
			}
			
			if(response.dkswLabModifyPermission == "OK"){
				addMember = "<div class='col-lg-3 col-md-3 col-sm-6'><div class='profile-circle' style='margin-bottom:100px;'><div class='hover-content'><img class='img-responsive' src='/dksw/04_upload/files/sub_03/members/no-image.jpg'"
					+ "style='width:100%' /><div class='content-circle content-center text-center'><ul class='circle-icons icons-list'><li><a href='mailto://"
					+ "' title='Follow us'><i class='fa fa-envelope'></i></a></li><li><a href='#' title='Follow us'><i class='fa fa-twitter'></i></a></li><li><a href='#' title='Follow us'><i class='fa fa-facebook'></i></a></li></ul></div></div><h3 class='text-center'>" 
					+ "<input type='text' name='data1' maxlength='20' class='form-control text-center' style='width:200px;padding:0px 3px; display:inline' placeholder = '이름(Ko)' />	"
					+ "</span><small>"
					+ "<input type='text' name='data2' maxlength='20' class='form-control text-center' style='width:200px;padding:0px 3px; display:inline' placeholder = '이름(En)' />	"
					+ "</small></h3><ul class='info-list-pro i-primary font-NanumGothic'>"
					+ "<li><i class='fa fa-caret-right'></i>입학년도 : <input type='text' name='data3' maxlength='2' class='form-control text-center' style='width:50px;padding:0px 3px; display:inline'/> </li>"
					+ "<li><i class='fa fa-caret-right'></i>이메일 : <input type='text' name='data4' maxlength='50' class='form-control text-center' style='width:150px;padding:0px 3px; display:inline'/> </li>"
					+ "<li><i class='fa fa-caret-right'></i>근무지 : <input type='text' name='data5' maxlength='20' class='form-control text-center' style='width:150px;padding:0px 3px; display:inline'/> </li>"
					+ "<input type='button' class ='btn btn-primary-trn btn-sm' value='추가' onclick='writeLabTable(" + labCode + ", 3)' /></ul></div></div>";
			}
			
			$("#dkswLabMembers").html(members + addMember);
			
			var professor = "<div class='tab-pane active' id='believe'><div class='row'> "+
							"<div class='col-sm-6 col-md-6 col-lg-5 wow fadeInLeft animated' style='visibility: visible;'>"+
							"<div class='space visible-sm'></div><img class='img-responsive' src='" +response.dkswLabMembersProfessorPicture+ "'>" +
							"</div><div class='col-sm-6 col-md-6 col-lg-7 wow fadeInRight animated' style='visibility: visible;'>"+
							"<h2>Professor</h2><h1>"+response.dkswLabMembersProfessorNameKo+"</h1>" +
							"<h4>"+response.dkswLabMembersProfessorNameEn+"</h4><div class='space-sm'>" +
							"</div><ul class='info-list md-list style i-primary'><li><i class='fa fa-play'>" +
							"</i>Phone No. : " +response.dkswLabMembersProfessorContact+"</li><li><i class='fa fa-play'>" +
							"</i>E-mail: " +response.dkswLabMembersProfessorEmail+"</li><li><i class='fa fa-play'>" +
							"</i>Research Interest:" +response.dkswLabMembersProfessorField+"</li></ul></div></div></div>"
			
			$("#dkswLabMembersProfessor").html(professor);
			
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
						achievement += "<td class='text-center' style='width:50px;'><input type='button' class ='btn btn-danger btn-sm' value='삭제' onclick='deleteLabTable(0, " + response.dkswLabAchievements[i].dkswLabAchievementsNo + ")' /></td></tr>";
					} else {
						achievement += "</tr>";
					}
					
				achievements += achievement;
			}
			
			var achievementForm = "";
			
			if(response.dkswLabModifyPermission == "OK") {
				achievementForm += "<tr><td><input type='text' name='data1' maxlength='4' class='form-control text-center' style='width:66px;padding:0px 3px; display:inline;'placeholder = '연도' /></td>" +
						"<td><input type='text' name='data2' maxlength='2' class='form-control text-center' style='width:46px;padding:0px 3px; display:inline;' placeholder = '월' /></td>" +
						"<td><input type='text' name='data3' class='form-control text-center' style='width:100%; padding:0px 3px; display:inline;' placeholder = '내용' /></td><td><input type='button' class ='btn btn-primary-trn btn-sm' value='추가' onclick='writeLabTable(" + labCode + ", 0)' /></td></tr>";
			}
			
			$("#dkswLabAchievements").html(head + achievements + achievementForm);
			
			// Paper
			var paperHead = "<tr><td class='text-center text-bold'>논문명 및 저자</td>";
			
			if(response.dkswLabModifyPermission == "OK") {
				paperHead += "<td class='text-center text-bold' style='width:50px;'>관리</td></tr>";
			} else {
				paperHead += "</tr>";
			}
			
			for(i=0; i<response.dkswLabPaper.length; i++){
					var paper ="<tr name='" + response.dkswLabPaper[i].dkswLabPaperNo + "'> <td style='line-height:2em;'><span class='text-bold'>"
					+ response.dkswLabPaper[i].dkswLabPaperTitle + "</span>&nbsp;(" + response.dkswLabPaper[i].dkswLabPaperContent
					+ ")<br /><span class='text-size-08'>" + response.dkswLabPaper[i].dkswLabPaperParticipants
					+ "</span></td>";
					if(response.dkswLabModifyPermission == "OK") {
						paper += "<td class='text-center' style='width:50px;'><input type='button' class ='btn btn-danger btn-sm' value='삭제' onclick='deleteLabTable(1, " + response.dkswLabPaper[i].dkswLabPaperNo + ")' /></td>";
					} else {
						paper += "</tr>";
					}
				
				papers += paper;
			}
			var paperForm = "";
			
			if(response.dkswLabModifyPermission == "OK") {
				paperForm += "<tr><td><input type='text' name='data1' maxlength='50' class='form-control text-center' style='width:40%;padding:0px 3px; display:inline' placeholder = '논문명'/> " +
						"<input type='text' name='data2' maxlength='20' class='form-control text-center' style='width:30%;padding:0px 3px; display:inline'  placeholder = '게재지'/> " +
						"<input type='text' name='data3' class='form-control text-center' style='width:27%;padding:0px 3px; display:inline'  placeholder = '논문 저자'/></td>" +
						"<td><input type='button' class ='btn btn-primary-trn btn-sm' value='추가' onclick='writeLabTable(" + labCode + ", 1)' /></td></tr>";
			}
			
			$("#dkswLabPaper").html(paperHead + papers+ paperForm);
			
			// Project
			var projecthead = "<tr><td class='text-center text-bold' style='width:200px;'>진행기간</td><td class='text-center text-bold'>프로젝트명</td>";

			if(response.dkswLabModifyPermission == "OK") {
				projecthead += "<td class='text-center text-bold' style='width:50px;'>관리</td></tr>";
			} else {
				projecthead += "</tr>";
			}
			
			for(i=0; i<response.dkswLabProject.length; i++){
				
				var project = "<tr name = '"+response.dkswLabProject[i].dkswLabProjectNo+"'> <td class='text-center' style='line-height:2em;'>"
					+ response.dkswLabProject[i].dkswLabProjectStartYear + "." + response.dkswLabProject[i].dkswLabProjectStartMonth
					+ " ~ "
					+ response.dkswLabProject[i].dkswLabProjectEndYear + "." + response.dkswLabProject[i].dkswLabProjectEndMonth
					+ "</td><td style='line-height:2em;'><span class='text-bold'>"
					+ response.dkswLabProject[i].dkswLabProjectContent + "</span>, " + response.dkswLabProject[i].dkswLabProjectName
					+ "</td>";
				
				if(response.dkswLabModifyPermission == "OK") {
					project += "<td class='text-center' style='width:50px;'><input type='button' class ='btn btn-danger btn-sm' value='삭제' onclick='deleteLabTable(2, " + response.dkswLabProject[i].dkswLabProjectNo + ")' /></td>";
				} else {
					project += "</tr>";
				}
								
				projects += project;
			}
			var projectForm = "";
			
			if(response.dkswLabModifyPermission == "OK") {
				projectForm += "<tr><td><input type='text' name='data1' maxlength='4' class='form-control text-center' style='width:50px; padding:0px 3px; display:inline;' placeholder ='연도' />." +
						"<input type='text' name='data2' maxlength='2' class='form-control text-center' style='width:25px; padding:0px 3px; display:inline;' placeholder ='월' />" +
						" ~ <input type='text' name='data3' maxlength = '4' class='form-control text-center' style='width:50px;padding:0px 3px; display:inline;' placeholder ='연도'/> . " +
						"<input type = 'text' name = 'data4' maxlength='2' class='form-control text-center' style = 'width:25px;padding:0px 3px; display:inline;' placeholder ='월' /></td>" +
						"<td><input type='text' name='data5' maxlength='50' class='form-control text-center' style='width:70%;padding:0px 3px; display:inline;' placeholder ='프로젝트명' /> " +
						"<input type='text' name='data6' maxlength='50' class='form-control text-center' style='width:28%;padding:0px 3px; display:inline;' placeholder ='프로젝트 기관명'/> " +
						"</td><td><input type='button' class ='btn btn-primary-trn btn-sm' value='추가' onclick='writeLabTable(" + labCode + ", 2)' /></td></tr>";
			}
			
			$("#dkswLabProject").html(projecthead + projects + projectForm);
			
		},error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;	
}

function writeLabTable(labCode, item) {

	var action = "/dksw/lab?action=writeLabTableData";
	var itemStr = new Array('Achievements', 'Paper', 'Project','Members');
	var form_data = {
			inputLabCode : labCode,
			inputLabItem : item,
			inputLabData1 : $("div[name='lab" + itemStr[item] + "'] input[name='data1']").val(),
			inputLabData2 : $("div[name='lab" + itemStr[item] + "'] input[name='data2']").val(),
			inputLabData3 : $("div[name='lab" + itemStr[item] + "'] input[name='data3']").val(),
			inputLabData4 : $("div[name='lab" + itemStr[item] + "'] input[name='data4']").val(),
			inputLabData5 : $("div[name='lab" + itemStr[item] + "'] input[name='data5']").val(),
			inputLabData6 : $("div[name='lab" + itemStr[item] + "'] input[name='data6']").val(),
			
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
function modifyIntro(labCode){
	var action  = "/dksw/lab?action=modifyLabIntro";
	var form_data  = {
			inputLabCode : labCode,
			inputLabData1 : $("textarea[name='inputIntroContent']").val()
	};	
	
	$.ajax({
		type : "POST",
		url : action,
		data : form_data,
		dataType : "text",
		success: function(response) {
			if(response == "ModifyOK") {
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

function modifyIntroMode(labCode) {
	
	var action = "/dksw/lab?action=getIntroData";
	var form_data = {
		inputLabCode : labCode
	};
	
	$.ajax({
		type : "POST",
		url : action,
		data : form_data,
		dataType : "json",
		success: function(response) {
			$(".view").slideUp(500);
			$(".write-form").slideDown(500);
			$("textarea[name='inputIntroContent']").val(response.dkswIntroContent);		
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;	
}

function modifyModeCancel() {
	
	$(".view").slideDown(500);
	$(".write-form").slideUp(500);
	
	
	$(".form-control[name='dkswIntroContent']").val("");
	

}


function deleteLabTable(item, record) {

	var form_data;
	check = confirm("정말로 삭제하시겠습니까?");

	if(!check) {
		return false;
		
	} else {
	
		var action = "/dksw/lab?action=deleteLabTableData";
		var itemStr = new Array('Achievements', 'Paper', 'Project','Members');
		
		form_data = {
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
					if(item == 3) {
						$("div[name='labMembers'] div[name='" + record + "']").remove();
					} else {
						$("div[name='lab" + itemStr[item] + "'] tr[name='" + record + "']").remove();						
					}
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