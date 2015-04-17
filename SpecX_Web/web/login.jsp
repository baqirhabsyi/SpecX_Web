<%-- 
    Document   : login
    Created on : Apr 15, 2015, 9:14:44 PM
    Author     : Rio7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css-js/login.css">
        <title>SPECX: Webmaster</title>
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
                WEBMASTER
            </h2>
            <hr></hr>
      <form method="POST" action="login">
        <h1>Please enter your credentials.</h1>
            <table>
                <tr>
                    <td>Username</td>
                    <td>&nbsp;<input type="text" id="username" name="username"/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>&nbsp;<input type="password" id="password" name="password"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="login"/></td>
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
                    <a class= "nostyle" href="#">WEBMASTER ?</a>
                </span>
            </div>
        </div>
    </body>
</html>
