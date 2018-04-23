<%@ tag
        display-name="link"
        body-content="scriptless"
        trimDirectiveWhitespaces="true"
        description="Displays a link from the generic Apollo nested link content.
    Perfroms all checks to make sure the link is correctly set.
    Also honors the 'open in new window' flag." %>


<%@ attribute name="link" type="java.lang.String" required="true"
              description="The link to format. Must be a generic Apollo nested link content."%>

<%@ attribute name="text" type="java.lang.String" required="false"
              description="The link to format. Must be a generic Apollo nested link content."%>

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
        <c:set var="prefix" value="${requestScope['javax.servlet.forward.request_uri']}"/>
        <c:set var="rewriteUrl" value="${fn:replace(cmsLink, prefix , '')}"/>

        <a href="${rewriteUrl}"
           <c:if test="${not empty cssclass}">${' '}class="${cssclass}"</c:if>
        >
            <c:choose>
                <c:when test="${empty bodyVal and not empty text}">
                    ${text}
                </c:when>
                <c:when test="${empty bodyVal}">
                    <c:if test="${empty text}">
                        More
                    </c:if>
                    ${text}
                </c:when>

                <%-- ####### JSP body inserted here ######## --%>
                <c:otherwise>${bodyVal}</c:otherwise>
                <%-- ####### /JSP body inserted here ######## --%>
            </c:choose>
        </a>
    </c:when>

    <%-- ####### JSP body inserted here ######## --%>
    <c:otherwise>${bodyVal}</c:otherwise>
    <%-- ####### /JSP body inserted here ######## --%>

</c:choose>
