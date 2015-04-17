<%-- 
    Document   : compareConfirmation
    Created on : 17-Apr-2015, 14:36:21
    Author     : Baqir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String Code = request.getQueryString();
    %>
    <body>
        <form method="post" action="compareGame">
        <h1>Comparing <%=Code%> With your PC.</h1>
            <table align="center">
                <tr>
                    <td colspan="2">
                        <input type="hidden" id="Code" name="Code" value="<%=Code%>"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        This action will result in the comaparation of the selected data entry from the database. Continue?
                    </td>
                </tr>
                <tr>
                    <td align="left"><input type="submit" value="compare"</td>
                    <td align="right"><a href="compareGame.jsp"><input type="button" value="Cancel"/></a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
