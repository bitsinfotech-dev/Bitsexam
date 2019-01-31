<%-- 
    Document   : DeleteStudents
    Created on : Jan 22, 2018, 12:41:11 PM
    Author     : Alok Panday
--%>

<%@page import="DAO.StudentOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        long id=Long.parseLong(request.getParameter("id"));
        StudentOperation so=new StudentOperation();
        boolean b=so.delete(id);
        if(b){
        response.sendRedirect("../ShowAllStudents.jsp");
        }
        else{
        out.print("there is something wrong so try again other wise contact to admin :8976110254");
        }
        %>
        
    </body>
</html>
