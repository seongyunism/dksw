<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">

<head>
	<title>단국대학교 소프트웨어학과 | 회원가입</title>

	<jsp:include page="../commonHeader.jsp" flush="false" />
	
	<!-- Custom Scripts -->
	<script>
	var checkEmailAddr = 0;
	var checkOfflineAuthCode = false;
	var formClickCount = 0;
	
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
    <section class="background-bar-join bg-center bg-cover section-fxd">
        <div class="bg-filter">
            <div class="hv-center">
                
                <c:if test="${empty sessionScope.dkswMemberNo}">
	                <div class="sign-up">
		                
		                <h1 class="sign-up-title">Create new account</h1>
							
						<form role="form" class="icon" method="post">
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
		                                	<input type="text" name="inputMemberName" class="form-control" placeholder="이름(실명)" />
		                                    <i class="fa fa-user"></i>
		                                </div>
									</div>
									
		                            <div class="form-group ">
		                            	<div class="control">
		                               		<input type="email" name="inputMemberEmail" class="form-control" placeholder="이메일주소" onkeyup="checkEmail()" />
		                                	<i class="fa fa-envelope"></i>
		                            	</div>
		                            </div>
		                            
		                            <div class="form-group ">
		                            	<div class="control">
		                                	<input type="password" name="inputMemberPassword" class="form-control" placeholder="비밀번호" />
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
								<div class="col-md-8">
									<div class="txtStatus"></div>
								</div>
								
								<div class="col-md-4">
									<button type="button" class="btn btn-success btn-sign-up" onclick="joinMember()"><i class="fa fa-arrow-circle-right"></i><span class="txtNext">서버로 전송</span></button>
									<div class="space visible-sm visible-xs"></div>
			                    </div>   
							</div>
							
							<!-- 인증코드 입력란 -->
							<div class="row offline-auth">
								<div class="col-md-12 col-sm-6">
									<div class="offline-auth-code"><input type="text" class="form-control" maxlength="6" placeholder="오프라인 인증코드를 입력해주시기 바랍니다.  (6자리)" /></div>
			                        <button type="button" class="btn btn-success btn-offline-auth-code" onclick="offlineAuthCode()"><i class="fa fa-check"></i>서버로 전송</button>
								</div>
							</div>
								
						</form>
				
						<!-- 온라인 인증코드 관련 메시지 -->
						<div class="row online-auth">
							<div class="col-md-12 col-sm-6">
								<h4 class="online-auth-text"><span style="font-weight:bold;">입력하신 이메일로 인증코드가 발송되었습니다.</span><br />
								이메일을 확인하시면 가입이 완료됩니다.</h4><br />
							</div>
						</div>
		
	                </div>
				</c:if>
                
                <c:if test="${not empty sessionScope.dkswMemberNo}">
	                <div class="sign-up" style="text-align:center; color:#555555;">
		                <h4>잘못된 접근입니다. (이미 가입한 회원)</h4>
					</div>
                </c:if>
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