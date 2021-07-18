<%-- 
    Document   : adminRegisteration
    Created on : Jun 25, 2021, 7:20:14 PM
    Author     : PANDIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3g              FoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <%
                String failReg = (String) session.getAttribute("adminregfail");
                if (failReg != null) {%>
                <div class="mt-5 text-center text-danger"><h3><b><%=failReg%></b></h3></div>
            <%}
                session.removeAttribute("adminregfail");
            %>
            <%
                 String regMsg = (String) session.getAttribute("adminreg");
                 if (regMsg != null) {%>
            <div class="alert alert-success mt-5 text-center" role="alert"><%= regMsg%> .Click here to <a href="../Login.jsp" class="alert-link">Login</a> </div>

            <%  }

                session.removeAttribute("adminreg");
            %>

            <form class="form-group form-control mt-5" name="myform" action="../adminRegister" method="post" enctype="multipart/form-data">
                <div><h3 class="text-center" style="background-color: lavender"><b>Admin Registration form</b></h3></div>
                <div>
                    <label><b>Name</b></label>
                    <input type="text" name="adminName" class="form-control">
                </div>
                <div>
                    <label><b>Email</b></label>
                    <input type="email" name="adminEmail" class="form-control">
                </div>
                <div>
                    <label><b>Mobile No.</b></label>
                    <input type="text" name="adminMobile" class="form-control">
                </div>
                <div>
                    <label><b>Password</b></label>
                    <input type="password" name="adminPassword" class="form-control">
                </div>

                <div class="form-group">
                    <label for="exampleInputRadio"><b>Gender</b></label>
                    <div class="form-control">
                        <input type="radio" id="gender" name="gender" value="male"> Male</input>
                        <input type="radio" id="gender" name="gender" value="female"> Female</input> 
                    </div>
                </div>

                <div>
                    <lable><b>document number</b></lable>
                    <input type="text" name="docnum" class="form-control">
                </div>
                <div>
                    <lable><b>upload document</b></lable>
                    <input type="file" name="file" class="form-control-file">
                </div>
                <div class="container text-center">
                    <button type="submit" class="btn btn-primary"><b>Register</b></button>
                </div>
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
