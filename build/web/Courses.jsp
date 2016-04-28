<%-- 
    Document   : Courses
    Created on : Mar 14, 2016, 7:18:26 AM
    Author     : mohamed
--%>

<%@page import="models.ModelOfProfessor"%>
<%@page import="models.ModelOfStudent"%>
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


    </head>
    <body>
        
                <div id="LatestProject">
            <h1>My Courses</h1>
            <%
                if(p.getUserType()==6){

                try{
                    ModelOfStudent modelOfStudent=new ModelOfStudent();
                    ResultSet rs = modelOfStudent.ViewMyCourses(p.getCode());
                
                
                while (rs.next()) {
            %>
            <div class="Project">
                <img width='140' height='100' src='images/life.jpg' > 

                <h2>
                </h2>

                <p>
                                  <!--
//subject=`SubjectName`, `Code`, `WritenGrade`, `MidtermGrade`, `RemaingGrade`
//subjectstudent=`SubjectID`, `StudentID`, `WritenGrade`, `MidtermGrade`, `RemaingGrade`
//user=`Code`, `Mail`,
                    -->
                    <!--<font color="red">
                     <rs.getString("SubjectRegisterDate")%>
                     </font><br/>-->
                    Subject Name:<font color="red"> <b><%= rs.getString("SubjectName")%></b></font><br/>
                    Final Grade:
                    <% if (rs.getInt("WritenGrade") > 50) {
                    %> <font color="red"><%= rs.getInt("WritenGrade")%></font><font color="green">Pass</font>
                    <% } else if(rs.getInt("WritenGrade") < 50 && rs.getInt("WritenGrade") > -1) {%>
                   <font color="red"><%= rs.getInt("WritenGrade")%></font> <font color="green">Fail</font>
                      <% } else{%>
                    <font color="green">No Grades till now</font>
                    <% }%>
                    <br/>
                    Midterm Grade:<font color="red"><%= rs.getInt("MidtermGrade")%></font>

                    <br/>
                    Class Work Grade:<font color="red"><%= rs.getInt("RemaingGrade")%></font>

                    <br/>

                    Code:<font color="red"><%= rs.getString("Code")%></font>
                    <br/>
                     

                    <a href="?innerpage=CoursePage&Subject_Code=<%= rs.getInt("ID")%>"><%= rs.getString("SubjectName")%></a> 
               <!--<form action="MyAccount.jsp?innerpage=CoursePage" method="GET">
                    <input name="Subject_Code" type="text" readonly="" hidden=""  value="<rs.getInt("ID")%>"/>

                    <input style=" float: right;background-color: black;
                           color: #f5f4f4;"
                           type="submit" value=" <rs.getString("SubjectName")%> " name="CourseName"/>
                </form>
      -->
            </p>
            

            </div>


            
            <% }//end of while  
                
                }//end of try
            catch(Exception ex){
                out.println(ex.getMessage()+"Courses Page");
            %>
            <br/>  <font color='blue'>There is no Courses Untill Now ^_^ </font>
            <% }//end of catch %>
            
            <% } else if(p.getUserType()==5||p.getUserType()==4){
               
               try{
                    ModelOfProfessor modelOfProfessor=new ModelOfProfessor();
                    ResultSet rs = modelOfProfessor.ViewMyCoursesProfessor(p.getCode());
                
                
                while (rs.next()) {
            %>
            <div class="Project">
                <img width='140' height='100' src='images/life.jpg' > 

                <h2>
                </h2>

                <p>
                                  <!--
//subject=`SubjectName`, `Code`, `WritenGrade`, `MidtermGrade`, `RemaingGrade`
//subjectstudentInstructor=`ID`, `SubjectID`, `UserID`, `semester`, `InstructorSubjectYear`, `SubjectInstructorRegisterDate`
//user=`Code`, `Mail`,
                    -->
                    <!--<font color="red">
                     <rs.getString("SubjectRegisterDate")%>
                     </font><br/>-->
                    Subject Name:<font color="red"> <b><%= rs.getString("SubjectName")%></b></font><br/>
                    Semester<font color="red"><%= rs.getString("semester")%></font>
                    <br/>
                    Year:<font color="red"><%= rs.getString("InstructorSubjectYear")%></font>
                    <br/>
                    Code:<font color="red"><%= rs.getString("Code")%></font>
                    <br/>
                  <a href="?innerpage=CoursePage&Subject_Code=<%= rs.getInt("ID")%>"><%= rs.getString("SubjectName")%></a> 
               <!--<form action="MyAccount.jsp?innerpage=CoursePage" method="GET">
                    <input name="Subject_Code" type="text" readonly="" hidden=""  value="<rs.getInt("ID")%>"/>

                    <input style=" float: right;background-color: black;
                           color: #f5f4f4;"
                           type="submit" value=" <rs.getString("SubjectName")%> " name="CourseName"/>
                </form>
      -->
            </p>
            

            </div>


            
            <% }//end of while  
                
                }//end of try
            catch(Exception ex){
                out.println(ex.getMessage()+"Courses Page");
            %>
            <br/>  <font color='blue'>There is no Courses Untill Now ^_^ </font>
            <% }//end of catch %>
            
            <% }%>
        </div><!-- End of LatestProject -->

    </body>
</html>
<% } else {
        response.sendRedirect(response.encodeURL("InvalidRequest.jsp"));

    }%>