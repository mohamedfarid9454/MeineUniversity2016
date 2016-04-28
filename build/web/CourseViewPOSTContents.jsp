<%-- 
    Document   : CourseViewPOSTContents
    Created on : Apr 13, 2016, 10:18:37 AM
    Author     : mohamed
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="models.MyPerson"%>
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

        <%! int Subject_Code;
            int POSTID;
        %>
        <% try {
                Subject_Code = Integer.parseInt(request.getParameter("Subject_Code"));
                POSTID = Integer.parseInt(request.getParameter("POSTID"));

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

        PostNuM: <%=POSTID%>





        <%! ResultSet course_posts;
        %>

        <%
            try {
                // select user.FName,user.LName,user.Mail,user.Code,subject.Code,subject.ID,post.date,post.PostID,post.Post from post,user,subject where post.UserID=user.Code and subject.ID=post.SubjectPostID and  subject.ID=? and post.PostID=?";

                course_posts = p.ViewCoursePostContent(Subject_Code, POSTID);
                //  if(course_posts!=null){

                while (course_posts.next()) {%>
        <div style="background-color:#ac2925;width:70%;min-height:50%; margin-left: 90px; ">
            <form>
                <%=course_posts.getString("Post")%>
            </form> 
            <%=course_posts.getInt("PostID")%><br/>
            BY: <%=course_posts.getString("FName")%><%=course_posts.getString("LName")%><br/>
            Mail:<%=course_posts.getString("Mail")%><br/>
            User Code:  <%=course_posts.getInt("Code")%><br/>
            Date:  <%=course_posts.getString("date")%><br/>

        </div>

        <%! ResultSet commentResulttset;
            int commentsCount;
            String color;
        %>
        <%
            commentsCount = 0;
            commentResulttset = p.ViewCoursePostComments(course_posts.getInt("PostID"));
//        String sql = "select `comment`.`commentContent`,`comment`.`UserID`,`comment`.`date`,`user`.`Code`,`user`.`FName`,`user`.`LName`,`user`.`Mail`,`user`.`Code`,`post`.`PostID` from `post`,`user`,`comment` where `comment`.`UserID`=`user`.`Code` and `comment`.`PostID`=`post`.`PostID` and `post`.`PostID`=?";
            while (commentResulttset.next()) {
                ++commentsCount;

                if (commentsCount % 2 == 0) {
                    color = "red";
                } else {
                    color = "yellow";
                }%>
        <div style="background-color:<%=color%>;width:70%; margin-left: 150px; ">
            <%=commentsCount%>.<%=commentResulttset.getString("commentContent")%>   
            BY: <%=commentResulttset.getString("user.FName")%><%=commentResulttset.getString("user.LName")%><br/>
            Mail:<%=commentResulttset.getString("Mail")%><br/>
            User Code:  <%= commentResulttset.getInt("user.Code")%><br/>
            Date:  <%=commentResulttset.getString("comment.date")%>
            <hr/>
        </div>
        <% }%>

        <form action="AddComment" method="POST">

            <textarea id="mytextarea" name="mycomment">Hello, World!</textarea>
            <input type="text" value="<%=POSTID%>" name="POSTID" readonly="" hidden="" />
            <input type="text" value="<%=Subject_Code%>" name="Subject_Code" readonly="" hidden="" />

            <input type="submit"   style="   width: 200px;
                   height: 40px;text-align: center;
                   margin-left: 500px;
                   margin-top: 20px;
                   background-color:#28a4c9;
                   color:yellowgreen;
                   border:0px;
                   border-radius: 25px;" value="Comment"/>
        </form>         

        <%}//end of while
                /*}else{
             out.println("There is no Posts untill now  ^_^");}*/
        %>

        <% } catch (Exception ex) {
            System.err.println(ex.getMessage());
        %>
        <h1>There is no Posts till Now  ^_^</h1>
        <% }%>




        <%} catch (Exception ex) {
            }%>  </body>
</html>
<% } else {
        response.sendRedirect(response.encodeURL("InvalidRequest.jsp"));

    }%>
