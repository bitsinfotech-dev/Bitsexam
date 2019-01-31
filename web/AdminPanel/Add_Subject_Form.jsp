<%-- 
    Document   : Add_Subject_Form
    Created on : Jan 27, 2018, 12:51:32 PM
    Author     : Alok Panday
--%>

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
        <div class="col-sm-8">
            <div class="container">
                <h2>Add Subject form</h2>
                <form action="../AddSubjectController" method="get">
                    <div class="form-group">
                        <label for="name">Subject Name:</label>
                        <input type="text" class="form-control" id="sub_name" placeholder="Subject name" name="sub_name">
                    </div>
                    <div class="form-group">
                        <label for="address">Subject Max mark</label>
                        <input type="text" class="form-control" id="address" placeholder="Subject max mark" name="sub_max_marks">
                    </div>
                    <div class="form-group">
                        <label for="contact">Subject passing mark</label>
                        <input type="text" class="form-control" id="contact" placeholder="Subject passing mark" name="sub_passing_mark">
                    </div>
                    <div class="form-group">
                        <label for="fees">Subject Fees:</label>
                        <input type="text" class="form-control" id="fees" placeholder="Subject fees" name="sub_fees">
                    </div>
                    <div class="form-group">
                        <label for="admission_date">Subject total question</label>
                        <input type="text" class="form-control" id="admission_datecourse" placeholder="Total number of questions" name="sub_total_question">
                    </div>
                    <div class="form-group">
                        <label for="course">Subject Duration</label>
                        <input type="text" class="form-control" id="course" placeholder="Subject duration" name="sub_duration">
                    </div>

                    <div class="form-group">
                        <label for="email">Subject  offer:</label>
                        <input type="text" class="form-control" id="email" placeholder="Subject offer" value="0" name="sub_offer">
                    </div>

                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
            </div>
        </div>
    </body>
</html>
