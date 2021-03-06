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
			var firstImage = "";
			
			if(board == '4') {
				var posts = "";
				var post = "";
				
				for(i=0; i<response.dkswBoard.length; i++) {
					for(j=0; j<response.dkswBoard[i].dkswBoardFiles.length; j++) {
						if(response.dkswBoard[i].dkswBoardFiles[j].dkswBoardFileType == "jpg" || response.dkswBoard[i].dkswBoardFiles[j].dkswBoardFileType == "png") {
							firstImage = response.dkswBoard[i].dkswBoardFiles[j].dkswBoardFilePath;
							break;
						}
					}
					
					post = "<div class='row blog-post' name='"
						+ response.dkswBoard[i].dkswBoardNo
						+ "'><div class='col-sm-4'><div class='hover-content'><div class='image-crop-box'><img class='img-responsive image-crop' src='"
						+ firstImage
						+ "' /></div></div></div><div class='col-sm-8'><a href='./view.jsp?category=" + category + "&postNo="
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
					for(j=0; j<response.dkswBoard[i].dkswBoardFiles.length; j++) {
						if(response.dkswBoard[i].dkswBoardFiles[j].dkswBoardFileType == "jpg" || response.dkswBoard[i].dkswBoardFiles[j].dkswBoardFileType == "png") {
							firstImage = response.dkswBoard[i].dkswBoardFiles[j].dkswBoardFilePath;
							break;
						}
					}
					
					post = "<div class='row blog-post wow fadeInUp' name='"
						+ response.dkswBoard[i].dkswBoardNo
						+ "'><div class='col-sm-4'><div class='image-crop-box'><img class='img-responsive image-crop' src='"
						+ firstImage
						+ "' /></div></div><div class='col-sm-8'><a href='./view.jsp?category=" + category + "&postNo="
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
//			alert(error);
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
			
			for(i=0; i<response.dkswBoardFiles.length; i++) {
				$("#dkswBoardFileList").append("<div class='file'><a href='" + response.dkswBoardFiles[i].dkswBoardFilePath + "' targat='_blank'>" + response.dkswBoardFiles[i].dkswBoardFileName + "</a></div>");
				
				if(response.dkswBoardFiles[i].dkswBoardFileType == "jpg" || response.dkswBoardFiles[i].dkswBoardFileType == "png") {
					$("#dkswBoardFileImages").append("<img src='" + response.dkswBoardFiles[i].dkswBoardFilePath + "' onclick=viewFullImage('" + response.dkswBoardFiles[i].dkswBoardFilePath + "') />");
				}
			}
			
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
		inputAdminMenuName : "board_" + category,
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

function getNews() {
	var action = "/dksw/board?action=getBoardNewsListData";
	var posts = "";
	
	$.ajax({
		type : "POST",
		url : action,
		dataType : "json",
		success: function(response) {
			var firstImage = "";
			
			for(i=0; i<3; i++) {
				var target = "sub_01/notice";
				
				if(response.dkswBoard[i].dkswBoardCategory == 4) {
					target = "sub_05/board";
				}
				
				for(j=0; j<response.dkswBoard[i].dkswBoardFiles.length; j++) {
					if(response.dkswBoard[i].dkswBoardFiles[j].dkswBoardFileType == "jpg" || response.dkswBoard[i].dkswBoardFiles[j].dkswBoardFileType == "png") {
						firstImage = response.dkswBoard[i].dkswBoardFiles[j].dkswBoardFilePath;
						break;
					}
				}
					
				var post = "<a href='02_page/" + target + "/view.jsp?postNo=" + response.dkswBoard[i].dkswBoardNo + "' class='txtMain'>"
					+ "<div class='col-md-4 col-lg-4 col-sm-6' data-wow-delay='0.8s'>" 
					+ "<div class='news'><div class='image-crop-box'><img class='img-responsive image-crop' src='" + firstImage + "' /></div>"
					+ "<h3 class='EllipsText'>" + response.dkswBoard[i].dkswBoardTitle + "</h3>"
					+ "<p style='padding-top:5px;'>" + response.dkswBoard[i].dkswBoardContent + "</p>"
					+ "<p style='text-align:right;'><em>" + response.dkswBoard[i].dkswBoardWriteDate + "</em><p>"
					+ "</div></div></a>"
				
				posts += post;
			}

			$("#dkswBoardNews").html(posts);
			
		}, error: function(xhr,status,error) {
//			alert(error);
		}
	});
		
	return false;
}

function sendPush_board(no) {
	check = confirm("푸시를 발송하시겠습니까?\n등록된 회원 수에 따라 지연이 발생할 수 있습니다.");

	if(!check) {
		return false;
		
	} else {
	
		var action = "/dksw/board?action=sendPush";
		var form_data = {
			inputPostNo : no
		};
		
		$.ajax({
			type : "POST",
			url : action,
			data : form_data,
			dataType : "text",
			success: function(response) {
				if(response = "ok") {
					alert("푸시를 발송하였습니다.");
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

function viewFullImage(src) {
	$("div.blackPlate").slideDown(500);
	$("div.blackPlate div.v-center").html("<img src='" + src + "' />");
}

function closeViewFullImage() {
	$("div.blackPlate").slideUp(500);
}