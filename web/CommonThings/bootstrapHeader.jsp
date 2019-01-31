<%@page import="Bean.Teacher"%>
<%@page import="Bean.Admin"%>
<%@page import="Bean.Subject"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.SubjectOperation"%>
<%@page import="DAO.SubjectDeclaration"%>
<%@page import="Bean.Student"%>
<header class="row">
    <div class="col-sm-2">

    </div>
    <div class="col-sm-10">
        <nav class="navbar navbar-fixed-top">
            <div class="navbar-header">
                <a href="http://bitsinfotec.in/"> 
                    <img class="img-responsive" src="img/Logo/BITSinverseforblackbg..png"
                         width="80"
                         alt="sample logo"
                         >
                </a>

                <button class="navbar-toggle" data-toggle="collapse" data-target="#mynav">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

            </div>
            <div class="collapse navbar-collapse" id="mynav">
                <ul class="nav navbar-nav navbar-right" style="margin-right: 50px;">

                    <li>
                        <a href="Home">Home</a>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Exams and Certifications<i class="caret"></i>
                        </a>
                        <ul id="dropdown" class="dropdown-menu">
                            <%
                                SubjectDeclaration sd1 = new SubjectOperation();
                                if (sd1.selectAllSubjects() != null) {
                                    List li1 = sd1.selectAllSubjects();
                                    ListIterator lit1 = li1.listIterator();
                                    while (lit1.hasNext()) {
                                        Subject sub1 = (Subject) lit1.next();
                            %>
                            <li><a href="Exam/ExamPhase2.jsp?subject=<%= sub1.getSub_id()%>"><%= sub1.getSub_name()%></a></li>

                            <%
                                    }
                                }
                            %>
                        </ul>
                    </li> 
                    <!--                    <li>
                                            <a href="#!" class="dropdown-toggle" data-toggle="dropdown">IT Training & Skill development <i class="caret"></i>
                                            </a>
                                            <ul id="dropdown2" class="dropdown-menu">
                                                <li><a href="Courses/Degree.jsp">Degree Courses and Classes</a></li>
                                                <li><a href="Courses/Programming.jsp">Certification Courses</a></li>
                                                <li><a href="CollegeProject.jsp">College Project</a> <div class="divider"></div></li>
                                                <li><a href="#">Our Students</a></li>
                                                <li><a href="JavaTreeMain/web/JavaTreePoint_home.jsp">Free training</a></li>
                    
                                            </ul>
                                        </li>-->
                    <li>
                        <a class="dropdown-toggle" href="#" data-toggle="dropdown">Register As <i class="caret"></i>
                        </a>
                        <ul id="dropdown3" class="dropdown-menu">
                            <li><a href="../TeacherRegister.jsp">As a client</a></li>
                            <!--<li><a href="MemberShipContoller/MemberShipForm.jsp">As a Member</a></li>-->
                            <li><a href="StudentRegistration.jsp">As a Student</a></li>
                            <!--<li><a href="EnquiryInClass.jsp">As a Offline Student</a></li>-->
                        </ul>
                    </li>
                    <li>
                        <a href="http://bitsinfotec.in/ContactUs.jsp">Contact us</a>
                    </li>
                    <li class="dropdown">                        
                        <%
                            if (session.getAttribute("LogedIn") != null) {
                                if (session.getAttribute("type").toString().equals("student")) {
                                    Student s = (Student) session.getAttribute("LogedIn");
                        %>
                        <a class="nav-link dropdown-toggle" href="../UserLstudentogin.jsp" data-toggle="dropdown" style="color: white;">
                            <%=s.getName().toUpperCase()%>                             
                        </a>
                        <div class="dropdown-menu dropdown-content">
                            <a class="dropdown-item" href="UserProfile.jsp">User Profile</a>
                            <a class="dropdown-item" href="Logout">Logout</a>                                                                
                        </div>
                        <%
                        } else if (session.getAttribute("type").toString().equals("admin")) {
                            Admin a = (Admin) session.getAttribute("LogedIn");
                        %>
                        <a class="nav-link dropdown-toggle" href="../AdminPanel/AdminLogin.jsp" data-toggle="dropdown" style="color: white;">
                            <%=a.getName().toUpperCase()%>                             
                        </a>
                        <div class="dropdown-menu dropdown-content">
                            <a class="dropdown-item" href="Logout">Logout</a>
                            <a class="dropdown-item" href="AdminPanel/AdminPage.jsp">Only For Admin</a>                            
                        </div>
                        <%
                        } else if (session.getAttribute("type").toString().equals("teacher")) {
                            Teacher t = (Teacher) session.getAttribute("LogedIn");
                        %>
                        <a class="nav-link dropdown-toggle" href="../TeacherLogin.jsp" data-toggle="dropdown" style="color: white;">
                            <%=t.getName().toUpperCase()%>                             
                        </a>
                        <div class="dropdown-menu dropdown-content">
                            <a class="dropdown-item" href="TeacherPanel/TeacherShowAllStudents.jsp">Students Profile</a>                              
                            <a class="dropdown-item" href="Logout">Logout</a>                            
                        </div>
                        <%
                            }
                        } else {
                        %>
                        <a class="nav-link" href="UserLogin.jsp" style="color: white;background-color: gray"><i class="fa fa-sign-in" aria-hidden="true"></i>
                            Login</a>
                            <%
                                }
                            %>
                    </li>                                   
                    <li>
                        <a class="dropdown-toggle" href="#" data-toggle="dropdown">More<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="http://bitsinfotec.in/AboutUs.jsp">About us</a></li>
                            <li><a href="Gallary.jsp">Gallery</a></li>
                            <li><a href="OurClients.jsp">Our Clients and Projects</a></li>
                            <li><a href="OurStudents.jsp">Our Students</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>

