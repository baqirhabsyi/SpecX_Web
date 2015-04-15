<%-- 
    Document   : resultCompareMin
    Created on : 15-Apr-2015, 15:23:09
    Author     : Baqir
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
        <title>JSP Page</title>
    </head>
    <body>
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
        <h1>Hello World!</h1>
    </body>
</html>
