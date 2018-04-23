<%@ tag
        display-name="link"
        body-content="scriptless"
        trimDirectiveWhitespaces="true"
        description="Displays a link from the generic Apollo nested link content.
    Perfroms all checks to make sure the link is correctly set.
    Also honors the 'open in new window' flag." %>


<%@ attribute name="link" type="java.lang.String" required="true"
              description="The URI."%>

<%@ attribute name="text" type="java.lang.String" required="false"
              description="The title to display."%>

<%@ attribute name="cssclass" type="java.lang.String" required="false"
              description="CSS class added to the generated link tag"%>

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

        <a href="${rewriteUrl}"
           <c:if test="${not empty cssclass}">${' '}class="${cssclass}"</c:if>
        >
            <c:choose>
                <%--CmsLink :${cmsLink} <br/>--%>
                <%--ContextPath : ${contextPath} <br/>--%>
                <%--SubSitePath : ${subSitePath} <br/>--%>
                <%--Rewrite : ${rewriteUrl}--%>
                <c:when test="${empty bodyVal and not empty text}">
                    ${text}
                </c:when>
                <c:when test="${empty bodyVal and empty text}">

                </c:when>

                 <%--&lt;%&ndash;####### JSP body inserted here ########&ndash;%&gt;--%>
                <c:otherwise>${bodyVal}</c:otherwise>
                 <%--&lt;%&ndash;####### /JSP body inserted here ########&ndash;%&gt;--%>
            </c:choose>
        </a>
    </c:when>

    <%-- ####### JSP body inserted here ######## --%>
    <c:otherwise>${bodyVal}</c:otherwise>
    <%-- ####### /JSP body inserted here ######## --%>

</c:choose>
