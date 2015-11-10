<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String inputUploadMode = request.getParameter("mode").toString(); %>
<% String inputUploadCategory = request.getParameter("category").toString(); %>
<% int inputUploadPostNo = (request.getParameter("no") != null) ? Integer.parseInt(request.getParameter("no")) : 0; %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<title>단국대학교 소프트웨어학과 | 공지사항</title>
	
	<!-- CSS : Boostrap Framework -->
	<link href="<%=request.getContextPath()%>/03_include/css/bootstrap.min.css" rel="stylesheet" />

	<!-- CSS : Common Style -->
	<link href="<%=request.getContextPath()%>/03_include/css/style.css" rel="stylesheet" id="colors" />

    <!-- Script : jQuery -->
	<script src="<%=request.getContextPath()%>/03_include/js/jquery.min.js"></script>

    <!-- Script : Bootstrap JS -->
	<script src="<%=request.getContextPath()%>/03_include/js/bootstrap.min.js"></script>
	
	<!-- Custom Style -->
	<style>
	html, body {width:100%; height:100%; margin:0px; padding:0px;}
	</style>
	
	<!-- Custom Scripts -->
	<script>
	$(document).ready(function() {
		commonFileUploadFormInitialize();
	});

	function commonFileUploadFormInitialize() {
		var uploadMode = "<%=inputUploadMode%>";
		
		if(uploadMode == "new") {
			$(".commonFileUploadBox").show();
			$(".commonFileUploadForm").remove();
		} else if(uploadMode == "update") {
			$(".commonFileUploadBox").remove();
			$(".commonFileUploadForm").show();			
		}
	}

	function commonFileUploadFormClick() {	
		$(".txtUpload").text("파일 선택 후 업로드하기 버튼을 클릭해야 파일이 정상적으로 서버로 전송됩니다.");
		return;
	}

	function commonFileUploadFormChange() {
		var inputUploadFiles = document.getElementById("inputUploadFiles");
		$(".commonFileUploadForm input[name='inputUploadCount']").val(inputUploadFiles.files.length);
	}
	</script>
</head>

<body>
	<div class="commonFileUploadBox">파일 업로드 기능은 새글작성 후 수정모드에서 사용할 수 있습니다.</div>

	<form class="commonFileUploadForm" action="/dksw/upload?action=commonFileUpload" method="post" enctype="multipart/form-data">
		<input type="hidden" name="inputUploadCount" value="0" />
		<input type="hidden" name="inputUploadPostNo" value="<%=inputUploadPostNo %>" />
		<input type="hidden" name="inputUploadCategory" value="<%=inputUploadCategory %>" />
		<input type="hidden" name="inputUploadMode" value="<%=inputUploadMode %>" />
		
		<div style="width:100%;">
			<div class="left" style="width:85%; float:left;"><input type="file" id="inputUploadFiles" class="btn btn-default btn-sm margin_right_2" style="width:100%; outline:0px;" value="" name="inputUploadFiles" multiple onchange="commonFileUploadFormChange()" onclick="commonFileUploadFormClick()" /></div>
			<div class="right" style="width:15%; float:left;"><button type="submit" class="btn btn-primary-trn btn-sm" style="width:100%;">업로드 하기</button></div>
		</div>
		<div class="text-center font-NanumGothic" style="width:100%;"><span class="txtUpload">Ctrl키나 Shift키로 다중 선택하여 여러 개의 파일을 동시에 업로드할 수 있습니다. (한 파일당 최대 20MB)</span></div>
	</form>
</body>
</html>