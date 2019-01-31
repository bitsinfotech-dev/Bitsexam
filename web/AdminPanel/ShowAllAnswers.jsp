<%-- 
    Document   : SelectAllStudents
    Created on : Mar 2, 2018, 10:38:03 PM
    Author     : Alok Panday
--%>

<%@page import="Bean.Answer"%>
<%@page import="DAO.AnswerOperation"%>
<%@page import="Bean.Subject"%>
<%@page import="Bean.Questions"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.QuestionOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>  <%@include file="../CommonThings/BTCDN.jsp"%>
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
        <%--  <%
            if (request.getParameter("submit_search") != null) {
                String taegetString = request.getParameter("search");
        %>

        <div class="container">
            <table class="table table-striped">
                <caption>Searched Data</caption>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Marks</th>
                        <th>Question type</th>
                        <th>Question Text</th>
                        <th>Answer Text</th>
                    </tr>
                </thead>

                <%
                    if (qo.serchByName(taegetString) != null) {
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
        --%>
        <!----------------------------searched data-------------------------------------> 

        <div class="container">
            <table class="table table-striped">
                <caption>All Questions records</caption>
                <thead>
                    <tr>
                        <th>Answer ID</th>
                        <th>Subject name</th>
                        <th>Question ID</th>
                        <th>Question marks</th>
                        <th>Question type</th>
                        <th>Question text</th>
                        <th>Actual answer Text</th>
                        <th>Student answer Text</th>
                        <th>Wrong or Right</th>
                        <th>Answer date</th>
                    </tr>
                </thead>

                <%
                    AnswerOperation ao=new AnswerOperation();
                    
                    if (ao.selectAllAnswers() != null) {
                        List li = ao.selectAllAnswers();
                        ListIterator lit = li.listIterator();
                        while (lit.hasNext()) {
                            Answer answer = (Answer) lit.next();
                       

                %>
                <tr>
                    <td><%= answer.getId() %></td>
                    <td><%= answer.getSubjectid().getSub_name() %></td>
                    <td><%= answer.getQuestions().getQuestion_id() %></td>
                    <td><%= answer.getQuestions().getMark() %></td>
                    <td><%= answer.getQuestions().getQuestion_type() %></td>
                    <td><%= answer.getQuestions().getQuestion_text() %></td>
                    <td><%= answer.getQuestions().getAnswer_text() %></td>                    
                    <td><%= answer.getAnswerText() %></td>
                    <td><%= answer.getWrongOrRight() %></td>
                    <td><%= answer.getAnswer_date() %></td>
                    <td><a class="update" href="QuestionControll/QuestionUpdateForm.jsp?id=<%= answer.getId() %>">Update</a></td>
                    <td><a class="delete" href="../DeleteQuestion?id=<%= answer.getId() %>">Delete</a></td>
                </tr>
                <%}
                        
                    }

                %>

            </table>

        </div>

    </body>
</html>
