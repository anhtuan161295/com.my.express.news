<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content">

	<c:if test="${cms.container.type == 'express-news-body'}">
		<c:choose>
			<c:when test="${cms.element.inMemoryOnly}">
				<div>
					<h1>Layout Detail Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<div class="main-body">
						<div class="wrap">
							<ol class="breadcrumb">
								<c:set var="rootSitemap" value="${cms.subSitePath}"/>
								<c:set var="homePage" value="${rootSitemap}home"/>
								<li><a href="<cms:link>${homePage}</cms:link>">${cms.vfs.property[homePage]['NavText']}</a></li>

								<c:set var="currentPagePath" value="${requestScope['javax.servlet.forward.request_uri']}" />
								<li class="active"><a href="<cms:link>${currentPagePath}</cms:link>"><cms:info property="opencms.title"/></a></li>
							</ol>

							<div class="single-page">
                                <!-- Share -->
								<div class="col-md-2 share_grid">
									<cms:container name="leftsidebar" type="express-news-left-sidebar" width="450">
										<div style="background: lightgray; height: 200px">Share</div>
									</cms:container>
								</div>

                                <!-- Body -->
								<div class="col-md-6 content-left single-post">
									<cms:container name="contentleft-single-post-container" type="express-news-content-detail" width="450" detailview="true" detailonly="true">
										<div style="background: lightgray; height: 200px">Body</div>
									</cms:container>
								</div>

                                <!-- Right sidebar -->
                                <div class="col-md-4 side-bar">
                                    <div class="first_half">
                                        <cms:container name="sidebarfirsthalfcontainer" type="express-news-right-sidebar" width="450">
                                            <div style="background: lightgray; height: 100px">First Half Side Bar</div>
                                        </cms:container>
                                    </div>

                                    <div class="secound_half">
                                        <cms:container name="sidebarsecondhalfcontainer" type="express-news-right-sidebar" width="450">
                                            <div style="background: lightgray; height: 100px">Second Half Side Bar</div>
                                        </cms:container>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="clearfix"></div>

                            </div>

                        </div>
                    </div>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>
