
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String user_type = request.getParameter("user_type");
            String user_name = request.getParameter("user_name");
            String user_contact = request.getParameter("user_contact");
            String email_address = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String gender = request.getParameter("gender");
            String state = request.getParameter("state");
            String district = request.getParameter("district");
            int pincode = Integer.parseInt(request.getParameter("pincode"));

            session.setAttribute("user_type", user_type);
            session.setAttribute("user_name", user_name);
            session.setAttribute("user_contact", user_contact);
            session.setAttribute("email_address", email_address);
            session.setAttribute("password", password);
            session.setAttribute("gender", gender);
            session.setAttribute("state", state);
            session.setAttribute("district", district);
            session.setAttribute("pincode", pincode);

            Random rand = new Random();
            int otp = rand.nextInt(900000) + 100000;
            session.setAttribute("otp", otp);

            String authkey = "MFlvn5j21IYLO0c6CE3AXWk4RVeyBuihHxb9rJKPZqTQo8DStmiWCwj2y8Kxv1rbZl4uJO7gEosYdBU5";
            String route = "v3";
            String senderId = "TXTIND";
            String message = "Your OTP is " + otp;
            String language = "english";
            String number = user_contact;
            
            //String flash = "0";
            URLConnection myURLConnection = null;
            URL myURL = null;
            BufferedReader reader = null;
            String encoded_message = URLEncoder.encode(message);
            String mainUrl = "https://www.fast2sms.com/dev/bulkV2";
            StringBuilder sbPostData = new StringBuilder(mainUrl);
            sbPostData.append("authkey=" + authkey);
            sbPostData.append("&route=" + route);
            sbPostData.append("&sender=" + senderId);
            sbPostData.append("&mobiles=" + number);
            sbPostData.append("&message=" + encoded_message);
            sbPostData.append("&language="+ language);

            mainUrl = sbPostData.toString();

            try {
//prepare connection
                myURL = new URL(mainUrl);
                myURLConnection = myURL.openConnection();
                myURLConnection.setRequestProperty("cache-control", "no-cache");
                myURLConnection.connect();
                reader = new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
                String success="message send successfully to your registered mobile number";
                session.setAttribute("msg", "success");
                response.sendRedirect("otp.jsp");
//finally close connection
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
