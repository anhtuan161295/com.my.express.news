<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ex" tagdir="/WEB-INF/tags/express-news" %>

<cms:formatter var="content">

	<c:if test="${cms.container.type == 'express-news-content-detail'}">
		<c:choose>
			<c:when test="${cms.element.inMemoryOnly}">
				<div>
					<h1>Single Page Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<div class="blog-posts">
						<h3 class="post">${content.value.Title}</h3>
						<div class="last-article">
							${content.value.Content}
							
							<%--<p class="artext">With Cameron immediately renewing his pledge to hold a referendum on British membership of the European Union, the result throws up questions about Britain’s constitutional future. For now, the surprise victory was welcomed by markets, with stocks and the pound rallying as it became clear Cameron had defied forecasts of a hung parliament to easily defeat Ed Miliband’s Labour Party and govern alone.</p>--%>
							<%--<h3>Donald Trump News - Donald Trump Special Reports</h3>--%>
							<%--<iframe src="https://www.youtube.com/embed/mbDg4OG7z4Y" frameborder="0" allowfullscreen=""></iframe>--%>
							<%--<p class="artext">The premier was meeting with Queen Elizabeth II at Buckingham Palace as the Conservatives reached the 326-seat threshold that allows them--%>
								<%--to ditch their Liberal Democrat coalition partners and govern alone in the 650-seat Parliament.</p>--%>
							<%--<p class="artext">The premier was meeting with Queen Elizabeth II at Buckingham Palace as the Conservatives reached the 326-seat threshold that allows them--%>
								<%--to ditch their Liberal Democrat coalition partners and govern alone in the 650-seat Parliament.</p>--%>

							<c:if test="${not empty content.valueList.Categories}">
								<ul class="categories">
									<c:forEach var="item" items="${content.valueList.Categories}">
										<li>
											<ex:a link="${item}">
												${cms.vfs.property[item]['NavText']}
											</ex:a>
										</li>
									</c:forEach>
								</ul>
							</c:if>
							<div class="clearfix"></div>
							<!--related-posts-->
							<div class="row related-posts">
								<h4>Articles You May Like</h4>

								<%-- Get the type of the resources to display --%>
								<c:set var="resType">express-news-article</c:set>
								<%-- root path : /sites/default/ --%>
								<c:set var="rootPath">${cms.requestContext.siteRoot}</c:set>
								<%-- Get the path under which the resources should be searched (including subpathes) --%>
								<c:set var="resPath">${rootPath}/</c:set>
								<%-- Create the configuration for <cms:search> --%>
								<c:set var="searchConfig">
									{
									"ignorequery" : true,
									"extrasolrparams" : "fq=parent-folders:\"${resPath}\"&fq=type:${resType}",
									"pagesize" : 4
									}
								</c:set>

								<cms:search configString="${searchConfig}" var="search" addContentInfo="true" />

								<c:choose>
									<c:when test="${search.numFound > 0}">
										<%-- Iterate through the search results and render them via <cms:display> --%>
										<c:forEach var="result" items="${search.searchResults}" varStatus="status">
											<cms:display value='${result.xmlContent.filename}'
														 displayFormatters="${resType}:/system/modules/com.my.express.news/formatters/related-article-formatter-config.xml"
														 editable="false" create="false" delete="false">
												<%--<cms:displayFormatter type="${resType}" path="/system/modules/com.my.express.news/formatters/related-article-formatter-config.xml" />--%>
											</cms:display>
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
							<!--//related-posts-->
							<c:set var="hostPath" value="${requestScope['javax.servlet.forward.request_uri']}" />
							<c:set var="hostName" value="${cms.requestContext.requestMatcher}" />
							<c:set var="currentUrl" value="${hostName}${hostPath}" />

							<div id="fb-root"></div>
							<script>(function(d, s, id) {
								var js, fjs = d.getElementsByTagName(s)[0];
								if (d.getElementById(id)) return;
								js = d.createElement(s); js.id = id;
								js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.12';
								fjs.parentNode.insertBefore(js, fjs);
							}(document, 'script', 'facebook-jssdk'));</script>

							<div class="fb-comments" data-href="${currentUrl}" data-numposts="5"></div>

							<div class="clearfix"></div>
						</div>
					</div>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>
