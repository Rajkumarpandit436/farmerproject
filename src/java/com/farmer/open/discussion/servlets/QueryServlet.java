/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.servlets;

import com.farmer.open.discussion.dao.QueryDao;
import com.farmer.open.discussion.dao.UserDao;
import com.farmer.open.discussion.entities.Query;
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
public class QueryServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String qt = request.getParameter("question");
            String email = request.getParameter("email");
            String category = request.getParameter("category");

            //create query object and set all data to that object
            Query query = new Query(email, category, qt);

           // UserDao dao;
            //dao = new UserDao((Connection) ConnectionProvider.getConnection());

            QueryDao dao=new QueryDao(ConnectionProvider.getConnection());
            boolean f = dao.saveQuery(query);
            HttpSession session;
            
            if(f){
               if (f) {
                    session = request.getSession();
                    session.setAttribute("reg-success", "query submission successful...");
                    response.sendRedirect("Query.jsp");
                } else {
                    session = request.getSession();
                    session.setAttribute("fail-msg", "something went wong on server");
                    response.sendRedirect("Query.jsp");
                }
            

        }
     }
    }
    

   
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
