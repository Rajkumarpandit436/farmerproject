/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.servlets;

import com.farmer.open.discussion.dao.UserDao;
import com.farmer.open.discussion.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author PANDIT
 */
@WebServlet("/delete")
@MultipartConfig

public class deleteUserServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            int id = Integer.parseInt(request.getParameter("id"));
            String userType = request.getParameter("user_type");
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            boolean f = dao.deleteUser(id);

            HttpSession session = request.getSession();

            if (userType.equalsIgnoreCase("Administrator")) {

                if (f) {

                    session.setAttribute("updatemsg", "User updated Successfully");
                    response.sendRedirect("admin/administrator.jsp");

                } else {

                    session.setAttribute("errorupdatemsg", "User not updated Successfullty");
                    response.sendRedirect("admin/administrator.jsp");

                }
            }else if(userType.equalsIgnoreCase("Agriculture Student")){
                 if (f) {

                    session.setAttribute("updatemsg", "User updated Successfully");
                    response.sendRedirect("admin/studentDetails.jsp");

                } else {

                    session.setAttribute("errorupdatemsg", "User not updated Successfullty");
                    response.sendRedirect("admin/studentDetails.jsp");

                }
                
            }else if(userType.equalsIgnoreCase("General Public")){
                 if (f) {

                    session.setAttribute("updatemsg", "User updated Successfully");
                    response.sendRedirect("admin/publicUser.jsp");

                } else {

                    session.setAttribute("errorupdatemsg", "User not updated Successfullty");
                    response.sendRedirect("admin/publicUser.jsp");

                }
                
            }else if(userType.equalsIgnoreCase("farmer")){
                 if (f) {

                    session.setAttribute("updatemsg", "User updated Successfully");
                    response.sendRedirect("admin/farmerDetails.jsp");

                } else {

                    session.setAttribute("errorupdatemsg", "User not updated Successfullty");
                    response.sendRedirect("admin/farmerDetails.jsp");

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
        processRequest(request, response);
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
        processRequest(request, response);
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
