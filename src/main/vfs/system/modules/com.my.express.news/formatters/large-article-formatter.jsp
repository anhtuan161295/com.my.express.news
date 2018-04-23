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
							<ex:a link="${content.filename}">
								<img src="<cms:link>${content.value.Thumbnail}</cms:link>">
							</ex:a>
						</div>
						<div class="article-right">
							<div class="article-title">
								<p>${content.value.Date}
									<ex:a link="${content.filename}" cssclass="span_link">
										<span class="glyphicon glyphicon-comment"></span>${content.value.Comment}
									</ex:a>
									<ex:a link="${content.filename}" cssclass="span_link">
										<span class="glyphicon glyphicon-eye-open"></span>${content.value.View}
									</ex:a>
									<ex:a link="${content.filename}" cssclass="span_link">
										<span class="glyphicon glyphicon-thumbs-up"></span>${content.value.Like}
									</ex:a>
								</p>
								<ex:a link="${content.filename}" text="${content.value.Title}" cssclass="title"/>
							</div>
							<div class="article-text">
								<p>${content.value.ShortDescription}</p>
								<ex:a link="${content.filename}">
									<img src="<cms:link>%(link.weak:/system/modules/com.my.express.news/resources/images/more.png)</cms:link>" alt="" />
								</ex:a>
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
