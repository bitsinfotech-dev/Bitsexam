<%-- 
    Document   : Member
    Created on : 13 Dec, 2018, 2:56:33 PM
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
        <form action="InsertAdmin" method="post">
            <label>Name:</label>
            <input type="text" name="name"><br><br>
            <label>Username:</label>
            <input type="text" name="username"><br><br>
            <label>Password</label>
            <input type="password" name="password"><br><br>
            <input type="submit" name="submit">
        </form>
    </body>
</html>
