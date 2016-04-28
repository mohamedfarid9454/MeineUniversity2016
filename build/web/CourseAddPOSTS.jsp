<%-- 
    Document   : CoursePOSTS
    Created on : Mar 16, 2016, 2:27:46 PM
    Author     : mohamed
--%>

<%@page import="models.MyPerson"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% if (session.getAttribute("UserObject") != null) {
        MyPerson p = (MyPerson) session.getAttribute("UserObject");
%>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src='https://cdn.tinymce.com/4/tinymce.min.js'></script>
        <script>
            tinymce.init({
                selector: '#mytextarea'
            });
        </script>       
    </head>
    <body>

        <%! int Subject_Code;%>
        <% try {
                Subject_Code = Integer.parseInt(request.getParameter("Subject_Code"));
        %>
        <%=Subject_Code%>


        <div style="background-color: skyblue;margin-left: 400px;width: 50%; " id="Mymenue" >
            <ul>
                <li><a href="?innerpage=CourseAddPOSTS&Subject_Code=<%=Subject_Code%>">Add POST</a></li>
                <li><a href="?innerpage=CourseViewPOSTS&Subject_Code=<%=Subject_Code%>">View POSTS</a></li>
                <li><a href="?innerpage=CourseMaterials&Subject_Code=<%=Subject_Code%>">Materials</a></li>
                <li><a href="?innerpage=CourseGrades&Subject_Code=<%=Subject_Code%>">Grades</a></li>

            </ul>
        </div>

        <form method="post" action="AddPost"><!--?Subject_Code="<Subject_Code%>>-->
      <!--      <input type="text" placeholder="Title" style="float: right;margin-top: 10px;width:195px; border:0; height: 25px; padding: 5px;margin-bottom: 10px;" name="POSTTitle" />
-->
            <textarea id="mytextarea" name="Post">Hello, World!</textarea>
            <input type="text"  value="<%=Subject_Code%>" name="Subject_Code" readonly="" hidden="" />
                        
            <input type="submit" value=" Post"  style="   width: 200px;
                   height: 40px;text-align: center;
                   margin-left: 500px;
                   margin-top: 20px;
                   background-color:#28a4c9;
                   color: #f5f4f4;
                   border:0px;
                   border-radius: 25px;" />
        </form>

        <% } catch (Exception ex) {
            }%>  </body>
</html>
<% } else {
        response.sendRedirect(response.encodeURL("InvalidRequest.jsp"));

    }%>