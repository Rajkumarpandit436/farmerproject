/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.servlets;

import com.farmer.open.discussion.dao.UserDao;
import com.farmer.open.discussion.entities.SoilEntry;
import com.farmer.open.discussion.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author PANDIT
 */
public class soilServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String soilname = request.getParameter("soil");

           
             
            if (soilname.equalsIgnoreCase("Sandy Soil")) {
                response.sendRedirect("soil/about_sandy_soil.jsp");
            } else if (soilname.equalsIgnoreCase("Clay Soil")) {
                response.sendRedirect("soil/clay_soil.jsp");
            } else if (soilname.equalsIgnoreCase("Silt soil")) {
                response.sendRedirect("soil/silt_soil.jsp");
            } else if (soilname.equalsIgnoreCase("Peat Soil")) {
                response.sendRedirect("soil/peat_soil.jsp");
            } else if (soilname.equalsIgnoreCase("Chalk Soil")) {
                response.sendRedirect("soil/chalk_soil.jsp");
            } else if (soilname.equalsIgnoreCase("Loam Soil")) {
                response.sendRedirect("soil/loam_soil.jsp");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("msg", "please choose right soil name");
                response.sendRedirect("soilEntry.jsp");
            }
//            

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
