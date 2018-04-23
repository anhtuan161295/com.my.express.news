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
					<h1>Layout Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<div class="main-body">
						<div class="wrap">
							<div class="col-md-8 content-left">
								<cms:container name="contentleftcontainer" type="express-news-content" width="450">
									<div style="background: lightgray; height: 200px">Content</div>
								</cms:container>
							</div>
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
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>
