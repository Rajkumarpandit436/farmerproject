/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.farmer.open.discussion.servlets;

import com.farmer.open.discussion.dao.AdminDao;
import com.farmer.open.discussion.entities.AdminReg;
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
public class adminRegister extends HttpServlet {

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
            String name = request.getParameter("adminName");
            String email = request.getParameter("adminEmail");
            String mob = request.getParameter("adminMobile");
            String pass = request.getParameter("adminPassword");
            String gender = request.getParameter("gender");
            String docnum = request.getParameter("docnum");
            Part part = request.getPart("file");
            String pic = part.getSubmittedFileName();
            
//            out.println(part.getSubmittedFileName());
//            out.println(name);
//            out.println(email);
//            out.println(mob);
//            out.println(pass);
//            out.println(gender);
//            out.println(docnum);

            AdminReg ar = new AdminReg(name, email, mob, pass, gender, docnum, pic);
            AdminDao dao = new AdminDao((Connection) ConnectionProvider.getConnection());
            boolean f = dao.saveAdmin(ar);
            HttpSession session=request.getSession();
            if (f) {
                //out.println("yes");
                String path = "C:/Users/PANDIT/Documents/NetBeansProjects/Farmer_open_discussion_portl/web/adminpic/"+ part.getSubmittedFileName();
                // boolean b = Helper.saveFile(part.getInputStream(), path);
                try {
                    try (FileOutputStream fos = new FileOutputStream(path)) {
                        InputStream is = part.getInputStream();

                        byte[] b = new byte[is.available()];
                        is.read(b);
                        fos.write(b);
                    }
                } catch (IOException e) {
                    System.out.println(e);
                }
                
                session.setAttribute("adminreg", "admin register successfully");
                response.sendRedirect("admin/adminRegisteration.jsp");
            } else {
                //out.println("no");
                session.setAttribute("adminregfail", "something went wrong");
                response.sendRedirect("admin/adminRegisteration.jsp");
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
