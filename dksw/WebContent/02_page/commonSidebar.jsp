<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <div class="sidebar-off hidden-xs sidebar">
        <div class="wrap">

            <div class="form-lg">
                <div class="input-group all-trn" role="search">
                    <input type="text" class="form-control" placeholder="Search" />
                    <span class="input-group-btn">
    					<button class="btn btn-all-trn" title="Search" type="button">
    						<i class="fa fa-search"></i>
                        </button>
                	</span> 
                </div>
            </div>

            <div class="space-sm"></div>

			<!-- Login Form & Member Information Section -->
			<c:if test="${empty sessionScope.dkswMemberNo}">
	            <h4>Login</h4>
	            <div class="space-sm"></div>
	            
	            <div class="loginForm">
		            <input type="text" class="form-control" placeholder="이메일 주소" id="inputMemberEmail" style="font-size:13px;" /><br />
		            <input type="password" class="form-control" placeholder="비밀번호" id="inputMemberPassword" style="font-size:13px;" />
		        </div>
	            <div class="space-sm"></div>
		        
		        <button class="btn btn-primary font-NanumGothic" style="width:100%; padding:5px 0px; margin-bottom:5px;" onclick="loginMember()"><i class="fa fa-sign-in"></i>로그인</button>
				<div class="text-center" style="font-size:0.8em;">
					<span>아이디 및 비밀번호 찾기</span>&nbsp;&nbsp;|&nbsp;&nbsp;
					<span>회원가입</span>
				</div>
				 
	            <div class="space-sm"></div>


			</c:if>

			<c:if test="${not empty sessionScope.dkswMemberNo}">
	            <h4>Member Information</h4>
	            <div class="space-sm"></div>
	            
	            <ul class="info-list sm-list">
	                <li>
	                    <i class="fa fa-envelope fa-fw margin_left_10"></i>
	                    <a class="text-muted"><%=session.getAttribute("dkswMemberEmail").toString()%></a>
	                </li>
	                <li>
	                    <i class="fa fa-user fa-fw margin_left_10"></i>
						<%=session.getAttribute("dkswMemberName").toString()%>
	                </li>
	            </ul>
	            <div class="space-sm"></div>
		        
		        <button class="btn btn-danger font-NanumGothic" style="width:100%; padding:5px 0px;" onclick="logoutMember()"><i class="fa fa-sign-out"></i>로그아웃</button>

	            <div class="space"></div>
	            <div class="space"></div>

	            <h4>My Menu</h4>

			</c:if>






			<!-- Contact Section -->
            <c:if test="${empty sessionScope.dkswMemberNo}">
	            <div style="position:fixed; bottom:0px; margin-bottom:20px;">
		            <h4>Social Login</h4>
		            <div class="space-sm"></div>
		            
				    <a href="javascript:loginWithKakao()" id="custom-login-btn">
				      <img src="http://mud-kage.kakao.co.kr/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" style="width:240px;" />
				    </a>
	    			
	    			<script>
					// KaKao API
					Kakao.init('41dcde3d524729798e2358ce473f9fc0');
					function loginWithKakao() {
				  		Kakao.Auth.login({
				    		success: function(authObj) {
				      			loginByKaKao(authObj);
				    		}, fail: function(err) {
				      			alert(JSON.stringify(err))
				    		}
				  		});
					}
				    </script>

		    	</div>
			</c:if>

        </div>
	</div>