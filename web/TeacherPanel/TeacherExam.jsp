<%-- 
    Document   : GradeCard
    Created on : Apr 28, 2018, 9:40:47 PM
    Author     : Alok Panday
--%>

<%@page import="Bean.Answer"%>
<%@page import="Bean.StudentExamInfo"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.*"%>
<%@page import="Bean.Student"%>
<%@page import="DAO.StudentOperation"%>
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
        <%
            if (session.getAttribute("LogedIn") != null) {
                StudentOperation studentOperation = new StudentOperation();
                Student student = studentOperation.selectStudent(Integer.parseInt(request.getParameter("id").toString()));
                StudentExamInfoDeclaration studentExamInfoDeclaration = new StudentExamInfoImpl();
                if (studentExamInfoDeclaration.selectAllStudentExamInformation() != null) {
                    List li = studentExamInfoDeclaration.selectAllStudentExamInformation();
                    System.err.println("---------------+++++++++++" + li.size() + "id is" + student.getS_id());
                    ListIterator lit = li.listIterator();
                    AnswerOperation answerOperation = new AnswerOperation();
                    QuestionOperation questionOperation = new QuestionOperation();
//                int totalExamGiven=studentExamInfoDeclaration.selectAllDistinctSubject(student).size();                    
                    System.err.println("vLUES ARAE1" + student.getContact());
                    System.err.println("vLUES ARAE2" + student.getAddress());
                    System.err.println("vLUES ARAE3" + student.getEmail());
                    System.err.println("vLUES ARAE4" + student.getCourse());
                    System.err.println("vLUES ARAE5" + student.getSubjectList().size());
                    System.err.println("vLUES ARAE6" + studentExamInfoDeclaration.selectAllStudentExamInformation(student).size());
        %>

        <div class="container">
            <div class="row profile-name page-header"  style="margin-top: 0px!important;">
                <div class="col-sm-2"  style="margin-top: 0px!important; text-align: center;">
                    <img src="../img/user_man-256.png" height="100" width="100" alt=""/>
                    <br>
                    <%=student.getName()%>
                </div>
                <div class="col-sm-10">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="row">
                                <div class="col-sm-12">Contact:<%= student.getContact()%></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">Address:<%= student.getAddress()%></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">Email:<%= student.getEmail()%></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">Course:<%= student.getCourse()%></div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="row">
                                <div class="col-sm-12">Total Subjects:<%= student.getSubjectList().size()%></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">Total exam given :<%= studentExamInfoDeclaration.selectAllStudentExamInformation(student).size()%></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="progress">
                                <div class="progress-bar progress-bar-striped active" role="progressbar"></div>                                                                  
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <table class="table table-striped table-hovered">
                    <tr>
                        <th>Subject name</th>
                        <th>Actual subject marks</th>
                        <th>Your marks</th>
                        <th>Percentage</th>
                        <th>Pass or Fail</th>
                        <th>Exam date</th>
                        <th>Option</th>
                    </tr>

                    <%
                        while (lit.hasNext()) {
                            StudentExamInfo examinfo = (StudentExamInfo) lit.next();
                            double totalRightAnswerMarks = 0;
                            if (answerOperation.WrongOrRight("Right", student, examinfo.getSub()) != null) {
                                List righ_tans_li = answerOperation.WrongOrRight("Right", student, examinfo.getSub());
                                ListIterator righ_tans_lit = righ_tans_li.listIterator();
                                while (righ_tans_lit.hasNext()) {
                                    Answer ans = (Answer) righ_tans_lit.next();
                                    totalRightAnswerMarks += ans.getQuestions().getMark();
                                }
                            }
                    %>
                    <tr>
                        <td><%= examinfo.getSub().getSub_name()%></td>
                        <td><%= questionOperation.SumOfMarks(examinfo.getSub())%></td>
                        <td><%=totalRightAnswerMarks%></td>
                        <td><%= ((totalRightAnswerMarks * 100) / questionOperation.SumOfMarks(examinfo.getSub())) + "%"%></td>
                        <td><%= ((totalRightAnswerMarks * 100) / questionOperation.SumOfMarks(examinfo.getSub())) < 40 ? "<span style='color:red;'>Failed</span>" : "<span style='color:green;'>Passed</span>"%></td>
                        <td><%=examinfo.getDate()%></td>                        
                        <td><A href="../AdminPanel/CheckAnswers.jsp?id=<%=examinfo.getSub().getSub_id()%>">Check Answers</A></td>                         
                    </tr>
                    <%
                            }
                        }
                    %>

                </table>
            </div>
        </div>

        <%}%>
    </body>
</html>
