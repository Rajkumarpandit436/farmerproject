<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <title> crop Info </title>
    </head>
    <body>
        <section>
            <div class="row">
                <div class="col-lg-12">
                    <div class="container mt-5">
                        <%
                            String cropError = (String) session.getAttribute("cropAddError");
                            if (cropError != null) {%>
                        <div class="text-center text-danger"><p><b><%=cropError%></b></p></div>

                        <%}
                            session.removeAttribute("cropAddError");
                        %>
                        <form name="myform" class="form-group form-control" action="../CropInfoServlet" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label><b><p> Title <span class="text-danger">*</span></p></b></label>
                                <input type="text" name="croptitle" id="croptitle" class="form-control">
                            </div>

                            <div class="form-group">
                                <label><b><p> Title type <span class="text-danger">*</span></p></b></label>
                                <select class="form-control" name="title_type" id="title_type">
                                    <option selected="" disabled="">...choose title type...</option>
                                    <option><b>food crop</b></option>
                                    <option><b>cash crop</b></option>
                                    <option><b>plantation crop</b></option>
                                    <option><b>horticulture crop</b></option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label><b><p> Upload title Image <span class="text-danger">*</span></p></b></label>
                                <input type="file" name="titleImg" class="form-control-file" id="titleImg">
                            </div>

                            <div class="form-group">
                                <label><b><p> Title Description <span class="text-danger">*</span></p></b></label>
                                <textarea rows="15" cols="12" class="form-control" name="titledescription"
                                          id="titledescription" placeholder="enter title description"></textarea>
                            </div>


                            <div class="form-group">
                                <label><b><p> production <span class="text-danger">*</span></p></b></label>
                                <textarea class="form-control" rows="15" cols="12" name="production"
                                          id="production" placeholder="enter about crop production"></textarea>
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
                                <select class="form-control" name="soilCategory">
                                    <option disabled="" selected="">...choose...</option>
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
                                <textarea class="form-control" name="soildescription" cols="12" rows="10" id="soildescription"></textarea>
                            </div>

                            <div class="form-group">
                                <label><b><p> fertilizer description <span class="text-danger">*</span></p></b></label>
                                <textarea class="form-control" cols="12" rows="10" name="fdescription" id="fdescription"></textarea>
                            </div>

                            <div class="form-group">
                                <button type="submit" name="cropInfo-btn" class="btn btn-primary text-center">Submit</button>
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