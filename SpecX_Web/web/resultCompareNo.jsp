<%-- 
    Document   : resultcomparenormal
    Created on : Apr 15, 2015, 9:31:30 PM
    Author     : Rio7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="config.Connect" %>
<%@page import ="model.Check" %>
<%@page import ="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css-js/rcn.css">
        <title>SPECX: Result Normal</title>
    </head>
           <%
            String myCPU = "";
            String myGPU = "";
            String myRAM = "";
            String recCPU = "";
            String recGPU = "";
            String recRAM = "";
            String minCPU = "";
            String minGPU = "";
            String minRAM = "";
            String minHDD = "";

            try
                {
                Connect obj_con = new Connect();
                Connection con = obj_con.Open();
                
                String sql = "select tempdata from tempdata";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                
                rs.next();
                String Code = rs.getString(1);

                Check c = new Check();
                c.setCode(Code);
                ArrayList getData = c.runitData();
                for(int i = 0; i < getData.size() - 1; i+=9)
                {
                    myCPU = (String)getData.get(i);
                    myGPU = (String)getData.get(i+1);
                    myRAM = (String)getData.get(i+2);
                    recCPU = (String)getData.get(i+3);
                    recGPU = (String)getData.get(i+4);
                    recRAM = (String)getData.get(i+5);
                    minCPU = (String)getData.get(i+6);
                    minGPU = (String)getData.get(i+7);
                    minRAM = (String)getData.get(i+8);
                }
            }
            catch(Exception e)
            {
                System.out.println(e.getMessage());
            }
                
        %>
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
                Sorry, you can't run the game.
            </h2>
            <hr></hr>

        </div>
        <br></br>
        <div class="grid">
            <div class='col span-2'></div>
            <div class='col span-8'>
                <div class="tabs--horizontal" data-tab='anus'>
                    <nav class="tab-nav" data-tab-nav='anus'>
                        <ul>
                            <li><a href="#one">Your Specs</a></li>
                            <li><a href='#two'>Minimum Specs</a></li>
                            <li><a href="#three">Recommended Specs</a></li>
                        </ul>
                    </nav>
                    
                    <section class='tab-section' data-tab-section='anus'>
                        <table class="table is-striped large">
                            <thead>
                                <tr>
                                    <td>CPU</td>
                                    <td>GPU</td>
                                    <td>RAM</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><%=myCPU%></td>
                                    <td><%=myGPU%></td>
                                    <td><%=myRAM%> MB</td>
                                </tr>
                            </tbody>
                        </table>
                    </section>
                    <section class='tab-section' data-tab-section='anus'>
                        <table class="table is-striped large">
                            <thead>
                                <tr>
                                    <td>CPU</td>
                                    <td>GPU</td>
                                    <td>RAM</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><%=minCPU%></td>
                                    <td><%=minGPU%></td>
                                    <td><%=minRAM%> MB</td>
                                </tr>
                            </tbody>
                        </table>
                    </section>
                    <section class='tab-section' data-tab-section='anus'>
                        <table class="table is-striped large">
                            <thead>
                                <tr>
                                    <td>CPU</td>
                                    <td>GPU</td>
                                    <td>RAM</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><%=recCPU%></td>
                                    <td><%=recGPU%></td>
                                    <td><%=recRAM%> MB</td>
                                </tr>
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
        <script type="text/javascript" src="css-js/toolkit.js"></script>
        <script>
            var ti = function(){
                $('.tabs').tab();
            };
            
            $(document).ready(ti);
        </script>
    </body>
</html>
