<%-- 
    Document   : editGames
    Created on : 31-Mar-2015, 15:53:41
    Author     : Baqir
--%>
<%@page import="java.sql.*" %>
<%@page import="config.Connect" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Game Data</title>
    </head>
    <body>
        <%
            Connect obj_con = new Connect();
            ResultSet rs = null;
            
            String AppName = "";
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
            
            AppName = request.getQueryString();
            try
            {
                Connection con = obj_con.Open();
                String sql = "select * from required_Specs where AppName = ?";
                
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, AppName);
                rs = ps.executeQuery();
                if(rs.next())
                {
                    MinGpu = rs.getString("AppReqGpuNameMin");
                    RecGpu = rs.getString("AppReqGpuNameRec");
                    MinCpu = rs.getString("AppReqCpuNameMin");
                    RecCpu = rs.getString("AppReqCpuNameRec");
                    
                    MinCpuLvl = rs.getInt("");
                }
            }
            catch(Exception ex)
            {
               out.println(ex.getMessage());
            }
            
        %>
        <h1>Editing Data Page.</h1>
        <form name="frmEdit" method="post" action="editGames">
            <table border="1" align="center">
                <tr>
                    <td width="100"><label>Game Name</label></td>
                    <td><input type="text" id="appName" name="AppName" size="30" value="<%=AppName%>"/></td>
                </tr>
                <tr>
                    <td width
                </tr>
            </table>
        </form>
    </body>
</html>
