<%@ page import="java.sql.Connection" %>
<%@ page import="org.opencms.main.OpenCms" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="org.opencms.util.CmsStringUtil" %>
<%@ page import="java.sql.ResultSet" %>
<%@page buffer="none" session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%!
    private boolean isEmailDuplicate(String email) {
        boolean result = false;
        try {
            String query = "SELECT email FROM `express-news`.`newsletter` WHERE email=?";

            try (Connection conn = OpenCms.getSqlManager().getConnection(OpenCms.getSqlManager().getDefaultDbPoolName());
                 PreparedStatement ps = conn.prepareStatement(query)) {

                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    if (rs.getString(1).equals(email)) {
                        result = true;
                        break;
                    }
                }
            }

        } catch (Exception e) {
            result = false;
        }

        return result;
    }

    private boolean insertEmail(String email) {
        boolean result = false;
        try {
            String query = "INSERT INTO `express-news`.`newsletter`(email) VALUES (?)";

            try (Connection conn = OpenCms.getSqlManager().getConnection(OpenCms.getSqlManager().getDefaultDbPoolName());
                 PreparedStatement ps = conn.prepareStatement(query)) {

                ps.setString(1, email);
                // insert the data
                int rs = ps.executeUpdate();

                if (rs > 0) {
                    result = true;
                }
            }

        } catch (Exception e) {
            result = false;
        }

        return result;
    }
%>

<%
    String result = "Some errors occured";

    try {
        String email = request.getParameter("email");

        if (CmsStringUtil.isEmpty(email)) {
            out.print("Email is required");
            return;
        }

        if (isEmailDuplicate(email)) {
            out.print("Email is existed. Please use other email");
            return;
        }

        if (insertEmail(email)) {
            result = "Send mail success";
        }

    } catch (Exception e) {
        result = "Exception occurred during sending mail";
    }

    out.print(result);
%>

