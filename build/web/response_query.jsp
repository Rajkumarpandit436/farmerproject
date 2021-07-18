<%@page import="com.farmer.open.discussion.entities.User"%>
<%@page import="com.farmer.open.discussion.entities.Query"%>
<%@page import="com.farmer.open.discussion.dao.UserDao"%>
<%@page import="com.farmer.open.discussion.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("loginmsg");
    if (user == null) {
        session.setAttribute("responselogin", "please login first to reply about query");
        response.sendRedirect("Login.jsp");
    } else {%>



<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/admincss.css" rel="stylesheet" type="text/css"/>

        <title>query response</title>
    </head>
    <body>

        <%@include file="nav_bar.jsp"%>
        <%

            int id = Integer.parseInt(request.getParameter("id"));
            String q = request.getParameter("question");
            String cat = request.getParameter("category");
        %>


        <!--dgdfsrhdfhdfh-->

        <div class="container mt-5">
            <div class="row">
                <div class="col-md-12">

                    <div class="card">
                        <div class="card-header" style="text-align: center; background-color: #a1887f ;">
                            <h3>Give Your Reply</h3>
                        </div>
                        <div class="card-body">
                            <form action="ReplyServlet" method="post" enctype="multipart/form-data">

                                <input type="hidden" name="id" value="<%=id%>">
                                <input type="hidden" name="cat" id="category" value="<%=cat%>">
                                <input type="hidden" name="quest" id="reply_quest" value="<%=q%>">


                                <div class="form-group ">
                                    <label for="text"><b><h5>question</h5></b></label>
                                    <input type="text" class="form-control" value="<%=q%>" disabled>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" value="<%=user.getEmail_address()%>" readonly="">
                                </div>

                                <div class="form-group ">
                                    <label for="comment"><b><h5>Reply</h5></b></label>
                                    <textarea class="form-control" rows="4" id="comment" name="response"></textarea>
                                </div>
                                <div class="container" style="text-align: center">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>
                        </div>

                    </div>

                </div>

            </div>

        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>

<%  }
%>
