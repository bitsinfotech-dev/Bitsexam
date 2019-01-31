<%@page import="Bean.Subject"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.SubjectOperation"%>
<%@page import="DAO.SubjectDeclaration"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BITS Infotec About Us</title>        
        <%@include file="CommonThings/BTCDN.jsp" %>
        <style>
            <%@include file="CommonThings/bootstrapHeaderCss.css" %>
            .product-container{
                background-image: url(img/BG/HomeBackground.jpg);
                background-position: center;
                background-attachment: fixed;
                background-size: cover;
                height: 100vh;
                box-shadow: inset -50px 50px 100px white;
                background-repeat: no-repeat;
                /*background-color: rgba(1,255,1,.7);*/
            }
            .layer{
                height: 100vh;
                position: absolute;
                background-color: rgba(1,1,1,.7);
                box-shadow: inset 1px 1px 1000px rgba(255,255,255,.6);
                box-decoration-break: slice;

                min-width: 100%;

            }
            .layer .title{
                margin: 0px auto;
                margin-top:10%;
                color: white;
                text-align: center;
                word-wrap: break-word;
                text-transform: uppercase;
            }
            @media (max-width: 768px) {
                .title{
                    position: relative;
                    top:20%;
                    font-size: 35px;
                }
                .subtitle{
                    position: relative;
                    top:15%;
                    font-size: 30px;
                    display: none;
                }
                .title::after{
                    display: block;
                    font-size: 15px;
                    padding-top: 5px;
                    content: 'Developing IT career and software products in BITS';
                }


            }
            .layer .subtitle{
                position: relative;
                margin: 0px auto;
                padding: 30px  10% 0px 10%; 
                color: white;
                font-size: 45px;
                text-align: center;

                word-wrap: break-word;

            }

            .members-container{
                /*background-image: linear-gradient(to bottom, rgba(1, 1, 1, 0.5) 50%, rgba(125, 185, 232, 0) 50%);*/
            }
            .member-cards img{
                border: thick orange solid;
                margin-left: 23%;
                height: 200px;
                width: 200px;
                background-image: url(Image/person-flat.png);
                background-position: center;
                border-radius: 100px;
                transition: 0.5s;
            }
            .member-cards img:hover{
                transition: 0.5s;
                border: none;
                transform: scale(1.2);
            }

            .member-cards .cover{
                box-shadow: 1px 1px 50px black;
                margin:5px 10px 5px 10px;
                padding:5px 10px 5px 10px;

                background-image : url("Image/Smoke-on-Carbon-Pattern-Wallpaper.jpg");
                background-size: 100%;
                border-radius:5px;
                color: white;
            }
            .cardcontainer .lang-card{
                /*height: 400px;*/ 
                width: 300px;
                box-shadow: 1px 1px 8px grey,-1px -1px 8px grey;
                text-align: center;
                font-size: 20px;
                line-height: 30px;
            }
            .cardcontainer{
                position: relative;
            }
            .cardcontainer .lang-card{
                position: relative;
                float: left;
                margin: 2% 0px 0px 2%;

            }
            .cardcontainer .lang-card img{
                width: 100%;
                height: 200px;

            }
            .cardcontainer .lang-card .imgtext{
                word-wrap: break-word;
                overflow: hidden;
                padding:2px 10px 2px 10px; 
            }
        </style>
    </head>
    <body>
        <%@include file="CommonThings/bootstrapHeader.jsp" %>
        <div class="product-container">
            <div class="layer">
                <h1 class="title"><span style="color: orange;">BITS-</span>INFOTEC<br><small style="color: white; font-size: 30px;">Exams and certificate</small></h1>
                <div class="subtitle">
                    Here, in this page you can check yourself by giving exams and you can get certificates by registering as a student.
                </div>
            </div>  

        </div>
        <div class="cardcontainer">
            <%                SubjectDeclaration subimpl = new SubjectOperation();
            if(subimpl.selectAllSubjects()!=null){            
                List li = subimpl.selectAllSubjects();
                ListIterator lit = li.listIterator();
                while (lit.hasNext()) {
                    Subject sub = (Subject) lit.next();

            %>
            <div class="lang-card">
                <img src="img/BG/HomeBackground.jpg" class="cardimg">
                <div class="imgtext">
                    <%="<strong>Subject name: </strong>" + sub.getSub_name() + "<br>"%>
                    <%="<strong>Total question:</strong> " + sub.getSub_total_questions() + "<br>"%>
                    <%="<strong>Total Duration:</strong> " + sub.getSub_duration() + "<br>"%>
                    <%="<strong>Maximum Marks:</strong> " + sub.getSub_max_marks() + "<br>"%>
                    <%="<strong>Passing Marks: </strong>" + sub.getSub_passing_Marks() + "<br>"%>
                    <a class="btn btn-success" href="StudentRegistration.jsp"><strong>I want to learn</strong></a>
                    <a class="btn btn-success" href="Exam/ExamPhase2.jsp?subject=<%=sub.getSub_id()%>"><strong>Go for Exam</strong></a>
                </div>
            </div>
            <%}}

            %>
        </div>
    </body>
</html>
