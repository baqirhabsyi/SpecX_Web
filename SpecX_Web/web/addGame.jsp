<%-- 
    Document   : addgame
    Created on : Apr 15, 2015, 8:15:51 PM
    Author     : Rio7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css-js/addgame.css">
        <title>SPECX: Add Game Data</title>
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
                Add Game
            </h2>
            <hr></hr>
            <form method="post" enctype="multipart/form-data" action="addgame">
        <table border="1" align="center">
                <tr>
                    <td width="100"><label>Game Name</label></td>
                    <td><input type="text" id="AppName" name="AppName" size="30" required/></td>
                </tr>
                <tr>
                    <td width="100"><label>Game Name</label></td>
                    <td><input type="text" id="Code" name="Code" size="30" required/></td>
                </tr>
                <tr>
                    <td width="100"><label>Minimum Required GPU</label></td>
                    <td><textarea id="MinGpu" name="MinGpu" rows="5" cols="30" required></textarea></td>
                </tr>
                <tr>
                    <td width="100"><label>Minimum Required GPU Level</label></td>
                    <td><input type="number" id="MinGpuLvl" name="MinGpuLvl" required</td>
                </tr>
                <tr>
                    <td width="100"><label>Recommended GPU</label></td>
                    <td><textarea id="RecGpu" name="RecGpu" required></textarea></td>
                </tr>
                <tr>
                    <td width="100"><label>Recommended GPU Level</label></td>
                    <td><input type="number" id="RecGpuLvl" name="RecGpuLvl" required/></td>
                </tr>
                <tr>
                    <td width="100"><label>Minimum Required CPU</label></td>
                    <td><textarea id="MinCpu" name="MinCpu" rows="5" cols="30" required></textarea></td>
                </tr>
                <tr>
                    <td width="100"><label>Minimum Required CPU Level</label></td>
                    <td><input type="number" id="MinCpuLvl" name="MinCpuLvl" required</td>
                </tr>
                <tr>
                    <td width="100"><label>Recommended CPU</label></td>
                    <td><textarea id="RecCpu" name="RecCpu" required></textarea></td>
                </tr>
                <tr>
                    <td width="100"><label>Recommended CPU Level</label></td>
                    <td><input type="number" id="RecCpuLvl" name="RecCpuLvl" required/></td>
                </tr>
                <tr>
                    <td width="100"><label>Minimum Required RAM (in MB)</label></td>
                    <td><input type="number" id="MinRam" name="MinRam" required/></td>
                </tr>
                <tr>
                    <td width="100"><label>Recommended RAM (in MB)</label></td>
                    <td><input type="number" id="RecRam" name="RecRam" required/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="add"/></td>
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
