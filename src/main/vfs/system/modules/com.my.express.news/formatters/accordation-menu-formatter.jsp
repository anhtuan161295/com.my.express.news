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
					<h1>Accordation Menu Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<div class="list_vertical">
						<section class="accordation_menu">

							<c:set var="accordationItemSize" value="0"/>

							<c:forEach items="${content.valueList.AccordationPostItems}" var="accordationPostItem" varStatus="status">

								<c:set var="accordationItemSize" value="${accordationItemSize + 1}"/>

								<div>
									<input id="label-${accordationItemSize}" name="lida" type="radio" ${status.index == 0 ? 'checked':''}/>
									<label for="label-${accordationItemSize}" id="item${accordationItemSize}"><i class="ferme"> </i>${accordationPostItem.value.Title}<i class="icon-plus-sign i-right1"></i><i class="icon-minus-sign i-right2"></i></label>
									<div class="content" id="a${accordationItemSize}">
										<div class="scrollbar" id="style-2">
											<div class="force-overflow">
												<div class="popular-post-grids">

													<%-- Get the type of the resources to display --%>
													<c:set var="resType">${fn:substringBefore(accordationPostItem.value.TypesToCollect, ":")}</c:set>
													<%-- Get the path under which the resources should be searched (including subpathes) --%>
													<c:set var="path">${cms.requestContext.siteRoot}/</c:set>
													<%-- Create the configuration for <cms:search> --%>
													<c:set var="searchconfig">
														{
														"ignorequery" : true,
														"extrasolrparams" : "fq=parent-folders:\"${path}\"&fq=type:${resType}",
														"pagesize" : ${accordationPostItem.value.ResourceLimit}
														}
													</c:set>

													<cms:search configString="${searchconfig}" var="search" addContentInfo="true" />

													<c:choose>
														<c:when test="${search.numFound > 0}">
															<%-- Iterate through the search results and render them via <cms:display> --%>
															<c:forEach var="result" items="${search.searchResults}">
																<cms:display value='${result.xmlContent.filename}'
																			 displayFormatters="${accordationPostItem.value.TypesToCollect}"
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
									</div>
								</div>
							</c:forEach>

							<c:forEach items="${content.valueList.AccordationCommentItems}" var="accordationCommentItem">
								<c:set var="accordationItemSize" value="${accordationItemSize + 1}"/>

								<div>
									<input id="label-${accordationItemSize}" name="lida" type="radio"/>
									<label for="label-${accordationItemSize}" id="item${accordationItemSize}"><i class="icon-trophy" id="i3"></i>${accordationCommentItem.value.Title}<i class="icon-plus-sign i-right1"></i><i class="icon-minus-sign i-right2"></i></label>
									<div class="content" id="a${accordationItemSize}">
										<div class="scrollbar" id="style-2">
											<div class="force-overflow">
												<div class="response">

													<c:forEach items="${accordationCommentItem.valueList.CommentItems}" var="commentItem">
														<div class="media response-info">
															<div class="media-left response-text-left">
																<a href="<cms:link>${commentItem.value.Link}</cms:link>">
																	<img class="media-object" src="<cms:link>${commentItem.value.ImageLink}</cms:link>" alt="" />
																</a>
																<h5><a href="<cms:link>${commentItem.value.UserLink}</cms:link>">${commentItem.value.UserName}</a></h5>
															</div>
															<div class="media-body response-text-right">
																<p>${commentItem.value.Comment}</p>
																<ul>
																	<li>${commentItem.value.Date}</li>
																	<li><a href="<cms:link>${commentItem.value.ReplyLink}</cms:link>">${accordationCommentItem.value.ReplyButtonLabel}</a></li>
																</ul>
															</div>
															<div class="clearfix"> </div>
														</div>

													</c:forEach>


												</div>
											</div>

										</div>
									</div>
								</div>
							</c:forEach>



						</section>
					</div>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>

</cms:formatter>
