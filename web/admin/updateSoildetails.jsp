



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
    </head>
    <body>
        <%
            int sId = Integer.parseInt(request.getParameter("id"));
            SoilDetailsDao dao = new SoilDetailsDao(ConnectionProvider.getConnection());
            SoilDetails sd = dao.getSoilDetailsById(sId);
        %>
        <%@include file="adminNav.jsp" %>
        <%
            String errorUpdateSoildetails = (String)session.getAttribute("ErrorUpdatesoildetails");
            if(errorUpdateSoildetails!=null){%>
            
            <div class="text-center text-danger mt-4"><p><b><%=errorUpdateSoildetails%></b></p></div>
                
            <%}
            session.removeAttribute("ErrorUpdatesoildetails");
        %>
        <section class="form-section mt-5">
            <div class="row">
                <div class="col-md-12">
                    <div class="container">
                        <div class="text-center text-primary"><h3><b>Update Soil Details</b></h3></div>

                        <form class="form-control form-group" method="post" action="../updateSoildetails">
                            <div><input type="hidden" value="<%=sId%>" name="updateId"></div>
                            <div>
                                <label class="form-group">soil Type</label>
                                <select class="form-control" name="updateSoiltype" id="soilType">
                                    <option selected="" ><%=sd.getSoiltype()%></option>
                                </select>
                            </div>
                            <br>

                            <div>
                                <label class="form-group">about</label>
                                <textarea name="updateAbout" class="form-control" cols="12" rows="10" id="aboutSoil" placeholder="about the soil"><%=sd.getAbout()%></textarea>
                            </div>
                            <br>

                            <div>
                                <label class="form-group">Uses</label>
                                <textarea name="updateUses" class="form-control" cols="12" rows="10" id="soilUses" placeholder="about the soil Uses"><%=sd.getUses()%></textarea>
                            </div>
                            <br>

                            <div>
                                <label>Classification</label>
                                <textarea name="updateClassification" class="form-control" cols="12" rows="10" id="soilClassification" placeholder="about soil classification"><%=sd.getClassification()%></textarea>
                            </div>
                            <br>

                            <div class="text-center">
                                <button class="btn btn-primary" type="submit">save update</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
