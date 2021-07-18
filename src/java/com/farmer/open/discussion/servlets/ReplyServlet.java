/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.servlets;

import com.farmer.open.discussion.dao.ReplyDao;
import com.farmer.open.discussion.dao.UserDao;
import com.farmer.open.discussion.entities.Reply;
import com.farmer.open.discussion.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

/**
 *
 * @author PANDIT
 */
@MultipartConfig
public class ReplyServlet extends HttpServlet {

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
            
            String q_r = request.getParameter("response");
            String email = request.getParameter("email");
            int id = Integer.parseInt(request.getParameter("id"));
            String quest=request.getParameter("quest");
            String category=request.getParameter("cat");


           // UserDao dao = new UserDao(ConnectionProvider.getConnection());
           ReplyDao dao=new ReplyDao(ConnectionProvider.getConnection());
            Reply rep=new Reply(category,quest,q_r,email,id);
            boolean f = dao.saveResponse(rep);

            HttpSession session=request.getSession();
            if (f) {
                session.setAttribute("rep_msg", "Reply send successfully");
                response.sendRedirect("ViewQuery.jsp");
            } else {
                session.setAttribute("error_rep_msg", "somethong wromg!");
                response.sendRedirect("ViewQuery.jsp");
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
