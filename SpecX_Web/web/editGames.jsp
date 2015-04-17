<%-- 
    Document   : editgames
    Created on : Apr 15, 2015, 8:41:46 PM
    Author     : Rio7
--%>

<%@page import="java.sql.*" %>
<%@page import="config.Connect" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css-js/editgame.css">
        <title>SPECX: Edit Game Data</title>
    </head>
    <body>
        <header>
            <div class="nav">
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Run Now</a></li>
                    <li><a href="aboutus.jsp">About Us</a></li>
                    <li><a href="tos.jsp">Terms of Service</a></li>
                    <li><a href="contactus.jsp">Contact Us</a></li>
                </ul>
            </div>
        </header>
        <div class='contentFake'>
            <h2 class="centered">
                Edit Game
            </h2>
            <hr></hr>
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
        <h1>Editing Data Page.</h1>
        <form name="frmEdit" method="post" enctype="multipart/form-data" action="editgames">
            <table border="1" align="center">
                <tr>
                    <td width="100"><label>Game Name</label></td>
                    <td><input type="text" id="Code" name="Code" size="30"  value="<%=Code%>"/></td>
                </tr>
                <tr>
                    <td width="100"><label>Minimum Required GPU</label></td>
                    <td><textarea id="MinGpu" name="MinGpu" rows="5" cols="30"><%=MinGpu%></textarea></td>
                </tr>
                <tr>
                    <td width="100"><label>Minimum Required GPU Level</label></td>
                    <td><input type="number" id="MinGpuLvl" name="MinGpuLvl" value="<%=MinGpuLvl%>"</td>
                </tr>
                <tr>
                    <td width="100"><label>Recommended GPU</label></td>
                    <td><textarea id="RecGpu" name="RecGpu"><%=RecGpu%></textarea></td>
                </tr>
                <tr>
                    <td width="100"><label>Recommended GPU Level</label></td>
                    <td><input type="number" id="RecGpuLvl" name="RecGpuLvl" value="<%=RecGpuLvl%>"/></td>
                </tr>
                <tr>
                    <td width="100"><label>Minimum Required CPU</label></td>
                    <td><textarea id="MinCpu" name="MinCpu" rows="5" cols="30"><%=MinCpu%></textarea></td>
                </tr>
                <tr>
                    <td width="100"><label>Minimum Required CPU Level</label></td>
                    <td><input type="number" id="MinCpuLvl" name="MinCpuLvl" value="<%=MinCpuLvl%>"</td>
                </tr>
                <tr>
                    <td width="100"><label>Recommended CPU</label></td>
                    <td><textarea id="RecCpu" name="RecCpu" value=""><%=RecCpu%></textarea></td>
                </tr>
                <tr>
                    <td width="100"><label>Recommended CPU Level</label></td>
                    <td><input type="number" id="RecCpuLvl" name="RecCpuLvl" value="<%=RecCpuLvl%>"/></td>
                </tr>
                <tr>
                    <td width="100"><label>Minimum Required RAM (in MB)</label></td>
                    <td><input type="number" id="MinRam" name="MinRam" value="<%=MinRam%>"/></td>
                </tr>
                <tr>
                    <td width="100"><label>Recommended RAM (in MB)</label></td>
                    <td><input type="number" id="RecRam" name="RecRam" value="<%=RecRam%>"/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="edit"/></td>
                </tr>
            </table>
        </form>
        </div>
        <br></br>
        <div class='footer'>
            <div class='bawah'>
                <span>
                    Copyright © SpecX.com 2015 -
                    <a class= "nostyle" href="#">Privacy Policy</a> -
                    <a class= "nostyle" href="#">Powered by System Requirements Lab</a> -
                    <a class= "nostyle" href="#">Reddit</a> -
                    <a class= "nostyle" href="#">Youtube</a> -
                    <a class= "nostyle" href="login.jsp">WEBMASTER ?</a>
                </span>
            </div>
        </div>
    </body>
</html>
