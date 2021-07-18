<%-- 
    Document   : view_response
    Created on : May 27, 2021, 4:56:01 PM
    Author     : PANDIT
--%>

<%@page import="com.farmer.open.discussion.dao.ReplyDao"%>
<%@page import="com.farmer.open.discussion.dao.QueryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.farmer.open.discussion.entities.Reply"%>
<%@page import="com.farmer.open.discussion.entities.Query"%>
<%@page import="com.farmer.open.discussion.dao.UserDao"%>
<%@page import="com.farmer.open.discussion.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="css/admincss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>

        <%@include file="nav_bar.jsp" %>



        <div class="row mt-2">
            <div class="col-md-3">
                <%
                    QueryDao qdao = new QueryDao(ConnectionProvider.getConnection());
                    List<Query> randq = qdao.getQuestionRandomly();
                    for (Query rq : randq) {%>
                <div style="margin-left: 30px; margin-top: 5px;"><a href="GetAnswerServlet?id=<%=rq.getId()%>"><%=rq.getQuestion()%></a></div>  
                    <%}
                    %>
            </div>
            <div class="col-md-7">

                <%!
                    String qu;
                %>
                <%
                    //ReplyDao rdao = new ReplyDao(ConnectionProvider.getConnection());
                    List<Reply> rp = (List<Reply>) session.getAttribute("reply-msg");

                    for (Reply rq : rp)
                        qu = rq.getQuestion();
                %>
                <div class="container" style="text-align: center; font-weight: bold">
                    <div><h3>Q. <%=qu%></h3></div>
                </div>
                <%
                    for (Reply r : rp) {%>

                <div class="card">
                    <!--<div class="card-header" id="headingOne">
                        <span style="color: green">Posted By: </span> 
                    </div>-->
                    <div class="card-body">
                        <h5 class="card-title"> Answer by:<span style="color:green; font-size: 14px"><%=r.getEmail()%></span></h5>
                        <p class="more"><%=r.getResponse()%></p>
                        <br>
                        <p><a href="" style="color: blue">comment</a></p>
                    </div>
                </div>
                <br>
                <%
                    }
                %>
                <br>
                <br>
                <div class="container bg-primary"><h3 style="text-align: center; color: white">You can also view this question </h3></div>

                <%
                    QueryDao dao = new QueryDao(ConnectionProvider.getConnection());
                    List<Query> query = dao.list();

                    for (Query q : query) {%>
                <div class="container">
                    <div class="row">
                        <div><a href="GetAnswerServlet?id=<%=q.getId()%>"><%=q.getQuestion()%></a></div>
                    </div>
                </div>
                <%  }
                %>
            </div>
            <div class="col-md-2">
                <p>show question by follow category</p>
            </div>
        </div>

        <script src="js/lessmore.js" type="text/javascript"></script>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
