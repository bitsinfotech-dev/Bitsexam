<%-- 
    Document   : ExamPhase2
    Created on : Mar 22, 2018, 10:25:22 PM
    Author     : Alok Panday
--%>

<%@page import="Bean.Student"%>
<%@page import="DAO.StudentOperation"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Subject"%>
<%@page import="DAO.SubjectOperation"%>
<%@page import="Bean.Questions_option"%>
<%@page import="DAO.OptionsOperation"%>
<%@page import="Bean.Questions"%>
<%@page import="DAO.QuestionOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title> 
        <link href="CSS_Topic_css/topic.css" rel="stylesheet" type="text/css"/>
        <script src="CSS_Topic_css/CSS_script.js" type="text/javascript"></script>
        <%@include file="../CommonThings/BTCDN.jsp" %>
        <style>
            body{
                font-family: monospace;
            }
            h2 , h3{
                margin: 1px;
                font-weight: bold;
                color: black;
            }
        </style>
    </head>
    <body>
        <DIV class="container"> 



            <%  StudentOperation so = new StudentOperation();
                Student student;
                if (session.getAttribute("LogedIn") != null) {
                    long id = ((Student) session.getAttribute("LogedIn")).getS_id();
                    student = so.selectStudent(id);
                    int qno = 0;
                    boolean lastq = false;

                        int subid = Integer.parseInt(request.getParameter("subject"));
                        QuestionOperation qo = new QuestionOperation();
                        Subject sub = new SubjectOperation().selectSubject(subid);
            %>
            <h1>Subject ID:<%= sub.getSub_id() + " Subject name:" + sub.getSub_name()%></h1><%
                if (qo.selectNotIn(sub, student) != null) {

                    List li = qo.selectNotIn(sub, student);
                    int size = li.size();
                    ListIterator lit = li.listIterator();
                    while (lit.hasNext()) {

                        qno++;
                        Questions questions = (Questions) lit.next();

                        String qtype = questions.getQuestion_type();
                        if (qno == size) {
                            lastq = true;
                        }
                        if (qtype.equals("written")) {

            %>
            <div class="well well-sm">
                <form action="../Question_Check_store">
                    <h2>Question type: <%= qtype%> </h2>
                    <h3>(<%= qno%>) : <%= questions.getQuestion_text()%> <span class="badge badge-success">For <%= questions.getMark()%> marks</span> </h3>

                    <textarea name="answer" class="form-control"></textarea>
                    <ul class="pager">
                        <input type="hidden" value="<%= questions.getQuestion_id()%>" name="qid">
                        <input type="hidden" value="<%= sub.getSub_id()%>" name="subid">
                        <input type="hidden" name="lastq" value="<%= lastq%>">
                        <button type="submit" class="next">Next</button>
                    </ul> 
                </form>
            </div>
            <%

            } else if (qtype.equals("optional")) {
                OptionsOperation oo = new OptionsOperation();
                Questions_option qoption = oo.serchByQuestions(questions);
                
            %>

            <div class="well well-sm">
                <form action="../Question_Check_store">
                    <h2>Question type: <%= qtype%> </h2>

                    <h3>(<%=qno%>) : <%= questions.getQuestion_text()%> <span class="badge badge-success">For <%= questions.getMark()%> marks</span> </h3>

                    <ul class="list-group">
                        <li class="list-group-item"><input type="radio" value="<%=qoption.getOption1()%>" name="answer"> <%=qoption.getOption1()%></li>
                        <li class="list-group-item"> <input type="radio" value="<%=qoption.getOption2()%>" name="answer"> <%=qoption.getOption2()%></li>
                        <li class="list-group-item"><input type="radio" value="<%=qoption.getOption3()%>" name="answer"> <%=qoption.getOption3()%></li>
                        <li class="list-group-item"><input type="radio" value="<%=qoption.getOption4()%>" name="answer"> <%=qoption.getOption4()%></li>
                    </ul>
                    <ul class="pager">
                        <input type="hidden" value="<%= questions.getQuestion_id()%>" name="qid">
                        <input type="hidden" value="<%= sub.getSub_id()%>" name="subid">
                        <input type="hidden" name="lastq" value="<%= lastq%>">
                        <button type="submit" class="next">Next</button>
                    </ul> 
                </form>
            </div>

            <%
                
            } else if (qtype.equals("practical")) {
            %>
            <div class="well well-sm">
                <form action="../Question_Check_store">
                    <h2>Question type: <%= qtype%> </h2>
                    <h3>(<%= qno%>) : <%= questions.getQuestion_text()%> <span class="badge badge-success">For <%= questions.getMark()%> marks</span> </h3>

                    <textarea name="answer" class="code_box" onclick="textAreaAdjust(this)" onkeyup="textAreaAdjust(this)">
                    
                    </textarea>
                    <ul class="pager">
                        <input type="hidden" value="<%= questions.getQuestion_id()%>" name="qid">
                        <input type="hidden" value="<%= sub.getSub_id()%>" name="subid">
                        <input type="hidden" name="lastq" value="<%= lastq%>">
                        <button type="submit" name="submit" class="next">Next</button>
                    </ul> 
                </form>
            </div>
            <%

                    } else {
                        out.print("Follow the exam phases. Don't run this page directly.");
                    }
                }
            } else {
                out.print("Looks like you have already given the exam Or No questions are their for subject " + sub.getSub_name());
            %>
            <br>Check your previous result for <%= sub.getSub_name()%> <a href="Result.jsp?sub=<%=sub.getSub_id()%>">Get result</a>
            <%
                        }
                } else {
                    out.println("<h1>Login first <a href='../UserLogin.jsp'>Login</a></h1>");
                }
            %>

        </DIV>
    </body>
</html>
