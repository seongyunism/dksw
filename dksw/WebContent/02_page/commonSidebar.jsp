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
		        
		        <button class="btn btn-primary font-NanumGothic" style="width:100%; padding:5px 0px;" onclick="loginMember()"><i class="fa fa-sign-out"></i>로그인</button>
 
	            <div class="space-sm"></div>

			    <a href="javascript:loginWithKakao()" id="custom-login-btn">
			      <img src="http://mud-kage.kakao.co.kr/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" style="width:240px;" />
			    </a>
    			
    			<script>
				// KaKao API
				Kakao.init('41dcde3d524729798e2358ce473f9fc0');
				function loginWithKakao() {
			  		Kakao.Auth.login({
			  			persistAccessToken: true,
			  			persistRefreshToken: false,
			    		success: function(authObj) {
			    			Kakao.API.request({
								url: '/v1/user/me',
								success: function(res) {
									loginByKaKao(res.id, authObj.access_token);
								}, fail: function(error) {
									console.log(error);
								}
							});
			    		}, fail: function(err) {
			      			alert(JSON.stringify(err))
			    		}
			  		});
				}
			    </script>
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
		        
		        <button class="btn btn-primary font-NanumGothic" style="width:100%; padding:5px 0px;" onclick="logoutMember()"><i class="fa fa-sign-out"></i>로그아웃</button>
			</c:if>

			<!-- Contact Section -->
            <div style="position:fixed; bottom:0px; margin-bottom:20px;">
	            <h4>Contact</h4>
	            <div class="space-sm"></div>
	            
	            <ul class="info-list sm-list">
	                <li>
	                    <i class="fa fa-envelope fa-fw margin_left_10"></i>
	                    <a class="text-muted" href="mailto:dankook.sw@gmail.com">dankook.sw@gmail.com</a>
	                </li>
	                <li>
	                    <i class="fa fa-phone fa-fw margin_left_10"></i>
	                    031) 8005 - 3227
	                </li>
	                <li>
	                    <i class="fa fa-map-marker fa-fw margin_left_10"></i>
	                    자연과학관 501호
	                </li>
	            </ul>
	    	</div>

        </div>
	</div>