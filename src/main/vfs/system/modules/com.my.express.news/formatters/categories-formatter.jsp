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
					<h1>Categories Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<div class="categories">
						<header>
							<h3 class="side-title-head">${content.value.Title}</h3>
						</header>
						<ul>
							<c:forEach var="item" items="${content.valueList.Category}">
								<li><a href="<cms:link>${item}</cms:link>">${cms.vfs.property[item]['NavText']}</a></li>
							</c:forEach>

						</ul>
					</div>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>
