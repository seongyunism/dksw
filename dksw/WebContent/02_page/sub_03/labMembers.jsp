<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% String labCode = request.getParameter("labCode").toString();%>

	<section class="section-md bg-grey-4">
		<div class="container">
			<h2 class="text-uppercase m-no-all">Members</h2>
		</div>
	</section>

    <section class="section-lg team-grid">
        <div class="container" name="labMembers">
            
            <!-- 교수님 -->
            <div class="tab-content text-left">
                <div class="tab-pane active" id="believe">
                    <div class="row">
                        <div class="col-sm-6 col-md-6 col-lg-5 wow fadeInLeft animated" style="visibility: visible;">
                            <div class="space visible-sm"></div>
                            <img class="img-responsive" alt="about us" src="">
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-7 wow fadeInRight animated" style="visibility: visible;">
                            <h2>Professor</h2>
                            <p>Korean Name</p>
                            <p>English Name</p>
                            <div class="space-sm"></div>
                            <ul class="info-list md-list style i-primary">
                                <li><i class="fa fa-play"></i>Phone No. :</li>
                                <li><i class="fa fa-play"></i>E-mail:</li>
                                <li><i class="fa fa-play"></i>Research Interest:</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="space"></div>
            <div class="space"></div>
            <div class="space"></div>
               
            <!-- 나머지 -->
			<div class="row" id="dkswLabMembers"></div>
			
        </div>
    </section>