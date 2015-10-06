<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% String labCode = request.getParameter("labCode").toString();%>
    <section class="bg-grey section-lg team-grid">
        <div class="container">
            <h2 class="big-title text-center">Members</h2>
            
            <!-- 교수님 -->
            <div class="tab-content text-left">
                <div class="tab-pane active" id="believe">
                    <div class="row">
                        <div class="col-sm-6 col-md-6 col-lg-5 wow fadeInLeft animated" style="visibility: visible;">
                            <div class="space visible-sm"></div>
                            <img class="img-responsive" alt="about us" src="./Dragonfly - About Us _ Version 3_files/photodune-4107116-meeting-s.jpg">
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-7 wow fadeInRight animated" style="visibility: visible;">
                            <h2>Professor</h2>
                            <p>Korean Name</p>
                            <p>English Name</p>
                            <div class="space-sm"></div>
                            <ul class="info-list md-list style i-primary">
                                <li>
                                    <i class="fa fa-play"></i>Phone No. :</li>
                                <li>
                                    <i class="fa fa-play"></i>E-mail:</li>
                                <li>
                                    <i class="fa fa-play"></i>Research Interest:</li>
                          
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
                
            <!-- 나머지 -->
            <div class="space-lg"></div>

			<div class="row" id="dkswLabMembers">


			
			</div>
        </div>
    </section>