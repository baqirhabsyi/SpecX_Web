<%-- 
    Document   : addGame
    Created on : 14-Apr-2015, 09:16:12
    Author     : Baqir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Game Data</title>
    </head>
    <body>
        <form method="post" enctype="multipart/form-data" action="addGame">
        <h1>Adding Game Data</h1></br>
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
                    <td colspan="2"><input type="submit" value="addd"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
