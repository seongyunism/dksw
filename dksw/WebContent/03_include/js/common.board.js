/******************************************************
 * 게시판 페이지 공통 스크립트
 ******************************************************/

// 리스트 가져오기
function initializeBoard(board) {
	
	var action = "/dksw/board?action=getBoardListData";
	var inputBoardCategory = "inputBoardCategory=" + board;
	
	$.ajax({
		type : "POST",
		url : action,
		data : inputBoardCategory,
		dataType : "json",
		success: function(response) {
			var posts = "";
			var post = "";
			
			for(i=0; i<response.dkswBoard.length; i++) {
				post = "<div class='row blog-post wow fadeInUp' name='"
					+ response.dkswBoard[i].dkswBoardNo
					+ "'><div class='col-sm-3'><img class='img-responsive' src='"
					+ response.dkswBoard[i].dkswBoardPicture
					+ "'></div><div class='col-sm-9'><a href='./view.jsp?postNo="
					+ response.dkswBoard[i].dkswBoardNo
					+ "'><h3>"
					+ response.dkswBoard[i].dkswBoardTitle
					+ "</h3></a><p>"
					+ response.dkswBoard[i].dkswBoardContent
					+ "</p><a href='./view.jsp?postNo="
					+ response.dkswBoard[i].dkswBoardNo
					+"' class='btn btn-default-trn-v2'><i class='fa fa-angle-right'></i>더 보기</a></div></div>";

				posts += post;
			}
			
			$("#dkswBoard").html(posts);
			
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
}

// 페이지 가져오기
function initializeBoardView(no) {
	
	var action = "/dksw/board?action=getBoardPostData";
	var form_data = {
		inputMode : 1,
		inputBoardNo : no
	};
		
	$.ajax({
		type : "POST",
		url : action,
		data : form_data,
		dataType : "json",
		success: function(response) {
			$(".view").attr("name", response.dkswBoardNo);
			$("input[name='inputMemberNo']").val(response.dkswBoardNo);			
			$("#dkswBoardTitle").text(response.dkswBoardTitle);
			$("#dkswBoardSubTitle").text(response.dkswBoardSubTitle);			
			$("#dkswBoardContent").html(response.dkswBoardContent);
			$("#dkswMemberName").text(response.dkswMemberName);		
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;	
}

function writePost() {
	
	var action = "/dksw/board?action=modifyPost";
	var form_data = {
		inputMode : $("input[name='inputMode']").val(),
		inputBoardNo : $(".view").attr("name"),
		inputBoardCategory : $("input[name='inputBoardCategory']").val(),
		inputMemberNo : $("input[name='inputMemberNo']").val(),
		inputBoardTitle :  $("input[name='inputBoardTitle']").val(),
		inputBoardContent :  $("textarea[name='inputBoardContent']").val()
	};
	
	$.ajax({
		type : "POST",
		url : action,
		data : form_data,
		dataType : "json",
		success: function(response) {
			$(".view").attr("name", response.dkswBoardNo);
			$("input[name='inputMemberNo']").val(response.dkswBoardNo);			
			$("#dkswBoardTitle").text(response.dkswBoardTitle);
			$("#dkswBoardSubTitle").text(response.dkswBoardSubTitle);			
			$("#dkswBoardContent").html(response.dkswBoardContent);
			$("#dkswMemberName").text(response.dkswMemberName);		
			
			modifyModeCancel();
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
}

function modifyMode() {
	
	var action = "/dksw/board?action=getBoardPostData";
	var form_data = {
		inputMode : 2,
		inputBoardNo : $(".view").attr("name")
	};
	
	$.ajax({
		type : "POST",
		url : action,
		data : form_data,
		dataType : "json",
		success: function(response) {
			$(".view").slideUp(500);
			$(".write-form").slideDown(500);
			
			$("input[name='inputMode']").val("2");
			$("input[name='inputBoardTitle']").val(response.dkswBoardTitle);
			$("textarea[name='inputBoardContent']").val(response.dkswBoardContent);		
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;	
}

function modifyModeCancel() {
	
	$(".view").slideDown(500);
	$(".write-form").slideUp(500);
	
	$(".form-control[name='dkswBoardTitle']").val("");
	$(".form-control[name='dkswBoardContent']").val("");
	
	$("input[name='inputMode']").val("1")
}

