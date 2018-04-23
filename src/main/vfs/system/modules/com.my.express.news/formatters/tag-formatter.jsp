<%@ page import="java.util.concurrent.ThreadLocalRandom" %>
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

							<%-- Get the type of the resources to display --%>
							<c:set var="resType">${content.value.ResourceType}</c:set>
							<%-- Get the path under which the resources should be searched (including subpathes) --%>
							<c:set var="path">${cms.requestContext.siteRoot}/</c:set>
							<%-- Create the configuration for <cms:search> --%>
							<c:set var="searchconfig">
							{
							"ignorequery" : true,
							"extrasolrparams" : "fq=parent-folders:\"${path}\"&fq=type:${resType}",
							}
							</c:set>

							<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />

							<fmt:parseNumber var="totalCount" value="50" integerOnly="TRUE" type="NUMBER" />

							<c:choose>
								<c:when test="${search.numFound > 0}">
									<fmt:parseNumber var="count" value="0" integerOnly="TRUE" type="NUMBER" />

									<%-- Iterate through the search results and render them via <cms:display> --%>
									<c:forEach var="result" items="${search.searchResults}" varStatus="status">
										<c:set var="xmlContent" value="${result.xmlContent}"/>

										<c:set var="articleTitle" value="${xmlContent.value.Title}"/>

										<ex:a cssclass="tag${count}" link="${xmlContent.filename}">
											${articleTitle} ${' '}
										</ex:a>

										<c:set var="count" value="${count + 1}"/>

									</c:forEach>

								</c:when>

							</c:choose>

						</p>
					</div>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>

