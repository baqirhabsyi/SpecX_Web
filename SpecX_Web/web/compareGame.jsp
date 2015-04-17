<%-- 
    Document   : comparegame
    Created on : Apr 15, 2015, 8:57:24 PM
    Author     : Rio7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*, java.io.*, java.util.*, javax.servlet.*" %>
<%@page import ="config.Connect, model.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css-js/comparegame.css">
        <link rel="stylesheet" type="text/css" href="css-js/toolkit.css">
        <link rel="stylesheet" type="text/css" href="css-js/dhtmlxcombo.css">
        <script src="../codebase/dhtmlxcombo.js"></script>
        <title>SPECX: Compare Game</title>
    </head>
    <body>
    <form method="post" action="compareGame">
        <header>
            <div class="nav">
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="#">Run Now</a></li>
                    <li><a href="aboutus.jsp">About Us</a></li>
                    <li><a href="tos.jsp">Terms of Service</a></li>
                    <li><a href="contactus.jsp">Contact Us</a></li>
                </ul>
            </div>
        </header>
         <div class='contentFake'>
            <h2 class="centered">
                Compare Game
            </h2>
            <hr></hr>
        <div class="grid">
            <div class="col span-12">
                <div class="centered">
                    Select Your game.
                </div>
            </div>
            </br></br>
            <div class="col span-3" ></div>
            <div class="col span-3" >
                <table class="table" style="color: black">
                    <thead>
                    <th>Game Name</th>
                    <th>Action</th>
                    </thead>
                    <tbody>
                        <%
                            try
                            {
                                Connect obj_con = new Connect();
                                Connection con = obj_con.Open();
                                ResultSet rs = null;
                                String sql = "select AppName, MinReqCode from Application_Names";
                                Statement stmt = con.createStatement();
                                rs = stmt.executeQuery(sql);
                                while(rs.next())
                                {
                                    String Code = rs.getString("MinReqCode");
                                    String nama = rs.getString("AppName");
                                    out.println("<tr>");
                                    out.print("<td>"+nama+"</td>");
                                    out.print("<td><a href = compareConfirmation.jsp?"+Code+">TITIT</a></td>");
                                }
                                stmt.close();
                                con.close();
                            }
                            catch(Exception e)
                            {
                                System.out.println(e.getMessage());
                            }
                        %>
                    </tbody>
                </table>
<!--                        <select id="combo_zone1" style="width:200px; color: black;" name="combo_zone1" >
                            <%
                                String option;
                                int i = 1;
                                
                                Connect obj_con = new Connect();
                                Connection con = obj_con.Open();

                                String sql = "select * from Application_Names";
                                Statement stmt = con.createStatement();
                                ResultSet rs = stmt.executeQuery(sql);
                                while(rs.next())
                                {
                                    option = rs.getString(1);
                                    out.println("<option value="+i+">"+option+"</option>");
                                    i = i+1;
                                }
                            %>
                        </select>
                        
            </div>
                        <div class="col span-3" >
                            <input type="submit" value="Check Now!"/>
                        </div>-->
        </div>
            </div>
        <br></br>
        <div class="footer">
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
        <script type="text/javascript" src="css-js/jquery.autocomplete.js"></script>
        <script>
            
            
//            function eek({
//                var z=dhtmlXComboFromSelect("combo_zone1");
//                z.enableFilteringMode(true);
//                
//            });
//            })
//            
//            $('#combo_zone1').eek();
//            
//            $(document).ready(eek);
        </script>
    </form>
    </body>
</html>
