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
					<h1>Slider Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<div class="slider">
						<div class="callbacks_wrap">
							<ul class="rslides" id="slider">

								<c:forEach items="${content.valueList.SliderItems}" var="item">
									<li>
										<cms:img src="${item.value.ImageLink}" alt=""/>
											<%--<img src="images/3.jpg" alt="">--%>
										<div class="caption">
											<ex:a link="${item.value.Link}">
												${item.value.Title}
											</ex:a>
										</div>
									</li>
								</c:forEach>

							</ul>
						</div>
					</div>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>
