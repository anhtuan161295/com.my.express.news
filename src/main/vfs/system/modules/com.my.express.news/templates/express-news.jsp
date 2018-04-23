<%@page buffer="none" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
    <title><cms:info property="opencms.title"/></title>
    <cms:enable-ade/>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Express News Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>

    <!-- Bootsrap -->
    <link href="<cms:link>%(link.weak:/system/modules/com.my.express.news/resources/css/bootstrap.css)</cms:link>"
          rel='stylesheet' type='text/css'/>
    <!-- Custom Theme files -->
    <link href="<cms:link>%(link.weak:/system/modules/com.my.express.news/resources/css/style.css)</cms:link>"
          rel="stylesheet" type="text/css" media="all"/>

    <!-- web-fonts -->
    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
          rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>

    <!-- JS -->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<cms:link>%(link.weak:/system/modules/com.my.express.news/resources/js/jquery.min.js)</cms:link>"></script>
    <!-- for bootstrap working -->
    <script type="text/javascript"
            src="<cms:link>%(link.weak:/system/modules/com.my.express.news/resources/js/bootstrap.js)</cms:link>"></script>

    <script type="application/x-javascript"> addEventListener("load", function () {
      setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
      window.scrollTo(0, 1);
    } </script>

    <script type="text/javascript"
            src="<cms:link>%(link.weak:/system/modules/com.my.express.news/resources/js/jquery.marquee.min.js)</cms:link>"></script>

    <script src="<cms:link>%(link.weak:/system/modules/com.my.express.news/resources/js/responsiveslides.min.js)</cms:link>"></script>
    <script>
      $(function () {
        $("#slider").responsiveSlides({
          auto: true,
          nav: true,
          speed: 500,
          namespace: "callbacks",
          pager: true,
        });
      });
    </script>

    <script type="text/javascript"
            src="<cms:link>%(link.weak:/system/modules/com.my.express.news/resources/js/move-top.js)</cms:link>"></script>
    <script type="text/javascript"
            src="<cms:link>%(link.weak:/system/modules/com.my.express.news/resources/js/easing.js)</cms:link>"></script>
    <script type="text/javascript">
      jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
          event.preventDefault();
          $('html,body').animate({scrollTop: $(this.hash).offset().top}, 900);
        });
      });
    </script>

    <cms:headincludes type="css"/>
    <cms:headincludes type="javascript"/>

</head>
<body>

<%--<c:if test="${cms.isEditMode}">--%>
    <%--<div style="height: 80px"></div>--%>
<%--</c:if>--%>

<!-- Header -->
<cms:container name="headercontainer" type="express-news-header" width="450">
    <div style="background: lightgray; height: 60px">
        <h1>Header</h1>
    </div>
</cms:container>

<%--<c:if test="${cms.isEditMode}">--%>
    <%--<div style="height: 80px"></div>--%>
<%--</c:if>--%>

<!-- Body -->
<cms:container name="contentcontainer" type="express-news-body" width="450">
    <div style="background: lightgray; height: 60px">
        <h1>Body</h1>
    </div>
</cms:container>

<%--<c:if test="${cms.isEditMode}">--%>
    <%--<div style="height: 800px"></div>--%>
<%--</c:if>--%>

<!-- Footer -->
<cms:container name="footercontainer" type="express-news-footer" width="450">
    <div style="background: lightgray; height: 60px">
        <h1>Footer</h1>
    </div>
</cms:container>

<script type="text/javascript">
  $(document).ready(function () {
    /*
    var defaults = {
    wrapID: 'toTop', // fading element id
    wrapHoverID: 'toTopHover', // fading element hover id
    scrollSpeed: 1200,
    easingType: 'linear'
    };
    */
    $().UItoTop({easingType: 'easeOutQuart'});
  });
</script>

<a href="#to-top" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</body>
</html>
