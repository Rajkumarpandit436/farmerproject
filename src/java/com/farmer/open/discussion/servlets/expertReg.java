/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.servlets;

import com.farmer.open.discussion.dao.ExpertDao;
import com.farmer.open.discussion.entities.Expert;
import com.farmer.open.discussion.helper.ConnectionProvider;
import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.FileOutputStream;
import java.io.InputStream;
import javax.servlet.annotation.MultipartConfig;

/**
 *
 * @author PANDIT
 */
@MultipartConfig
public class expertReg extends HttpServlet {

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

            String name = request.getParameter("expertName");
            String email = request.getParameter("expertEmail");
            String phone = request.getParameter("expertPhone");
            String pass = request.getParameter("password");
            String gender = request.getParameter("expertGender");
            String prof = request.getParameter("profession");
            String doc = request.getParameter("docId");
            String state = request.getParameter("expertState");
            String district = request.getParameter("expertDist");
            String region = request.getParameter("expertRegion");
            String pin = request.getParameter("expertPin");
            String docnum = request.getParameter("expertDocNum");
            Part part = request.getPart("expertDocumentfile");
            String pic = part.getSubmittedFileName();

//            out.println(part.getSubmittedFileName());
//            out.println(name);
//            out.println(email);
//            out.println(phone);
//            out.println(pass);
//            out.println(gender);
//            out.println(prof);
//            out.println(doc);
//            out.println(state);
//            out.println(district);
//            out.println(region);
//            out.println(pin);
//            out.println(docnum);
            Expert exp = new Expert(name, email, prof, doc, phone, pic, pass, state, region, district, pin, gender, docnum);
            ExpertDao dao = new ExpertDao((Connection) ConnectionProvider.getConnection());
            boolean f = dao.saveExpertData(exp);
            HttpSession session = request.getSession();
            if (f) {

                String path = "C:/Users/PANDIT/Documents/NetBeansProjects/Farmer_open_discussion_portl/web/expertImage/" + part.getSubmittedFileName();
                try {
                    try (FileOutputStream fos = new FileOutputStream(path)) {
                        InputStream is = part.getInputStream();

                        byte[] b = new byte[is.available()];
                        is.read(b);
                        fos.write(b);
                        fos.close();
                    }
                } catch (IOException e) {
                    System.out.println(e);
                }
                session.setAttribute("expReg_success", "Expert Successfully Register");
                response.sendRedirect("expertRegistration.jsp");
            } else {
                session.setAttribute("expRegError", "registration fail");
                //out.println("no");
                response.sendRedirect("expertRegistration.jsp");
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
