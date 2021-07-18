/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.servlets;

import com.farmer.open.discussion.dao.ReplyDao;
import com.farmer.open.discussion.dao.UserDao;
import com.farmer.open.discussion.entities.Query;
import com.farmer.open.discussion.entities.Reply;
import com.farmer.open.discussion.entities.User;
import com.farmer.open.discussion.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author PANDIT
 */
@WebServlet(name = "SearchServlet", urlPatterns = {"/SearchServlet"})
public class SearchServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String inputSearch = request.getParameter("search");
            HttpSession session = request.getSession();

            if (inputSearch == null) {
                session.setAttribute("empty-search", "please input something to search");
                response.sendRedirect("index.jsp");

            } else {

                //UserDao dao = new UserDao(ConnectionProvider.getConnection());
                ReplyDao dao = new ReplyDao(ConnectionProvider.getConnection());
                Reply reply = dao.searchByQuestion(inputSearch);
                if (reply != null) {
                    session.setAttribute("search-msg", reply);
                    response.sendRedirect("search.jsp");
                } else {

                    session.setAttribute("errorSearch-msg", reply);
                    response.sendRedirect("search.jsp");
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
