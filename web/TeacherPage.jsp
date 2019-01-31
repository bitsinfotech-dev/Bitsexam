<%-- 
    Document   : Admin
    Created on : 11 Dec, 2018, 12:36:06 PM
    Author     : SWATI DHANDE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <%@include file="../CommonThings/BTCDN.jsp" %>
        <style>
            <%@include file="adminpageCss.css" %>
        </style>
    </head>
    <body>        
        <%
            if ((session.getAttribute("LogedIn") != null) && (session.getAttribute("type") != null)) {
                if (session.getAttribute("type").toString().equals("teacher")) {
        %>

        <nav class="navbar navbar-inverse sidebar" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Teacher Panel</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
                    <ul class="nav navbar-nav">                        
                        <li class=" active dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Question Control <span class="caret"></span></a>
                            <ul class="dropdown-menu forAnimate" role="menu">                               
                                <li><a href="AddQuestions.jsp">Student's Profile</a></li>
                                <li><a href="SelectAllQuestions.jsp">Stuents</a></li>
                                <!--                                <li class="divider"></li>
                                                                <li><a href="#">Separated link</a></li>
                                                                <li class="divider"></li>
                                                                <li><a href="#">One more separated link</a></li>-->
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Student Controll<span class="caret"></span></a>
                            <ul class="dropdown-menu forAnimate" role="menu">                                                                
                                <li><a href="ShowAllStudents.jsp">Show All Student</a></li>
                                <!--                                <li class="divider"></li>
                                                                <li><a href="#">Separated link</a></li>
                                                                <li class="divider"></li>
                                                                <li><a href="#">One more separated link</a></li>-->
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Subject Controll<span class="caret"></span></a>
                            <ul class="dropdown-menu forAnimate" role="menu">                                
                                <li><a href="Add_Subject_Form.jsp">Add Subject Form</a></li>
                                <li><a href="SelectAllSubjects.jsp">Select All Subjects</a></li>
                                <!--                                <li class="divider"></li>
                                                                <li><a href="#">Separated link</a></li>
                                                                <li class="divider"></li>
                                                                <li><a href="#">One more separated link</a></li>-->
                            </ul>
                        </li>
                        <!--                        <li><a href="#">Home</a></li>
                                                <li ><a href="#">Profile</a></li>
                                                <li ><a href="#">Messages</a></li>-->
                    </ul>
                </div>
            </div>
        </nav>
        <div class="main">
            <!-- Content Here -->
        </div>
        <%    }
            } else {
                out.println("<a href='UserLogin.jsp'><h1>Login here</h1></a>");
            }
        %>
    </body>
</html>
