/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package config;

import java.sql.Connection;
import java.sql.DriverManager;
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
            String url = "jdbc:sqlserver://localhost:29791;databaseName=SpecX";
            con = DriverManager.getConnection(url,"sa","jangofett");
            return con;
        }
        catch(Exception e)
        {
            return null;
        }
    }
}
