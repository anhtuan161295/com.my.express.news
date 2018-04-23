<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content">

	<c:if test="${cms.container.type == 'express-news-right-sidebar'}">
		<c:choose>
			<c:when test="${cms.element.inMemoryOnly}">
				<div>
					<h1>Sidebar Article Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<div class="side-bar-article">
						<a href="<cms:link>${content.filename}</cms:link>"><img src="<cms:link>${content.value.Thumbnail}</cms:link>" alt="" /></a>
						<div class="side-bar-article-title">
							<a href="<cms:link>${content.filename}</cms:link>">${content.value.ShortDescription}</a>
						</div>
					</div>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>
