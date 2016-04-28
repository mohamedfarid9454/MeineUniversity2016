<%-- 
    Document   : index
    Created on : Mar 9, 2016, 10:59:07 AM
    Author     : mohamed0
--%>

<%@page import="models.MyPerson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>My University</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="./CSSfiles/reset-min.css" rel="stylesheet" type="text/css" />
        <link href="./CSSfiles/fonts-min.css" rel="stylesheet" type="text/css" />
        <link href="./CSSfiles/style.css" rel="stylesheet" type="text/css" />

    </head>
    <body >
        <div id="MyWebsite">
            <div id="Myheader">
                <div id="Mymenue">
                    <ul>
                        <li class="active"><a href="index.jsp"> Home<span class="sr-only">
                                </span></a></li>

                        <li><a href="#">Universities</a></li>
                        <li><a href="#portfolio">Description</a></li>

                        <li><a href="#contacts">Contact Us</a></li>

                        <% if (session.getAttribute("UserObject") != null) {
                                MyPerson p = (MyPerson) session.getAttribute("UserObject");
                        %>
                        <li><a href="MyAccount.jsp">My Account </a></li>

                        <% }%>

                    </ul>  
                </div>

            </div>
            <div id="MyContent">
                <!-- login-->




                <% if (session.getAttribute("UserObject") != null) {
                        MyPerson p = (MyPerson) session.getAttribute("UserObject");
                %>
                <h2 class="form-signin-heading">Welcome <%= p.getFName()%><%=p.getLName()%></h2>
                <form class="form-signin"  action="MyLogout" method="POST">
                    <button class="btn btn-lg btn-primary btn-block" type="submit">
                        Logout</button>
                </form>
                <% } else {%>
                <h2 class="form-signin-heading">Please login</h2>
                <form class="form-signin"  action="MyLogin" method="POST">
                    <input type="text" class="form-control" placeholder="Email" name="UserEmail" required autofocus>
                    <input type="password" class="form-control" placeholder="Password" name="UserPassword" required>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">
                        Sign in</button>
                    <label class="checkbox pull-left">
                        <input type="checkbox" value="remember-me">
                        Remember me
                    </label>
                    <a href="#" class="pull-right need-help">Need help? </a><span class="clearfix"></span>
                </form>
                <% }%>


            </div>
            <div id="Myfooter">

                copyRight

            </div>


        </div><!-- end of My Website-->


    </body>
</html>