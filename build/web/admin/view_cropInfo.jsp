

<%@page import="java.util.List"%>
<%@page import="com.farmer.open.discussion.entities.CropInfo"%>
<%@page import="com.farmer.open.discussion.helper.ConnectionProvider"%>
<%@page import="com.farmer.open.discussion.dao.CropInfoDao"%>
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
        
        <%@include file="adminNav.jsp" %>
        <%
            String cropmsg = (String)session.getAttribute("updateCrop");
            if(cropmsg!=null){%>
            <div class="text-center text-success mt-5"><p><b><%=cropmsg%></b></p></div>  
            <%}
            
            session.removeAttribute("updateCrop");
        %>
            <%
                String cropdeleteSuc = (String)session.getAttribute("deletecrop");
                if(cropdeleteSuc!=null){%>
            <div class="text-center text-success"><p><b><%=cropdeleteSuc%></b></p></div>      
            <%}
            session.removeAttribute("deletecrop");
            %>
            
            <%
                String cropdeleteError  = (String)session.getAttribute("cropdeleteError");
                if(cropdeleteError!=null){%>
                <div class="text-center text-danger"><p><b><%=cropdeleteError%></b></p></div>  
                <%}
            %>
        <section class="table-responsive mt-5">
            <table class="table" id="query">
                <thead style="background-color: #a1887f;">
                    <tr>
                        <th>title</th>
                        <th>description</th>
                        <th>production</th>
                        <th>edit</th>
                        <th>delete</th>
                    </tr>
                </thead>
                <%
                    CropInfoDao dao = new CropInfoDao(ConnectionProvider.getConnection());
                    List<CropInfo> crop = dao.getcropInfo();
                    for (CropInfo c : crop) {%>
                <tbody>
                    <tr>
                        <td><%=c.getTitle()%></td>
                        <td><%=c.getTitleDesc()%></td>
                        <td><%=c.getProduction()%></td>
                        <td><a href="updateCropInfo.jsp?id=<%=c.getId()%>"><button class="btn btn-primary">update</button></a></td>
                        <td><a href="../deleteCropInfo?id=<%=c.getId()%>"><button class="btn btn-danger">delete</button></a></td>
                    </tr>
                </tbody>
                <% }
                %>

            </table>
        </section>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
