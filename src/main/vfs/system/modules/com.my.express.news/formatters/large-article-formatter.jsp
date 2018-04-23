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
					<h1>Large Article Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<div class="article">
						<div class="article-left">
							<%--<a href="<cms:link>${content.filename}</cms:link>">--%>
								<%--<img src="<cms:link>${content.value.Thumbnail}</cms:link>">--%>
							<%--</a>--%>
							<a href="<cms:link>${content.filename}</cms:link>">
								<img src="<cms:link>${content.value.Thumbnail}</cms:link>">
							</a>
						</div>
						<div class="article-right">
							<div class="article-title">
								<p>${content.value.Date}
									<a class="span_link" href="<cms:link>${content.filename}</cms:link>">
										<span class="glyphicon glyphicon-comment"></span>${content.value.Comment}
									</a>
									<a class="span_link" href="<cms:link>${content.filename}</cms:link>">
										<span class="glyphicon glyphicon-eye-open"></span>${content.value.View}
									</a>
									<a class="span_link" href="<cms:link>${content.filename}</cms:link>">
										<span class="glyphicon glyphicon-thumbs-up"></span>${content.value.Like}
									</a></p>
								<%--<a class="title" href="<cms:link>${content.filename}</cms:link>"> ${content.value.Title}</a>--%>
								<ex:link link="${content.filename}" text="${content.value.Title}" cssclass="title"/>
							</div>
							<div class="article-text">
								<p>${content.value.ShortDescription}</p>
								<%--<a href="<cms:link>${content.filename}</cms:link>">--%>
									<%--<img src="<cms:link>%(link.weak:/system/modules/com.my.express.news/resources/images/more.png)</cms:link>" alt="" />--%>
								<%--</a>--%>
								<ex:link link="${content.filename}">
									<img src="<cms:link>%(link.weak:/system/modules/com.my.express.news/resources/images/more.png)</cms:link>" alt="" />
								</ex:link>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>
