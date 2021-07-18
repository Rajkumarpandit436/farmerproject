<%-- 
    Document   : showNotes
    Created on : Jun 13, 2021, 2:47:23 PM
    Author     : PANDIT
--%>


<%@page import="java.util.List"%>
<%@page import="com.farmer.open.discussion.entities.Enotes"%>
<%@page import="com.farmer.open.discussion.entities.User"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.farmer.open.discussion.dao.EnotesDao"%>
<%@page import="com.farmer.open.discussion.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link href="../css/enotes_nav.css" rel="stylesheet" type="text/css"/>
        <title>show Notes</title>
    </head>
    <body>
        <%
            User u = (User) session.getAttribute("loginmsg");
            //int id = Integer.parseInt(request.getParameter("id"));

            int uid = u.getId();
        %>
        <!--Start of nav-->
        <section class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar-light bg-custom">
                <a class="navbar-brand text-success text-bold" href="#">Enote</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="takeNote.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>

                        <!--<li class="nav-item active">
                                                    <a class="nav-link " href="">show notes</a>
                                                </li>-->

                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link"  href="../index.jsp" ><button class="btn btn-success">goto main portal</button><span class="sr-only">(current)</span></a>

                        </li>

                    </ul>

                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
            </nav>
        </section>
        <!--End of nav-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-12">
                    <%
                        String sucmsg = (String) session.getAttribute("editSuc");
                        if (sucmsg != null) {%>
                    <div class="text-success text-centert" style="background-color: lavender"><p><b><%=sucmsg%></b></p></div>
                                <%}
                                    session.removeAttribute("editSuc");
                                    String errormsg = (String) session.getAttribute("editError");
                                    if (errormsg != null) {%>
                    <div class="text-danger text-centert" style="background-color: lavender"><p><b><%=errormsg%></b></p></div>
                                <%}
                                    session.removeAttribute("editError");
                                %>

                    <%
                        String enotedelete_suc = (String) session.getAttribute("EnoteDelete");
                        if (enotedelete_suc != null) {%>
                    <div class="text-success text-center" style="background-color: lavender"><p><b><%=enotedelete_suc%></b></p></div>
                                <% }
                                    session.removeAttribute("EnoteDelete");
                                    String enotedeleteError = (String) session.getAttribute("EnoteDeleteError");
                                    if (enotedeleteError != null) {%>
                    <div class="text-center text-danger" style="background-color: lavender"><p><b><%=enotedeleteError%></b></p></div>
                                <%}
                                    session.removeAttribute("EnoteDeleteError");
                                %>

                    <%
                        EnotesDao dao = new EnotesDao((Connection) ConnectionProvider.getConnection());
                        List<Enotes> note = dao.getNotes(uid);
                        for (Enotes n : note) {%>
                    <div class="card">
                        <div class="card-body">
                            <div>
                                <table>
                                    <tr>
                                        <td><b>Q. <%=n.getTitle()%></b></td>
                                    <br>
                                    </tr>

                                    <tr>
                                        <td><span class="text-success"><b>Ans. </b></span><%=n.getDesc()%></td>
                                        <td class="ml-3"><a href="editNotes.jsp?id=<%=n.getId()%>"><button type="submit" class="btn btn-primary">Edit</button></a></td>
                                        <td><a href="../deleteEnotes?id=<%=n.getId()%>"><button type="submit" class="btn btn-danger">delete</button></a></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <%}
                    %>

                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    </body>
</html>
