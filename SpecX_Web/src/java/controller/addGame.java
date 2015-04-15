/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import config.Connect;

/**
 *
 * @author Baqir
 */
@WebServlet(name = "addGame", urlPatterns = {"/addGame"})
public class addGame extends HttpServlet {

    String AppName, Code, MinCpu, RecCpu, MinGpu, RecGpu;
    int MinCpuLvl, RecCpuLvl, MinGpuLvl, RecGpuLvl, MinRam, RecRam; 
    FileItem flItem = null;
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
            if(isMultiPart)
            {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = upload.parseRequest(request);
                Iterator<FileItem> iter = items.iterator();
                while(iter.hasNext())
                {
                    FileItem fileItem = iter.next();
                    if(fileItem.isFormField())
                    {
                        processFormField(fileItem);
                    }
                    else
                    {
                        flItem = fileItem;
                    }
                }
            }
            
            Connect obj_con = new Connect();
            Connection con = obj_con.Open();
            
            String sql = "insert into Application_Names values(?,?,?)";
            String sql1 = "insert into required_Minimum values(?,?,?,?,?,?)";
            String sql2 = "insert into required_Recomended values(?,?,?,?,?,?)";
            
            PreparedStatement pr = con.prepareStatement(sql);
            PreparedStatement pr1 = con.prepareStatement(sql1);
            PreparedStatement pr2 = con.prepareStatement(sql2);
            
            pr.setString(1, AppName);
            pr.setString(2, Code);
            pr.setString(3, Code);
            
            pr1.setString(1, Code);
            pr1.setString(2, MinGpu);
            pr1.setInt(3, MinGpuLvl);
            pr1.setString(4, MinCpu);
            pr1.setInt(5, RecCpuLvl);
            pr1.setInt(6, MinRam);
            
            pr2.setString(1, Code);
            pr2.setString(2, RecGpu);
            pr2.setInt(3, RecGpuLvl);
            pr2.setString(4, RecCpu);
            pr2.setInt(5, RecCpuLvl);
            pr2.setInt(6, RecRam);
            
            int a = pr.executeUpdate();
            int b = pr1.executeUpdate();
            int c = pr2.executeUpdate();
            
            if(a > 0 && b > 0 && c > 0)
            {
                RequestDispatcher rd = request.getRequestDispatcher("viewGames.jsp");
                request.setAttribute("return", "Added Item Succesfully.");
                rd.forward(request, response);
                    
                pr.close();
                pr1.close();
                pr2.close();
                con.close();
            }
            else
            {
                RequestDispatcher rd = request.getRequestDispatcher("addGame.jsp");
                request.setAttribute("return", "Added Item Succesfully.");
                rd.forward(request, response);
            }
            
        }
        catch(Exception e)
        {
            System.out.println(e.getCause());
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
    
    private void processFormField(FileItem item)
    {
        if(item.getFieldName().equals("AppName"))
        {
            AppName = item.getString();
        }
        else if(item.getFieldName().equals("RecRam"))
        {
            String a = item.getString();
            RecRam = Integer.parseInt(a);
        }
        else if(item.getFieldName().equals("Code"))
        {
            Code = item.getString();
        }
        else if(item.getFieldName().equals("MinCpu"))
        {
            MinCpu = item.getString();
        }
        else if(item.getFieldName().equals("RecCpu"))
        {
            RecCpu = item.getString();
        }
        else if(item.getFieldName().equals("MinGpu"))
        {
            MinGpu = item.getString();
        }
        else if(item.getFieldName().equals("RecGpu"))
        {
            RecGpu = item.getString();
        }
        else if(item.getFieldName().equals("MinCpuLvl"))
        {
            String a = item.getString();
            MinCpuLvl = Integer.parseInt(a);
        }
        else if(item.getFieldName().equals("RecCpuLvl"))
        {
            String a = item.getString();
            RecCpuLvl = Integer.parseInt(a);
        }
        else if(item.getFieldName().equals("MinGpuLvl"))
        {
            String a = item.getString();
            MinGpuLvl = Integer.parseInt(a);
        }
        else if(item.getFieldName().equals("RecGpuLvl"))
        {
            String a = item.getString();
            RecGpuLvl = Integer.parseInt(a);
        }
        else if(item.getFieldName().equals("MinRam"))
        {
            String a = item.getString();
            MinRam = Integer.parseInt(a);
        }
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
