<%-- 
    Document   : UpdateRecord
    Created on : Feb 4, 2018, 7:11:55 PM
    Author     : Alok Panday
--%>

<%@page import="Bean.Subject"%>
<%@page import="DAO.SubjectOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        int id=Integer.parseInt(request.getParameter("id"));
        SubjectOperation so=new SubjectOperation();
        if(so.selectSubject(id)!=null){
        Subject sub=so.selectSubject(id);
        %>
        
          <div class="container">
            <h2>Add Subject form</h2>
            <form action="../../FinalUpdateForSubject" method="get">
                <div class="form-group">
                    <label for="name">Subject Name:</label>
                    <input type="text" class="form-control" value="<%= sub.getSub_name() %>" id="sub_name" placeholder="Subject name" name="sub_name">
                </div>
                <div class="form-group">
                    <label for="address">Subject Max mark</label>
                    <input type="text" class="form-control" value="<%= sub.getSub_max_marks()%>" id="address" placeholder="Subject max mark" name="sub_max_marks">
                </div>
                <div class="form-group">
                    <label for="contact">Subject passing mark</label>
                    <input type="text" class="form-control" id="contact" value="<%= sub.getSub_passing_Marks() %>" placeholder="Subject passing mark" name="sub_passing_mark">
                </div>
                <div class="form-group">
                    <label for="fees">Subject Fees:</label>
                    <input type="text" class="form-control" id="fees" value="<%= sub.getSub_fees() %>" placeholder="Subject fees" name="sub_fees">
                </div>
                <div class="form-group">
                    <label for="admission_date">Subject total question</label>
                    <input type="text" class="form-control" id="admission_datecourse" value="<%= sub.getSub_total_questions() %>" placeholder="Total number of questions" name="sub_total_question">
                </div>
                <div class="form-group">
                    <label for="course">Subject Duration</label>
                    <input type="text" class="form-control" id="course" placeholder="Subject duration" value="<%= sub.getSub_duration() %>" name="sub_duration">
                </div>
                
                <div class="form-group">
                    <label for="email">Subject  offer:</label>
                    <input type="text" class="form-control" id="email" placeholder="Subject offer" value="0" value="<%= sub.getSub_offer() %>" name="sub_offer">
                </div>
                <input type="hidden" name="id" value="<%= sub.getSub_id() %>"> 
                <button type="submit" class="btn btn-default">Update Record</button>
            </form>
        </div>
        
        <%
            
        }
        else{
        out.println("hey there is something wrong or there is no data ");
        }

%>
        <form>
            
        </form>
    </body>
</html>
