<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content">

	<c:if test="${cms.container.type == 'express-news-footer'}">
		<c:choose>
			<c:when test="${cms.element.inMemoryOnly}">
				<div>
					<h1>Footer Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<div class="footer">
						<div class="footer-top">
							<div class="wrap">
								<div class="col-md-3 col-xs-6 col-sm-4 footer-grid">
									<h4 class="footer-head">${content.value.AboutUsLabel}</h4>
									<p>${content.value.AboutUs}</p>
								</div>
								<div class="col-md-2 col-xs-6 col-sm-2 footer-grid">
									<h4 class="footer-head">${content.value.CategoriesLabel}</h4>
									<ul class="cat">
										<c:forEach items="${content.valueList.Categories}" var="item">
											<li><a href="<cms:link>${item}</cms:link>">${cms.vfs.property[item]['NavText']}</a></li>
										</c:forEach>
									</ul>
								</div>
								<div class="col-md-4 col-xs-6 col-sm-6 footer-grid">
									<h4 class="footer-head">${content.value.FeedsLabel}</h4>
									<ul class="flickr">
										<c:forEach items="${content.valueList.Feeds}" var="item">
											<li><a href="<cms:link>${item}</cms:link>"><img src="<cms:link>${item}</cms:link>"></a></li>
										</c:forEach>
										<div class="clearfix"></div>
									</ul>
								</div>
								<div class="col-md-3 col-xs-12 footer-grid">
									<h4 class="footer-head">${content.value.ContactUsLabel}</h4>
									<span class="hq">${content.value.OurHeadquarterText}</span>
									<address>
										<ul class="location">
											<li><span class="glyphicon glyphicon-map-marker"></span></li>
											<li>${content.value.Address}</li>
											<div class="clearfix"></div>
										</ul>
										<ul class="location">
											<li><span class="glyphicon glyphicon-earphone"></span></li>
											<li>${content.value.PhoneNumber}</li>
											<div class="clearfix"></div>
										</ul>
										<ul class="location">
											<li><span class="glyphicon glyphicon-envelope"></span></li>
											<li><a href="${content.value.Email}">${content.value.Email}</a></li>
											<div class="clearfix"></div>
										</ul>
									</address>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="footer-bottom">
							<div class="wrap">
								<div class="copyrights col-md-6">
									<p>${content.value.CopyrightText}</p>
								</div>
								<div class="footer-social-icons col-md-6">
									<ul>
										<li><a class="facebook" href="#"></a></li>
										<li><a class="twitter" href="#"></a></li>
										<li><a class="flickr" href="#"></a></li>
										<li><a class="googleplus" href="#"></a></li>
										<li><a class="dribbble" href="#"></a></li>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>
