<%-- 
    Document   : Fees
    Created on : Nov 8, 2018, 4:52:19 PM
    Author     : Alok Panday
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="Bean.Fees"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="CommonThings/BTCDN.jsp" %>

        <style>
            <%@include file="CommonThings/bootstrapHeaderCss.css" %>
            <%@include file="Css/UserProfile.css"%>
            
            .feesmain ul a{
                text-decoration: none;
                color:white;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <%@include file="CommonThings/bootstrapHeader.jsp" %>
        <div class="container feesmain">
            <ul class="nav nav-tabs" style="margin-top: 70px;">
                <li class="active"><a data-toggle="tab" href="#home">Overview</a></li>
                <li><a data-toggle="tab" href="#menu1">Fees Detail</a></li>
                <li><a data-toggle="tab" href="#menu2">All subject</a></li>
            </ul>
            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
                    <h3>Summary</h3>
                    <p>Some content.</p>
                </div>
                <div id="menu1" class="tab-pane fade">
                    <h3>Fees detail</h3>
                    <div class="container">                        
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Subject</th>
                                    <th>Fees</th>      
                                    <th>Pay Now</th>
                                </tr>
                            </thead>
                            <%                                if (session.getAttribute("LogedIn") != null) {
                                    if (session.getAttribute("type").toString().equals("student")) {
                                        Student st = (Student) session.getAttribute("LogedIn");
                                        String subjects="";
                                        Subject subject = new Subject();
                                        if (st != null) {
                                            Set set = st.getSubjectList();
                                            Iterator lit = set.iterator();
                                            System.err.println(set.size() + "------------------------------------");
                                            int totalprice = 0;
                                            while (lit.hasNext()) {
                                                subject = (Subject) lit.next();
                                                totalprice += subject.getSub_fees();
                                                subjects+=subject.getSub_name()+",";
                            %>
                            <tbody>
                                <tr>
                                    <td><%=subject.getSub_name()%></td>
                                    <td><%=subject.getSub_fees()%></td>  
                                    <td><a href="PayNow.jsp?name=<%=st.getName()%>&contact=<%=st.getContact()%>&email=<%=st.getEmail()%>&subject=<%=subject.getSub_name()%>&amount=<%=subject.getSub_fees()%>">Pay Now</a></td>
                                </tr> 
                            </tbody>
                            <%
                                }
                            %>
                            <tfoot>
                                <tr>
                                    <td>Total Subjects:<%=st.getSubjectList().size()%></td>
                                    <td>Total Fees:<%=totalprice%></td>
                                    <td><a href="PayNow.jsp?name=<%=st.getName()%>&contact=<%=st.getContact()%>&email=<%=st.getEmail()%>&subject=<%=subjects%>&amount=<%=totalprice%>">Pay Now</a></td>
                                </tr>                            
                            </tfoot>
                            <%        }
                                }
                            } else {
                                out.print("there is no data in the list");
                            %>

                            <a href="UserLogin.jsp">First login here to see the data</a>
                            <%
                                }
                            %>                            
                        </table>
                    </div>
                </div>
                <div id="menu2" class="tab-pane fade">
                    <h3>All subject</h3>
                    <div class="container">                        
                        <table class="table table-bordered">
                            <thead>
                                <tr>          
                                    <th>Subject</th>
                                    <th>Sub_max_marks</th>
                                    <th>Sub_passing_Marks</th>
                                    <th>Sub_total_questions</th>
                                    <th>Sub_duration</th>
                                    <th>Fees</th>  
                                    <th>Sub_offer</th>                                    
                                </tr>
                            </thead>
                            <%
                                if (session.getAttribute("LogedIn") != null) {
                                    if (session.getAttribute("type").toString().equals("student")) {
                                        Student s = (Student) session.getAttribute("LogedIn");
                                        Set set = s.getSubjectList();
                                        Iterator lit = set.iterator();
                                        while (lit.hasNext()) {
                                            Subject subject = (Subject) lit.next();
                            %>
                            <tbody>
                                <tr>
                                    <td><%=subject.getSub_name()%></td>
                                    <td><%=subject.getSub_max_marks()%></td>
                                    <td><%=subject.getSub_passing_Marks()%></td>
                                    <td><%=subject.getSub_total_questions()%></td>
                                    <td><%=subject.getSub_duration()%></td>
                                    <td><%=subject.getSub_fees()%></td>    
                                    <td><%=subject.getSub_offer()%></td>                                    
                                </tr>                                
                            </tbody>
                            <%
                                    }
                                }
                            } else {
                                out.print("there is no data in the list");
                            %>
                            <a href="UserLogin.jsp">First login here to see the data</a>
                            <%
                                }
                            %>
                        </table>                    
                    </div>
                </div>
            </div>
    </body>
</html>
