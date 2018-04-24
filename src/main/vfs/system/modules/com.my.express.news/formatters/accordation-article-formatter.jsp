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
					<h1>Accordation Article Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<div class="popular-post-grid">
						<div class="post-img">
							<ex:a link="${content.filename}">
								<img src="<cms:link>${content.value.Thumbnail}</cms:link>">
							</ex:a>
						</div>
						<div class="post-text">
							<ex:a link="${content.filename}" cssclass="pp-title">${content.value.Title}</ex:a>
							<fmt:formatDate var="formattedDate" pattern="MMM dd" value = "${cms:convertDate(content.value.Date)}" />
							<p>On ${formattedDate}
								<ex:a link="${content.filename}" cssclass="span_link">
									<span class="glyphicon glyphicon-comment"></span>${content.value.Comment}
								</ex:a>
								<ex:a link="${content.filename}" cssclass="span_link">
									<span class="glyphicon glyphicon-eye-open"></span>${content.value.View}
								</ex:a>
							</p>
						</div>
						<div class="clearfix"></div>
					</div>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>
