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
					<h1>Popular Article Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<div class="popular-grid">
						<c:if test="${content.value.Thumbnail ne '' and content.value.VideoLink eq ''}">
							<a href="<cms:link>${content.filename}</cms:link>"><img src="<cms:link>${content.value.Thumbnail}</cms:link>" alt="" /></a>
						</c:if>

						<c:if test="${content.value.Thumbnail eq '' and content.value.VideoLink ne ''}">
							<iframe width="100%" src="${content.value.VideoLink}" frameborder="0" allowfullscreen></iframe>
						</c:if>

						<a class="title" href="<cms:link>${content.filename}</cms:link>">${content.value.Title}</a>
						<p>${content.value.Date} <a class="span_link" href="<cms:link>${content.filename}</cms:link>"><span class="glyphicon glyphicon-comment"></span>${content.value.Comment} </a><a class="span_link" href="<cms:link>${content.filename}</cms:link>"><span class="glyphicon glyphicon-eye-open"></span>${content.value.View} </a><a class="span_link" href="<cms:link>${content.filename}</cms:link>"><span class="glyphicon glyphicon-thumbs-up"></span>${content.value.Like}</a></p>
					</div>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>
