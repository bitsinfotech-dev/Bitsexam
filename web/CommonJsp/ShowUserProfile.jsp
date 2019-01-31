<%@page import="java.util.List"%>
<%@page import="java.util.ListIterator"%>
<%@page import="Bean.Student"%>
<%@page import="DAO.StudentOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container">
    <table class="table table-striped">
        <%
            if (session.getAttribute("LogedIn") != null) {
                Student stu = new Student();
                stu = (Student) session.getAttribute("LogedIn");
        %>
        <tr style="background-color: transparent; ">
            <td colspan="2" align="center" style="border-top: none; margin-top: 50px;">
                <img src="img/Profile/<%=stu.getImage()%>" class="img-circle profilepicture" width="150" height="150">
            </td>
        </tr>
        <tr>
            <th>Id</th><td><%= stu.getS_id()%></td>                
        </tr>
        <tr>
            <th>Name</th><td><%=stu.getName()%></td>
        </tr>
        <tr>
            <th>Address</th><td><%=stu.getAddress()%></td>
        </tr>
        <tr>
            <th>Contact Number</th><td><%=stu.getContact()%></td>
        </tr>
        <tr>
            <th>Email Id</th><td><%=stu.getEmail()%></td>
        </tr>
        <tr>
            <th>Course</th><td><%=stu.getCourse()%></td>
        </tr>
        <tr>
            <th>Username</th><td><%=stu.getUsername()%></td>                
        </tr>
        <tr>
            <th>Password</th><td><%=stu.getPassword()%></td>                
        </tr>
        <%
            
            }
        %>
    </table>
</div>