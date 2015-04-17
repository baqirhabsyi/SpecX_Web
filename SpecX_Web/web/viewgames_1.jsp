<%-- 
    Document   : viewgames
    Created on : Apr 15, 2015, 9:37:55 PM
    Author     : Rio7
--%>

<%@page import ="java.sql.*" %>
<%@page import ="config.Connect" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">
        <title>SPECX: Games Data</title>
        <link rel="stylesheet" type="text/css" href="css-js/viewgames.css">
        <link rel="stylesheet" type="text/css" href="media/css/jquery.dataTables.css"/>
        <link rel="stylesheet" type="text/css" href="resources/syntax/shCore.css">
        <link rel="stylesheet" type="text/css" href="resources/demo.css">
        <style type="text/css" class="init"></style>
        
        <script type="text/javascript" language="javascript" src="media/js/jquery.js"></script>
        <script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.js"></script>
        <script type="text/javascript" language="javascript" src="resources/syntax/shCore.js"></script>
        <script type="text/javascript" language="javascript" src="resourses/demo.js"></script>
        <script type="text/javascript" language="javascript" class="init">
            $(document).ready(function()
            {
                $('#example').dataTable();
            });
        </script>
        <title>SPECX: View Games</title>
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
                VIEW GAMES
            </h2>
            <hr></hr>
            <div class="dt-example">
                <div class="container">
            <section>
                <h1>Data Game</h1>
                <table id="example" class="display" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Application Name</th>
                            <th>Minimum Required GPU</th>
                            <th>Recommended GPU</th>
                            <th>Minimum Required CPU</th>
                            <th>Recommended CPU</th>
                            <th>Minimum Required RAM</th>
                            <th>Recommended RAM</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <%
                            try
                            {
                                Connect obj_con = new Connect();
                                Connection con = obj_con.Open();
                                ResultSet rs = null;
                                String sql = "select a.Code, a.AppReqGpuNameMin, a.AppReqGpuLevelMin, a.AppReqCpuNameMin, a.AppReqCpuLevelMin, a.AppReqRamMin, b.AppReqGpuNameRec, b.AppReqGpuLevelRec, b.AppReqCpuNameRec, b.AppReqCpuLevelRec, b.AppReqRamRec from required_Minimum a join required_Recomended b on a.Code = b.Code";
                                Statement stmt = con.createStatement();
                                rs = stmt.executeQuery(sql);
                                while(rs.next())
                                {
                                    String id = rs.getString("Code");
                                    out.println("<tr>");
                                    out.print("<td>"+id+"</td>");
                                    out.print("<td>"+rs.getString("AppReqGpuNameMin")+"</td>");
                                    out.print("<td>"+rs.getString("AppReqGpuNameRec")+"</td>");
                                    out.print("<td>"+rs.getString("AppReqCpuNameMin")+"</td>");
                                    out.print("<td>"+rs.getString("AppReqCpuNameRec")+"</td>");
                                    out.print("<td>"+rs.getString("AppReqRamMin")+" MB</td>");
                                    out.print("<td>"+rs.getString("AppReqRamRec")+" MB</td>");
                                    out.print("<td><a href=editGames.jsp?"+id+">Edit Game Data");
                                    out.print("</a> | <a href=deleteGame.jsp?"+id+">Delete Game Data");
                                    out.print("</a> | <a href=compareGame.jsp?"+id+"Test Compare to PC Data</a>");
                                    out.print("</tr>");
                                }
                                stmt.close();
                                con.close();
                            }
                            catch(Exception ex)
                            {
                                out.println(ex.getMessage());
                            }
                        %>
                    </tbody>
                </table>
            </section>
        </div>
                </div>
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
