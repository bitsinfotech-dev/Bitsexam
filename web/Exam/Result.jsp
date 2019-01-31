<%-- 
    Document   : Result
    Created on : Apr 16, 2018, 4:39:12 PM
    Author     : Alok Panday
--%>

<%@page import="DAO.QuestionOperation"%>
<%@page import="Bean.Answer"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Student"%>
<%@page import="Bean.Subject"%>
<%@page import="DAO.SubjectOperation"%>
<%@page import="DAO.SubjectDeclaration"%>
<%@page import="DAO.StudentOperation"%>
<%@page import="DAO.StudentDeclaration"%>
<%@page import="DAO.AnswerOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <div class="jumbotron container"  style="margin-top: 0px!important;">

            <%
                if (session.getAttribute("LogedIn") != null) {
                    try {
                        long id = ((Student) session.getAttribute("LogedIn")).getS_id();
                        int subid = Integer.parseInt(request.getParameter("sub"));
                        StudentDeclaration sd = new StudentOperation();
                        SubjectDeclaration subd = new SubjectOperation();
                        AnswerOperation ao = new AnswerOperation();
                        QuestionOperation qo = new QuestionOperation();

                        Student st = sd.selectStudent(id);
                        Subject sub = subd.selectSubject(subid);

                        List li = ao.serchByStudent$language(st, sub);

                        int totalquestions = qo.selectBySubject(sub).size();
                        int attemptQuestions = li.size();
                        int totalrightanswer = ao.WrongOrRight("Right", st, sub).size(), totalwronganswer = ao.WrongOrRight("Wrong", st, sub).size();
                        double totalmarkofsubject = qo.SumOfMarks(sub);
                        double totalmarkofstudent = 0.0;
                        ListIterator lit = li.listIterator();
                        int qno = 0;
                        //-------------------------------------------------------to sum of all right answer marks
                        double totalRightAnswerMarks = 0;
                        if (ao.WrongOrRight("Right", st, sub) != null) {
                            List righ_tans_li = ao.WrongOrRight("Right", st, sub);
                            ListIterator righ_tans_lit = righ_tans_li.listIterator();
                            while (righ_tans_lit.hasNext()) {
                                Answer ans = (Answer) righ_tans_lit.next();
                                totalRightAnswerMarks += ans.getQuestions().getMark();

                            }
                        }

                        //-------------------------------------------------------

            %>
            <div class="row profile-name page-header"  style="margin-top: 0px!important;">
                <div class="col-sm-2"  style="margin-top: 0px!important; text-align: center;">
                    <img src="../img/user_man-256.png" height="100" width="100" alt=""/>
                    <br>
                    <%=st.getName()%>
                </div>
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="row">
                                <div class="col-sm-12">Contact:<%= st.getContact()%></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">Address:<%= st.getAddress()%></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">Email:<%= st.getEmail()%></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">Course:<%= st.getCourse()%></div>
                            </div>

                        </div>
                        <div class="col-sm-6">
                            <div class="row">
                                <div class="col-sm-12">Total questions:<%= totalquestions%></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">Total attempted questions:<%= attemptQuestions%></div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">Total right answer:<%= totalrightanswer%></div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">Total wrong answer:<%= totalwronganswer%></div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">Total marks for <%= sub.getSub_name() + ": " + qo.SumOfMarks(sub)%></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">Total marks for right answer <%=totalRightAnswerMarks%></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12" style="color: #990000; font-weight: bold;">You are :<%= ((totalRightAnswerMarks * 100) / qo.SumOfMarks(sub)) < 40 ? "Failed" : "Passed"%> <%= "<br> You got " + ((totalRightAnswerMarks * 100) / qo.SumOfMarks(sub)) + "% requires 40% minimum"%></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="progress">
                                <div class="progress-bar progress-bar-striped active" role="progressbar"
                                     aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:<%= ((totalRightAnswerMarks * 100) / qo.SumOfMarks(sub)) + "%"%>">
                                    <%=((totalRightAnswerMarks * 100) / qo.SumOfMarks(sub)) + "%"%>
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
                <div class="col-sm-2">
                    <a href="GradeCard.jsp">Check your grade card</a>

                    <hr style="border:thin dashed black;">
                    <a href="">Request for certificate</a>
                </div>
            </div>
            <%
                while (lit.hasNext()) {
                    qno++;
                    Answer ans = (Answer) lit.next();
                    if (ans.getWrongOrRight().equals("Right")) {
                        totalrightanswer++;
                    } else if (ans.getWrongOrRight().equals("Wrong")) {
                        totalwronganswer++;
                    }

            %>
            <div class="row" style="margin-bottom: 10px; box-shadow: 1px 1px 5px black;">
                <div class="col-sm-2">
                    <div class="row">
                        <div class="col-sm-12 well well-sm">
                            Question:<%=qno%>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 well well-sm">
                            Your Answer
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 well well-sm">
                            Right answer 
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-sm-12 well well-sm"><%= ans.getQuestions().getQuestion_text()%></div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 well well-sm"><%= ans.getAnswerText()%> <span style="float: right;"> <div style="color:<%= ans.getWrongOrRight().equals("Right") ? "Green;" : "red;&Sqrt;"%>"><%= ans.getWrongOrRight().equals("Right") ? "" + ans.getWrongOrRight() + " &Sqrt;" : "" + ans.getWrongOrRight() + " &Chi;"%></div></span> </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 well well-sm"><%= ans.getQuestions().getAnswer_text()%></div>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="row">
                        <div class="col-sm-12 well well-sm">Type:<%= ans.getQuestions().getQuestion_type()%></div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 well well-sm">Try Again</div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 well well-sm">Not Satisfied</div>
                    </div>
                </div>
            </div>
            <%}
                    } catch (Exception ex) {
                        out.print("Looks like you have not given exam for this language. <br> Else There is some problem :- contact to your admin.Problem because of " + ex.getCause());
                    }
                }

            %>
        </div>

    </body>
</html>
