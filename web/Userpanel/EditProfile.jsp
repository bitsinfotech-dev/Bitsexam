<%@page import="DAO.StudentOperation"%>
<%@page import="Bean.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Student st = (Student) session.getAttribute("LogedIn");

        %>
        <div class="container">
            <h2>Student Update form</h2>
            <form action="StudentUpdateProfile" method="post">
                <div class="form-group">
                    <input type="hidden" name="s_id" value="<%=st.getS_id()%>">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" placeholder="Enter your name" value="<%=st.getName()%>" name="name">
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" class="form-control" id="address" placeholder="Enter your address" value="<%=st.getAddress()%>" name="address">
                </div>
                <div class="form-group">
                    <label for="contact">contact:</label>
                    <input type="text" class="form-control" id="contact" placeholder="Enter your contct number" value="<%=st.getContact()%>" name="contact">
                </div>                
                <div class="form-group">
                    <label for="course">Course</label>
                    <input type="text" class="form-control" id="course" placeholder="Enter course" value="<%=st.getCourse()%>" name="course">
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="<%=st.getEmail()%>">
                </div>
                <div class="form-group">
                    <label for="username">username:</label>
                    <input type="text" class="form-control" id="username" placeholder="Enter username" name="username" value="<%=st.getUsername()%>">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pass" value="">
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" name="remember"> Remember me</label>
                </div>
                <button type="submit" class="btn btn-default">Submit</button>

            </form>
        </div>
    </body>
</html>
