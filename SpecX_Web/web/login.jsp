<%-- 
    Document   : login
    Created on : 14-Apr-2015, 10:33:45
    Author     : Baqir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
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
    </body>
</html>
