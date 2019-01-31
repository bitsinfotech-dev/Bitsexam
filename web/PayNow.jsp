<%-- 
    Document   : PayNow
    Created on : 19 Dec, 2018, 2:12:16 PM
    Author     : SWATI DHANDE
--%>

<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="HelpingClasses.PayU"%>
<%@page import="DAO.SubjectOperation"%>
<%@page import="java.util.List"%>
<%@page import="DAO.StudentOperation"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="Bean.Subject"%>
<%@page import="Bean.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="CommonThings/BTCDN.jsp" %>
    </head>
    <body>
        <%
            if (session.getAttribute("LogedIn") != null) {
                if (session.getAttribute("type").toString().equals("student")) {
                    Student st = (Student) session.getAttribute("LogedIn");

        %>  
        <%!
            public boolean empty(String s) {
                if (s == null || s.trim().equals("")) {
                    return true;
                } else {
                    return false;
                }
            }
        %>
        <%!
            public String hashCal(String type, String str) {
                byte[] hashseq = str.getBytes();
                StringBuffer hexString = new StringBuffer();
                try {
                    MessageDigest algorithm = MessageDigest.getInstance(type);
                    algorithm.reset();
                    algorithm.update(hashseq);
                    byte messageDigest[] = algorithm.digest();

                    for (int i = 0; i < messageDigest.length; i++) {
                        String hex = Integer.toHexString(0xFF & messageDigest[i]);
                        if (hex.length() == 1) {
                            hexString.append("0");
                        }
                        hexString.append(hex);
                    }

                } catch (NoSuchAlgorithmException nsae) {
                }

                return hexString.toString();
            }
        %>
        <%    String merchant_key = "gtKFFx";
            String salt = "eCwWELxi";
            String action1 = "";
            String base_url = "https://test.payu.in";
            int error = 0;
            String hashString = "";

            Enumeration paramNames = request.getParameterNames();
            Map<String, String> params = new HashMap<String, String>();
            while (paramNames.hasMoreElements()) {
                String paramName = (String) paramNames.nextElement();
                String paramValue = request.getParameter(paramName);
                params.put(paramName, paramValue);
            }
            String txnid = "";
            if (empty(params.get("txnid"))) {
                Random rand = new Random();
                String rndm = Integer.toString(rand.nextInt()) + (System.currentTimeMillis() / 1000L);
                txnid = hashCal("SHA-256", rndm).substring(0, 20);
            } else {
                txnid = params.get("txnid");
            }
            String hash = "";
            String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
            if (empty(params.get("hash")) && params.size() > 0) {
                if (empty(params.get("key"))
                        || empty(params.get("txnid"))
                        || empty(params.get("firstname"))
                        || empty(params.get("amount"))
                        || empty(params.get("productinfo"))
                        || empty(params.get("email"))
                        || empty(params.get("phone"))
                        || empty(params.get("surl"))
                        || empty(params.get("furl"))) {
                    error = 1;
                } else {
                    String[] hashVarSeq = hashSequence.split("\\|");
                    for (String part : hashVarSeq) {
                        hashString = (empty(params.get(part))) ? hashString.concat("") : hashString.concat(params.get(part));
                        hashString = hashString.concat("|");
                    }
                    hashString = hashString.concat(salt);

                    hash = hashCal("SHA-512", hashString);
                    action1 = base_url.concat("/_payment");
                }
            } else if (!empty(params.get("hash"))) {
                hash = params.get("hash");
                action1 = base_url.concat("/_payment");
            }

        %>

        <div class="container">            
            <form class="form-horizontal" method="post" action="<%= action1%>">
                <input type="hidden" name="key" value="<%=merchant_key%>" />
                <input type="hidden" name="hash" value="<%= hash%>"/>
                <input type="hidden" name="txnid" value="<%= txnid%>" />
                <div class="form-group">
                    <label class="control-label col-sm-2" for="name">Name:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="subject"  name="firstname" value="<%=empty(params.get("name")) ? "" : params.get("name")%>" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="contact">Contact Number:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="contact"  name="phone" value="<%=empty(params.get("contact")) ? "" : params.get("contact")%>" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="email">Email:</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" id="email"  name="email" value="<%=empty(params.get("email")) ? "" : params.get("email")%>" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="subject">Subject:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="subject"  name="productinfo" value="<%=empty(params.get("subject")) ? "" : params.get("subject")%>" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="fees">Fees:</label>
                    <div class="col-sm-10">          
                        <input type="text" class="form-control" id="fees" name="amount" value="<%=empty(params.get("amount")) ? "" : params.get("amount")%>" readonly>
                    </div>
                </div>                                 
                <div class="form-group">
                    <label class="control-label col-sm-2" for="fees">Success URI:</label>
                    <div class="col-sm-10">          
                        <input type="text" class="form-control" id="fees" name="surl" value="http://bitsinfotec.in" size="64" readonly>
                    </div>
                </div>   
                <div class="form-group">
                    <label class="control-label col-sm-2" for="fees">Failure URI:</label>
                    <div class="col-sm-10">          
                        <input type="text" class="form-control" id="fees" name="furl" value="http://bitsinfotec.in" size="64" readonly>
                    </div>
                </div>    
                <div class="form-group">        
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">PAY NOW</button>
                    </div>                    
                </div>                    

            </form>            
        </div> 
        <%
                }
            } else {
                out.println("<a href='UserLogin.jsp'><h1>Login here</h1></a>");
            }
        %>
    </body>
</html>
