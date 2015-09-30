<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">

<head>
	<title>단국대학교 소프트웨어학과</title>

	<!-- Meta Tags -->
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Dankook University Department of Software" />
	<meta name="author" content="Seong-Gyun Jeon, Ji-Hoon Hwang, Jae-Seock Heo, Ha-Yarn Kim, Hong-Jun Jang" />

	<!-- Boostrap Framework  -->
	<link href="../../03_include/css/bootstrap.min.css" rel="stylesheet" />

	<!-- Google Fonts - Lato -->
	<link href="../../03_include/css/lato.css" rel="stylesheet" />

	<!-- Font Awesome Icons -->
	<link href="../../03_include/css/font-awesome.css" rel="stylesheet" />

	<!-- CSS Animations -->
	<link href="../../03_include/css/animate.min.css" rel="stylesheet" />

	<!-- Common Style -->
	<link href="../../03_include/css/style.css" rel="stylesheet" id="colors" />

	<!-- Slippry Slideshow -->
	<link href="../../03_include/css/slippry.min.css" rel="stylesheet" />
	
    <!-- Script : Modernizr -->
    <script src="../../03_include/js/modernizr.custom.min.js"></script>

    <!-- Script : jQuery -->
    <script src="../../03_include/js/jquery.min.js"></script>
    <script src="../../03_include/js/jquery-ui.min.js"></script>

    <!-- Script : Bootstrap JS -->
    <script src="../../03_include/js/bootstrap.min.js"></script>

    <!-- Script : Bootstrap Plugin - open dropdown on hover -->
    <script src="../../03_include/js/bootstrap-hover-dropdown.min.js"></script>

    <!-- Script : LESS preprocessor -->
    <script src="../../03_include/js/less.min.js"></script>

    <!-- Script : WOW.js - loading animations -->
    <script src="../../03_include/js/wow.min.js"></script>

    <!-- Script : Knobs - our skills -->
    <script src="../../03_include/js/jquery.knob.min.js"></script>

    <!-- Script : Slippry - Slideshow -->
    <script src="../../03_include/js/slippry.min.js"></script>

    <!-- Script : Mixitup plugin - Portfolio Filter Grid -->
    <script src="../../03_include/js/jquery.mixitup.min.js"></script>

    <!-- Script : Make sticky whatever elements -->
    <script src="../../03_include/js/jquery.sticky.min.js"></script>

    <!-- Script : Smooth sroll -->
    <script src="../../03_include/js/jquery.nicescroll.min.js"></script>

    <!-- Script : Contact Form -->
    <script src="../../03_include/js/contact-form.min.js"></script>

    <!-- Script : Must be last of all scripts -->
    <script src="../../03_include/js/scripts.min.js"></script>

    <!-- Script : Custom scripts -->
    <script src="../../03_include/js/common.js"></script>

    <!--[if lt IE 9]>
          <script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.min.js"></script>
          <script src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<!-- Google Analytics -->
	<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	
	ga('create', 'UA-68083185-1', 'auto');
	ga('send', 'pageview');
	</script>
	
	<!-- Custom Scripts -->
	<script>
	$(function() {
		$(".input-radio input[name='inputMemberCategory']").click(function() {
			if($(this).val() == 7 || $(this).val() == 8) {
				$(".member-studentNo").slideDown();
			} else {
				$(".member-studentNo").slideUp();				
			}
		});
	});
	</script>
</head>

<body>
    <!-- Navigation -->
	<jsp:include page="../commonNav.jsp" flush="false"/>

	<!-- Sign Up Section -->
    <section class="bg-8 bg-center bg-cover section-fxd">
        <div class="bg-filter">
            <div class="hv-center">
                
                <div class="sign-up">
                    <!--<div class="sign-up-hr hidden-xs"></div>-->
                    <h1 class="sign-up-title">Create new account</h1>
					
					<div class="row offline-auth">
						<div class="col-md-12 col-sm-6">
							<div class="offline-auth-code"><input type="text" class="form-control" maxlength="6" placeholder="오프라인 인증코드를 입력해주시기 바랍니다.  (6자리)" /></div>
                            <button type="submit" class="btn btn-success btn-offline-auth-code" onclick="offlineAuthCode()"><i class="fa fa-arrow-circle-right"></i>다음으로</button>
						</div>
					</div>
					
					<!-- 추후 보안을 위해 세션처리 해줄 것 -->
					<form role="form" class="icon" style="display:none;">
	                    <div class="row join-form">
	                    	<!-- Top Side -->
	                    	<div class="col-md-12 btn-radio">
								<div class="input-radio"><input type="radio" name="inputMemberCategory" id="radio-01" value="7" checked /></div>
								<div class="label-radio"><label for="radio-01">학부생</label></div>
								<div class="input-radio"><input type="radio" name="inputMemberCategory" id="radio-02" value="8" /></div>
	                    		<div class="label-radio"><label for="radio-02">졸업생</label></div>
	                    		<div class="input-radio"><input type="radio" name="inputMemberCategory" id="radio-03" value="9" /></div>
	                    		<div class="label-radio"><label for="radio-03">일반인</label></div>
	                    		<div class="input-radio"><input type="radio" name="inputMemberCategory" id="radio-04" value="6" /></div>
	                    		<div class="label-radio"><label for="radio-04">교수</label></div>
	                    	</div>
	                    	
	                    	<!-- Left Side -->
	                        <div class="col-md-6 col-sm-6">
                                <div class="form-group ">
                                    <div class="control">
                                        <input type="text" name="inputMemberName" class="form-control" placeholder="이름(실명)">
                                        <i class="fa fa-user"></i>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <div class="control">
                                        <input type="email" name="inputMemberEmail" class="form-control" placeholder="이메일주소">
                                        <i class="fa fa-envelope"></i>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <div class="control">
                                        <input type="password" name="inputMemberPassword" class="form-control" placeholder="비밀번호">
                                        <i class="fa fa-lock"></i>
                                    </div>
                                </div>
                                <div class="form-group member-studentNo">
                                    <div class="control">
                                        <input type="text" name="inputMemberStudentNo" class="form-control" placeholder="학번" maxlength="8" />
                                        <i class="fa fa-info"></i>
                                    </div>
                                </div>
							</div>

	                        <!-- Right Side -->
	                        <div class="col-md-6 col-sm-6">
	                            <a href="#" title=" Sing up with Facebook">
	                                <div class="sign-up-btn facebook">
	                                    <div class="icon"><i class="fa fa-facebook"></i></div>
	                                    <div class="text">Sign up with <span class="company">Facebook</span></div>
	                                </div>
	                            </a>
	                            
	                            <a href="#" title=" Sing up with Twitter">
	                                <div class="sign-up-btn twitter">
	                                    <div class="icon"><i class="fa fa-twitter"></i></div>
	                                    <div class="text">Sign up with <span class="company">Twitter</span></div>
	                                </div>
	                            </a>
	                            
	                            <a href="#" title=" Sing up with KakaoTalk">
	                                <div class="sign-up-btn kakaotalk">
	                                    <div class="icon" style="line-height:40px;"><i class="fa fa-commenting"></i></div>
	                                    <div class="text">Sign up with <span class="company">KakaoTalk</span></div>
	                                </div>
	                            </a>
	                        </div>
	                        
	                        <!-- Bottom Side -->
	                        <div class="col-md-12">
                                <button type="submit" class="btn btn-success btn-sign-up"><i class="fa fa-check"></i>가입 완료</button>
                                <div class="space visible-sm visible-xs"></div>
	                        </div>   
	                    </div>
					</form>
					
                </div>
            </div>
        </div>
    </section>

    <!-- Back to top-->
	<a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>

	<!-- Side Menu -->
	<jsp:include page="../commonSidebar.jsp" flush="false"/>
	
	<div id="ascrail2000" class="nicescroll-rails" style="width: 8px; z-index: 999999; position: fixed; top: 0px; height: 100%; right: 0px; cursor: default; display: none; background: rgb(221, 221, 221);">
		<div style="position: relative; top: 0px; float: right; width: 8px; height: 0px; border: none; border-radius: 0px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>
	
	<div id="ascrail2000-hr" class="nicescroll-rails" style="height: 8px; z-index: 999999; position: fixed; left: 0px; width: 100%; bottom: 0px; cursor: default; display: none; background: rgb(221, 221, 221);">
		<div style="position: relative; top: 0px; height: 8px; width: 0px; border: none; border-radius: 0px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>
	
</body>
</html>