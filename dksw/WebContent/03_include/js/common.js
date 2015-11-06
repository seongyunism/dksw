/******************************************************
 * 전체 페이지 공통 스크립트
 ******************************************************/

// Google Analytics
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
ga('create', 'UA-68083185-1', 'auto');
ga('send', 'pageview');

// Facebook API
// This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
  console.log('statusChangeCallback');
  console.log(response);
  // response 객체는 현재 로그인 상태를 나타내는 정보를 보여준다. 
  // 앱에서 현재의 로그인 상태에 따라 동작하면 된다.
  // FB.getLoginStatus().의 레퍼런스에서 더 자세한 내용이 참조 가능하다.
  if (response.status === 'connected') {
    // 페이스북을 통해서 로그인이 되어있다.
    testAPI();
  } else if (response.status === 'not_authorized') {
    // 페이스북에는 로그인 했으나, 앱에는 로그인이 되어있지 않다.
    document.getElementById('status').innerHTML = 'Please log ' +
      'into this app.';
  } else {
    // 페이스북에 로그인이 되어있지 않다. 따라서, 앱에 로그인이 되어있는지 여부가 불확실하다.
    document.getElementById('status').innerHTML = 'Please log ' +
      'into Facebook.';
  }
}

// 이 함수는 누군가가 로그인 버튼에 대한 처리가 끝났을 때 호출된다.
// onlogin 핸들러를 아래와 같이 첨부하면 된다.
function checkLoginState() {
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
}

window.fbAsyncInit = function() {
FB.init({
  appId      : '538015876360769',
  cookie     : true,  // 쿠키가 세션을 참조할 수 있도록 허용
  xfbml      : true,  // 소셜 플러그인이 있으면 처리
  version    : 'v2.1' // 버전 2.1 사용
});

// 자바스크립트 SDK를 초기화 했으니, FB.getLoginStatus()를 호출한다.
//.이 함수는 이 페이지의 사용자가 현재 로그인 되어있는 상태 3가지 중 하나를 콜백에 리턴한다.
// 그 3가지 상태는 아래와 같다.
// 1. 앱과 페이스북에 로그인 되어있다. ('connected')
// 2. 페이스북에 로그인되어있으나, 앱에는 로그인이 되어있지 않다. ('not_authorized')
// 3. 페이스북에 로그인이 되어있지 않아서 앱에 로그인이 되었는지 불확실하다.
//
// 위에서 구현한 콜백 함수는 이 3가지를 다루도록 되어있다.

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

};

// SDK를 비동기적으로 호출
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// 로그인이 성공한 다음에는 간단한 그래프API를 호출한다.
// 이 호출은 statusChangeCallback()에서 이루어진다.
function testAPI() {
  console.log('Welcome!  Fetching your information.... ');
  FB.api('/me', function(response) {
    console.log('Successful login for: ' + response.name);
    document.getElementById('status').innerHTML =
      'Thanks for logging in, ' + response.name + '!';
  });
}

//페이지 권한 정보 가져오기
function initializePermission(id) {

	var action = "/dksw/admin?action=getPermission";
	var inputAdminPermissionId = "inputAdminPermissionId=" + id;
	
	$.ajax({
		type : "POST",
		url : action,
		data : inputAdminPermissionId,
		dataType : "text",
		success: function(response) {
			if(response == "ApproveOK") {
				$("#writeBtn, #writeForm").show();				
			} else {
				$("#writeBtn, #writeForm").hide();
			}
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
		
	return false;
}

function nav() {

	var src = "/dksw/02_page/sub_02/department_info/index.jsp";

	location.href = src;
}

function loginByKaKao(id, token) {

	var action = "/dksw/snsAuth?action=loginByKaKao";
	var form_data = {
		inputMemberSNSCategory : 3,
		inputMemberSNSId : id,
		inputMemberSNSToken : token
	};
	
	$.ajax({
		type : "POST",
		url : action,
		data : form_data,
		dataType : "text",
		success: function(response) {
			if(response == "LoginOK") {
				location.reload(true);
			} else if(response == "NotSNSMember") {
				alert("카카오톡 아이디가 등록되지 않았거나 회원이 아닙니다.");
			} else if(response == "LoginFail") {
				alert("카카오톡 아이디가 연동되지 않은 회원입니다.");
			}
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
	
	return false;
}
