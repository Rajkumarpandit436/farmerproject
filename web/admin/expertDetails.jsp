<%-- 
    Document   : expertDetails
    Created on : Jun 26, 2021, 10:32:19 PM
    Author     : PANDIT
--%>

<%@page import="com.farmer.open.discussion.entities.Expert"%>
<%@page import="java.util.List"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.farmer.open.discussion.dao.ExpertDao"%>
<%@page import="com.farmer.open.discussion.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="../css/table.css" rel="stylesheet" type="text/css"/>
        <link href="../css/admincss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        
       

        <div class="container-fluid">
            <div class="table-responsive">  
                <div class="text-center mt-3"><h3 style="background-color: lavender"><b>Expert Details</b></h3></div>
                <table class="table mt-2" id="query">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>name</th>
                            <th>email</th>
                            <th>contact</th>
                            <th>state</th>
                            <th>district</th>
                            <th>region</th>
                            <th>pincode</th>
                            <th>gender</th>
                            <th>profession</th>
                            <th>id</th>
                            <th>idno</th>
                            <th>image</th>
                            <th>Update</th>
                            <th>delete</th>

                        </tr>
                    </thead>
                    <tbody>

                        <%
                            ExpertDao dao = new ExpertDao((Connection) ConnectionProvider.getConnection());
                            List<Expert> list = dao.expertDetails();
                            for (Expert expertdetail : list) {%>
                        <tr>
                            <td><%=expertdetail.getId()%></td>
                            <td><%=expertdetail.getName()%></td>
                            <td><%=expertdetail.getEmail()%></td>
                            <td><%=expertdetail.getPhone()%></td>
                            <td><%=expertdetail.getState()%></td>
                            <td><%=expertdetail.getDistrict()%></td>
                            <td><%=expertdetail.getRegion()%></td>
                            <td><%=expertdetail.getPincode()%></td>
                            <td><%=expertdetail.getGender()%></td>
                            <td><%=expertdetail.getOccupation()%></td>
                            <td><%=expertdetail.getIdentity()%></td>
                            <td><%=expertdetail.getDocnum()%></td>
                            <td><img src="../expertImage/<%=expertdetail.getPic()%>" style="width: 80px; height: 80px"></td>

                            <td><a href="#=<%=expertdetail.getId()%>"><button type="submit" class="btn btn-primary">update</button></a></td>
                            <td><a href="../delete?id=<%=expertdetail.getId()%>"><button type="submit" class="btn btn-danger">delete</button></a> </td>
                        </tr>
                        <%  }
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
