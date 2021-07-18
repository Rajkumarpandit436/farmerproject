package com.farmer.open.discussion.servlets;

import com.farmer.open.discussion.dao.UserDao;
import com.farmer.open.discussion.entities.User;
import com.farmer.open.discussion.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();

               String user_type = request.getParameter("user_type");
            String user_name = request.getParameter("user_name");
            String user_contact = request.getParameter("user_contact");
            String email_address = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String gender = request.getParameter("gender");
            String state = request.getParameter("state");
            String district = request.getParameter("district");
            int pincode=Integer.parseInt(request.getParameter("pincode"));

//            String user_type = (String) session.getAttribute("user_type");
//            String user_name = (String) session.getAttribute("user_name");
//            String user_contact = (String) session.getAttribute("user_contact");
//            String email_address = (String) session.getAttribute("email_address");
//            String password = (String) session.getAttribute("password");
//            String gender = (String) session.getAttribute("gender");
//            String state = (String) session.getAttribute("state");
//            String district = (String) session.getAttribute("district");
//            String pc = (String) session.getAttribute("pincode");
//            int pincode = Integer.parseInt(pc);
//           // int otp = (Integer) session.getAttribute("otp");
//            String otpvalue = request.getParameter("otpvalue");
//           // int enterOtp = Integer.parseInt(otpvalue);

           // if (otp == enterOtp) {
                //create user object and set all data to that object
                User user = new User(user_type, user_name, user_contact, email_address, password, gender, state, district, pincode);

                //create userDao object
                UserDao dao;
                dao = new UserDao((Connection) ConnectionProvider.getConnection());

                boolean f = dao.saveUser(user);

                if (f) {
                    session = request.getSession();
                    session.setAttribute("reg-success", "Registration successfull..");
                    response.sendRedirect("Registration.jsp");
                } else {
                    session = request.getSession();
                    session.setAttribute("fail-msg", "Email is already exist");
                    response.sendRedirect("Registration.jsp");
                }

           // }
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
