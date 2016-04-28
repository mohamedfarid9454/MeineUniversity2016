<%-- 
    Document   : 3FaculityAdminAddStudents
    Created on : Mar 14, 2016, 7:32:33 AM
    Author     : mohamed
--%>

<%@page import="models.MyPerson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if (session.getAttribute("UserObject") != null) {
        MyPerson p = (MyPerson) session.getAttribute("UserObject");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <form action="3FaculityAdminAddStudentsServlet.jsp" method="post"  enctype="multipart/form-data">
            <input type="file" name="myStudentsFile"  />
            <br />
            <input type="submit" value="Add Students" />
        </form>
    </body>
</html>
<% } else {
        response.sendRedirect(response.encodeURL("InvalidRequest.jsp"));

    }
%>