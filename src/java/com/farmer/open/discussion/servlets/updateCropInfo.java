/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.servlets;

import com.farmer.open.discussion.dao.CropInfoDao;
import com.farmer.open.discussion.entities.CropInfo;
import com.farmer.open.discussion.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author PANDIT
 */
public class updateCropInfo extends HttpServlet {

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
            
            int cropid = Integer.parseInt(request.getParameter("cropid"));
            String title = request.getParameter("updatecroptitle");
            String titleType = request.getParameter("updatetitle_type");
            String titleDesc = request.getParameter("updatetitledesc");
            String production = request.getParameter("updateproduction");
            String soilCat = request.getParameter("updatesoilCat");
            String soildesc = request.getParameter("updatesoildesc");
            String fertilizer = request.getParameter("updatefdesc");
            
            out.println(cropid);
            out.println(title);
            out.println(titleType);
            out.println(titleDesc);
            out.println(production);
            out.println(soilCat);
            out.println(soildesc);
            out.println(fertilizer);
            
            CropInfo cropinfo=new CropInfo(cropid,title,titleType,titleDesc,production,soilCat,soildesc,fertilizer);
            CropInfoDao dao=new CropInfoDao(ConnectionProvider.getConnection());
            boolean f=dao.updateCropInfo(cropinfo);
            
            HttpSession session=request.getSession();
            if(f){
                //out.println("yes");
                session.setAttribute("updateCrop", "crop updated successfully");
                response.sendRedirect("admin/view_cropInfo.jsp");
            }else{
                //out.println("no");
                
                session.setAttribute("updateCropError", "something happend wrong in server");
                response.sendRedirect("admin/updateCropInfo.jsp");
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
