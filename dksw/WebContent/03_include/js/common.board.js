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
			if(board == '4') {
				var posts = "";
				var post = "";
				
				for(i=0; i<response.dkswBoard.length; i++) {
					post = "<div class='row blog-post' name='"
						+ response.dkswBoard[i].dkswBoardNo
						+ "'><div class='col-sm-4'><div class='hover-content'><img class='img-responsive' alt='Blog Image' src='"
						+ response.dkswBoard[i].dkswBoardPicture
						+ "'></div></div><div class='col-sm-8'><a href='./view.jsp?category=" + category + "&postNo="
						+ response.dkswBoard[i].dkswBoardNo
						+ "'><h2>"
						+ response.dkswBoard[i].dkswBoardTitle
						+ "</h2></a><p>"
						+ response.dkswBoard[i].dkswBoardContent
						+ "</p> <a href='./view.jsp?category=" + category + "&postNo="
						+ response.dkswBoard[i].dkswBoardNo
						+ "' class='btn btn-default-trn-v2'><i class='fa fa-angle-right'></i>더 보기</a></div></div>";
					
					posts += post;
				}
				
				$("#dkswBoard_" + board).html(posts);
  
			} else {
				var posts = "";
				var post = "";
				
				for(i=0; i<response.dkswBoard.length; i++) {
					post = "<div class='row blog-post wow fadeInUp' name='"
						+ response.dkswBoard[i].dkswBoardNo
						+ "'><div class='col-sm-3'><img class='img-responsive' src='"
						+ response.dkswBoard[i].dkswBoardPicture
						+ "'></div><div class='col-sm-9'><a href='./view.jsp?category=" + category + "&postNo="
						+ response.dkswBoard[i].dkswBoardNo
						+ "'><h3>"
						+ response.dkswBoard[i].dkswBoardTitle
						+ "</h3></a><p>"
						+ response.dkswBoard[i].dkswBoardContent
						+ "</p><a href='./view.jsp?category=" + category + "&postNo="
						+ response.dkswBoard[i].dkswBoardNo
						+"' class='btn btn-default-trn-v2'><i class='fa fa-angle-right'></i>더 보기</a></div></div>";
					
					posts += post;
				}
				
				$("#dkswBoard_" + board).html(posts);
			}
			
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
			$("#dkswBoardTitle").text(response.dkswBoardTitle);
			$("#dkswBoardSubTitle").text(response.dkswBoardSubTitle);			
			$("#dkswBoardContent").html(response.dkswBoardContent);
			$("#dkswBoardWriteDate").html(response.dkswBoardWriteDate);
			$("#dkswMemberName").text(response.dkswMemberName);		
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;	
}

// 포스트 작성 및 수정하기
function writePost(category) {
	var boardCategory;
	
	if(category == "free") {
		boardCategory = 4;
	} else {
		boardCategory = $("input[name='inputBoardCategory']:checked").val();
	}
	
	var action = "/dksw/board?action=modifyPost";
	var form_data = {
		inputAdminPermissionId : "board_" + category,
		inputMode : $("input[name='inputMode']").val(),
		inputBoardNo : $(".view").attr("name"),
		inputBoardCategory : boardCategory,
		inputMemberNo : $("input[name='inputMemberNo']").val(),
		inputBoardTitle :  $("input[name='inputBoardTitle']").val(),
		inputBoardContent :  $("textarea[name='inputBoardContent']").val()
	};

	if($("input[name='inputMode']").val() == 1) { // 새글 작성
	
		$.ajax({
			type : "POST",
			url : action,
			data : form_data,
			dataType : "text",
			success: function(response) {
				if(response == "WriteOK") {
					location.reload(true);
				} else {
					alert("잘못된 접근입니다.")
				}
				
			}, error: function(xhr,status,error) {
				alert(error);
			}
		});
		
	} else if($("input[name='inputMode']").val() == 2) { // 수정	
				
		$.ajax({
			type : "POST",
			url : action,
			data : form_data,
			dataType : "json",
			success: function(response) {
				if(response.check =="ModifyOK") {
					$(".view").attr("name", response.dkswBoardNo);
					$("#dkswBoardTitle").text(response.dkswBoardTitle);
					$("#dkswBoardSubTitle").text(response.dkswBoardSubTitle);			
					$("#dkswBoardContent").html(response.dkswBoardContent);
					$("#dkswMemberName").text(response.dkswMemberName);		
					modifyModeCancel();
				} else {
					alert("본인이 작성한 글이 아니거나 잘못된 접근입니다.");
				}
				
		
			}, error: function(xhr,status,error) {
				alert(error);
			}
		});
	}
		
	return false;
}


function writeMode() {

	$(".list").slideUp(500);
	$(".write-form").slideDown(500);
	
	return;
}

function writeModeCancel() {
	
	$(".list").slideDown(500);
	$(".write-form").slideUp(500);
	
	$(".form-control[name='dkswBoardTitle']").val("");
	$(".form-control[name='dkswBoardContent']").val("");
	
	$("input[name='inputMode']").val("1");
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
			$("input[name='inputBoardCategory']:radio[value='" + response.dkswBoardCategory + "']").prop('checked',true);
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
	
	$("input[name='inputMode']").val("1");
}

function deletePost() {
	check = confirm("정말로 삭제하시겠습니까?");

	if(!check) {
		return false;
		
	} else {
		
		var action = "/dksw/board?action=deletePost";
		var inputBoardNo = "inputBoardNo=" + $(".view").attr("name");
		
		$.ajax({
			type : "POST",
			url : action,
			data : inputBoardNo,
			dataType : "text",
			success: function(response) {
				if(response == "DeleteOK") {
					location.href = "index.jsp?category=" + category;	
				} else {
					alert("본인이 작성한 글이 아니거나 잘못된 접근입니다.");
				}
			}, error: function(xhr,status,error) {
				alert(error);
			}
		});
			
		return false;
	}
}