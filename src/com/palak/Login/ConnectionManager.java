package com.palak.Login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ConnectionManager {
	 static Connection con; 
	 public static  Connection makeConnection()
	 {
	 try
     {
    //Class.forName("com.mysql.jdbc.Driver");
     Class.forName("com.mysql.jdbc.Driver");
     con= DriverManager.getConnection("jdbc:mysql://localhost/minor2","root", "");
     System.out.print("Database is connected !");
     }
     catch(Exception e)
     {
     System.out.print("Could not connect to DB - Error:"+e);
     }
	 return con;
	 }
}
