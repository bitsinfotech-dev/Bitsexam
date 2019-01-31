<%-- 
    Document   : selectlanguage
    Created on : Mar 20, 2018, 10:25:40 PM
    Author     : Alok Panday
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="Bean.Student"%>
<%@page import="DAO.StudentOperation"%>
<%@page import="java.util.List"%>
<%@page import="DAO.SubjectOperation"%>
<%@page import="Bean.Subject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../CommonThings/BTCDN.jsp" %>
    </head>
    <body>
        <div class="container">


            <h1>Examination process >- phase 1:</h1>
            <form action="ExamPhase2.jsp">
                <div class="form-group">
                    <label for="sel1">Select your subject:</label>
                    <select class="form-control" name="subject">
                        <%
                            if (session.getAttribute("LogedIn") != null) {
                                Student st = (Student) session.getAttribute("LogedIn");

                                Set subjectlist = st.getSubjectList();
                                Iterator ite = subjectlist.iterator();
                                while (ite.hasNext()) {
                                    Subject sub = (Subject) ite.next();
                        %>
                        <option value="<%=sub.getSub_id()%>"><%= sub.getSub_name()%></option>
                        <%
                                }
                            }

                        %>

                    </select>
                </div> 
                <div class="jumbotron ">
                    <h2>Read before next phase</h2>
                    <ul>
                        <li>Dear students your first attempts of examination is free next attempt is chargeable based on subject.</li>
                        <li>Question can have in three category (Practical , Optional , Written).</li>
                        <li>After completion of this exam you will be awarded by BITS-Infotec certificate.</li>
                        <l1><input type="checkbox" required> I am agree</l1>
                    </ul>
                </div>  
                <input class="btn btn-success" type="submit" name="submit" value="Next phase">
            </form>

        </div>
    </body>
</html>
