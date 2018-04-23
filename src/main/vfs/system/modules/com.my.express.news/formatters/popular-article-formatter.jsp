<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ex" tagdir="/WEB-INF/tags/express-news" %>

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
							<ex:a link="${content.filename}">
								<img src="<cms:link>${content.value.Thumbnail}</cms:link>">
							</ex:a>
						</c:if>

						<c:if test="${content.value.Thumbnail eq '' and content.value.VideoLink ne ''}">
							<iframe width="100%" src="${content.value.VideoLink}" frameborder="0" allowfullscreen></iframe>
						</c:if>

						<ex:a link="${content.filename}" cssclass="title">
							${content.value.Title}
						</ex:a>
						<p>${content.value.Date}
							<ex:a link="${content.filename}" cssclass="span_link">
								<span class="glyphicon glyphicon-comment"></span>${content.value.Comment}
							</ex:a>
							<ex:a link="${content.filename}" cssclass="span_link">
								<span class="glyphicon glyphicon-eye-open"></span>${content.value.View}
							</ex:a>
							<ex:a link="${content.filename}" cssclass="span_link">
								<span class="glyphicon glyphicon-thumbs-up"></span>${content.value.Like}
							</ex:a>
						</p>
					</div>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>
