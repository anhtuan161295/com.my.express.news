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
					<h1>Tag Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<div class="tags">
						<header>
							<h3 class="title-head">${content.value.Title}</h3>
						</header>
						<p>
							<c:forEach items="${content.valueList.TagItems}" var="item" varStatus="status">
								<a class="tag${status.index + 1}" href="<cms:link>${item.value.Link}</cms:link>">${item.value.Title}</a>
							</c:forEach>
						</p>
					</div>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>
