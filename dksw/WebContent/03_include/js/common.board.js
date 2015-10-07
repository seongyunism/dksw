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

//			response.dkswBoard[i].dkswBoardNo
//			response.dkswBoard[i].dkswBoardCategory
//			response.dkswBoard[i].dkswMemberNo
//			response.dkswBoard[i].dkswBoardWriteDate
//			response.dkswBoard[i].dkswBoardReadnum
//			response.dkswBoard[i].dkswBoardTitle
//			response.dkswBoard[i].dkswBoardContent
//			response.dkswBoard[i].dkswBoardPicture
			
			var posts = "";
			var post = "";
			
			for(i=0; i<response.dkswBoard.length; i++) {
				post = "<div class='row blog-post wow fadeInUp'><div class='col-sm-3'><img class='img-responsive' src='"
					+ response.dkswBoard[i].dkswBoardPicture
					+ "'></div><div class='col-sm-9'><a href='./view.jsp'><h3>"
					+ response.dkswBoard[i].dkswBoardTitle
					+ "</h3></a><p>"
					+ response.dkswBoard[i].dkswBoardContent
					+ "</p><a href='./view.jsp' class='btn btn-default-trn-v2'><i class='fa fa-angle-right'></i>더 보기</a></div></div>";

				posts += post;
			}
			
			$("#dkswBoard").html(posts);
			
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
}