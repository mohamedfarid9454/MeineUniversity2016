<%-- 
    Document   : CoursePage
    Created on : Mar 16, 2016, 1:38:27 PM
    Author     : mohamed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
    </head>
    <body>
           <%! int Subject_Code;%>
        <% try{Subject_Code=Integer.parseInt(request.getParameter("Subject_Code")); 
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
        
        <% }catch(Exception ex){
        } %>
    </body>
</html>
