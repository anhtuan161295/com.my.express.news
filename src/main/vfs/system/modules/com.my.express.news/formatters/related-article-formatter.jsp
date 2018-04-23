<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content">

	<c:if test="${cms.container.type == 'express-news-content-detail'}">
		<c:choose>
			<c:when test="${cms.element.inMemoryOnly}">
				<div>
					<h1>Related Article Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<div class="col-xs-6 col-md-3 related-grids">
						<a href="<cms:link>${content.filename}</cms:link>" class="thumbnail">
							<img src="<cms:link>${content.value.Thumbnail}</cms:link>" alt=""/>
						</a>
						<h5><a href="<cms:link>${content.filename}</cms:link>">${content.value.ShortDescription}</a></h5>
					</div>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>
