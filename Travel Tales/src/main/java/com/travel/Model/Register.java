package com.travel.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.travel.Entity.Customer;

import jakarta.servlet.http.HttpSession;

public class Register {
	

	Customer c=new Customer();
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
		String status1="" ,id="";
		String uname="" ,emails="";
		String phones="";
		String query="SELECT * FROM CUSTOMER WHERE EMAIL='"+mail +"'and Password='"+password+"';";

		try {
		Statement st=null;
		ResultSet rs=null;
		st=con.createStatement();
		rs=st.executeQuery(query);
		boolean b=rs.next();
		if(b==true) {
			id=rs.getString("id");
			uname=rs.getString("name");
			emails=rs.getString("email");
			phones=rs.getString("phone");
			se.setAttribute("uname", uname);
			se.setAttribute("email", emails);
			se.setAttribute("phone", phones);
			se.setAttribute("id", id);
			
			status1="success";
			
		}
		else {
			status1="failure";
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return status1;
		
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
	
	

