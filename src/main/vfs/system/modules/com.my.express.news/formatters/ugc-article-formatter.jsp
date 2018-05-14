<%@page buffer="none" session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ex" tagdir="/WEB-INF/tags/express-news" %>
<cms:formatter var="content">

    <c:choose>
        <c:when test="${cms.element.inMemoryOnly}">
            <div>
                <h1>UGC Form Article Component</h1>
            </div>
        </c:when>
        <c:otherwise>
            <div>

                <div class="container">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">

                        <c:set var="ugcError" value=""/>

                        <div id="error" class="alert alert-danger" style="display:none;"></div>

                        <div id="postFormLoading" class="alert alert-info" style="display:none;">Please wait, loading</div>

                        <cms:ugc var="ugcId" configPath="${content.filename}" error="ugcError"/>

                            <%-- render the form --h%>
                            <%-- IMPORTANT: expose the session-id of the UGC session --%>
                        <form id="ugcForm" ugc-id="${ugcId}" method="post" role="form">
                                <%-- render the form fields and buttons to save and/or (server-side) validate the input and/or cancel --%>

                            <div class="form-group">
                                <label for="title">Title</label>
                                <input type="text" class="form-control" name="title" value="" placeholder="Title">
                            </div>
                            <div class="form-group">
                                <label for="shortDescription">Short Description</label>
                                <input type="text" class="form-control" name="shortDescription" value="" placeholder="Short Description">
                            </div>
                            <div class="form-group">
                                <label for="thumbnail">Thumbnail</label>
                                <input type="file" class="form-control" name="thumbnail" value="" placeholder="Thumbnail">
                            </div>
                            <div class="form-group">
                                <label for="videoLink">Video Link</label>
                                <input type="text" class="form-control" name="videoLink" value="" placeholder="Video Link">
                            </div>
                            <div class="form-group">
                                <label for="content">Content</label>
                                <input type="text" class="form-control" name="content" value="" placeholder="Content">
                            </div>
                            <div class="form-group">
                                <label for="categories">Categories</label>
                                <input type="text" class="form-control" name="categories" value="" placeholder="Categories">
                            </div>
                            <div class="form-group">
                                <label for="date">Date</label>
                                <input type="date" class="form-control" name="date" value="" placeholder="Date">
                            </div>
                            <div class="form-group">
                                <label for="comment">Comment</label>
                                <input type="text" class="form-control" name="comment" value="" placeholder="Comment">
                            </div>
                            <div class="form-group">
                                <label for="view">View</label>
                                <input type="text" class="form-control" name="view" value="" placeholder="View">
                            </div>
                            <div class="form-group">
                                <label for="like">Like</label>
                                <input type="text" class="form-control" name="like" value="" placeholder="Like">
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <button id="saveButton" type="button" class="btn btn-block btn-primary">Save</button>
                                    </div>
                                    <div class="col-sm-3">
                                        <button id="validateButton" type="button" class="btn btn-block btn-default">Validate</button>
                                    </div>
                                    <div class="col-sm-3">
                                        <button id="cancelButton" type="button" class="btn btn-block btn-default">Cancel</button>
                                    </div>
                                </div>
                            </div>

                        </form>

                    </div>
                </div>


            </div>
        </c:otherwise>
    </c:choose>

</cms:formatter>
