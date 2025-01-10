package com.travel.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import jakarta.servlet.http.HttpSession;

public class Register {

	private Connection con;
	HttpSession se;
	
	public Register(HttpSession session) {
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

	public String signup(String name,String phone,String mail,String password) {
		String status="";
		PreparedStatement ps=null;
		
		try {
		Statement st=null;
		ResultSet rs=null;
		
		st=con.createStatement();
		rs=st.executeQuery("select * from customer where phone='"+phone+"' or email='"+mail+"';");
		
		boolean res=rs.next();
		if(res==true) {
			status="existed";
		}
		else {
			ps=con.prepareStatement("insert into customer values(0,?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, phone);
			ps.setString(3, mail);
			ps.setString(4, password);
			
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

	public String login(String mail, String password) {
		String status = "", email = "", name = "", id = "",phone="";
		
			try {
				
				Statement st = null;
				ResultSet rs = null;
				st = con.createStatement();
				rs = st.executeQuery("select * from customer where email='" + mail + "' and password='" + password + "';");
				boolean b = rs.next();
				if (b == true) {
					id = rs.getString("id");
					name = rs.getString("name");
					email = rs.getString("email");
					phone=rs.getString("phone");
					
					se.setAttribute("uname", name);
					se.setAttribute("email", email);
					se.setAttribute("id", id);
					se.setAttribute("phone", phone);
					status = "success";
				} else
					status = "failure";
			} catch (Exception e) {
				e.printStackTrace();
			
		}
		return status;
	}

	public String forgotPass(String email, String password) {
		PreparedStatement ps;
		String status = "";
		
			try {
				Statement st = null;
				ResultSet rs = null;
				st = con.createStatement();
				ps = (PreparedStatement) con.prepareStatement("update customer set password=? where email=?");
				ps.setString(1, password);
				ps.setString(2, email);
				int a = ps.executeUpdate();
				if (a > 0)
					status = "success";
				else
					status = "failed";
			} catch (Exception e) {
				e.printStackTrace();
			}
			return status;
		
			
		}
	
}
