<%-- 
    Document   : AboutUs
    Created on : 26 Sep, 2018, 9:55:29 AM
    Author     : SWATI DHANDE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <style>
            .first{
                background-image: url(img/BG/back.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                height : 700px;
                width: auto;                
            }
            .tag{
                font-family: 'Lobster', cursive;
                font-size:30px;
                color: white;
                letter-spacing: 2px;
                word-spacing: 6px;
                margin-left: 600px;
            }
            .guests
            {
                background-image:url(img/BG/back2.png); 
                background-size: cover;
                background-repeat: no-repeat;
            }
            .car
            {
                margin-top: 80px; 
                background-color: transparent;
            }
            .car a
            {
                background-color: rgba(255,255,255,.1);
            }
            .item1
            {
                padding: 30px;
                color: white;
                letter-spacing: 1px;
                word-spacing: 6px;  
            }
            /*            .second{
                            background-image:  url(img/BG/back3.jpg);
                            background-repeat: no-repeat;
                            background-size: cover;
                            height : 700px;                              
                        }
                        .gp img
                        {                
                            height:500px; 
                            width:100%;
                            margin-bottom: 50px;
                        }*/
            p{
                color: black;
            }
        </style>
    </head>
    <body>       
        <div class="first container-fluid">     
            <div class="row">
                <div class="col-sm-10 tag">
                    Start where you are. Use what you have.<br> 
                    Do what you can. 
                </div>
            </div>
        </div>
        <div class="guests container-fluid">
            <h2 style="color:white;">Guests Speaks</h2>
            <div class="row">
                <div class="gues col-sm-6">
                    <div id="myCarousel"  class="car carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="6"></li>
                            <li data-target="#myCarousel" data-slide-to="7"></li>
                            <li data-target="#myCarousel" data-slide-to="8"></li>
                            <li data-target="#myCarousel" data-slide-to="9"></li>
                            <li data-target="#myCarousel" data-slide-to="10"></li>
                        </ol>

                        <div class="carousel-inner">
                            <div class="item1 item active">
                                <p>
                                    Hello and welcome to ONLINE BEST SHOP, the place to find the best PRODUCTS CATEGORY  for every taste and 
                                    occasion. We thoroughly check the quality of our goods, working only with reliable suppliers so that you only receive the best quality product.                                
                                    We at ONLINE BEST SHOP believe in high quality and exceptional customer service. 
                                    But most importantly, we believe shopping is a right, not a luxury, so we strive to deliver the best products at the most affordable prices, 
                                    and ship them to you regardless of where you are located.
                                </p>                            
                            </div>

                            <div class="item1 item">
                                <p>
                                    We aim to offer our customers a variety of the latest PRODUCTS. 
                                    We’ve come a long way, so we know exactly which direction to take when supplying you with high quality yet budget friendly products. 
                                    We offer all of this while providing excellent customer service and friendly support.
                                    We always keep an eye on the latest trends in PRODUCTS  and put our customers’ wishes first. 
                                    That is why we have satisfied customers all over the world, and are thrilled to be a part of the PRODUCTS industry.
                                </p>                            
                            </div>

                            <div class="item1 item">
                                <p>
                                    The interests of our customers are always the top priority for us, 
                                    so we hope you will enjoy our products as much as we enjoy making them available to you.
                                    We are ONLINE BEST SHOP, a small but motivated company specializing in cloths,watches,bags,shoes,etc. 
                                    We believe passionately in great bargains and excellent service, which is why we commit ourselves to giving you the best of both.
                                </p>                            
                            </div>

                            <div class="item1 item">
                                <p>
                                    If you’re looking for something new, you’re in the right place. 
                                    We strive to be industrious and innovative, 
                                    offering our customers something they want, 
                                    putting their desires at the top of our priority list.
                                    At ONLINE BEST SHOP, our aim is to offer you cloths,watches,shoes,bags,etc. 
                                    that show you that we really care! Not only have we got the trendiest PRODUCTS, 
                                    but we can also guarantee that they are of the finest quality.
                                </p>
                            </div>

                            <div class="item1 item">
                                <p>
                                    We started as a small business in kalyan,india,2018, and 
                                    our aim is to continue providing our customers with products that keep them happy, at prices that keep them happy.  
                                    Our customers are our top priority and through our products 
                                    we work hard towards building long-lasting and meaningful relations with them. 
                                </p>                            

                            </div>

                            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                                <span class="glyhicon glyhicon-chevron-left"></span>
                                <span class="sr-only">Previous</span>
                            </a>

                            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                                <span class="glyhicon glyhicon-chevron-right"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<!--        <div class="second row">
            <div class="gp col-sm-6">
                <img src="img/BG/back1.jpg"  class="img-circle">
            </div>
        </div>        -->
    </body>
</html>
