function addLecture() {
		
	var action = "/dksw/lecture?action=addLecture";
	var form_data = {
			inputLectureYear : $("select[name='inputLectureYear']").val(),
			inputLectureSemester : $("select[name='inputLectureSemester']").val(),
			inputLectureName : $("input[name='inputLectureName']").val(),
			inputLectureCount : $("input[name='inputLectureCount']").val()
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

function getLectureList() {

	var action = "/dksw/lecture?action=getLectureList";

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
					chapters += "<tr><td class='text-center' style='line-height:31px;'>#" + response.dkswLectureList[i].dkswLectureChapters[j].dkswLectureChapterCount + "</td><td style='line-height:31px;'>" + response.dkswLectureList[i].dkswLectureChapters[j].dkswLectureChapterName + "</td><td><button type='button' class='btn btn-success btn-sm margin_right_2 '>푸시알림</button><button type='button' class='btn btn-warning btn-sm margin_right_2 '>수정</button><button type='button' class='btn btn-danger btn-sm'>삭제</button></td></tr>";
					lastChapterCount++;
				}
				
				chapters += "<tr><td class='text-center' style='line-height:31px;'>#" + lastChapterCount + "</td><td style='line-height:31px;'><input type='text' class='form-control' placeholder='단원명' style='padding:0px 5px;'/></td><td class='text-center'><button type='button' class='btn btn-default btn-sm margin_right_2'>파일 선택</button><button type='button' class='btn btn-primary-trn btn-sm'>업로드 완료</button></td></tr>";
			
				lectures += chapters;
				lectures += "</table></div></div></div>";
			}
			
			$("#dkswLectureList").html(lectures);
			
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
}