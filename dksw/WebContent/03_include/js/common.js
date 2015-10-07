/******************************************************
 * 전체 페이지 공통 스크립트
 ******************************************************/

// Google Analytics -->
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
ga('create', 'UA-68083185-1', 'auto');
ga('send', 'pageview');

// 서브 메뉴 이동
function navLab(num) {
	var src = "/dksw/02_page/sub_03/index.jsp?labCode=" + num;
	
	location.href = src;
}