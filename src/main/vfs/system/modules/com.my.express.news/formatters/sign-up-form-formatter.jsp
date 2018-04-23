<%@ page import="java.sql.Connection" %>
<%@ page import="org.opencms.main.OpenCms" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="org.opencms.util.CmsStringUtil" %>
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
					<h1>Sign Up Form Component</h1>
				</div>
			</c:when>
			<c:otherwise>
				<div>

					<div class="newsletter">
						<h1 class="side-title-head">${content.value.Title}</h1>
						<p class="sign">${content.value.Description}</p>
						<form id="sendMail">
							<input type="text" name="email" id="email" class="text" placeholder="${content.value.EmailPlaceHolder}">
							<input type="submit" value="${content.value.SubmitButtonLabel}">
						</form>
					</div>

					<script>
						$(document).ready(function () {
							$('form#sendMail').submit(function (e) {
							    e.preventDefault();

							    var email = $('#email').val();

							   	$.ajax({
                                    url: '<cms:link>/system/modules/com.my.express.news/formatters/sendEmail.jsp</cms:link>',
                                    method: 'POST',
									data: {
                                        email: email
									}
                                }).done(function(data, textStatus, jqXHR) {
                                    alert(data);
                                }).fail(function(jqXHR, textStatus, errorThrown) {
                                    alert(errorThrown);
                                });

                            })
                        })
					</script>

				</div>
			</c:otherwise>
		</c:choose>
	</c:if>


</cms:formatter>
