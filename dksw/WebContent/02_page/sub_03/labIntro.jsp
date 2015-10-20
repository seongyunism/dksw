<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% String labCode = request.getParameter("labCode").toString();%>
    <section class="section">
        <div class="container">
            <h2 class="big-title">Introduction</h2> 
 
            <div class="space-sm" ></div>
 
            <p class="text-block" id="dkswLabIntroIntroduction"></p>
            
            
            <hr class="hr">
        </div>
    </section>
    
    
    <section class="section">
        <div class="container">
            <div class="sy-box">
            	<div class="normal sy-slides-wrap">
            		<div class="sy-slides-crop">
            			<ul id="slider-aboutUs" class="sy-list">
            			
            			
			                <li class="sy-slide fade useCSS transition" style="transition-duration: 800ms; opacity: 1;">
			                    <a href="#slide1" id = "dkswLabIntroPicture" >
			                    </a>
			                </li>
			                
			                <li class="sy-slide fade useCSS" style="transition-duration: 800ms; opacity: 0;">
			                    <a href="#slide2">
			                        <img src="../../01_image/temp/DeathtoStock_Desk3a.jpg" alt="">
			                    </a>
			                </li>
			                
			                <li class="sy-slide fade useCSS transition" style="transition-duration: 800ms; opacity: 0;">
			                    <a href="#slide3">
			                        <img src="../../01_image/temp/DeathtoStock_Desk1a.jpg" alt="">
			                    </a>
			                </li>
			                
			                
			                
            			</ul>
            		</div>
            		
            		<ul class="sy-controls">
            			<li class="sy-prev">
            				<a href="#prev">Previous</a>
            			</li>
            			<li class="sy-next">
            				<a href="#next">Next</a>
            			</li>
            		</ul>
            		
            		<div class="sy-caption-wrap">
            			<div class="sy-caption" style="display: none;"></div>
            		</div>
            		
            		<div class="sy-filler ready" style="padding-top: 39.4737%;"></div>
            	</div>
            	
            	<ul class="sy-pager">
            		<li class="sy-active">
            			<a href="#1">1</a>
            		</li>
            		<li class="">
            			<a href="#2">2</a>
            		</li>
            		<li class="">
            			<a href="#3">3</a>
            		</li>
            	</ul>
            </div>
        </div>
    </section>
