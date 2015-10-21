/******************************************************
 * 학과 소개 페이지 공통 스크립트
 ******************************************************/

// 학과장 인사 페이지 로딩
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

// 학과 연혁 페이지 로딩
function initializeDepartmentHistory() {

	var action = "/dksw/department?action=getHistoryData";

	$.ajax({
		type : "POST",
		url : action,
		dataType : "json",
		success : function(response) {
			var head = "<tr><td class='history-head'>년도</td><td class='history-head'>월</td><td class='history-head'>내용</td></tr>";
			var histories = "";
			var history = "";

			for (i=0; i<response.dkswDepartmentHistory.length; i++) {
				var history = "<tr> <td class='history-year' style='line-height:2em;'>"
					+ response.dkswDepartmentHistory[i].dkswDepartmentHistoryYear
					+ "</td> <td class='history-year' style='line-height:2em;'>"
					+ response.dkswDepartmentHistory[i].dkswDepartmentHistoryMonth
					+ "</td> <td style='line-height:2em;'>"
					+ response.dkswDepartmentHistory[i].dkswDepartmentHistoryContent
					+ "</td> </tr>";
				
				histories += history;
			}

			$("#dkswDepartmentHistory").html(head + histories);
		},
		error : function(xhr, status, error) {
			alert(error);
		}
	});

	return false;
}

// 학과 교수 페이지 로딩
function initializeDepartmentProfessor() {
	
	var action = "/dksw/department?action=getProfessorData";

	$.ajax({
		type : "POST",
		url : action,
		dataType : "json",
		success : function(response) {
			
			var professors = "";

			for (i=0; i<response.dkswDepartmentProfessor.length; i++) {
				
				var professor = "<div class='col-lg-3 col-md-3 col-sm-6'><div class='profile'><div class='hover-content'><img class='img-responsive' src='"
					+ response.dkswDepartmentProfessor[i].dkswDepartmentProfessorPicture
					+ "' style='width:100%' /><div class='content-open content-center'><ul class='circle-icons text-center icons-list'><li><a href='mailto:"
					+ response.dkswDepartmentProfessor[i].dkswDepartmentProfessorEmail
					+ "' title='Follow us'><i class='fa fa-envelope'></i></a></li><li><a href='"
//					+ facebook
					+ "' title='Follow us'><i class='fa fa-twitter'></i></a></li><li><a href='"
//					+ twitter
					+ "' title='Follow us'><i class='fa fa-facebook'></i></a></li></ul></div></div><h3 class='font-NanumGothic'>"
					+ response.dkswDepartmentProfessor[i].dkswDepartmentProfessorNameKo
					+ "&nbsp;&nbsp;<small>"
					+ response.dkswDepartmentProfessor[i].dkswDepartmentProfessorNameEn
					+ "</small></h3><ul class='info-list-pro i-primary font-NanumGothic'><li><i class='fa fa-caret-right'></i>연구실 : "
					+ response.dkswDepartmentProfessor[i].dkswDepartmentProfessorLabName
					+ "</li><li><i class='fa fa-caret-right'></i>사무실 : "
					+ response.dkswDepartmentProfessor[i].dkswDepartmentProfessorLabLocation
					+ "</li><li><i class='fa fa-caret-right'></i>이메일 : "
					+ response.dkswDepartmentProfessor[i].dkswDepartmentProfessorEmail
					+ "</li><li><i class='fa fa-caret-right'></i>연락처 : "
					+ response.dkswDepartmentProfessor[i].dkswDepartmentProfessorContact
					+ "</li><li><i class='fa fa-caret-right'></i>홈페이지 : <a href='"
					+ response.dkswDepartmentProfessor[i].dkswDepartmentProfessorHomepage
					+ "' target='_blank'>바로가기</a></li></ul></div></div>";
				
				professors += professor;
			}

			$("#dkswDepartmentProfessor").html(professors);
		},
		error : function(xhr, status, error) {
			alert(error);
		}
	});

	return false;
}

//연락처 페이지 로딩
function initializeDepartmentContact() {
	var action = "/dksw/department?action=getContactData";
	
	$.ajax({
		type : "POST",
		url : action,
		dataType : "json",
		success: function(response) {
			var number = "";
			//contact number
			number = "<i class='fa fa-angle-right fa-fw'></i> 과사무실:" +response.dkswDepartmentContactNumber ;
			
			alert(number);
			
			
			$("#dkswContactNumber").html(number);
			//contact location
			$("#dkswContactLocation").text(response.dkswContactLocation);
			$("#dkswContactEmail").text(response.dkswContactEmail);
			$("#dkswContactFax").text(response.dkswContactFax);
			$("#dkswContactOffice").text(response.dkswContactOffice);
			$("#dkswContactRoom").text(response.dkswContactRoom);
			
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
}