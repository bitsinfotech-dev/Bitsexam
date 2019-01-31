<%-- 
    Document   : AddQuestions
    Created on : Mar 2, 2018, 10:06:24 PM
    Author     : Alok Panday
--%>

<%@page import="Bean.Questions_option"%>
<%@page import="DAO.OptionsOperation"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ListIterator"%>
<%@page import="Bean.Subject"%>
<%@page import="DAO.SubjectOperation"%>
<%@page import="Bean.Questions"%>
<%@page import="DAO.QuestionOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../../CommonThings/BTCDN.jsp" %>
    </head>
    <body>
        <%!
            int id;
            QuestionOperation qo = new QuestionOperation();
            Questions q;
        %>
        <%
            if (request.getParameter("id") != null) {
                id = Integer.parseInt(request.getParameter("id"));
//                out.print("ID is not null------------------------"+id);
                q = qo.selectQuestion(id);
                if (q != null) {

        %>
        <div class="container">
            <h2>Update Questions form</h2>
            <form action="../../FinalUpdateForQuestions" method="get">
                <div class="form-group">
                    <label for="subjectname">Subject name:</label>
                    <select name="subject_id">
                        <%        SubjectOperation subo = new SubjectOperation();
                            if (subo.selectAllSubjects() != null) {
                                List li = subo.selectAllSubjects();
                                ListIterator lit = li.listIterator();
                                while (lit.hasNext()) {
                                    Subject sub = (Subject) lit.next();

                        %>
                        <option value="<%= sub.getSub_id()%>" <%= request.getParameter("language").equals(sub.getSub_name()) ? "selected" : ""%> > <%= sub.getSub_name()%></option>
                        <%      }

                            }
                        %>
                    </select>
                </div>

                <div class="form-group">
                    <label for="question_marks">Question id:</label>
                    <input type="text" class="form-control" id="question_marks" value="<%= q.getQuestion_id()%>" name="id">
                </div>
                <div class="form-group">
                    <label for="question_marks">Question Marks:</label>
                    <input type="text" class="form-control" id="question_marks" value="<%= q.getMark()%>" name="question_marks">
                </div>
                <div class="form-group">
                    <label for="question_type">Question type</label>
                    <select class="form-control" name="question_type" id="question_type">
                        <option value="<%= q.getQuestion_type()%>" selected><%= q.getQuestion_type()%></option>
                        <option value="optional">Optional</option>
                        <option value="written">Written</option>
                        <option value="practical">Practical</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="question_text">Question Text</label>
                    <input type="text" class="form-control" id="question_text" value="<%= q.getQuestion_text()%>" name="question_text">
                </div>
                <%

                    OptionsOperation oo = new OptionsOperation();
                    if (oo.serchByQuestions(q) != null) {
                        Questions_option qo = oo.serchByQuestions(q);
                %>
                <div class="form-group" id="qoptions" style="display: block;">
                    <label for="options">Add option for this question:</label>
                    <input type="hidden" value="<%= qo.getOption_id()%>" name="option_id">
                    &nbsp;<input type="text" class="form-control" value="<%= qo.getOption1()%>" id="options1" name="qoption1">
                    &nbsp; <input type="text" class="form-control" value="<%= qo.getOption2()%>" id="options2" name="qoption2">
                    &nbsp; <input type="text" class="form-control" value="<%= qo.getOption3()%>" id="options3" name="qoption3">
                    &nbsp; <input type="text" class="form-control" value="<%= qo.getOption4()%>" id="options4" name="qoption4">
                </div>
                <%} else {
                        out.print("data not available");
                    }
                %>
                <div class="form-group">
                    <label for="answer_text">Answer Text</label>
                    <input type="text" class="form-control" id="answer_text" value="<%= q.getAnswer_text()%>" name="answer_text">
                </div>

                <button type="submit" class="btn btn-success btn-lg">Submit</button>
            </form>
        </div>
        <%}
            }%>
        <script>
            $(document).ready(function () {
                $('#q_option').change(function () {
                    var optionSelected = $(this).find("option:selected");
                    var textSelected = optionSelected.text();
                    if (textSelected == "Optional") {
                        $('#qoptions').slideDown(1000);
                    } else if (textSelected == "Written") {
                        $('#qoptions').slideUp();
                    } else if (textSelected == "Practical") {
                        $('#qoptions').slideUp();
                    }

                });
            });
        </script>
    </body>
</html>
