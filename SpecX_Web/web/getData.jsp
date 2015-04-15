<%-- 
    Document   : getData
    Created on : 14-Apr-2015, 11:50:25
    Author     : Baqir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css-js/toolkit.css">
        <title>Getting your data.</title>
    </head>
    <body>
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
    </body>
</html>
