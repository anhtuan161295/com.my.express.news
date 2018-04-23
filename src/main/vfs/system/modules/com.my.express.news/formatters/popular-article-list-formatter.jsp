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
					<h1>Popular Article List Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<div class="popular-news">
						<header>
							<h3 class="title-popular">${content.value.Title}</h3>
						</header>
						<div class="popular-grids">

							<c:set var="count" value="0"/>

								<%-- Get the type of the resources to display --%>
							<c:set var="resType">${fn:substringBefore(content.value.TypesToCollect, ":")}</c:set>
								<%-- Get the path under which the resources should be searched (including subpathes) --%>
							<c:set var="path">${cms.requestContext.siteRoot}/</c:set>
								<%-- Create the configuration for <cms:search> --%>
							<c:set var="searchconfig">
								{
								"ignorequery" : true,
								"extrasolrparams" : "fq=parent-folders:\"${path}\"&fq=type:${resType}",
								"pagesize" : ${content.value.ResourceLimit}
								}
							</c:set>

							<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />

							<c:choose>
								<c:when test="${search.numFound > 0}">
									<%-- Iterate through the search results and render them via <cms:display> --%>
									<c:forEach var="result" items="${search.searchResults}">
										<cms:display value='${result.xmlContent.filename}'
													 displayFormatters="${content.value.TypesToCollect}"
													 editable="true" create="true" delete="true" />
										<hr />
									</c:forEach>
								</c:when>
								<c:otherwise>
									<%-- Show an option to create a new content via <cms:edit> --%>
									<cms:edit createType="${resType}" create="true">
										<div>
											Create a new list entry of type ${resType}.
										</div>
									</cms:edit>
									<hr />
								</c:otherwise>

							</c:choose>

						</div>
					</div>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>
