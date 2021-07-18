<%-- 
    Document   : editNotes
    Created on : Jun 15, 2021, 2:19:23 PM
    Author     : PANDIT
--%>

<%@page import="com.farmer.open.discussion.entities.Enotes"%>
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

        <title>EditNotes</title>
    </head>
    <body>
        <div class="row">
            <div class="col-lg-12">
                <div class="container mt-5">
                    <%
                        int editid = Integer.parseInt(request.getParameter("id"));
                        EnotesDao dao = new EnotesDao((Connection) ConnectionProvider.getConnection());
                        Enotes note = dao.getNotesById(editid);
                    %>
                    <form class="form-group" action="../UpdateNotes" method="post">
                        <div>
                            <input type="hidden" name="editnotesid" id="id" value="<%=editid%>">
                        </div>
                        <div>
                            <label><b><p>Enter the notes title</p></b></label>
                            <input type="text" class="form-control" name="editnotestitle" id="notestitle" value="<%=note.getTitle()%>">
                        </div>
                        <br>
                        <div>
                            <label><b><p>Enter the title description</p></b></label>
                            <textarea class="form-control" rows="10" cols="12" name="editnotesdesc" id="notesdesc"><%=note.getDesc()%></textarea>
                        </div>
                        <div class="text-center mt-3">
                            <button type="submit" class="btn btn-primary">Save Edit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
