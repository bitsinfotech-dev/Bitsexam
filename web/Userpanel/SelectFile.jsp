<%-- 
    Document   : SelectFile
    Created on : 10 Sep, 2018, 11:01:03 AM
    Author     : SWATI DHANDE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <%
            if (request.getParameter("status") != null) {
                if (request.getParameter("status").equals("success")) {
        %>
        <img src="../img/Profile/<%=request.getParameter("filename")%>">
        <%
                } else if (request.getParameter("status").equals("unsuccess")) {
                    out.println("<h1 style='color:red;'>Not Uploaded</h1>");
                }
            }
        %>
    </body>
</html>
