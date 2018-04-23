<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<cms:formatter var="content">

	<c:if test="${cms.container.type == 'express-news-left-sidebar'}">
		<c:choose>
			<c:when test="${cms.element.inMemoryOnly}">
				<div>
					<h1>Share Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<h3>SHARE</h3>
					<ul>
						<li>
							<a href="<cms:link>${content.value.FacebookLink}</cms:link>">
								<i class="facebook"></i>
								<div class="views">
									<span>SHARE</span>
									<label>180</label>
								</div>
								<div class="clearfix"></div>
							</a>
						</li>
						<li>
							<a href="<cms:link>${content.value.TwitterLink}</cms:link>">
								<i class="twitter"></i>
								<div class="views">
									<span>TWEET</span>
									<label>355</label>
								</div>
								<div class="clearfix"></div>
							</a>
						</li>
						<li>
							<a href="<cms:link>${content.value.LinkedInLink}</cms:link>">
								<i class="linkedin"></i>
								<div class="views">
									<span>SHARES</span>
									<label>28</label>
								</div>
								<div class="clearfix"></div>
							</a>
						</li>
						<li>
							<a href="<cms:link>${content.value.PinterestLink}</cms:link>">
								<i class="pinterest"></i>
								<div class="views">
									<span>PIN</span>
									<label>16</label>
								</div>
								<div class="clearfix"></div>
							</a>
						</li>
						<li>
							<a href="<cms:link>${content.value.EmailLink}</cms:link>">
								<i class="email"></i>
								<div class="views">
									<span>Email</span>
								</div>
								<div class="clearfix"></div>
							</a>
						</li>
					</ul>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>


</cms:formatter>
