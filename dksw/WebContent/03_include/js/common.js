function offlineAuthCode() {
	
	var action = "/dksw/member?action=checkOfflineAuthCode";
	var inputOfflineAuthCode = "inputOfflineAuthCode=" + $("div.offline-auth-code input").val();
	
	$.ajax({
		type : "POST",
		url : action,
		data : inputOfflineAuthCode,
		dataType : "text",
		success: function(response) {
			if(response == "Checked") {
				alert("성공");
			} else if(response == "Fail") {
				alert("실패");
			}
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
}

