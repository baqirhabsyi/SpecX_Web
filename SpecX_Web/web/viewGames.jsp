<%-- 
    Document   : viewGames
    Created on : 31-Mar-2015, 14:14:34
    Author     : Baqir
--%>

<%@page import ="java.sql.*" %>
<%@page import ="config.Connect" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">
        <title>Games Data</title>
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
    </head>
    <body class="dt-example">
        <div class="container">
            <section>
                <h1>DataTables example <span>Base style</span></h1>
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
                                String sql = "select * from required_Specs";
                                Statement stmt = con.createStatement();
                                rs = stmt.executeQuery(sql);
                                while(rs.next())
                                {
                                    String id = rs.getString("AppName");
                                    out.println("<tr>");
                                    out.print("<td>"+rs.getString("AppName")+"</td>");
                                    out.print("<td>"+rs.getString("AppReqGpuNameMin")+"</td>");
                                    out.print("<td>"+rs.getString("AppReqGpuNameRec")+"</td>");
                                    out.print("<td>"+rs.getString("AppReqCpuNameMin")+"</td>");
                                    out.print("<td>"+rs.getString("AppReqCpuNameRec")+"</td>");
                                    out.print("<td>"+rs.getString("AppReqRamMin")+" MB</td>");
                                    out.print("<td>"+rs.getString("AppReqRamRec")+" MB</td>");
                                    out.print("<td><a href=editGames.jsp?"+id+">Edit Game Data");
                                    out.print("</a> | <a href=deleteGame.jsp"+id+">Delete Game Data");
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
    </body>
</html>
