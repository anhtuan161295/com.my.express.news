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
					<h1>Small Article Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<%-- Abbreviate "cms.element.settings" with "settings" --%>
					<c:set var="settings" value="${cms.element.settings}" />

					<c:if test="${settings['isFirst'] eq 'true'}">
						<div class="c-sports-main">
							<div class="c-image">
								<ex:a link="${content.filename}">
									<img src="<cms:link>${content.value.Thumbnail}</cms:link>" alt=""/>
								</ex:a>
							</div>
							<div class="c-text">
								<h6>${content.value.Title}</h6>
								<ex:a link="${content.filename}" cssclass="power">${content.value.ShortDescription}</ex:a>
								<p class="date">${content.value.Date}</p>
								<ex:a link="${content.filename}" cssclass="reu">
									<img src="<cms:link>%(link.weak:/system/modules/com.my.express.news/resources/images/more.png)</cms:link>" alt="" />
								</ex:a>
								<div class="clearfix"></div>
							</div>
							<div class="clearfix"></div>
						</div>
					</c:if>

					<c:if test="${empty settings['isFirst']}">
						<div class="s-grid-small">
							<div class="sc-image">
								<ex:a link="${content.filename}">
									<img src="<cms:link>${content.value.Thumbnail}</cms:link>" alt=""/>
								</ex:a>
							</div>
							<div class="sc-text">
								<h6>${content.value.Title}</h6>
								<ex:a link="${content.filename}" cssclass="power">${content.value.ShortDescription}</ex:a>
								<p class="date">${content.value.Date}</p>
								<ex:a link="${content.filename}" cssclass="reu">
									<img src="<cms:link>%(link.weak:/system/modules/com.my.express.news/resources/images/more.png)</cms:link>" alt="" />
								</ex:a>
								<div class="clearfix"></div>
							</div>
							<div class="clearfix"></div>
						</div>
					</c:if>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>
