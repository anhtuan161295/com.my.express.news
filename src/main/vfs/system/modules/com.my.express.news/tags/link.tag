<%@ tag
        display-name="link"
        body-content="scriptless"
        trimDirectiveWhitespaces="true"
        description="Displays a link from the generic Apollo nested link content.
    Perfroms all checks to make sure the link is correctly set.
    Also honors the 'open in new window' flag." %>

<%@ attribute name="link" type="java.lang.String" required="true"
              description="The URI."%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%-- ####### Assign JSP body to a variable, we need to check if this is empty ######## --%>
<jsp:doBody var="bodyVal" />

<c:choose>
    <c:when test="${not empty link}">
        <c:set var="cmsLink"><cms:link>${link}</cms:link></c:set>

        <c:set var="rewriteUrl" value="${cmsLink}" />

        <c:if test="${!cms.isEditMode}">
            <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
            <c:set var="subSitePath" value="${cms.subSitePath}"/>
            <c:set var="rewriteUrl1" value="${fn:replace(cmsLink, contextPath , '')}" />
            <c:set var="rewriteUrl2" value="${fn:replace(rewriteUrl1, subSitePath , '')}" />
            <c:set var="rewriteUrl" value="${rewriteUrl2}" />

            <c:if test="${!fn:startsWith(rewriteUrl, '/')}">
                <c:set var="rewriteUrl" value="/${rewriteUrl}" />
            </c:if>
        </c:if>

        ${rewriteUrl}

    </c:when>

    <%-- ####### JSP body inserted here ######## --%>
    <c:otherwise>${bodyVal}</c:otherwise>
    <%-- ####### /JSP body inserted here ######## --%>

</c:choose>
