

<%@page import="com.farmer.open.discussion.entities.SoilDetails"%>
<%@page import="com.farmer.open.discussion.dao.SoilDetailsDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="../css/admincss.css" rel="stylesheet" type="text/css"/>

        <title>JSP Page</title>

        <style>
            td:hover{
                background-color: #ffffcc;
            }

            #tabledata tr:nth-child(even){
                background-color: #f2f2f2;
            }

            #tabledata td, #tabledata th {
                border: 1px solid #ddd;
                padding: 8px;
            }
        </style>
    </head>
    <body>
        <%@include file="adminNav.jsp" %>
        <%
            String updatedSoildetails = (String) session.getAttribute("updatesoildetails");
            if (updatedSoildetails != null) {%>
        <div class="text-center text-success mt-4"><p><b><%=updatedSoildetails%></b></p></div>
                    <%}
                        session.removeAttribute("updatesoildetails");

                        String deleteSuccess = (String) session.getAttribute("deleteSuccess");
                        if (deleteSuccess != null) {%>
        <div class="text-center text-success mt-4"><p><b><%=deleteSuccess%></b></p></div>
                    <%}
                        session.removeAttribute("deleteSuccess");
                        String errorIndelete = (String) session.getAttribute("deletError");
                        if (errorIndelete != null) {%>
        <div class="text-center text-danger mt-4"><p><b><%=errorIndelete%></b></p></div>
                    <%}
                        session.removeAttribute("deletError");
                    %>
        <div class="container-fluid">
            <div class="table-responsive">          
                <table class="table" id="tabledata">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>SoilType</th>
                            <th>About</th>
                            <th>Uses</th>
                            <th>Classification</th>
                            <th>Update</th>
                            <th>delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            SoilDetailsDao dao = new SoilDetailsDao(ConnectionProvider.getConnection());
                            List<SoilDetails> list = dao.getSoilDetails();
                            for (SoilDetails sd : list) {%>
                        <tr>
                            <td><%=sd.getId()%></td>
                            <td><%=sd.getSoiltype()%></td>
                            <td><%=sd.getAbout()%></td>
                            <td><%=sd.getUses()%></td>
                            <td><%=sd.getClassification()%></td>
                            <td><a href="updateSoildetails.jsp?id=<%=sd.getId()%>"><button class="btn btn-primary">update</button></a></td>
                            <td><a href="../deleteSoildetails?id=<%=sd.getId()%>"><button class="btn btn-danger">delete</button></a></td>
                        </tr>
                        <% }
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
