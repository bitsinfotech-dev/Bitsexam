<%-- 
    Document   : ShowAllStudents
    Created on : Jan 3, 2018, 12:15:48 PM
    Author     : Alok Panday
--%>

<%@page import="Bean.Subject"%>
<%@page import="DAO.SubjectOperation"%>
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
    <%!
        SubjectOperation st = new SubjectOperation();
    %>
    <body>

        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Bits Infotec</a>
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
                        <th>sub_max_marks</th>
                        <th>Sub_passing_Marks</th>
                        <th>Sub_total_questions</th>
                        <th>Sub_duration</th>
                        <th>Sub_fees</th>
                        <th>Sub_offer</th>
                    </tr>
                </thead>

                <%
                    if (st.serchByName(taegetString) != null) {
                        List li = st.serchByName(taegetString);

                        ListIterator lit = li.listIterator();
                        while (lit.hasNext()) {
                            Subject subject = (Subject) lit.next();
                %>
                <tr>
                    <td><%= subject.getSub_id()%></td>
                    <td><%= subject.getSub_name()%></td>
                    <td><%= subject.getSub_max_marks()%></td>
                    <td><%= subject.getSub_passing_Marks()%></td>
                    <td><%= subject.getSub_total_questions()%></td>
                    <td><%= subject.getSub_duration()%></td>
                    <td><%= subject.getSub_fees()%></td>
                    <td><%= subject.getSub_offer()%></td>

                    <td><a class="update" href="StudentControll/UpudateStudent.jsp?id=<%= subject.getSub_id()%>">Update</a></td>
                    <td><a class="delete" href="DeleteSubject?id=<%= subject.getSub_id()%>">Delete</a></td>
                </tr>
                <%
                        }
                    } else {
                        out.println("<th style='color:red;'>there is no record for given name</th>");

                    }
                %>

            </table>

        </div>
        <hr>
        <%
            }
        %>
        <!----------------------------searched data-------------------------------------> 
        <%@include file="AdminPage.jsp" %>
        <div class="col-sm-8">        
            <div class="container">
                <table class="table table-striped">
                    <caption>All subject records</caption>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>sub_max_marks</th>
                            <th>Sub_passing_Marks</th>
                            <th>Sub_total_questions</th>
                            <th>Sub_duration</th>
                            <th>Sub_fees</th>
                            <th>Sub_offer</th>
                        </tr>
                    </thead>

                    <%
                        if (st.selectAllSubjects() != null) {
                            List li = st.selectAllSubjects();
                            ListIterator lit = li.listIterator();
                            while (lit.hasNext()) {
                                Subject subject = (Subject) lit.next();
                    %>
                    <tr>
                        <td><%= subject.getSub_id()%></td>
                        <td><%= subject.getSub_name()%></td>
                        <td><%= subject.getSub_max_marks()%></td>
                        <td><%= subject.getSub_passing_Marks()%></td>
                        <td><%= subject.getSub_total_questions()%></td>
                        <td><%= subject.getSub_duration()%></td>
                        <td><%= subject.getSub_fees()%></td>
                        <td><%= subject.getSub_offer()%></td>

                        <td><a class="update" href="SubjectControll/UpdateRecord.jsp?id=<%= subject.getSub_id()%>">Update</a></td>
                        <td><a class="delete" href="../DeleteSubject?id=<%= subject.getSub_id()%>">Delete</a></td>
                    </tr>
                    <%
                            }
                        }
                    %>

                </table>
            </div>
        </div>
    </body>
</html>
