<%-- 
    Document   : UserLogin
    Created on : 2 Sep, 2018, 8:57:09 PM
    Author     : SWATI DHANDE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">            
        <meta name="viewport" content="width=device-width, initial-scale=1.0">         
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <style> 
            body{                
                background-image: url(img/BG/loginpage.png);
                background-repeat: no-repeat;
                background-size: cover;                                                                                              
            }
            .first{
                margin-top: 0%;
                height: 700px;                
            }            
            .container form{                
                border-radius: 5px;                                
                background-color: rgba(1,1,1,.3);
                box-shadow: inset 1px 1px 1000px rgba(255,255,255,.5);                
                box-decoration-break: slice;
                padding: 20px;
                margin-left:30%;;
                width: 35%;   
                height: 450px!important;                           
                margin-top: 50px;
                box-shadow: 1px 1px 30px black,-1px -1px 30px black;
            }                
            .container label{
                font-size: 20px;
                font-weight: bold;
                color: white;
                text-shadow:1px 1px 10px black;                
                margin-top: 40px!important;                            
            }
            .container input{
                background-color: rgba(1,1,1,.2);                
                font-size: 18px;                
                border-color: white!important;
                background-color: transparent;                
                border-radius: 5px;
                height: 35px;
                width: 100%;                
                box-shadow: 1px 1px 50px black,-1px -1px 50px black;
                color: white; 

            }                 
            .btn{                
                margin-top: 50px;
                border-radius: 5px;
                font-size: 20px;   
                width: 130px;
                background-color: transparent;
                border-color: white;
                height: 35px;
                box-shadow: 1px 1px 50px black,-1px -1px 50px black;
            }

            h2{
                font-size: 25px; 
                font-family: 'Indie Flower', cursive!important;              
                font-weight: bold!important;
                letter-spacing: 2px;
                text-align: center;
                word-spacing: 6px;                   
            }

            h3{
                color: black;
                font-size: 20px;                                          
                text-align: center;
                letter-spacing: 2px;
                font-family: 'Indie Flower', cursive!important;              
                font-weight: bold!important;
                word-spacing: 6px;                     
            }
            @media only screen and (max-width: 600px) {
                .container form{
                    width:90%;
                    margin-left: 0px;
                }
            }
        </style>
    </head>
    <body>                    
        <div class="container">                         
            <form action="TeacherSignIn" method="post">

                <h2>Login Here</h2> 
                <h3>Teacher login panel</h3>
                <div class="form-group">
                    <input type="hidden" value="user" name="type">
                    <label><span><i class="fa fa-user-circle" aria-hidden="true"></i></span>Username:</label><br><br>
                    <input type="text" name="uname" placeholder="Enter User name"><br><br>
                </div>
                <div class="form-group">
                    <label><span><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>Password:</label><br><br>
                    <input type="password" placeholder="*********" name="pwd">
                </div>
                <div class="form-group">                    
                    <button type="submit" class="btn btn-success">Login</button>                    
                </div>
                <div><h3 style="color: RED;"><% if (request.getParameter("info") != null) {
                        out.println(request.getParameter("info"));
                    }%></h3></div>
            </form> 
        </div>        
    </body>
</html>
