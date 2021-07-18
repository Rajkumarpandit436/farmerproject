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
public class UpdateNotes extends HttpServlet {

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
           
            int noteId=Integer.parseInt(request.getParameter("editnotesid"));
            String noteTitle=request.getParameter("editnotestitle");
            String noteDesc=request.getParameter("editnotesdesc");
            
//            out.println(noteId);
//            out.println(noteTitle);
//            out.println(noteDesc);
            
            Enotes note=new Enotes(noteId,noteTitle,noteDesc);
            
            EnotesDao dao=new EnotesDao((Connection) ConnectionProvider.getConnection());
            
            boolean f=dao.UpdateNotes(note);
            
            HttpSession session=request.getSession();
            
            if(f){
               // out.println("yes");
                session.setAttribute("editSuc", "notes Edited Successfully");
                response.sendRedirect("eNotes/showNotes.jsp");
            }else{
                //out.println("no");
                session.setAttribute("editError", "Something Error");
                response.sendRedirect("eNotes/showNotes.jsp");
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
