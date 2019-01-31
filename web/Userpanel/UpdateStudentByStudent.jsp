<%-- 
    Document   : UpudateJsp
    Created on : Jan 22, 2018, 12:39:35 PM
    Author     : Alok Panday
--%>

<%@page import="java.util.HashSet"%>
<%@page import="java.util.Enumeration"%>
<%@page import="Bean.Subject"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.SubjectOperation"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="Bean.Student"%>
<%@page import="DAO.StudentOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    long id;
    StudentOperation st = new StudentOperation();
    Student student;
    Subject sub;
%>
<%
    if (session.getAttribute("LogedIn") != null) {
        student = (Student) session.getAttribute("LogedIn");
        if (student != null) {

%>

<div class="container">
    <div class="row">
        <div class="col-sm-5">
            <h2>Student update form</h2>
            <form action="FinalUpdate" method="post" enctype="multipart/form-data">
                <input type="hidden" value="<%= student.getS_id()%>" name="id">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" value="<%= student.getName()%>" id="name" placeholder="Enter your name" name="name">
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" class="form-control" value="<%= student.getAddress()%>" id="address" placeholder="Enter your address" name="address">
                </div>
                <div class="form-group">
                    <label for="contact">contact:</label>
                    <input type="text" class="form-control" id="contact" value="<%= student.getContact()%>" placeholder="Enter your contct number" name="contact">
                </div>                        
                <div class="form-group">
                    <label for="course">Course</label>
                    <input type="text" class="form-control" id="course" value="<%= student.getCourse()%>" placeholder="Enter course" name="course">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" value="<%= student.getEmail()%>" placeholder="Enter email" name="email">
                </div>
                <div class="form-group">
                    <label>User Profile Pic </label><img src="img/Profile/<%=student.getImage()%>" width="150" height="150">
                    <input type="file" class="form-control" id="img" placeholder="Select your profile picture" name="image" value=" <%=student.getImage()%>">
                </div>
                <div class="form-group">
                    <label for="username">username:</label>
                    <input type="text"  value="<%= student.getUsername()%>" class="form-control" id="username" placeholder="Enter username" name="username">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" value="" class="form-control" id="pwd" placeholder="Enter password" name="pass">
                </div>

                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <%}
                } else {
                    out.print("Select any record cause ID is null");
                }
            %>
        </div>
        <div class="col-sm-6">
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">

                        <h3 for="fees">Taken by student</h3>
                        <ul>
                            <form action="../../RemoveSubjectFromStudent" method="get">
                                <%
                                    Student student2 = student;
                                    Set s = student2.getSubjectList();
                                    Iterator ite = s.iterator();
                                    int i = 0;
                                    while (ite.hasNext()) {
                                        i++;
                                        Subject sub2 = (Subject) ite.next();

                                %>
                                <li class="list-group-item">
                                    <input type="checkbox" name="<%= sub2.getSub_name()%>" value="<%=sub2.getSub_id()%>">&nbsp;&nbsp;&nbsp;&nbsp;<%=sub2.getSub_name()%>     
                                </li>
                                <%
                                    }
                                %>
                                <input type="hidden" name="id" value="<%=id%>">
                                <button type="submit" name="removesub" class="btn btn-block btn-success" value="Add"> Remove subject from student</button>
                            </form>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6">
                    <span><h3>All Available subjects:</h3></span>
                    <ul class="list-group">
                        <form action="../../AddSubjectControll">
                            <%                                SubjectOperation subo = new SubjectOperation();
                                List li = subo.selectAllSubjects();
                                ListIterator lit = li.listIterator();
                                while (lit.hasNext()) {
                                    sub = (Subject) lit.next();

                            %>
                            <li class="list-group-item">

                                <input type="checkbox" name="<%= sub.getSub_name()%>" value="<%= sub.getSub_id()%>">&nbsp;&nbsp;&nbsp;&nbsp;<%= sub.getSub_name()%>
                            </li>

                            <%
                                }
                            %>
                            <input type="hidden" name="id" value="<%=id%>">
                            <button type="submit" name="addsub" class="btn btn-block btn-success" value="Add"> Add subject to student</button>
                        </form>

                    </ul>
                </div>
            </div>
        </div>
        <div class="col-sm-1"></div>
    </div>
</div>