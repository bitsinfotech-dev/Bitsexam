<%-- 
    Document   : StudentRegistration
    Created on : Dec 31, 2017, 4:59:00 PM
    Author     : Alok Panday
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@include file="CommonThings/BTCDN.jsp"%>
        <style>
            <%@include file="CommonThings/bootstrapHeaderCss.css" %>
            body{
                background-image: url("img/BG/loginpage.png");
            }
            .container{
                margin-top: 50px;
                /*margin-left: auto;*/
            }
            .container form{
                /*border: thin solid orange;*/
                background-color: rgba(1,1,1,.2);
                border-radius: 5px;
                box-shadow: 1px 1px 20px black,-1px -1px 20px black;
                padding: 20px;
                margin-left:25%;;
                width: 50%;

            }
            .container h2{
                text-align: center;
                font-weight: bold;
            }
            .container label{
                font-size: 20px;
                font-weight: bold;
                color: white;
                text-shadow:1px 1px 10px black;
            }
            .container input{
                background-color: rgba(1,1,1,.2);
                box-shadow: 1px 1px 5px black;
                color: white;
                font-size: 18px;
            }
            ::placeholder{
                color: white!important;
            }
            .btn{
                color: black!important;
                font-weight: bold;
                font-size: 20px;
            }
            @media only screen and (max-width: 600px) {
                .container form{
                    width:100%;
                    margin-left: auto;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="CommonThings/bootstrapHeader.jsp" %>
        <div class="container">
            <h2>Student registration form</h2>
            <form action="RegisterController" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" placeholder="Enter your name" name="name">
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" class="form-control" id="address" placeholder="Enter your address" name="address">
                </div>
                <div class="form-group">
                    <label for="contact">contact:</label>
                    <input type="text" class="form-control" id="contact" placeholder="Enter your contct number" name="contact">
                </div>
                <div class="form-group">
                    <label for="course">Interested Course:</label>
                    <input type="text" class="form-control" id="course" placeholder="Java, PHP, HTML, JSP etc." name="course">
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                </div>
                <div class="form-group">
                    <label for="username">username:</label>
                    <input type="text" class="form-control" id="username" placeholder="Enter username" name="username">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pass">
                </div>
                <div class="form-group">
                    <label>User Profile Pic</label>
                    <input type="file" class="form-control" id="img" placeholder="Select your profile picture" name="image">
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" name="remember"> Remember me</label>
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
                <a href="UserLogin.jsp"><button class="btn btn-default" type="button">Already Registered</button></a>

            </form>
        </div>

    </body>
</html>
