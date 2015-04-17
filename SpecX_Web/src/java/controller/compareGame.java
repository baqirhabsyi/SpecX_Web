/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java. io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.sql.PreparedStatement;
import config.Connect;
import model.Check;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Baqir
 */
@WebServlet(name = "compareGame", urlPatterns = {"/compareGame"})
public class compareGame extends HttpServlet {

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
            
//            String Name = (String)request.getParameter("combo_zone1");
//            
//            Connect obj_con = new Connect();
//            Connection con = obj_con.Open();
//            
//            String sql = "select * from Application_Names where AppName = ?";
//            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setString(1, Name);
//            ResultSet rs = ps.executeQuery();
//            rs.next();
//            String Code = rs.getString(2);
            
            
            
//            boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
//            if(isMultiPart)
//            {
//                FileItemFactory factory = new DiskFileItemFactory();
//                ServletFileUpload upload = new ServletFileUpload(factory);
//                List items = upload.parseRequest(request);
//                Iterator<FileItem> iter = items.iterator();
//                while(iter.hasNext())
//                {
//                    FileItem fileItem = iter.next();
//                    if(fileItem.isFormField())
//                    {
//                        processFormField(fileItem);
//                    }
//                    else
//                    {
//                        flItem = fileItem;
//                    }
//                }
//            }
            Connect obj_con = new Connect();
            Connection con = obj_con.Open();
            
            String Code = request.getParameter("Code");
            
            String sql = "delete from tempdata";
            String sql2 = "insert into tempdata(tempdata) values(?)";
            PreparedStatement mw = con.prepareStatement(sql);
            PreparedStatement sl = con.prepareStatement(sql2);
            sl.setString(1, Code);
            
            mw.executeUpdate();
            sl.executeUpdate();
            
            Check c = new Check();
           
            c.setCode(Code);
            int i = c.compareSpecs();
            
            if(i == 3)
            {
                RequestDispatcher rd = request.getRequestDispatcher("resultCompareRec.jsp");
                request.setAttribute("return", "Get Recommended Settings");
                rd.forward(request, response);
            }
            else if(i == 2)
            {
                RequestDispatcher rd = request.getRequestDispatcher("resultCompareMin.jsp");
                request.setAttribute("return", "Get Minimum Settings");
                rd.forward(request, response);
            }
            else if(i == 1)
            {
                RequestDispatcher rd = request.getRequestDispatcher("resultCompareNo.jsp");
                request.setAttribute("return", "Do Not Get Any Settings");
                rd.forward(request, response);
            }
            else
            {
                RequestDispatcher rd = request.getRequestDispatcher("compareGame.jsp");
                request.setAttribute("return", "Do Not Get Any Settings");
                rd.forward(request, response);
            }
            
//            RequestDispatcher rd = request.getRequestDispatcher("resultCompareRec.jsp");
//                request.setAttribute("return", "Get Recommended Settings");
//                rd.forward(request, response);
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
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

//    private void processFormField(FileItem item)
//    {
//        if(item.getFieldName().equals("Code"))
//        {
//            Code = item.getString();
//        }
//    }
    
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
