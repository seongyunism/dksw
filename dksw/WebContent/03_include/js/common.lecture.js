// 초기화
function initializeLecture(category) {
	
	switch(category) {
		case '6':
			$(".lecture-year, .lecture-semester").selectpicker();
			break;
		case '7':
			getLectureList();
			break;
		default:
			alert("로그인이 필요합니다.");
			history.go(-1);
	}
}

// [교수모드] 강의 개설하기
function addLecture() {
		
	var action = "/dksw/lecture?action=addLecture";
	var form_data = {
		inputLectureYear : $("select[name='inputLectureYear']").val(),
		inputLectureSemester : $("select[name='inputLectureSemester']").val(),
		inputLectureName : $("input[name='inputLectureName']").val()
	};

	$.ajax({
		type : "POST",
		url : action,
		data : form_data,
		dataType : "text",
		success: function(response) {
			if(response == "AddOK") {
				alert("강의가 개설되었습니다.");
				location.reload(true);
			} else if(response == "NoProfessor") {
				alert("잘못된 접근입니다.");
			} else {
				alert("실패하였습니다.");
			}
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
}

// [교수모드] 본인이 개설한 강의 리스트 가져오기
function getLectureListByProfessor() {

	var action = "/dksw/lecture?action=getLectureListByProfessor";

	$.ajax({
		type : "POST",
		url : action,
		dataType : "json",
		success: function(response) {
			var lectures = "";
			var chapters = "";
			var lastChapterCount = 1;
			
			for(i=0; i<response.dkswLectureList.length; i++) {
			
				lectures += "<div class='panel panel-default'><a data-toggle='collapse' href='#" + response.dkswLectureList[i].dkswLectureNo + "'> <div class='panel-heading'><h4 class='panel-title font-NanumGothic'><i class='fa fa-th-list'></i>("
					+ response.dkswLectureList[i].dkswLectureYear + "-" + response.dkswLectureList[i].dkswLectureSemester + ") " + response.dkswLectureList[i].dkswLectureName + "</h4></div></a>"
					+ "<div id='" + response.dkswLectureList[i].dkswLectureNo + "' class='panel-collapse collapse'><div class='panel-body'><button type='button' class='btn btn-primary btn-xs margin_right_2'>강의 공지하기</button><button type='button' class='btn btn-primary btn-xs margin_right_2'>과제물 공지하기</button><button type='button' class='btn btn-primary btn-xs'>수강중인 학생보기</button>"
					+ "<div class='space-sm'></div>";
					
				var chapters = "<table class='table table-striped'><tr><td class='text-center text-bold' style='width:70px;'>No</td><td class='text-center text-bold'>단원명</td><td class='text-center text-bold' style='width:190px;'>관리</td></tr>";
			
				for(j=0; j<response.dkswLectureList[i].dkswLectureChapters.length; j++) {
					chapters += "<tr><td class='text-center' style='line-height:31px;'>#" + response.dkswLectureList[i].dkswLectureChapters[j].dkswLectureChapterCount + "</td><td style='line-height:31px;'>" + response.dkswLectureList[i].dkswLectureChapters[j].dkswLectureChapterName + "</td><td><button type='button' onclick='sendPush_lecture(" + response.dkswLectureList[i].dkswLectureNo + ", "+response.dkswLectureList[i].dkswLectureChapters[j].dkswLectureChapterNo +")' class='btn btn-success btn-sm margin_right_2 '>푸시알림</button><button type='button' class='btn btn-warning btn-sm margin_right_2 '>수정</button><button type='button' class='btn btn-danger btn-sm'>삭제</button></td></tr>";
					lastChapterCount++;
				}
				
				chapters += "<tr><td class='text-center' style='line-height:31px;'>#" + lastChapterCount + "</td><td style='line-height:31px;'><input type='text' class='form-control' placeholder='단원명' style='padding:0px 5px;'/></td><td class='text-center'><button type='button' class='btn btn-default btn-sm margin_right_2'>파일 선택</button><button type='button' class='btn btn-primary-trn btn-sm'>업로드 완료</button></td></tr>";
			
				lectures += chapters;
				lectures += "</table></div></div></div>";
				
				lastChapterCount = 1;
			}
			
			$("#getLectureListByProfessor").html(lectures);
			
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
}

// [학생모드] 전체 강의 리스트 가져오기
function getLectureList() {
	
	$(".panel-group").show();

	var action = "/dksw/lecture?action=getLectureList";

	$.ajax({
		type : "POST",
		url : action,
		dataType : "json",
		success: function(response) {
			var lectures = "";
			
			for(i=0; i<response.dkswLectureList.length; i++) {
				lectures += "	<div class='panel panel-default' style='clear:both;' name='" + response.dkswLectureList[i].dkswLectureNo + "'><a><div class='panel-heading' style='height:76px; padding:0px;'>" 
					+ "<div class='left' style='float:left; height:26px; margin:25px 0px 25px 25px;'><h4 class='panel-title font-NanumGothic' value='12'><i class='fa fa-th-list'></i><span class='subject'>("
					+ response.dkswLectureList[i].dkswLectureYear + "-" + response.dkswLectureList[i].dkswLectureSemester + ") " + response.dkswLectureList[i].dkswLectureProfessorName + " - " + response.dkswLectureList[i].dkswLectureName + "</span></h4></div>"
					+ "<div class='right' style='float:right; height:26px; margin:16px 16px 16px 0px;'><button type='button' class='btn btn-primary' onclick='addRegisterLecture(" + response.dkswLectureList[i].dkswLectureNo + ")'>수강하기</button></div>"
					+ "</div></a></div>";		
			}
			
			if(response.dkswLectureCountCheck == "false") {
				lectures += "<div class='text-center'>등록된 강의를 모두 수강중입니다.</div>";
			}
			
			$("#getLectureList").html(lectures);
			
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
}

// [학생모드] 수강 신청하기
function addRegisterLecture(lecture) {
	
	var action = "/dksw/lecture?action=addRegisterLecture";
	var form_data = {
		inputLectureNo : lecture
	};
	
	$.ajax({
		type : "POST",
		url : action,
		data : form_data,
		dataType : "text",
		success: function(response) {
			if(response == "RegisterOK") {
				alert("수강신청이 완료되었습니다.");
				getLectureList();
				$("#getLectureList div[name='" + lecture + "']").remove();
			} else if(response == "Already") {
				alert("이미 수강중인 강의입니다.");
			} else if(response == "NoStudent") {
				alert("잘못된 접근입니다.");
			} else if(response == "Fail") {
				alert("서버 내부 오류입니다.");
			} else {
				alert("알 수 없는 오류가 발생하였습니다.");
			}
			
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
}

// [학생모드] 수강하고 있는 강의 리스트 가져오기
function getLectureListByStudent() {
	
	var action = "/dksw/lecture?action=getLectureListByStudent";

	$.ajax({
		type : "POST",
		url : action,
		dataType : "json",
		success: function(response) {
			var lectures = "";
			var chapters = "";

			for(i=0; i<response.dkswLectureList.length; i++) {
			
				lectures += "<div class='panel panel-default' name='" + response.dkswLectureList[i].dkswLectureNo + "'><a data-toggle='collapse' href='#" + response.dkswLectureList[i].dkswLectureNo + "'> <div class='panel-heading'><h4 class='panel-title font-NanumGothic'><i class='fa fa-th-list'></i>("
					+ response.dkswLectureList[i].dkswLectureYear + "-" + response.dkswLectureList[i].dkswLectureSemester + ") " + response.dkswLectureList[i].dkswLectureProfessorName + " - " + response.dkswLectureList[i].dkswLectureName + "</h4></div></a>"
					+ "<div id='" + response.dkswLectureList[i].dkswLectureNo + "' class='panel-collapse collapse'><div class='panel-body'><button type='button' class='btn btn-primary btn-xs margin_right_2'>강의 공지사항</button><button type='button' class='btn btn-primary btn-xs margin_right_2'>과제물 공지사항</button><button type='button' class='btn btn-danger btn-xs margin_right_2' onclick='cancelRegisterLecture(" + response.dkswLectureList[i].dkswLectureNo + ")'>수강 취소</button>"
					+ "<div class='space-sm'></div>";
					
				var chapters = "<table class='table table-striped'><tr><td class='text-center text-bold' style='width:70px;'>No</td><td class='text-center text-bold'>단원명</td></tr>";
			
				for(j=0; j<response.dkswLectureList[i].dkswLectureChapters.length; j++) {
					chapters += "<tr><td class='text-center' style='line-height:31px;'>#" + response.dkswLectureList[i].dkswLectureChapters[j].dkswLectureChapterCount + "</td><td style='line-height:31px;'>" + response.dkswLectureList[i].dkswLectureChapters[j].dkswLectureChapterName + "</td></tr>";
				}
							
				lectures += chapters;
				lectures += "</table></div></div></div>";
			}
			
			$("#getLectureListByStudent").html(lectures);
			
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
}

// [학생모드] 수강 취소하기
function cancelRegisterLecture(lecture) {
	check = confirm("정말로 취소하시겠습니까?");

	if(!check) {
		return false;
		
	} else {		
		var action = "/dksw/lecture?action=cancelRegisterLecture";
		var form_data = {
			inputLectureNo : lecture
		};
		
		$.ajax({
			type : "POST",
			url : action,
			data : form_data,
			dataType : "text",
			success: function(response) {
				if(response == "CancelOK") {
					$("#getLectureListByStudent div[name='" + lecture + "']").remove();
				} else {
					alert("알 수 없는 오류가 발생하였습니다.");
				}
			}, error: function(xhr,status,error) {
				alert(error);
			}
		});
		
		return false;
	}
}

// [교수모드] 푸시 보내기
function sendPush_lecture(lecture, chapter) {
	check = confirm("푸시를 발송하시겠습니까?\n등록된 회원 수에 따라 지연이 발생할 수 있습니다.");

	if(!check) {
		return false;
		
	} else {
	
		var action = "/dksw/lecture?action=sendPush";
		var form_data = {
			inputLectureNo : lecture,
			inputChapterNo : chapter
		};
		
		$.ajax({
			type : "POST",
			url : action,
			data : form_data,
			dataType : "json",
			success: function(response) {
				if(response.dkswSendPush_Check == "complete") {
					alert("푸시를 발송하였습니다.");
				} else if(response.dkswSendPush_Check == "some") {
					alert("푸시를 일부 발송하였습니다. (" + response.dkswSendPush_PushCount + "/" + dkswSendPush_TotalCount + ")");					
				} else {
					alert("푸시 발송에 실패하였습니다.");
				}
			}, error: function(xhr,status,error) {
				alert(error);
			}
		});
			
		return false;
	}
}