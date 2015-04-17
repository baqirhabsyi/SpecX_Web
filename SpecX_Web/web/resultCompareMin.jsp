<%-- 
    Document   : resultcomparemin
    Created on : Apr 15, 2015, 9:28:14 PM
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
        <link rel="stylesheet" type="text/css" href="css-js/rcm.css">
        <title>SPECX: Result Minimum</title>
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
                YES YOU CAN RUN THE GAME
            </h2>
            <hr></hr>
      <%
            try
                {
                String myCPU, myGPU, myRAM, recCPU, recGPU, recRAM, minCPU, minGPU, minRAM, minHDD;

                Check c = new Check();

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
