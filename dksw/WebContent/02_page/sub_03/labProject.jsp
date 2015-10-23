<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% String labCode = request.getParameter("labCode").toString();%>

	<section class="section-md bg-grey-4">
		<div class="container">
			<h2 class="text-uppercase m-no-all">On Going Project</h2>
		</div>
	</section>

    <section class="section-lg">  
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
                    <table class="table table-striped" id="dkswLabProject"></table>
				</div>
			</div>
		</div>
	</section>