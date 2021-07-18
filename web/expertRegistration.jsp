<%-- 
    Document   : expertRegistration
    Created on : Jun 26, 2021, 9:54:52 AM
    Author     : PANDIT
--%>

<%@page import="com.farmer.open.discussion.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        
        <script src="js/expertValidation.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div>
                <%
                    String errormsg = (String) session.getAttribute("expRegError");
                    if (errormsg != null) {%>
                    <div class="text-center text-danger mt-5"><h3><b><%=errormsg%></b></h3></div>
                <%}

                    session.removeAttribute("expRegError");
                %>
                <%
                    String regMsg = (String) session.getAttribute("expReg_success");
                    if (regMsg != null) {%>
                    <div class="alert alert-success text-center mt-5" role="alert"><p><%= regMsg%> </p>.Click here to <a href="expertLogin.jsp" class="alert-link">Login</a> </div>

                <%  }

                    session.removeAttribute("expReg_success");
                %>

            </div>
            <div class="text-center mt-5"><h3><b>Expert Registration form</b></h3></div>
            <form class="form-group form-control" name="expertform" action="expertReg" method="post" enctype="multipart/form-data" onsubmit="return expertValid()">
                <div class="row">
                    <div class="col-md-6">
                        <div>
                            <label><b>name</b><span class="text-danger" id="name_error">*</span></label>
                            <input type="text" name="expertName" class="form-control">
                        </div>
                        <div>
                            <label><b>email</b><span class="text-danger" id="email_error">*</span></label>
                            <input type="email" name="expertEmail" class="form-control">
                        </div>
                        <div>
                            <label><b>phone</b><span class="text-danger" id="contact_error">*</span></label>
                            <input type="text" name="expertPhone" class="form-control">
                        </div>
                        <div>
                            <label><b>password</b><span class="text-danger" id="pass_error">*</span></label>
                            <input type="password" name="password" class="form-control">
                        </div>
                        <div>
                            <label><b>gender</b><span class="text-danger" id="gender_error">*</span></label>
                            <input type="radio" name="expertGender" value="male">Male</input>
                            <input type="radio" name="expertGender" value="female">Female</input>
                        </div>
                        <div>
                            <label><b>profession</b><span class="text-danger" id="profession_error">*</span></label>
                            <select name="profession" class="form-control">
                                <option selected disable>...Choose...</option>
                                <option>Agriculture Student</option>
                                <option>public</option>
                                <option>Farmer</option>
                                <option>Teacher</option>
                            </select>
                        </div>


                        <div>
                            <label><b>select doc Id</b><span class="text-danger" id="docId_error">*</span></label>
                            <select name="docId" class="form-control">
                                <option selected disable>...Choose...</option>
                                <option>college Id</option>
                                <option>Employee Id</option>
                                <option>Government Id</option>
                                <option>Farmer awarded certificate</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div>
                            <label><b>enter document no</b><span class="text-danger" id="docnum_error">*</span></label>
                            <input type="text" name="expertDocNum" class="form-control">
                        </div>
                        <div>
                            <label><b>Document file</b><span class="text-danger" id="file_error">*</span></label>
                            <input type="file" name="expertDocumentfile" class="form-control-file">
                        </div>
                        <div>
                            <label><b>state</b><span class="text-danger" id="state_error">*</span></label>
                            <input type="text" name="expertState" class="form-control">
                        </div>
                        <div>
                            <label><b>district</b><span class="text-danger" id="dist_error">*</span></label>
                            <input type="text" name="expertDist" class="form-control">
                        </div>
                        <div>
                            <label><b>region</b><span class="text-danger" id="region_error">*</span></label>
                            <input type="text" name="expertRegion" class="form-control">
                        </div>
                        <div>
                            <label><b>pincode </b> <span class="text-danger" id="pin_error">*</span></label>
                            <input type="text" name="expertPin" class="form-control">
                        </div>


                    </div>

                    <div class="mt-2 container text-center">
                        <button type="submit" class="btn btn-primary">submit</button>
                    </div>
            </form>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>
