<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% String labCode = request.getParameter("labCode").toString();%>

	<section class="section-md bg-grey-4">
		<div class="container">
			<h2 class="text-uppercase m-no-all">Achievements</h2>
		</div>
	</section>

	<section class="section">
		<div class="container" name="labAchievements">
            <div class="row">
                <div class="col-lg-12">
                	<table class="table table-striped" id="dkswLabAchievements"></table>      
                </div>
             </div>
         </div>
    </section>