<%-- 
    Document   : ShowAllStudents
    Created on : Jan 3, 2018, 12:15:48 PM
    Author     : Alok Panday
--%>

<%@page import="Bean.Subject"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="Bean.Student"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.StudentOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../CommonThings/BTCDN.jsp"%>
        <style>
            .update,.delete{
                border-radius: 4px;
                padding: 5px;
            }
            .update{
                border:thin solid green;
            }

            .delete{
                border:thin solid red;
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">WebSiteName</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#">Page 1</a></li>
                    <li><a href="#">Page 2</a></li>
                </ul>
                <form class="navbar-form navbar-left" action="#">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search" name="search">
                        <div class="input-group-btn">
                            <button name="submit_search" class="btn btn-default" type="submit">
                                <i class="glyphicon glyphicon-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </nav>


        <!----------------------------searched data-------------------------------------> 
        <%
            if (request.getParameter("submit_search") != null) {
                String taegetString = request.getParameter("search");
        %>

        <div class="container">
            <table class="table table-striped">
                <caption>Searched Data</caption>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Contact</th>
                        <th>Address</th>
                        <th>Email</th>                        
                        <th>course</th>
                        <th>Course detail</th>                        
                        <th>username</th>
                        <th>Password</th>
                    </tr>
                </thead>

                <%
                    StudentOperation st = new StudentOperation();
                    if (st.serchByName(taegetString) != null) {
                        List li = st.serchByName(taegetString);
                        ListIterator lit = li.listIterator();
                        while (lit.hasNext()) {
                            Student student = (Student) lit.next();
                %>
                <tr>
                    <td><%= student.getS_id()%></td>
                    <td><%= student.getName()%></td>
                    <td><%= student.getContact()%></td>
                    <td><%= student.getAddress()%></td>
                    <td><%= student.getEmail()%></td>
                    <td><%= student.getCourse()%></td>
                    <td>
                        <%

                            Set s = student.getSubjectList();
                            Iterator ite = s.iterator();
                            while (ite.hasNext()) {
                                Subject sub2 = (Subject) ite.next();
                                out.println(sub2.getSub_name());
                            }
                        %>
                    </td>
                    <td><%= student.getUsername()%></td>
                    <td><%= student.getPassword()%></td>
                    <td><a class="update" href="StudentControll/UpdateStudentByAdmin.jsp?id=<%= student.getS_id()%>">Update</a></td>
                    <td><a class="delete" href="StudentControll/DeleteStudents.jsp?id=<%= student.getS_id()%>">Delete</a></td>
                </tr>
                <%
                        }
                    } else {
                        out.print("no record found");
                    }
                %>

            </table>

        </div>
        <hr>
        <%
            }
        %>
        <!----------------------------all data-------------------------------------> 
        <%@include file="AdminPage.jsp" %>
        <div class="col-sm-6">
            <div class="container">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Contact</th>
                            <th>Address</th>
                            <th>Email</th>                        
                            <th>course</th>
                            <th>Course detail</th>                        
                            <th>username</th>
                            <th>Password</th>
                        </tr>
                    </thead>

                    <%
                        StudentOperation st = new StudentOperation();
                        if (st.selectAllStudents() != null) {

                            List li = st.selectAllStudents();
                            ListIterator lit = li.listIterator();
                            while (lit.hasNext()) {
                                Student student = (Student) lit.next();
                    %>
                    <tr>
                        <td><%= student.getS_id()%></td>
                        <td><%= student.getName()%></td>
                        <td><%= student.getContact()%></td>
                        <td><%= student.getAddress()%></td>
                        <td><%= student.getEmail()%></td>
                        <td><%= student.getCourse()%></td>
                        <td>
                            <%
                                Set s = student.getSubjectList();
                                Iterator ite = s.iterator();
                                while (ite.hasNext()) {
                                    Subject sub2 = (Subject) ite.next();
                                    out.println(sub2.getSub_name());
                                }
                            %>
                        </td>
                        <td><%= student.getUsername()%></td>
                        <td><%= student.getPassword()%></td>
                        <td><a class="update" href="StudentControll/UpdateStudentByAdmin.jsp?id=<%= student.getS_id()%>">Update</a></td>
                        <td><a class="delete" href="StudentControll/DeleteStudents.jsp?id=<%= student.getS_id()%>">Delete</a></td>
                        <td><a class="delete" href="SelectAllStudentExamInfo.jsp?id=<%= student.getS_id()%>">Exam</a></td>
                    </tr>
                    <%
                            }
                        } else {
                            out.print("no record found");
                        }

                    %>

                </table>
            </div>
        </div>
    </body>
</html>
