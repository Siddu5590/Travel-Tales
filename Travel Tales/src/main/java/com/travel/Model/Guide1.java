package com.travel.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.http.HttpSession;

public class Guide1 {
	private Connection con;
	HttpSession se;
    
	public Guide1(HttpSession session) {
		String url="jdbc:mysql://localhost:3306/travel_tales";
		String user="root";
		String pass="tiger";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			con=DriverManager.getConnection(url,user,pass);
			
			se=session;
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	public String addguide(String name,String phone,String mail,String age) {
		String status="";
		PreparedStatement ps=null;
		
		try {
		Statement st=null;
		ResultSet rs=null;
		
		st=con.createStatement();
		rs=st.executeQuery("select * from guide where phone='"+phone+"' or email='"+mail+"';");
		
		boolean res=rs.next();
		if(res==true) {
			status="existed";
		}
		else {
			ps=con.prepareStatement("insert into guide values(0,?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, phone);
			ps.setString(3, mail);
			ps.setString(4, age);
		
			
			int a=ps.executeUpdate();
			if(a>0) {
				status="success";
			}
			else {
				status="failure";
			}
		}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return status;
	}

}
