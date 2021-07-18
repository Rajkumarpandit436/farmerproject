/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.servlets;

import com.farmer.open.discussion.dao.EnotesDao;
import com.farmer.open.discussion.entities.Enotes;
import com.farmer.open.discussion.helper.ConnectionProvider;
import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;


/**
 *
 * @author PANDIT
 */
public class NotesAddServlet extends HttpServlet {

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
          
            int id=Integer.parseInt(request.getParameter("uid"));
            String title=request.getParameter("notestitle");
            String description=request.getParameter("notesdesc");
            
            out.println(id);
            out.println(title);
            out.println(description);
            
            Enotes notes=new Enotes(title,description,id);
            EnotesDao edao=new EnotesDao((Connection) ConnectionProvider.getConnection());
            boolean f = edao.saveNotes(notes);
            
            HttpSession session=request.getSession();
            if(f){
                session.setAttribute("savenote", "notes save successfully");
                response.sendRedirect("eNotes/takeNote.jsp");
            }else{
                session.setAttribute("savenote-error", "something wrong in server");
                response.sendRedirect("eNotes/addNotes.jsp");
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
