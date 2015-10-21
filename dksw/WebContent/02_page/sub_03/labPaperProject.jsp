<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% String labCode = request.getParameter("labCode").toString();%>
    <section class="bg-grey section-lg team-grid">  
     <h2 class="big-title text-center">Paper & On-Going Projects</h2>
			             <div class="container">
					          <div class="row">
			            <div class="col-lg-12">
			                <div class="well text-center">
			                    PAPER
			                </div>
			            </div>
			            <!-- /.col-lg-12 -->
			        </div>
			        <!-- /.row -->
			
			        <!-- Content Row -->
			     <div class="row">
                <div class="col-lg-12" >
                    <table class="table table-striped" id="dkswLabPaper"></table>
                </div>
            </div>
			        </div>
			        
			             <div class="container">
		          <div class="row">
            <div class="col-lg-12">
                <div class="well text-center">
                   ON-GOING PROJECTS
                </div>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
                <div class="col-lg-12">
                    <table class="table table-striped" id="dkswLabProject"></table>
                </div>
            </div>
      </div>
	</section>