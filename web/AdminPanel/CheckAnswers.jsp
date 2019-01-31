<%-- 
    Document   : CheckAnswers.jsp
    Created on : 12 Dec, 2018, 1:36:46 PM
    Author     : SWATI DHANDE
--%>

<%@page import="Bean.Subject"%>
<%@page import="DAO.SubjectOperation"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Answer"%>
<%@page import="DAO.AnswerOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../CommonThings/BTCDN.jsp" %>
        <style>
            .row{
                box-shadow:1px 1px 10px black; margin: 10px; padding: 10px; border-radius: 10px;
                padding-bottom: 30px;
            }
            .row .buttoncontainer a{
                text-decoration: none;
                padding: 10px;
                margin: 10px;
                border:thin solid black;
                color:black;
                box-shadow: 1px 1px 20px black; 
                border-radius: 5px;

            }
            .row .qac{
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">              
            <form class="form-horizontal" action="" method="">
                <div class="form-group">
                    <%
                        AnswerOperation ao = new AnswerOperation();
                        Subject subject = (Subject) new SubjectOperation().selectSubject(Integer.parseInt(request.getParameter("id").toString()));
                        if (ao.selectAllAnswersBySubjecId(subject) != null) {
                            List li = ao.selectAllAnswersBySubjecId(subject);
                            System.err.println("---------------id:" + li.size());
                            //                System.err.println("size:" + li.size());
                            ListIterator it = li.listIterator();
                            while (it.hasNext()) {
                                Answer a = (Answer) it.next();
                                if (a.getSubjectid().getSub_id() == subject.getSub_id()) {
                    %>                    
                    <div class="row">

                        <div class="qac">
                            <label class="control-label" for="name">Q.<%=a.getQuestions().getQuestion_text()%>?</label>
                            <p style="font-weight: bold">Result:<%=a.getWrongOrRight()%></p>
                            <textarea class="form-control">Ans:<%=a.getAnswerText()%></textarea>
                        </div>
                        <div class="buttoncontainer">                            
                            <a href="../RightOrWrong?id=<%=a.getId()%>&RightOrWrong=Right">Right</a> 
                            <a href="../RightOrWrong?id=<%=a.getId()%>&RightOrWrong=Wrong">Wrong</a> 
                        </div>
                    </div>
                    <%                    }
                            }
                        }
                    %>  
                </div>
            </form>
        </div>
    </body>
</html>
