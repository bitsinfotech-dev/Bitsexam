<%-- 
    Document   : UserProfile
    Created on : 8 Sep, 2018, 10:33:01 AM
    Author     : SWATI DHANDE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="CommonThings/BTCDN.jsp" %>
        <script>
            $(document).ready(function (){
            $('#editprofile').hide();
                    $('.editprofilebtn').click(function(){
            $('#editprofile').show();
                    $('#profile').hide();
            });
        </script>
        <style>
            <%@include file="CommonThings/bootstrapHeaderCss.css" %>
            <%@include file="Css/UserProfile.css"%>
        </style>

    </head>
    <body>        
        <%
            if ((session.getAttribute("LogedIn") != null) && (session.getAttribute("type") != null)) {
                if (session.getAttribute("type").toString().equals("student")) {
        %>
        <%@include file="CommonThings/bootstrapHeader.jsp" %>        
        <div class="container-fluid main">
            <div class="row">
                <div class="col-sm-2">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <a href="#profile">Profile</a>
                        </li>
                        <li class="list-group-item editprofilebtn">
                            <a href="#editprofile">Edit profile</a>
                        </li>
                        <li class="list-group-item editprofilebtn">
                            <a href="Exam/selectlanguage.jsp">Exams</a>
                        </li>
                        <li class="list-group-item editprofilebtn">
                            <a href="Exam/GradeCard.jsp">Grade card</a>
                        </li>
                        <li class="list-group-item editprofilebtn">
                            <a href="Fees.jsp">Fees</a>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-10">
                    <div id="profile" style="background-color: white;">
                        <%@include file="CommonJsp/ShowUserProfile.jsp"%>
                    </div>
                    <div id="editprofile" style="background-color: white;">
                        <h1>Edit Profile</h1>
                        <%@include file="Userpanel/UpdateStudentByStudent.jsp" %>
                    </div>
                </div>
            </div>
        </div>
        <%    }
            } else {
                out.println("<a href='UserLogin.jsp'><h1>Login here</h1></a>");
            }
        %>
    </body>
</html>
