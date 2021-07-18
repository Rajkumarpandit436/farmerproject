/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.servlets;

import com.farmer.open.discussion.dao.UserDao;
import com.farmer.open.discussion.entities.User;
import com.farmer.open.discussion.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

/**
 *
 * @author PANDIT
 */
@MultipartConfig
public class UpdateUserServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String contact = request.getParameter("contact");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String userType = request.getParameter("ut");

            User us = new User();
            us.setId(id);
            us.setUser_name(name);
            us.setUser_Contact(contact);
            us.setEmail_address(email);
            us.setPassword(password);

            us = new User(id, name, contact, email, password);
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            boolean f = dao.UpdateUser(us);
            HttpSession session = request.getSession();

            if (userType.equalsIgnoreCase("Agriculture Student")) {
                if (f) {
                    session.setAttribute("updatemsg", "User updated Successfully");
                    response.sendRedirect("admin/studentDetails.jsp");
                } else {
                    session.setAttribute("errorupdatemsg", "User not updated Successfullty");
                    response.sendRedirect("admin/studentDetails.jsp");
                }

            } else if (userType.equalsIgnoreCase("Administrator")) {
                if (f) {
                    session.setAttribute("updatemsg", "User updated Successfully");
                    response.sendRedirect("admin/administrator.jsp");
                } else {
                    session.setAttribute("errorupdatemsg", "User not updated Successfullty");
                    response.sendRedirect("admin/administrator.jsp");
                }

            } else if (userType.equalsIgnoreCase("General Public")) {
                if (f) {
                    session.setAttribute("updatemsg", "User updated Successfully");
                    out.println("udeted");
                    response.sendRedirect("admin/publicUser.jsp");
                } else {
                    session.setAttribute("errorupdatemsg", "User not updated Successfullty");
                    response.sendRedirect("admin/publicUser.jsp");
                    out.println("not updeted");
                }

            } else if (userType.equalsIgnoreCase("farmer")) {
                if (f) {
                    session.setAttribute("updatemsg", "User updated Successfully");
                    out.println("udeted");
                    response.sendRedirect("admin/farmerDetails.jsp");
                } else {
                    session.setAttribute("errorupdatemsg", "User not updated Successfullty");
                    response.sendRedirect("admin/farmerDetails.jsp");
                    out.println("not updeted");
                }

            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
