<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">

<head>
	<title>단국대학교 소프트웨어학과 | 공학인증</title>
	
	<jsp:include page="../../commonHeader.jsp" flush="false" />

	<!-- Custom Scripts -->
	<script>
	$(document).ready(function() {
		initializeDepartmentProfessor();
	});

	$(window).load(function() {

	});
	
	$(function() {

	});
	</script>
	
</head>

<body>
	<!-- Navigation -->
	<jsp:include page="../../commonNav.jsp" flush="false" />
	
    <!-- Header Section  -->
	<section class="background-bar-04-02 bg-center bg-cover">
		<div class="bg-filter">
			<div class="container section-lg">
				<h1 class="top-title">공학인증</h1>
			</div>
		</div>
	</section>

    <!-- Content Section --> 
    <section class="section-lg">
		<div class="container">
		
			<p class="page-law-title text-center text-bold">공학인증이란?</p>
			<div class="space"></div>
			
			<div class="page-law-content">
				<p class="page-law-content-jo">공학인증의 정의</p>
				<ul class="page-law-content-hang">
					<li> 공학교육인증제는 한국공학교육인증원에서 요구하는 국제적인 수준의 교육기준인 인증기준에 도달하는 공학인증전공 과정을 이수하고 졸업한 학생이 국제적이고 전문적인 수준의 공학 현장 실무 능력을 갖추었음을 객관적으로 보증하는 제도이다.</li>
				</ul>
			</div>
			
			
			<div class="page-law-content">
				<p class="page-law-content-jo">공과대학 교육목표</p>
				<ul class="page-law-content-hang">
					<li>① 인간존중의 정신을 갖는 공학인 양성</li>
					<li>② 창의력과 리더쉽을 갖춘 공학인 양성</li>
					<li>③ 산업현장의 문제를 해결할 수 있는 공학인 양성</li>
				</ul>
			</div>
			
			<div class="page-law-content">
				<p class="page-law-content-jo">소프트웨어학과 교육목표 (Program Educational Objectives)</p>
				<ul class="page-law-content-hang">
					<li>소프트웨어학과는 지식 정보화 사회의 핵심 동력이며 기술 집약체인 소프트웨어에 대한 이론과 응용기술을 교육하여 실무 능력과 국제 경쟁력을 갖춘 소프트웨어 전문 인력을 육성하는데 교육목표를 두고 있다. 창의성과 능동성, 전문성을 갖추고 인류 사회에 공헌하는 인재를 교육하기 위해 다음과 같은 구체적인 교육 목표를 가지고 있다.</li>
					<li>
						<ul class="page-law-content-hang-s">
							<li>① 공학윤리와 글로벌 리더십을 갖춘 소프트웨어학 기술인 양성</li>
							<li>② 공학적인 분석 및 문제해결능력 배양</li>
							<li>③ 소프트웨어 분야의 전문지식 및 현장 적응력을 갖춘 인재 양성</li>
						</ul>
					</li>
				</ul>
			</div>
			
			<div class="page-law-content">
				<p class="page-law-content-jo">소프트웨어학과 프로그램 학습성과 (Program Outcomes)</p>
				<ul class="page-law-content-hang">
					<li>프로그램 학습성과는 소프트웨어학과 프로그램 전문 과정을 이수한 학생이 졸업한 시점에서 갖추게 되는 자질로서 아래와 같이 12가지가 있다.</li>
					<il>
						<ul class="page-law-content-hang-s">
							<il>
								<table class="table-bordered" style="width:100%;">
									<tr>
										<td class="text-bold  text-center">자질의 영역</td>
										<td class="text-bold  text-center">학습 성과(Program Outcomes)</td>
										<td class="text-bold  text-center">특성</td>
									</tr>
									
									<tr>
										<td rowspan="3" class="text-center">전문지식(Knowledge)</td>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 수학, 기초과학, 공학의 지식과 정보기술을 응용할 수 있는 능력</td>
										<td rowspan="5" class="text-center">기술적 자질</td>
									</tr>
									
									<tr>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 자료를 이해하고 분석할 수 있는 능력 및 실험을 계획하고 수행할 수 있는 능력</td>
									</tr>
									
									<tr>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. 현실적 제한요건을 반영하여 시스템, 공정을 설계할 수 있는 능력</td>
									</tr>
									
									<tr>
										<td rowspan="2" class="text-center">공학실무(Skill)</td>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. 공학문제들을 인식하며, 이를 공식화하고 해결할 수 있는 능력</td>
									</tr>
									
									<tr>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5. 공학실무에 필요한 기술, 방법, 도구들을 사용할 수 있는 능력</td>
									</tr>
									
									<tr>
										<td rowspan="7" class="text-center">기본소양(Attitude)</td>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6. 복합 학제적 팀의 한 구성원의 역할을 해낼 수 있는 능력</td>
										<td rowspan="7" class="text-center">비기술적 자질</td>
									</tr>
									
									<tr>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7. 효과적으로 의사를 전달할 수 있는 능력</td>
									</tr>
									
									<tr>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8.평생교육에 대한 필요성의 인식과 평생교육에 참여할 수 있는 능력</td>
									</tr>
									
									<tr>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9. 공학적 해결방안이 세계적, 경제적, 환경적, 사회적 상황에 끼치는 영향을 이해할 수 있는 폭 넓은 지식</td>
									</tr>
									
									<tr>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10. 시사적 논점들에 대한 기본지식</td>
									</tr>
									
									<tr>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;11. 직업적, 윤리적인 책임에 대한 인식 능력</td>
									</tr>
									
									<tr>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12. 세계문화에 대한 이해와 국제적으로 협동할 수 있는 능력</td>
									</tr>
								</table>
							</il>
						</ul>
					</il>
				</ul>
			</div>
			
			<div class="page-law-content">
				<p class="page-law-content-jo">변경되는 소프트웨어학 전문 프로그램 학습성과 (ABEEK 한국공학교육인증원 KEC/KCC 2015에 따른 변경, 2015년도 입학생부터 적용)</p>
				<ul class="page-law-content-hang">
					<il>
						<ul class="page-law-content-hang-s">
							<il>
								<table class="table-bordered" style="width:100%;" >
									<tr>
										<td class="text-bold text-center">자질의 영역</td>
										<td class="text-bold text-center">학습 성과(Program Outcomes)</td>
										<td class="text-bold text-center">특성</td>
									</tr>
									
									<tr>
										<td rowspan="3" class=" text-center">전문지식(Knowledge)</td>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 수학, 기초과학, 공학의 지식과 정보기술을 공학문제 해결에 응용할 수 있는 능력</td>
										<td rowspan="5" class=" text-center">기술적 자질</td>
									</tr>
									
									<tr>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 데이터를 분석하고 주어진 사실이나 가설을 실험을 통하여 확인할 수 있는 능력</td>
									</tr>
									
									<tr>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. 공학문제를 정의하고 공식화할 수 있는 능력</td>
									</tr>
									
									<tr>
										<td rowspan="2" class=" text-center">공학실무(Skill)</td>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. 공학문제를 해결하기 위해 최신 정보, 연구 결과, 적절한 도구를 활용할 수 있는 능력</td>
									</tr>
									
									<tr>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5. 현실적 제한조건을 고려하여 시스템, 요소, 공정 등을 설계할 수 있는 능력</td>
									</tr>
									
									<tr>
										<td rowspan="5" class=" text-center">기본소양(Attitude)</td>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6. 공학문제를 해결하는 프로젝트 팀의 구성원으로서 팀 성과에 기여할 수 있는 능력</td>
										<td rowspan="5" class=" text-center">비기술적 자질</td>
									</tr>
									
									<tr>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7. 다양한 환경에서 효과적으로 의사소통할 수 있는 능력</td>
									</tr>
									
									<tr>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8. 공학적 해결방안이 보건, 안전, 경제, 환경, 지속가능성 등에 미치는 영향을 이해할 수 있는 능력</td>
									</tr>
									
									<tr>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9. 공학인으로서의 직업윤리와 사회적 책임을 이해할 수 있는 능력</td>
									</tr>
									
									<tr>
										<td class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10. 기술환경 변화에 따른 자기계발의 필요성을 인식하고 지속적이고 자기주도적으로 학습할 수 있는 능력</td>
									</tr>
									
								</table>
							</il>
						</ul>
					</il>
				</ul>
			</div>
			
			<div class="space"></div>
			<div class="space"></div>
			<div class="space"></div>
			
			<p class="page-law-title text-center text-bold">교육과정</p>
			<div class="space"></div>
			
			<div class="page-law-content">
				<p class="page-law-content-jo">소프트웨어학과 프로그램 학습성과 (Program Outcomes)</p>
				<ul class="page-law-content-hang">
					<li>프로그램 학습성과는 소프트웨어학과 프로그램 전문 과정을 이수한 학생이 졸업한 시점에서 갖추게 되는 자질로서 아래와 같이 12가지가 있다.</li>
					<il>
						<ul class="page-law-content-hang-s">
							<il>
								<table class="table-bordered text-center" style="width:100%;"  id="edutb4" class="edutable" border="1" >
									<thead>
										<tr>
										<td id="setedu1" class="setEdu2 text-bold" colspan="3" rowspan="2">이수구분</td>
										<td id="setedu2" class="setEdu2 text-bold" colspan="6" rowspan="2">교과목명</td>
										<td id="setedu3" class="setEdu2 text-bold" colspan="2" rowspan="2">학점</td>
										<td id="setedu4" class="setEdu2 text-bold" colspan="12">기준수강 학년/학기</td>
										</tr>
										<tr>
										<td class="edu2_td">1-1</td>
										<td class="edu2_td">1-2</td>
										<td class="edu2_td">2-1</td>
										<td class="edu2_td">2-2</td>
										<td class="edu2_td">3-1</td>
										<td class="edu2_td">3-2</td>
										<td class="edu2_td">4-1</td>
										<td class="edu2_td">4-2</td>
										<td class="edu2_td">5-1</td>
										<td class="edu2_td">5-2</td>
										<td class="edu2_td">6-1</td>
										<td class="edu2_td">6-2</td>
										</tr>
										</thead>
										<tbody>
										<tr>
										<td colspan="3">공학소양</td>
										<td colspan="6">공학멘토링</td>
										<td colspan="2">0(0)</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학기초(수학)</td>
										<td colspan="6">일반수학1</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학기초(기초과학영역)</td>
										<td colspan="6">일반물리학1</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학기초(기초과학영역)</td>
										<td colspan="6">일반물리학실험1</td>
										<td colspan="2">1(0)</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학기초(기초과학영역)</td>
										<td colspan="6">일반화학1</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학기초(기초과학영역)</td>
										<td colspan="6">일반화학실험1</td>
										<td colspan="2">1(0)</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학기초(전산영역)</td>
										<td colspan="6">공학컴퓨터응용</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공필수</td>
										<td colspan="6">프로그래밍1</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">소프트웨어학개론</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학기초(수학)</td>
										<td colspan="6">일반수학2</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학기초(기초과학영역)</td>
										<td colspan="6">일반물리학2</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학기초(기초과학영역)</td>
										<td colspan="6">일반물리학실험2</td>
										<td colspan="2">1(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학기초(기초과학영역)</td>
										<td colspan="6">일반화학2</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학기초(기초과학영역)</td>
										<td colspan="6">일반화학실험2</td>
										<td colspan="2">1(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학기초(전산영역)</td>
										<td colspan="6">컴퓨터프로그래밍</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공필수</td>
										<td colspan="6">프로그래밍2</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">컴퓨터사고를위한닷넷프로그래밍기초</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공필수</td>
										<td colspan="6">창의적공학설계</td>
										<td colspan="2">2(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학소양</td>
										<td colspan="6">첨단제조산업의이해</td>
										<td colspan="2">2(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학기초(공학수학1)</td>
										<td colspan="6">공학수학1</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공필수</td>
										<td colspan="6">객체지향프로그래밍</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">멀티미디어시스템</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">이산수학</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">데이터베이스 기초</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공기초(수학)</td>
										<td colspan="6">공학수학2</td>
										<td colspan="2">2(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학소양</td>
										<td colspan="6">지식재산과특허전략</td>
										<td colspan="2">2(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">시스템프로그래밍</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">웹프로그래밍</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">자료구조</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">컴퓨터구조</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">컴퓨터와통신</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">산업체현장실습1(소프트)</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">산업체현장실습2(소프트)</td>
										<td colspan="2">6(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학기초(수학)</td>
										<td colspan="6">확률및통계학</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학기초(기초과학영역)</td>
										<td colspan="6">공학생물</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학소양</td>
										<td colspan="6">공학경제</td>
										<td colspan="2">2(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">알고리즘</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">컴퓨터그래픽스</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">컴퓨터네트워크</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">컴퓨터보안</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">모바일시스템</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">운영체제개론</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">교직</td>
										<td colspan="6">정보,컴퓨터교과교육론</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학기초(수학)</td>
										<td colspan="6">공학수치해석</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학소양</td>
										<td colspan="6">기술과경영</td>
										<td colspan="2">2(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">소프트웨어공학</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">영상정보처리</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">고급정보관리및데이터베이스응용</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">모바일프로그래밍및콘텐츠응용</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">신호처리프로그래밍</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">운영체제및보안</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">교직</td>
										<td colspan="6">정보ㆍ컴퓨터교과교재연구및지도법</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">교직</td>
										<td colspan="6">자연공학교과논리및논술</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">국내인턴십1(소프트)</td>
										<td colspan="2">18(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">국내인턴십2(소프트)</td>
										<td colspan="2">12(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">국외인턴십1(소프트)</td>
										<td colspan="2">18(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">국외인턴십2(소프트)</td>
										<td colspan="2">12(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학소양</td>
										<td colspan="6">지식재산기반창업</td>
										<td colspan="2">2(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공필수</td>
										<td colspan="6">SW종합설계1</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">데이터마이닝</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공필수</td>
										<td colspan="6">시스템분석및설계</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학소양</td>
										<td colspan="6">공학윤리</td>
										<td colspan="2">2(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">공학소양</td>
										<td colspan="6">기술보고서작성</td>
										<td colspan="2">2(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공필수</td>
										<td colspan="6">SW종합설계2</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
										<tr>
										<td colspan="3">전공선택</td>
										<td colspan="6">컴파일러</td>
										<td colspan="2">3(0)</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">O</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										<td class="edu2_td">–</td>
										</tr>
									</tbody>
								</table>
							</il>
						</ul>
					</il>
				</ul>
			</div>
										
		
		
		
		







		
		</div>
    </section>
	
	<!--Back to top-->
	<a href="#" class="back-to-top" style="display: none;">
		<i class="fa fa-angle-up"></i>
	</a>

	<!-- Side Menu -->
	<jsp:include page="../../commonSidebar.jsp" flush="false" />

	<!-- Footer-->
	<jsp:include page="../../commonFooter.jsp" flush="false" />

	<div id="ascrail2000" class="nicescroll-rails" style="width: 8px; z-index: 999999; position: fixed; top: 0px; height: 100%; right: 0px; cursor: default; opacity: 0; background: rgb(221, 221, 221);">
		<div style="position: relative; float: right; width: 8px; border: none; border-radius: 0px; height: 269px; top: 0px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>

	<div id="ascrail2000-hr" class="nicescroll-rails" style="height: 8px; z-index: 999999; position: fixed; left: 0px; width: 100%; bottom: 0px; cursor: default; opacity: 0; display: none; background: rgb(221, 221, 221);">
		<div style="position: relative; top: 0px; height: 8px; border: none; border-radius: 0px; width: 1391px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>

</body>
</html>