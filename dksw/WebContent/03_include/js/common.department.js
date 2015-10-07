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
			var head = "<tr><td class='history-head'>년도</td><td class='history-head'>월</td><td class='history-head'>내용</td></tr>"
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