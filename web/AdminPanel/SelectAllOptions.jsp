<%-- 
    Document   : ShowAllStudents
    Created on : Jan 3, 2018, 12:15:48 PM
    Author     : Alok Panday
--%>

<%@page import="Bean.Questions"%>
<%@page import="DAO.QuestionOperation"%>
<%@page import="Bean.Questions_option"%>
<%@page import="DAO.OptionsOperation"%>
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
            String subName = null;
            if (request.getParameter("id") != null) {
                String taegetString = request.getParameter("id");
                QuestionOperation operation = new QuestionOperation();
                Questions q = operation.selectQuestion(Integer.parseInt(request.getParameter("id")));

        %>
        <div class="container">
            <table class="table table-striped">
                <option>Question detail</option>
                <tr>
                    <th>Language name</th>
                    <th>Question id</th>
                    <th>Question type</th>
                    <th>Question text</th>
                    <th>Answer text</th>
                </tr>
                <tr>
                    <td>
                        <%=q.getSubject().getSub_name()%>
                    </td>
                    <td><%= q.getQuestion_id()%></td>
                    <td><%= q.getQuestion_type()%></td>
                    <td><%= q.getQuestion_text()%></td>
                    <td><%= q.getAnswer_text()%></td>
                </tr>
            </table>
        </div>
        <%}%>        
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
                        <th>Option ID</th>
                        <th>Question Id</th>
                        <th>Option 1</th>
                        <th>Option 2</th>
                        <th>Option 3</th>
                        <th>Option 4</th>


                    </tr>
                </thead>

                <%--<%
                    OptionsOperation st = new OptionsOperation();
                    if (st.serchByName(taegetString) != null) {
                        List li = st.serchByName(taegetString);
                        ListIterator lit = li.listIterator();
                        while (lit.hasNext()) {
                            Questions_option questions_option = (Questions_option) lit.next();
                %>
                <tr>
                    <td><%= questions_option.getOption_id()%></td>
                    <td><%= questions_option.getQuestion_no().getQuestion_id()%></td>
                    <td><%= questions_option.getOption1()%></td>
                    <td><%= questions_option.getOption2()%></td>
                    <td><%= questions_option.getOption3()%></td>
                    <td><%= questions_option.getOption4()%></td>
                    <td><a class="update" href="StudentControll/UpudateStudent.jsp?id=<%= questions_option.getOption_id()%>">Update</a></td>
                    <td><a class="delete" href="StudentControll/DeleteStudents.jsp?id=<%= questions_option.getOption_id()%>">Delete</a></td>
                </tr>
                <%
                        }
                    } else {
                        out.print("no record found");
                    }
                %>
--%>
            </table>

        </div>
        <hr>
        <%
            }
        %>
        <!----------------------------all data-------------------------------------> 

        <div class="container">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Option ID</th>
                        <th>Question Id</th>
                        <th>Option 1</th>
                        <th>Option 2</th>
                        <th>Option 3</th>
                        <th>Option 4</th>
                    </tr>
                </thead>

                <%
                    OptionsOperation oo = new OptionsOperation();
                    if (oo.selectAllOptions() != null) {

                        List li = oo.selectAllOptions();
                        ListIterator lit = li.listIterator();
                        while (lit.hasNext()) {
                            Questions_option questions_option = (Questions_option) lit.next();
                %>
                <tr>
                    <td><%= questions_option.getOption_id()%></td>
                    <td><a href="SelectAllOptions.jsp?id=<%= questions_option.getQuestion_no().getQuestion_id()%>"><%= questions_option.getQuestion_no().getQuestion_id()%></a></td>
                    <td><%= questions_option.getOption1()%></td>
                    <td><%= questions_option.getOption2()%></td>
                    <td><%= questions_option.getOption3()%></td>
                    <td><%= questions_option.getOption4()%></td>
                    <td><a class="update" href="QuestionControll/QuestionUpdateForm.jsp?id=<%= questions_option.getQuestion_no().getQuestion_id()%>&language=<%=subName%>">Update</a></td>
                    <td><a class="delete" href="../DeleteOption?id=<%= questions_option.getOption_id()%>">Delete</a></td>
                </tr>
                <%
                        }
                    } else {

                        out.print("no record found");
                    }
                %>

            </table>

        </div>
    </body>
</html>
