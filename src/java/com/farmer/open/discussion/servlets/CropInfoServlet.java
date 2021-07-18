package com.farmer.open.discussion.servlets;

import com.farmer.open.discussion.dao.CropInfoDao;
import com.farmer.open.discussion.entities.CropInfo;
import com.farmer.open.discussion.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import javax.servlet.annotation.MultipartConfig;

/**
 *
 * @author PANDIT
 */
@MultipartConfig
public class CropInfoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charser=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String title = request.getParameter("croptitle");
            String title_type = request.getParameter("title_type");
            String title_desc = request.getParameter("titledescription");
            String production = request.getParameter("production");
            String s_category = request.getParameter("soilCategory");
            String s_desc = request.getParameter("soildescription");
            String fertilizer = request.getParameter("fdescription");

            Part part;
            part=request.getPart("titleImg");
            //part=request.getPart("pImg");
////            
//            String tpic=part.getSubmittedFileName();
//            out.println(title);
//            out.println(title_type);
//            out.println(title_desc);
//            out.println(production);
//            out.println(s_category);
//            out.println(s_desc);
//            out.println(fertilizer);
//            out.println(part.getSubmittedFileName());
            CropInfo crop = new CropInfo(title, title_type, title_desc, production, s_category, s_desc, fertilizer, part.getSubmittedFileName());
            CropInfoDao dao = new CropInfoDao(ConnectionProvider.getConnection());

            boolean f = dao.addCropInfo(crop);

            HttpSession session = request.getSession();
            if (f) {
                String path="C:/Users/PANDIT/Documents/NetBeansProjects/Farmer_open_discussion_portl/web/cropTitleImage/"+part.getSubmittedFileName();
                try{
                    try (FileOutputStream fos = new FileOutputStream(path)) {
                        InputStream is=part.getInputStream();
                        byte[] b=new byte[is.available()];
                        is.read(b);
                        fos.write(b);
                        fos.close();
                    }
                    
                }catch(FileNotFoundException e){
                    
                }
                session.setAttribute("cropAdd", "Crop Info added successfully");
                response.sendRedirect("admin/admin.jsp");
            } else {
                // out.println("no");

                session.setAttribute("cropAddError", "something wrong on server");
                response.sendRedirect("admin/cropInfo.jsp");
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
