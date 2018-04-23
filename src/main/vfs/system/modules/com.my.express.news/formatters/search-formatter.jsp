<%@ page import="org.opencms.util.CmsStringUtil" %>
<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<cms:formatter var="content">

	<%
		String q = request.getParameter("q") == null ? "" : request.getParameter("q");
		String p = request.getParameter("page") == null ? "" : request.getParameter("page");

		int pageNumber = 0;

		try {
			if(CmsStringUtil.isNotEmpty(p)){
				pageNumber = CmsStringUtil.getIntValue(p, 0, "page");
			}
		}catch (Exception e){
			out.print("Error in parse integer pageNumber in search-formatter.jsp");
		}

		pageContext.setAttribute("searchquery", q);
		pageContext.setAttribute("pageNumber", p);
	%>

	<c:if test="${cms.container.type == 'express-news-body'}">
		<c:choose>
			<c:when test="${cms.element.inMemoryOnly}">
				<div>
					<h1>Search Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<%--<c:set var="query">q=${searchquery}&fq=parent-folders:/sites/default/express-news&fq=type:express-news-article&sort=lastmodified desc</c:set>--%>
					<%--<h1>Tu khoa "${searchquery}"</h1>--%>
					<%--<cms:contentload collector="byQuery" preload="true"--%>
									 <%--param='${query}'>--%>
						<%--<cms:contentinfo var="info" />--%>
						<%--<c:if test='${info.resultSize != 0}'>--%>
							<%--<cms:contentload editable="false">--%>
								<%--<cms:contentaccess var="content" />--%>
								<%--&lt;%&ndash; Title of the article &ndash;%&gt;--%>
								<%--&lt;%&ndash; The text field of the article with image &ndash;%&gt;--%>
								<%--<a href="<cms:link>${content.filename}</cms:link>">${content.value.Title}</a>--%>
								<%--<div class="paragraph">--%>
										<%--&lt;%&ndash; Set the requied variables for the image. &ndash;%&gt;--%>
									<%--<c:if test="${content.value.Thumbnail.isSet}">--%>
										<%--&lt;%&ndash; Output the image. &ndash;%&gt;--%>
										<%--<cms:img width="150" maxWidth="150" src="${content.value.Thumbnail}" />--%>
									<%--</c:if>--%>
										<%--${cms:trimToSize(cms:stripHtml(content.value.ShortDescription), 300)}--%>
								<%--</div>--%>
								<%--<div class="clear"></div>--%>
								<%--<hr/>--%>
							<%--</cms:contentload>--%>
						<%--</c:if>--%>
					<%--</cms:contentload>--%>

					<%-- Get the type of the resources to display --%>
					<c:set var="resType">express-news-article</c:set>
					<%-- Get the path under which the resources should be searched (including subpathes) --%>
					<c:set var="path">${cms.requestContext.siteRoot}/</c:set>

					<fmt:parseNumber var="resultPerPage" value="${content.value.ResultPerPage}" integerOnly="TRUE" type="NUMBER" />

					<%-- Create the configuration for <cms:search> --%>
					<c:set var="searchconfig">
						{
						"ignorequery" : true,
						"extrasolrparams" : "q=${searchquery}&fq=parent-folders:\"${path}\"&fq=type:${resType}",
						"pagesize" : ${resultPerPage}
						}
					</c:set>


					<c:set var="start" value="${pageNumber == 1 ? 0 : pageNumber * resultPerPage}"/>

					<c:if test="${pageNumber > 0}">
						<c:set var="searchconfig">
							{
							"ignorequery" : true,
							"extrasolrparams" : "q=${searchquery}&fq=parent-folders:\"${path}\"&fq=type:${resType}&start=${start}&rows=${resultPerPage}",
							"pagesize" : ${resultPerPage}
							}
						</c:set>
					</c:if>

					<%--${searchconfig}--%>

					<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />

					<fmt:parseNumber var="totalCount" value="${search.numFound}" integerOnly="TRUE" type="NUMBER" />

					<c:set var="totalPage" value="${totalCount % resultPerPage == 0 ? totalCount / resultPerPage : (totalCount / resultPerPage) + 1}"/>

						<header>
							<h3 class="title-head">${totalCount} results for <span>"${searchquery}"</span></h3>
							<br/>
						</header>

					<br/><br/>

					<c:forEach begin="1" end="${totalPage}" varStatus="status">
						<c:if test="${totalCount > resultPerPage}">
							<a href="<cms:link>${cms.requestContext.uri}</cms:link>?q=${searchquery}&page=${status.count}">${status.count}</a>
						</c:if>
					</c:forEach>

					<br/><br/>

					<c:choose>
						<c:when test="${search.numFound > 0}">

							<%--<c:if test="${empty pageStart or pageStart < 0}">--%>
								<%--<c:set var="pageStart" value="0"/>--%>
							<%--</c:if>--%>
							<%--<c:if test="${totalCount < pageStart}">--%>
								<%--<c:set var="pageStart" value="${pageStart - perPage}"/>--%>
							<%--</c:if>--%>
							<%--<a href="?start=${pageStart - perPage}"><<</a>${pageStart + 1} - ${pageStart + perPage}--%>
							<%--<a href="?start=${pageStart + perPage}">>></a>--%>
							<%--<h1>Letters</h1>--%>
							<%--<c:forEach var="letter" items="${letters}"--%>
									   <%--begin="${pageStart}" end="${pageStart + perPage - 1}">--%>
								<%--${letter}--%>
							<%--</c:forEach>--%>

							<%-- Iterate through the search results and render them via <cms:display> --%>
							<c:forEach var="result" items="${search.searchResults}" varStatus="status">
								<c:set var="xmlContent" value="${result.xmlContent}"/>

								<a href="<cms:link>${xmlContent.filename}</cms:link>">${xmlContent.value.Title}</a>

								<div class="paragraph">
									<%-- Set the requied variables for the image. --%>
									<c:if test="${xmlContent.value.Thumbnail.isSet}">
										<%-- Output the image. --%>
										<cms:img width="150" maxWidth="150" src="${xmlContent.value.Thumbnail}" />
									</c:if>
									${cms:trimToSize(cms:stripHtml(xmlContent.value.ShortDescription), 300)}
								</div>

								<hr />
							</c:forEach>
						</c:when>

					</c:choose>


				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>
