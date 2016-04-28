<%-- 
    Document   : CourseViewPOSTS
    Created on : Mar 20, 2016, 11:54:33 PM
    Author     : mohamed
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="models.MyPerson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        Posts for Course <%=Subject_Code%>



        <%! ResultSet course_posts;
        %>
        <% try {
                course_posts = p.ViewCoursePosts(Subject_Code);
              //  if(course_posts!=null){
        %>
<center>
        <table border="1" cellspacing="1" cellpadding="2">
            <thead>
                <tr>
                    <th>POST</th>
                    <th>Date</th>
                </tr>
            </thead>
        <%
            while (course_posts.next()) {
        %>
    
            <tbody>
                <tr>
                    <td>

                        <a href="?innerpage=CourseViewPOSTContents&POSTID=<%=course_posts.getInt("PostID")%>&Subject_Code=<%=Subject_Code%>">
                            <%=course_posts.getString("Post")%> </a> 
                    </td>
                    <td><%=course_posts.getString("date")%> </td>
                </tr>

            </tbody>
       


        <%}
        %>
 </table>
 </center>

        <% } catch (Exception ex) {%>
        <h1>There is no Posts till Now  ^_^</h1>
        <% }%>
        <% } catch (Exception ex) {
            }%>  </body>
</html>
<% } else {
        response.sendRedirect(response.encodeURL("InvalidRequest.jsp"));

    }%>