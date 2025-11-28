package com.happy_wallet.connectionpool;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DbConnect {
	
	private DbConnect() {
		
	}
	public static Connection connect() {
		
		Connection con=null;
	    try {
	        if (con == null || con.isClosed()) {
	            FileInputStream fin = new FileInputStream("C:\\Users\\ambar\\OneDrive\\Desktop\\Advance_java\\Full_stack_Java\\advancejava\\Happy Wallet- BankApplication\\src\\main\\java\\com\\happy_wallet\\connectionpool\\db.properties");
	            Properties prop = new Properties();
	            prop.load(fin);
	            String driverName = prop.getProperty("driverName");
	            String url = prop.getProperty("url");
	            String userName = prop.getProperty("username");
	            String pass = prop.getProperty("pass");
	            Class.forName(driverName);
	            con = DriverManager.getConnection(url, userName, pass);
	            System.out.println("Database connection established successfully");
	        }
	    } catch(ClassNotFoundException | SQLException | IOException e) {
	        e.printStackTrace();
	    }
	    return con;
	}


}
