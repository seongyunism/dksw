<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <nav class="navbar navbar-trn navbar-fixed-top" role="navigation" id="navbarSettings">
	    <div class="container">
	        <div class="navbar-header">
	            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-navbar-collapse-1">
	                <span class="sr-only">Toggle navigation</span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	            </button>
	            <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">DKU<span class="text-primary">SOFTWARE</span></a>
	        </div>

	        <div class="collapse navbar-collapse" id="bs-navbar-collapse-1">
	            <ul class="nav navbar-nav navbar-right ">
	
	                <!-- 공지사항 -->
	                <li class="dropdown">
	                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0">공지사항</a>
	                    <ul class="dropdown-menu">
	                        <li><a href="<%=request.getContextPath()%>/02_page/sub_01/notice/index.jsp">학부 공지</a></li>
	                        <li><a href="#">학생회 공지</a></li>
	                        <li class="divider"></li>
	                        <li><a href="#">채용 정보</a></li>
	                        <li class="dropdown-submenu">
	                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">자료실</a>
	                            <ul class="dropdown-menu">
	                                <li><a href="#">일반 자료실</a></li>
	                                <li><a href="#">강의자료</a></li>
	                                <li><a href="#">과제물 공지</a></li>              
	                            </ul>
	                        </li>
	                    </ul>
	                </li>
	
	                <!-- 학과소개 -->
	                <li class="dropdown">
	                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0">학과소개</a>
	                    <ul class="dropdown-menu">
	                        <li class="dropdown-submenu">
	                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">학과 소개</a>
	                            <ul class="dropdown-menu">
	                                <li><a href="<%=request.getContextPath()%>/02_page/sub_02/greeting/index.jsp">학과장 인사</a></li>
	                                <li><a href="#">학과 연혁</a></li>
	                                <li><a href="#">학과 내규</a></li>
	                            </ul>
	                        </li>
	
	                        <li><a href="#">교수 소개</a></li>
	
	                        <li class="dropdown-submenu">
	                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">동아리 소개</a>
	                            <ul class="dropdown-menu">
	                                <li><a href="#">AEGIS</a></li>
	                                <li><a href="#">DMAP'S</a></li>
	                            </ul>
	                        </li>
	
	                        <li class="divider"></li>
	
	                        <li><a href="#">위치 및 연락처</a></li>

	                    </ul>
	                </li>
	
	                <!-- 연구 -->
	                <li class="dropdown">
	                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0">연구
	                    </a>
	                    <ul class="dropdown-menu">
	
	                        <li class="dropdown-submenu">
	                            <a href="javascript:void(0);" onclick="navLab(1);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Database Lab.</a>
	                            <ul class="dropdown-menu">
	                                <li><a href="<%=request.getContextPath()%>/02_page/sub_03/index.jsp?labCode=1">소개 및 연구목표</a></li>
	                                <li><a href="#">연구원</a></li>
	                                <li><a href="#">포트폴리오</a></li>
	                            </ul>
	                        </li>
	
	                        <li class="dropdown-submenu">
	                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Embedded Lab.</a>
	                            <ul class="dropdown-menu">
	                                <li><a href="#">소개 및 연구목표</a></li>
	                                <li><a href="#">연구원</a></li>
	                                <li><a href="#">포트폴리오</a></li>
	                            </ul>
	                        </li>
	
	                        <li class="dropdown-submenu">
	                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Mobile Contents Lab.</a>
	                            <ul class="dropdown-menu">
	                                <li><a href="#">소개 및 연구목표</a></li>
	                                <li><a href="#">연구원</a></li>
	                                <li><a href="#">포트폴리오</a></li>
	                            </ul>
	                        </li>
	
	                        <li class="dropdown-submenu">
	                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Multimedia DSP Lab.</a>
	                            <ul class="dropdown-menu">
	                                <li><a href="#">소개 및 연구목표</a></li>
	                                <li><a href="#">연구원</a></li>
	                                <li><a href="#">포트폴리오</a></li>
	                            </ul>
	                        </li>
	
	                        <li class="dropdown-submenu">
	                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">OS/Security Lab.</a>
	                            <ul class="dropdown-menu">
	                                <li><a href="#">소개 및 연구목표</a></li>
	                                <li><a href="#">연구원</a></li>
	                                <li><a href="#">포트폴리오</a></li>
	                            </ul>
	                        </li>
	                    </ul>
	                </li>
	
					<!-- 교육 -->
	                <li class="dropdown">
	                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0">교육
	                    </a>
	                    <ul class="dropdown-menu">
	                        <li><a href="#">입학안내</a></li>
	                        <li><a href="#">산학협력</a></li>
	                    </ul>
	                </li>
	
					<!-- 게시판 -->
	                <li class="dropdown">
	                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0">게시판
	                    </a>
	                    <ul class="dropdown-menu">
	                        <li><a href="<%=request.getContextPath()%>/02_page/sub_05/board/index.jsp">자유게시판</a></li>
	                        <li><a href="#">질문게시판</a></li>
	                    </ul>
	                </li>
	
	                <!-- 사이드바 -->
	                <li class="dropdown hidden-xs">
	                    <a href="javascript:void(0);" id="sidebar-btn">
	                        <i class="fa fa-bars"></i>
	                    </a>
	                </li>
	            </ul>
	        </div>
	    </div>
	</nav>
	<div id="navbarSpaceBottom"></div>