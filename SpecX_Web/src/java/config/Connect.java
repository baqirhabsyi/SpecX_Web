/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author Baqir
 */
public class Connect 
{
    Connection con;
    public Connection Open()
    {
        try
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:29791;databaseName=SpecX2";
            con = DriverManager.getConnection(url,"sa","jangofett");
            return con;
        }
        catch(ClassNotFoundException | SQLException e)
        {
            return null;
        }
    }
}
