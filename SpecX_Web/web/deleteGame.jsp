<%-- 
    Document   : deleteGame
    Created on : 15-Apr-2015, 09:23:02
    Author     : Baqir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.Connect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Game</title>
    </head>
    <body>
        <form action="deleteGame" method="post">
            <%
            Connect obj_con = new Connect();
            ResultSet rs = null;
            
            String Code = "";
            String MinCpu = "";
            String RecCpu = "";
            String MinGpu = "";
            String RecGpu = "";
            
            int MinCpuLvl = 0;
            int RecCpuLvl = 0;
            int MinGpuLvl = 0;
            int RecGpuLvl = 0;
            int MinRam = 0;
            int RecRam = 0;
            
            Code = request.getQueryString();
            try
            {
                Connection con = obj_con.Open();
                //String sql = "select * from required_Specs where AppName = ?";
                
                String sql = "select a.Code, a.AppReqGpuNameMin, a.AppReqGpuLevelMin, a.AppReqCpuNameMin, a.AppReqCpuLevelMin, a.AppReqRamMin, b.AppReqGpuNameRec, b.AppReqGpuLevelRec, b.AppReqCpuNameRec, b.AppReqCpuLevelRec, b.AppReqRamRec from required_Minimum a join required_Recomended b on a.Code = b.Code where a.Code = ?";
                
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, Code);
                rs = ps.executeQuery();
                if(rs.next())
                {
                    MinGpu = rs.getString("AppReqGpuNameMin");
                    RecGpu = rs.getString("AppReqGpuNameRec");
                    MinCpu = rs.getString("AppReqCpuNameMin");
                    RecCpu = rs.getString("AppReqCpuNameRec");
                    
                    MinCpuLvl = rs.getInt("AppReqCpuLevelMin");
                    RecCpuLvl = rs.getInt("AppReqCpuLevelMin");
                    MinGpuLvl = rs.getInt("AppReqGpuLevelMin");
                    RecGpuLvl = rs.getInt("AppReqGpuLevelRec");
                    
                    MinRam = rs.getInt("AppReqRamMin");
                    RecRam = rs.getInt("AppReqRamRec");
                }
            }
            catch(Exception ex)
            {
               out.println(ex.getMessage());
            }
            %>
            
            <h1>Removing <%=Code%> from Database.</h1>
            <table align="center">
                <tr>
                    <td colspan="2">
                        <input type="hidden" id="Code" name="Code" value="<%=Code%>"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        This action will result in the deletion of the selected data entry from the database. Continue?
                    </td>
                </tr>
                <tr>
                    <td align="left"><input type="submit" value="delete"</td>
                    <td align="right"><a href="viewGames.jsp"><input type="button" value="Cancel"/></a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
