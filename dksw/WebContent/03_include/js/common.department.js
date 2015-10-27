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
			$("#dkswDepartmentProfessorNameKo").text(response.dkswDepartmentProfessorNameKo);
			$("#dkswDepartmentProfessorContact").text(response.dkswDepartmentProfessorContact);
			$("#dkswDepartmentProfessorLabLocation").text(response.dkswDepartmentProfessorLabLocation);
			$("#dkswDepartmentProfessorEmail").text(response.dkswDepartmentProfessorEmail);
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
			var head = "<tr><td class='text-center text-bold'>년도</td><td class='text-center text-bold'>월</td><td class='text-center text-bold'>내용</td></tr>";
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
					+ "' title='이메일 보내기'><i class='fa fa-envelope'></i></a></li><li><a href='"
//					+ facebook
					+ "' title='페이스북 방문하기'><i class='fa fa-twitter'></i></a></li><li><a href='"
//					+ twitter
					+ "' title='트위터 방문하기'><i class='fa fa-facebook'></i></a></li></ul></div></div><h3 class='font-NanumGothic'>"
					+ response.dkswDepartmentProfessor[i].dkswDepartmentProfessorNameKo
					+ "&nbsp;&nbsp;<small>"
					+ response.dkswDepartmentProfessor[i].dkswDepartmentProfessorNameEn
					+ "</small></h3><ul class='info-list-pro i-primary font-NanumGothic'><li><i class='fa fa-caret-right'></i>연구실 : "
					+ response.dkswDepartmentProfessor[i].dkswDepartmentProfessorLabName
					+ "</li><li><i class='fa fa-caret-right'></i>사무실 : "
					+ response.dkswDepartmentProfessor[i].dkswDepartmentProfessorLabLocation
					+ "</li><li><i class='fa fa-caret-right'></i>이메일 : <a href='mailto://"
					+ response.dkswDepartmentProfessor[i].dkswDepartmentProfessorEmail
					+ "'>이메일 보내기</a></li><li><i class='fa fa-caret-right'></i>연락처 : "
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
			var location = "";
			var email = "";
			var fax = "";
			var office = "";
			var room = "";
			//contact number
			number = "<i class='fa fa-angle-right fa-fw'></i> 과사무실: " +response.dkswDepartmentContactNumber ;
			$("#dkswContactNumber").html(number);
			
			//contact location
			location = "<i class='fa fa-angle-right fa-fw'></i> 주소 : " +response.dkswDepartmentContactLocation;
			$("#dkswContactLocation").html(location);
			
			//contact email
			email = "<i class='fa fa-angle-right fa-fw'></i> " +response.dkswDepartmentContactEmail;
			$("#dkswContactEmail").html(email);
			
			//contact fax
			fax = "<i class='fa fa-angle-right fa-fw'></i> Fax: " +response.dkswDepartmentContactFax;
			$("#dkswContactFax").html(fax);
			
			//contact office
			office = "<i class='fa fa-angle-right fa-fw'></i> 과사무실: " +response.dkswDepartmentContactOffice;
			$("#dkswContactOffice").html(office);
			
			//contact room
			room = "<i class='fa fa-angle-right fa-fw'></i> 과  방: " +response.dkswDepartmentContactRoom;
			$("#dkswContactRoom").html(room);
			
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
}

function initMap() {
	  var myLatLng = {lat: 37.322798, lng: 127.127507};

	  // Create a map object and specify the DOM element for display.
	  var map = new google.maps.Map(document.getElementById('map'), {
	    center: myLatLng,
	    scrollwheel: false,
	    zoom: 16
	  });

	  // Create a marker and set its position.
	  var marker = new google.maps.Marker({
	    map: map,
	    position: myLatLng,
	    title: '단국대학교 소프트웨어학과'
	  });
}