/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.servlets;

import com.farmer.open.discussion.dao.SoilDetailsDao;
import com.farmer.open.discussion.entities.SoilDetails;
import com.farmer.open.discussion.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author PANDIT
 */
public class updateSoildetails extends HttpServlet {

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
           
            int id=Integer.parseInt(request.getParameter("updateId"));
            String soiltype=request.getParameter("updateSoiltype");
            String about = request.getParameter("updateAbout");
            String uses=request.getParameter("updateUses");
            String classification = request.getParameter("updateClassification");
//            
//            out.println(id);
//            out.println(soiltype);
//            out.println(about);
//            out.println(uses);
//            out.println(classification);
            
            SoilDetails sd=new SoilDetails(id,soiltype,about,uses,classification);
            SoilDetailsDao dao=new SoilDetailsDao(ConnectionProvider.getConnection());
            boolean f=dao.updateSoildetail(sd);
            
            HttpSession session=request.getSession();
            if(f){
                //out.println("yes");
                session.setAttribute("updatesoildetails", "soil details updated successfully");
                response.sendRedirect("admin/viewSoilDetails.jsp");
            }else{
                //out.println("no");
                session.setAttribute("ErrorUpdatesoildetails", "something happend wrong on server");
                response.sendRedirect("admin/updateSoildetails.jsp");
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
