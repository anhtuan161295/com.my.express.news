<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content">

	<c:if test="${cms.container.type == 'express-news-content'}">
		<c:choose>
			<c:when test="${cms.element.inMemoryOnly}">
				<div>
					<h1>Dual Small Article List Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<div class="sports-top">
						<div class="s-grid-left">
							<div class="cricket">
								<header>
									<h3 class="title-head">${content.value.LeftArticleList.value.Title}</h3>
								</header>


								<%-- Get the type of the resources to display --%>
								<c:set var="leftResType">${fn:substringBefore(content.value.LeftArticleList.value.TypesToCollect, ":")}</c:set>
								<%-- root path : /sites/default/ --%>
								<c:set var="leftRootPath">${cms.requestContext.siteRoot}</c:set>
								<%-- Get the path under which the resources should be searched (including subpathes) --%>
								<c:set var="leftResPath">${leftRootPath}${content.value.LeftArticleList.value.ResourcePath}</c:set>
								<%-- Create the configuration for <cms:search> --%>
								<c:set var="leftSearchConfig">
									{
									"ignorequery" : true,
									"extrasolrparams" : "fq=parent-folders:\"${leftResPath}\"&fq=type:${leftResType}",
									"pagesize" : ${content.value.LeftArticleList.value.ResourceLimit}
									}
								</c:set>

								<cms:search configString="${leftSearchConfig}" var="leftSearch" addContentInfo="true" />

								<c:choose>
									<c:when test="${leftSearch.numFound > 0}">
										<%-- Iterate through the search results and render them via <cms:display> --%>
										<c:forEach var="result" items="${leftSearch.searchResults}" varStatus="status">

											<c:if test="${status.first}">
												<cms:display value='${result.xmlContent.filename}'
															 displayFormatters="${content.value.LeftArticleList.value.TypesToCollect}"
															 editable="true" create="true" delete="true">

													<cms:param name="isFirst">true</cms:param>

												</cms:display>

											</c:if>

											<c:if test="${!status.first}">
												<cms:display value='${result.xmlContent.filename}'
															 displayFormatters="${content.value.LeftArticleList.value.TypesToCollect}"
															 editable="true" create="true" delete="true"/>

											</c:if>

										</c:forEach>
									</c:when>
									<c:otherwise>
										<%-- Show an option to create a new content via <cms:edit> --%>
										<cms:edit createType="${leftResType}" create="true">
											<div>
												Create a new list entry of type ${leftResType}.
											</div>
										</cms:edit>
										<hr />
									</c:otherwise>

								</c:choose>

							</div>
						</div>

						<div class="s-grid-right">
							<div class="cricket">
								<header>
									<h3 class="title-popular">${content.value.RightArticleList.value.Title}</h3>
								</header>

								<%-- Get the type of the resources to display --%>
								<c:set var="rightResType">${fn:substringBefore(content.value.RightArticleList.value.TypesToCollect, ":")}</c:set>
								<%-- root path : /sites/default/ --%>
								<c:set var="rightRootPath">${cms.requestContext.siteRoot}</c:set>
								<%-- Get the path under which the resources should be searched (including subpathes) --%>
								<c:set var="rightResPath">${rightRootPath}${content.value.RightArticleList.value.ResourcePath}</c:set>
								<%-- Create the configuration for <cms:search> --%>
								<c:set var="rightSearchConfig">
									{
									"ignorequery" : true,
									"extrasolrparams" : "fq=parent-folders:\"${rightResPath}\"&fq=type:${rightResType}",
									"pagesize" : ${content.value.RightArticleList.value.ResourceLimit}
									}
								</c:set>

								<cms:search configString="${rightSearchConfig}" var="rightSearch" addContentInfo="true" />

								<c:choose>
									<c:when test="${rightSearch.numFound > 0}">
										<%-- Iterate through the search results and render them via <cms:display> --%>
										<c:forEach var="result" items="${rightSearch.searchResults}" varStatus="status">

											<c:if test="${status.first}">
												<cms:display value='${result.xmlContent.filename}'
															 displayFormatters="${content.value.RightArticleList.value.TypesToCollect}"
															 editable="true" create="true" delete="true">

													<cms:param name="isFirst">true</cms:param>

												</cms:display>

											</c:if>

											<c:if test="${!status.first}">
												<cms:display value='${result.xmlContent.filename}'
															 displayFormatters="${content.value.RightArticleList.value.TypesToCollect}"
															 editable="true" create="true" delete="true"/>

											</c:if>

										</c:forEach>
									</c:when>
									<c:otherwise>
										<%-- Show an option to create a new content via <cms:edit> --%>
										<cms:edit createType="${rightResType}" create="true">
											<div>
												Create a new list entry of type ${rightResType}.
											</div>
										</cms:edit>
										<hr />
									</c:otherwise>

								</c:choose>


							</div>
						</div>

						<div class="clearfix"></div>

					</div>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>
