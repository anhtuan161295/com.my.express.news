<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ex" tagdir="/WEB-INF/tags/express-news" %>

<cms:formatter var="content">

	<c:if test="${cms.container.type == 'express-news-header'}">
		<c:choose>
			<c:when test="${cms.element.inMemoryOnly}">
				<div>
					<h1>Header Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<div class="header">
						<div class="header-top">
							<div class="wrap">
								<div class="top-menu">
									<ul>
										<%--<c:forEach items="${content.valueList.MenuItems}" var="item">--%>
											<%--<li>--%>
												<%--<ex:a link="${item}">--%>
													<%--${cms.vfs.property[item]['NavText']}--%>
												<%--</ex:a>--%>
											<%--</li>--%>
										<%--</c:forEach>--%>
											<c:set var="currentLocale" value="${cms.locale}"/>
											<c:forEach var="locentry" items="${cms.localeResource}">

												<c:if test="${not empty locentry.value}">
													<li>
														<ex:a link="${locentry.value.link}">
															${locentry.key}
														</ex:a>
													</li>
												</c:if>

											</c:forEach>
									</ul>
								</div>
								<div class="num">
									<p> ${content.value.Message}</p>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="header-bottom">
							<div class="logo text-center">
								<ex:a link="${content.value.HomePageLink}">
									<cms:img src="${content.value.LogoImageLink}" alt=""/>
								</ex:a>
							</div>
							<div class="navigation">
								<nav class="navbar navbar-default" role="navigation">
									<div class="wrap">
										<div class="navbar-header">
											<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
												<span class="sr-only">Toggle navigation</span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>
											</button>

										</div>
										<!--/.navbar-header-->

										<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
											<ul class="nav navbar-nav">

												<c:set var="navStartLevel">1</c:set>
												<cms:navigation type="treeForFolder" startLevel="${navStartLevel}" endLevel="1" var="nav"/>

												<c:forEach items="${nav.items}" var="navElem">

													<c:if test="${!navElem.navigationLevel}">
														<li class='level-${navElem.navTreeLevel} ${nav.isActive[navElem.resourceName]?"active":""}'>
															<ex:a link="${navElem.resourceName}">
																${navElem.navText}
															</ex:a>
														</li>
													</c:if>

													<c:if test="${navElem.navigationLevel}">
														<cms:navigation type="treeForFolder" resource="${navElem.resourceName}" startLevel="${navElem.navTreeLevel+1}" endLevel="4" var="subNav"/>

														<li class="dropdown">
															<a href="<cms:link>${navElem.parentFolderName}</cms:link>" class="dropdown-toggle" data-toggle="dropdown" >${navElem.navText}<b class="caret"></b></a>
															<ul class="dropdown-menu multi-column columns-2">
																<div class="row">
																	<div class="col-sm-6">
																		<ul class="multi-column-dropdown">
																			<c:forEach items="${subNav.items}" var="subNavElem">
																				<li>
																					<ex:a link="${subNavElem.resourceName}">
																						${subNavElem.navText}
																					</ex:a>
																				</li>
																				<li class="divider"></li>
																			</c:forEach>
																		</ul>
																	</div>

																</div>
															</ul>
														</li>
													</c:if>
												</c:forEach>

												<div class="clearfix"></div>
											</ul>
											<div class="search">
												<!-- start search-->
												<div class="search-box">
													<div id="sb-search" class="sb-search">
														<c:set var="searchLink"><ex:link link="${content.value.SearchPageLink}"/></c:set>
														<form action="${searchLink}" method="get">
															<input class="sb-search-input" type="search" name="q" id="search">
															<input class="sb-search-submit" type="submit" value="">
															<span class="sb-icon-search"> </span>
														</form>
													</div>
												</div>
												<!-- search-scripts -->
												<script src="<cms:link>%(link.weak:/system/modules/com.my.express.news/resources/js/classie.js:0fa5b39f-3309-11e8-94f3-e5c82a707ed0)</cms:link>"></script>
												<script src="<cms:link>%(link.weak:/system/modules/com.my.express.news/resources/js/uisearch.js:10fe65dd-3309-11e8-94f3-e5c82a707ed0)</cms:link>"></script>
												<script>
                                                  new UISearch(document.getElementById('sb-search'));
												</script>
												<!-- //search-scripts -->
											</div>
											<div class="clearfix"></div>
										</div>
									</div>
									<!--/.navbar-collapse-->
									<!--/.navbar-->
							</nav>
						</div>
					</div>

						<div class="wrap">
						<div class="move-text">
							<div class="breaking_news">
								<h2>${content.value.MarqueeTitle}</h2>
							</div>
							<div class="marquee">
								<c:forEach items="${content.valueList.MarqueeItems}" var="item" varStatus="status">
									<div class="marquee${status.count}">
										<ex:a link="${item}" cssclass="breaking">
											${cms.vfs.property[item]['Title']}
										</ex:a>
									</div>
								</c:forEach>
								<div class="clearfix"></div>
							</div>
							<div class="clearfix"></div>

							<script>
                              $('.marquee').marquee({pauseOnHover: true});
                              //@ sourceURL=pen.js
							</script>
						</div>
					</div>

					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</c:if>


</cms:formatter>
