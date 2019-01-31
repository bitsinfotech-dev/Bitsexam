<%-- 
    Document   : TeacherRegister
    Created on : 14 Dec, 2018, 1:04:58 PM
    Author     : SWATI DHANDE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="CommonThings/BTCDN.jsp" %>
    </head>
    <body>
        <div class="container">
            <h2>Teacher Registration form</h2>            
            <form class="form-horizontal" action="InsertTecher" method="post">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="name">Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="contact">Contact:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="contact" placeholder="Enter Conatct" name="contact">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="address">Address</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" placeholder="Enter address" name="address">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="email">Email:</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                    </div>
                </div>               
                <div class="form-group">
                    <label class="control-label col-sm-2" for="forsubject">For Subject</label>
                    <div class="col-sm-10">
                        <input type="checkbox" id="forsubject" placeholder="Enter Subject" name="forsubject">subject name
                    </div>
                </div>                
                <div class="form-group">
                    <label class="control-label col-sm-2" for="joiningdate">Joining Date</label>
                    <div class="col-sm-10">
                        <input type="date" class="form-control" id="joiningdate" placeholder="Enter Date" name="joiningdate">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="username">Username</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="username" placeholder="Enter Username" name="username">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Password:</label>
                    <div class="col-sm-10">          
                        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
                    </div>
                </div>
                <div class="form-group">        
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                            <label><input type="checkbox" name="remember"> Remember me</label>
                        </div>
                    </div>
                </div>
                <div class="form-group">        
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
