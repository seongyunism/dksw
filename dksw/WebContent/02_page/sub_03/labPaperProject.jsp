<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% String labCode = request.getParameter("labCode").toString();%>
    <section class="bg-grey section-lg team-grid">  
     <h2 class="big-title text-center">Paper & On-Going Projects</h2>
			             <div class="container">
					          <div class="row">
			            <div class="col-lg-12">
			                <div class="well text-center">
			                    Paper
			                </div>
			            </div>
			            <!-- /.col-lg-12 -->
			        </div>
			        <!-- /.row -->
			
			        <!-- Content Row -->
			     <div class="row">
                <div class="col-lg-12" >
                    <ul class="timeline" id ="dkswLabPaper" >
                                                          
                    </ul>
                </div>
            </div>
			        </div>
			        
			             <div class="container">
		          <div class="row">
            <div class="col-lg-12">
                <div class="well text-center">
                   On-Going Projects
                </div>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
                <div class="col-lg-12">
                    <ul class="timeline" id="dkswLabProject">
                                                          
                    </ul>
                </div>
            </div>
      </div>
	</section>