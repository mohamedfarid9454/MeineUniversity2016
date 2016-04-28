<%-- 
    Document   : 3FaculityAdmin
    Created on : Mar 9, 2016, 2:36:42 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> <%= p.getFName()%><%=p.getLName()%></title>

    </head>
    <body>

        <div id="menue" >
            <ul>
                <li><a href="?innerpage=3FaculityAdminAddStudents">Add Students</a></li>
                <li><a href="?innerpage=3FaculityAdminViewStudents">View Students</a></li>
                <li><a href="?innerpage=3FaculityAdminAddYear">Add Year</a></li>
                <li><a href="?innerpage=3FaculityAdminAddSubjects">Add Subjects</a></li>
                <li><a href="?innerpage=3FaculityAdminViewSubjects">View Subjects</a></li>
              <!--  <li><a href="?innerpage=MyYears">My Years</a></li>
                --><li><a href="?innerpage=EditProfile">Edit Profile</a></li>
                <li><a href="?innerpage=Chats">Chats</a></li>

            </ul>
        </div>
         <%! String pageName=null; %>
         <%                        try {
                             pageName = request.getParameter("innerpage");
                            if (pageName != null) {
                       pageName+=".jsp";
                       
                      // out.println(pageName);
         %>
         <jsp:include page="<%=pageName%>"></jsp:include>
         
        
        <%
                            }
                          
                        } catch (Exception ex) {

                            System.err.println(ex.getMessage());

                    %>
                    <h1>Page Not Found ^_^  </h1>
                    <%  }//end of catch %> 
       
    </body>
    <% } else {
             response.sendRedirect(response.encodeURL("InvalidRequest.jsp"));

        }%>
</html>