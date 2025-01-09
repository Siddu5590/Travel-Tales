package com.travel.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import jakarta.servlet.http.HttpSession;

public class Customer {

	private Connection con;
	HttpSession se;
	
	public Customer(HttpSession session) {
		String url="jdbc:mysql://localhost:3306/travel_tales";
		String user="root";
		String pass="tiger";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			con=DriverManager.getConnection(url,user,pass);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String signup(String name,String phone,String mail,String password) {
		
		return null;
	}
}
