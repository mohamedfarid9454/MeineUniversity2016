<%-- 
    Document   : MyAccount
    Created on : Mar 9, 2016, 2:18:14 PM
    Author     : mohamed
--%>

<%@page import="models.MyPerson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% if (session.getAttribute("UserObject") != null) {
            MyPerson p = (MyPerson) session.getAttribute("UserObject");
    %>
    <head>
         <link href="./CSSfiles/reset-min.css" rel="stylesheet" type="text/css" />
        <link href="./CSSfiles/fonts-min.css" rel="stylesheet" type="text/css" />
        <link href="./CSSfiles/style.css" rel="stylesheet" type="text/css" />

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> <%= p.getFName()%><%=p.getLName()%></title>


       
    
    </head>
    <body>
        <a style="float: right;text-decoration: none; 
           color: red;background-color: greenyellow; margin-right:30px;" href="index.jsp">Home</a>
        <%
            if (p.getUserType() == 1) {


        %>
        <jsp:include page="1MyUniversityAdmin.jsp"></jsp:include>
        <%        } else if (p.getUserType() == 2) {
        %>
        <jsp:include page="2UniversityAdmin.jsp"></jsp:include>
        <%
        } else if (p.getUserType() == 3) {
        %>
        <jsp:include page="3FaculityAdmin.jsp"></jsp:include>
        <%
        } else if (p.getUserType() == 4) {

        %>
        <jsp:include page="4Professor.jsp"></jsp:include>
        <%        } else if (p.getUserType() == 5) {

        %>
        <jsp:include page="5ProfessorAssistant.jsp"></jsp:include>
        <%        } else if (p.getUserType() == 6) {

        %>
        <jsp:include page="6Student.jsp"></jsp:include>
        <%        } else {
        %>
        <jsp:include page="InvalidRequest.jsp"></jsp:include>
        <%
            }
        %>
        
    </body>

    <% } else {
            response.sendRedirect(response.encodeURL("index.jsp"));

        }%>
</html>
