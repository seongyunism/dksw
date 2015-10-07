<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths adownload bgsizecover boxsizing csscalc cubicbezierrange cssfilters lastchild mediaqueries no-overflowscrolling no-csspositionsticky no-regions cssresize cssscrollbar shapes subpixelfont supports no-userselect no-ie8compat svgfilters" style="overflow: hidden;">

<head>
	<title>단국대학교 소프트웨어학과 | 학과 소개</title>

	<jsp:include page="../../commonHeader.jsp" flush="false" />
</head>

<body>
    <!-- Navigation -->
	<jsp:include page="../../commonNav.jsp" flush="false"/>

    <!-- Header Box -->
    <section class="bg-16 bg-center bg-cover">
        <div class="bg-filter">
            <div class="container section-lg">
                <h1 class="top-title">학과 소개</h1>
            </div>
        </div>
    </section>

    <section class="section">
        <div class="container-sm">
            <h2 class="big-title">Project title</h2> 
            <div class="space-sm"></div>
            <img class="img-responsive  center-block" src="./Dragonfly - Portfolio Item I_files/rmbp-sm.png" alt="macbook pro retina">
            <p class="text-block">Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter purslane kale. Celery potato scallion desert raisin horseradish spinach carrot soko.</p>
            <p class="text-block">Lotus root water spinach fennel kombu maize bamboo shoot green bean swiss chard seakale pumpkin onion chickpea gram corn pea. Brussels sprout coriander water chestnut gourd swiss chard wakame kohlrabi beetroot carrot watercress. Corn amaranth salsify bunya nuts nori azuki bean chickweed potato bell pepper artichoke.</p>
            <div class="space"></div>
            
            <div class="space"></div>
            <p class="text-block">Etiam sapien elit, consequat eget, tristique non, venenatis quis, ante. In enim a arcu imperdiet malesuada. Maecenas ipsum velit, consectetuer eu lobortis ut, dictum at dui. Aliquam in lorem sit amet leo accumsan lacinia. Curabitur bibendum justo non orci. Sed convallis magna eu sem. Nam quis nulla.</p>
            <hr class="hr">

            <ul class="list-unstyled info-list">
                <li><strong>Category: </strong>Websites
                </li>
                <li><strong>Services in project: </strong>Webdesing, UX, SEO
                </li>
                <li><strong>Client: </strong>Google Inc.
                </li>
                <li><strong>Date released: </strong>February 2014</li>
            </ul>

            <hr class="hr">

            <div class="inline-btn">
                <a class="btn btn-primary btn-xlg" href="http://bootstrapart.net/dragonfly/v1.5/portfolio-item-v1.php#"><i class="fa fa-paper-plane-o"></i>Live Preview</a>
                <div class="space-sm visible-xs"></div>
                <a class="btn btn-primary-trn btn-xlg" href="http://bootstrapart.net/dragonfly/v1.5/portfolio-v1.php"><i class="fa fa-arrow-left"></i>Back To Portfolio</a>
            </div>
        </div>
    </section>

    <section class="bg-grey section">
        <div class="container">
            <div class="clearfix ">
                <h3 class="pull-left">More Projects</h3>
                <a href="http://bootstrapart.net/dragonfly/v1.5/portfolio/portfolio-v1.php">
                    <h3 class="pull-right">View all projects</h3>
                </a>
            </div>
            <div class="space-sm"></div>
            <div class="row portfolio-grid">

                <div class="col-md-4 col-sm-6">
                    <a href="http://bootstrapart.net/dragonfly/v1.5/portfolio/portfolio-item-v1.php" title="View portfolio item">
                        <div class="hover-content">
                            <img src="./Dragonfly - Portfolio Item I_files/sign-up-sketch.jpg" class="img-responsive" alt="Portfolio - application">
                            <div class="top-part hidden-xs">
                                <i class="fa fa-eye"></i>
                            </div>
                            <div class="bottom-part hidden-xs">
                                <h3>Title</h3>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4 col-sm-6 ">
                    <a href="http://bootstrapart.net/dragonfly/v1.5/portfolio/portfolio-item-v1.php" title="View portfolio item">
                        <div class="hover-content">
                            <img src="./Dragonfly - Portfolio Item I_files/minimal-wireframe-assets.jpg" class="img-responsive" alt="Websites Layout">
                            <div class="top-part hidden-xs">
                                <i class="fa fa-eye"></i>
                            </div>
                            <div class="bottom-part hidden-xs">
                                <h3>Title</h3>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4 col-sm-6 ">
                    <a href="http://bootstrapart.net/dragonfly/v1.5/portfolio/portfolio-item-v1.php" title="View portfolio item">
                        <div class="hover-content">
                            <img src="./Dragonfly - Portfolio Item I_files/App-Preview.jpg" class="img-responsive" alt="Portfolio - application">
                            <div class="top-part hidden-xs">
                                <i class="fa fa-eye"></i>
                            </div>
                            <div class="bottom-part hidden-xs">
                                <h3>Title</h3>
                            </div>
                        </div>
                    </a>
                </div>

            </div>
        </div>
    </section>

    <!--Back to top-->
	<a href="http://bootstrapart.net/dragonfly/v1.5/portfolio-item-v1.php#" class="back-to-top" style="display: none;">
	    <i class="fa fa-angle-up"></i>
	</a>

	<!-- Side Menu -->
	<jsp:include page="../../commonSidebar.jsp" flush="false"/>
	
    <!-- Footer-->
	<jsp:include page="../../commonFooter.jsp" flush="false"/>

	<div id="ascrail2000" class="nicescroll-rails" style="width: 8px; z-index: 999999; position: fixed; top: 0px; height: 100%; right: 0px; cursor: default; opacity: 0; background: rgb(221, 221, 221);">
		<div style="position: relative; float: right; width: 8px; border: none; border-radius: 0px; height: 269px; top: 0px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>
	
	<div id="ascrail2000-hr" class="nicescroll-rails" style="height: 8px; z-index: 999999; position: fixed; left: 0px; width: 100%; bottom: 0px; cursor: default; opacity: 0; display: none; background: rgb(221, 221, 221);">
		<div style="position: relative; top: 0px; height: 8px; border: none; border-radius: 0px; width: 1391px; background-color: rgb(153, 153, 153); background-clip: padding-box;"></div>
	</div>
	
</body>
</html>