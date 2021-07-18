
<%@page import="com.farmer.open.discussion.dao.QueryDao"%>
<%@page import="com.farmer.open.discussion.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.farmer.open.discussion.entities.Query"%>
<%@page import="com.farmer.open.discussion.entities.Query"%>
<%@page import="com.farmer.open.discussion.dao.UserDao"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.farmer.open.discussion.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link href="css/table.css" rel="stylesheet" type="text/css"/>
        <link href="css/admincss.css" rel="stylesheet" type="text/css"/>

        <title>JSP Page</title>
    </head>
    <body>

        <%@include file="nav_bar.jsp" %>
        <div>
            <%
                String replyMsg = (String) session.getAttribute("rep_msg");
                if (replyMsg != null) {
            %>

            <h4 style="text-align: center; color: green"><%=replyMsg%></h4>
            <%
                }
                session.removeAttribute("rep_msg");
                String Error_repMsg = (String) session.getAttribute("error_rep_msg");
                if (Error_repMsg != null) {%>
                <h4 style="text-align: center; color: red"><%=Error_repMsg%></h4>
            <%

                }
                session.removeAttribute("error_rep_msg");
            %>
        </div>
        <div class="container mt-5">
            <div class="table-responsive">          
                <table class="table" id="query">
                    <thead style="background-color: #a1887f;">
                        <tr>
                            <th>Question</th>
                            <th>published By</th>
                            <th>Reply</th>
                            <th>View response</th>
                        </tr>
                    </thead>
                    <tbody style="color:red">
                        <%
                            QueryDao dao = new QueryDao(ConnectionProvider.getConnection());
                            List<Query> qlist = dao.list();
                            for (Query q : qlist) {%>
                        <tr>
                            <td>
                                <%= q.getQuestion()%>
                            </td>
                            <td>
                                <%= q.getEmail()%>
                            </td>

                            <td><a href="response_query.jsp?question=<%=q.getQuestion()%>&id=<%=q.getId()%>&category=<%=q.getCategory()%>" class=""><button type="submit" class="btn btn-success">reply</button></a></td>
                            <td><a href="GetAnswerServlet?id=<%=q.getId()%>" class=""><button type="submit" class="btn btn-success">view answer</button></a></td>

                        </tr>
                        <%}
                        %>
                    </tbody>
                </table>
            </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>



