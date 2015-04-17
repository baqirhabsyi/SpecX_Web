<%-- 
    Document   : getdata
    Created on : Apr 15, 2015, 8:49:41 PM
    Author     : Rio7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css-js/getdata.css">
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
                Get Data
            </h2>
            <hr></hr>
        <form method="GET" action="getData">
            <input type="submit" name="sesuatu"/>
            <div class="loader bar-wave">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <span></span>

                <div class="loader-message">
                    Getting your PC Data... Hang in there!
                </div>
            </div>
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
