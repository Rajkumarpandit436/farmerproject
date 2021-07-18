<%-- 
    Document   : edit
    Created on : May 17, 2021, 9:25:23 PM
    Author     : PANDIT
--%>

<%@page import="com.farmer.open.discussion.entities.User"%>
<%@page import="com.farmer.open.discussion.dao.UserDao"%>
<%@page import="com.farmer.open.discussion.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            Integer idno = (Integer.parseInt(request.getParameter("id")));
            String ut=request.getParameter("user_type");
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            User user = dao.SelectUserById(idno);
        %>

        <script src="js/validation.js" type="text/javascript"></script>
        <main>
            <div class="container mt-3">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header bg-primary text-light">
                            <h3 style="text-align: center">Edit Here</h3>
                        </div>
                        <div class="card-body">
                            <form name="myform" action="../UpdateUserServlet" method="post" >
                                <input type="hidden" name="id" value="<%=idno%>">
                                <input type="hidden" name="ut" value="<%=ut%>">
                                <div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputName">User Name</label>
                                    <input type="text" class="form-control" id="exampleInputName" name="name" value="<%=user.getUser_name()%>" >
                                </div>
                                <div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputContact"> Contact No </label>
                                    <input type="text" class="form-control" id="exampleInputContact" name="contact" value="<%=user.getUser_contact()%>">
                                </div>
                                <div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" value="<%=user.getEmail_address()%>" >
                                </div>
                                <div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="text" class="form-control" id="exampleInputPassword1" name="password" value="<%=user.getPassword()%>"  >
                                </div>
                                <div class="border border-light p-3 mb-4 text-center">
                                    <button type="submit" class="btn btn-primary">Update</button>
                                </div>
                            </form>
                        </div>

                    </div>

                </div>

            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>

