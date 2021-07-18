<%-- 
    Document   : query_by_reply
    Created on : Jun 29, 2021, 11:04:16 PM
    Author     : PANDIT
--%>

<%@page import="java.util.List"%>
<%@page import="com.farmer.open.discussion.entities.Query"%>
<%@page import="com.farmer.open.discussion.entities.Reply"%>
<%@page import="com.farmer.open.discussion.dao.ReplyDao"%>
<%@page import="com.farmer.open.discussion.dao.QueryDao"%>
<%@page import="com.farmer.open.discussion.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="css/table.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            //int q_id=id;
            QueryDao qdao = new QueryDao(ConnectionProvider.getConnection());
            ReplyDao rdao = new ReplyDao(ConnectionProvider.getConnection());
            Query qr = qdao.getQuestionById(id);
            //Reply r=rdao.getReplyByQid(id);

        %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <table class="table mt-5 p-3" id="query">
                        <thead>
                        <th>Question</th>
                        <th>reply</th>
                        </thead>
                        <tbody>
                        <td><%=qr.getQuestion()%></td>
                       
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
