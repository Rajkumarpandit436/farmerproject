

<%@page import="com.farmer.open.discussion.entities.CropInfo"%>
<%@page import="com.farmer.open.discussion.helper.ConnectionProvider"%>
<%@page import="com.farmer.open.discussion.dao.CropInfoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="../css/admincss.css" rel="stylesheet" type="text/css"/>
        <title> crop Info </title>
    </head>


    <%
        int id = Integer.parseInt(request.getParameter("id"));
        CropInfoDao dao = new CropInfoDao(ConnectionProvider.getConnection());
        CropInfo info = dao.getCropInfoById(id);
    %>

    <body>
        <%@include file="adminNav.jsp" %>
        <%
            String updateErrorCrop = (String) session.getAttribute("updateCropError");
            if (updateErrorCrop != null) {%>
        <div class="text-center text-danger mt-5"><p><b><%=updateErrorCrop%></b></p></div>  
                    <%}
                    %>
        <section>
            <div class="row">
                <div class="col-lg-12">
                    <div class="container mt-5">

                        <form name="myform" class="form-group form-control" action="../updateCropInfo" method="post">
                            <div>
                                <input type="hidden" name="cropid" value="<%=id%>">
                            </div>
                            <div class="form-group">
                                <label><b><p> Title <span class="text-danger">*</span></p></b></label>
                                <input type="text" name="updatecroptitle" id="croptitle" class="form-control" value="<%=info.getTitle()%>">
                            </div>

                            <div class="form-group">
                                <label><b><p> Title type <span class="text-danger">*</span></p></b></label>
                                <select class="form-control" name="updatetitle_type" id="title_type" >
                                    <option selected=""><%=info.getTitleType()%></option>
                                    <option><b>Spice</b></option>
                                    <option><b>crop</b></option>
                                    <option><b>dry food</b></option>
                                    <option><b>plants</b></option>

                                </select>
                            </div>

                            <!--<div class="form-group">
                                <label><b><p> Upload title Image <span class="text-danger">*</span></p></b></label>
                                <input type="file" name="titleImg" class="form-control" id="titleImg">
                            </div>-->

                            <div class="form-group">
                                <label><b><p> Title Description <span class="text-danger">*</span></p></b></label>
                                <textarea rows="15" cols="12" class="form-control" name="updatetitledesc"
                                          id="titledescription" placeholder="enter title description"><%=info.getTitleDesc()%></textarea>
                            </div>

                            <div class="form-group">
                                <label><b><p> production <span class="text-danger">*</span></p></b></label>
                                <textarea class="form-control" rows="15" cols="12" name="updateproduction"
                                          id="production" placeholder="enter about crop production"><%=info.getProduction()%></textarea>
                            </div>

                            <!--<div class="form-group">
                                <label><b><p> Upload production Image <span class="text-danger">*</span></p></b></label>
                                <input type="file" name="productionImg1" class="form-control" id="productionImg">
                                <input type="file" name="productionImg2" class="form-control" id="productionImg">
                                <input type="file" name="productionImg3" class="form-control" id="productionImg">
                                <input type="file" name="productionImg4" class="form-control" id="productionImg">
                            </div>-->

                            <div class="form-group">
                                <label><b><p> Soil category <span class="text-danger">*</span></p></b></label>
                                <select class="form-control" name="updatesoilCat">
                                    <option selected="" ><%=info.getSoilCat()%></option>
                                    <option>Sandy soil</option>
                                    <option>Clay Soil</option>
                                    <option>Silt Soil</option>
                                    <option>Peat Soil</option>
                                    <option>Chalk Soil</option>
                                    <option>Loam Soil</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label><p><b> Soil Description <span class="text-danger">*</span></p></b></label>
                                <textarea class="form-control" name="updatesoildesc" cols="12" rows="10" id="soildescription"><%=info.getSoilDesc()%></textarea>
                            </div>

                            <div class="form-group">
                                <label><b><p> fertilizer description <span class="text-danger">*</span></p></b></label>
                                <textarea class="form-control" cols="12" rows="10" name="updatefdesc" id="fdescription"><%=info.getFertDesc()%></textarea>
                            </div>

                            <div class="form-group text-center">
                                <button type="submit" name="cropInfo-btn" class="btn btn-primary text-center">Update CropInfo</button>
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