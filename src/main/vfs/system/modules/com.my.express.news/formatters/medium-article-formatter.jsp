<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ex" tagdir="/WEB-INF/tags/express-news" %>

<cms:formatter var="content">

	<c:if test="${cms.container.type == 'express-news-content'}">
		<c:choose>
			<c:when test="${cms.element.inMemoryOnly}">
				<div>
					<h1>Medium Article Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<ex:a link="${content.filename}">
						<img src="<cms:link>${content.value.Thumbnail}</cms:link>">
					</ex:a>
					<ex:a link="${content.filename}" cssclass="title">
						${content.value.ShortDescription}
					</ex:a>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>
