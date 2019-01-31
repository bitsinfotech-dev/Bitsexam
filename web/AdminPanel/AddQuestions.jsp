<%-- 
    Document   : AddQuestions
    Created on : Mar 2, 2018, 10:06:24 PM
    Author     : Alok Panday
--%>

<%@page import="Bean.Subject"%>
<%@page import="java.util.ListIterator"%>
<%@page import="DAO.SubjectOperation"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../CommonThings/BTCDN.jsp" %>
    </head>
    <body>
        <%@include file="AdminPage.jsp" %>
        <div class="container">            
            <h2>Add Questions form</h2>
            <form action="../AddQuestionsController" method="get">
                <div class="form-group">
                    <label for="question_marks">Select Any subject to add questions: </label>
                    <select name="subject_id">
                        <%
                            SubjectOperation subo = new SubjectOperation();
                            if (subo.selectAllSubjects() != null) {
                                List li = subo.selectAllSubjects();
                                ListIterator lit = li.listIterator();
                                while (lit.hasNext()) {
                                    Subject sub = (Subject) lit.next();

                        %>
                        <option value="<%= sub.getSub_id()%>" > <%= sub.getSub_name()%></option>
                        <%      }

                        %>
                    </select>
                </div>
                <div class="col-sm-10">
                    <div class="form-group">
                        <label for="question_marks">Question Marks:</label>
                        <input type="text" class="form-control" id="question_marks" placeholder="question_marks" name="question_marks">
                    </div>
                    <div class="form-group" id="q_option">
                        <label for="question_type">Question type</label>
                        <select class="form-control" name="question_type" id="question_type">
                            <option value="optional">Optional</option>
                            <option value="written" selected>Written</option>
                            <option value="practical">Practical</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="question_text">Question Text</label>
                        <input type="text" class="form-control" id="question_text" placeholder="Question Text" name="question_text">
                    </div>
                    <div class="form-group" id="qoptions" style="display: none;">
                        <label for="options">Add option for this question:</label>
                        &nbsp;<input type="text" class="form-control" placeholder="Option 1" id="options1" name="qoption1">
                        &nbsp; <input type="text" class="form-control" placeholder="Option 2" id="options2" name="qoption2">
                        &nbsp; <input type="text" class="form-control" placeholder="Option 3" id="options3" name="qoption3">
                        &nbsp; <input type="text" class="form-control" placeholder="Option 4" id="options4" name="qoption4">
                    </div>
                    <div class="form-group">
                        <label for="answer_text">Answer Text</label>
                        <input type="text" class="form-control" id="answer_text" placeholder="Answer Text" name="answer_text">
                    </div>

                    <button type="submit" class="btn btn-lg btn-success">Submit</button>
            </form>
            <% } else {

                    out.print("no subject available");
                }


            %>
            <h1 style="color: red;"> <%= request.getParameter("result") != null ? request.getParameter("result") : ""%></h1>

        </div>
    </div>
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
