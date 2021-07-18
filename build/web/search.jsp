
<%@page import="java.util.List"%>
<%@page import="com.farmer.open.discussion.entities.Reply"%>
<%@page import="com.farmer.open.discussion.entities.Query"%>
<%@page import="com.farmer.open.discussion.entities.User"%>
<%@page import="com.farmer.open.discussion.dao.UserDao"%>
<%@page import="com.farmer.open.discussion.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <title>search Page</title>
    </head>
    <body>

        <%
            Reply searchSession = (Reply) session.getAttribute("search-msg");
            if (searchSession != null) {%>
        <div class="container mt-5 p-3">
            <div class="row">
                <div class="col-md-12">
                    <div style="text-align: center; color: green"><h1>Here is Your Answer</h1></div>
                    <div class="card">
                        <div class="card-body">
                            <table>
                                <tbody>
                                    <tr>
                                        <td><h3>Q. <%=searchSession.getQuestion()%></h3></td>
                                    </tr>
                                    <tr>
                                        <td><b style="color: green; font-size: 20px">Answer: </b><p style="font-size: 20px"><%=searchSession.getResponse()%></p></td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="bg-primary text-center mt-4">
                        <h2>Related Question </h2>
                    </div>
                    <div class="mt-2">
                        <%
                            UserDao dao1 = new UserDao(ConnectionProvider.getConnection());
                            List<Query> qlist = dao1.list();
                            for (Query query : qlist) {%>

                        <div style="background-color: lightgray; padding: 5px;">
                            <a href="GetAnswerServlet?id=<%=query.getId()%>"><b><%=query.getQuestion()%></b></a> 
                            <br>
                        </div>
                        <%
                            }
                        %>
                    </div>

                </div>
            </div>
        </div>

        <%} else {%>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div style="height: 100px; width: 100%; background-color: lavender; align-content:">
                        <h3 style=" text-align: center;" class="mt-2">Can't find your search or Query</h3>
                    </div>
                    <div>
                        <h4 class="bg-primary text-light text-center mt-2">See related Query</h4>
                    </div>
                    <%
                        UserDao dao = new UserDao(ConnectionProvider.getConnection());
                        List<Query> query = dao.list();
                        for (Query q : query) {%>
                    <div>
                        <table>
                            <tr>
                                <td><a href="GetAnswerServlet?id=<%=q.getId()%>"><b><%=q.getQuestion()%></b></a></td>
                            <br>
                            </tr>
                        </table>
                    </div>

                    <%}%>
                </div>

            </div>
        </div>

        <%  }
            session.removeAttribute("search-msg");
        %>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
