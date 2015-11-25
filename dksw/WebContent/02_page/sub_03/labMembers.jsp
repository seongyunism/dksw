<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% String labCode = request.getParameter("labCode").toString();%>

	<section class="section-md bg-grey-4">
		<div class="container">
			<h2 class="text-uppercase m-no-all">Members</h2>
		</div>
	</section>

    <section class="section-lg team-grid">
        <!-- ±³¼ö´Ô -->
        <div class="container-sm">
            <div class="text-left" id="dkswLabMembersProfessor"></div>
		</div>
		
        <div class="space"></div>
        <div class="space"></div>
		<hr class="hr" />
        <div class="space"></div>
        <div class="space"></div>
		
		
        <!-- ³ª¸ÓÁö -->
		<div class="container">
			<div class="row" id="dkswLabMembers" name="labMembers"></div>
        </div>
    </section>