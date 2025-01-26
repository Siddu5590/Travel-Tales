package com.travel.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.travel.Entity.Guide;

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
	
	//inserting guide details into db
	public String addguide(String name,String phone,String mail,String age, String city) {
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
			ps=con.prepareStatement("insert into guide values(0,?,?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, phone);
			ps.setString(3, mail);
			ps.setString(4, age);
			ps.setString(5, city);
		
			
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
	
	//retreving guide details from db
	public ArrayList<Guide> viewGuide(){
		Statement st=null;
		ResultSet rs=null;
		ArrayList<Guide> guide = new ArrayList<>();
		
		try {
			st=con.createStatement();
			
			rs=st.executeQuery("select * from guide");
			while(rs.next())
			{
				Guide g=new Guide();
				g.setGuide_id(rs.getInt("guide_id"));
				g.setGuide_name(rs.getString("name"));
				g.setGuide_email(rs.getString("email"));
				g.setGuide_phone(rs.getString("phone"));
				g.setGuide_age(rs.getString("age"));
				g.setLocation(rs.getString("location"));
				guide.add(g);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return guide;
	}

	//deleting guide details from db
	public String deleteguide(int id) {
		Statement st=null;
		String status="";
		int count=0;
		
		
		try {
			st=con.createStatement();
			count=st.executeUpdate("delete from guide where guide_id='"+id+"';");
			
			if(count>0)
			{
				status="success";
				
			}
			else {
				status="failure";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return status;
	}
	
	//retreving guide details from db based on guide id
	public ArrayList<Guide> viewGuide(int id){
		Statement st=null;
		ResultSet rs=null;
		ArrayList<Guide> guide = new ArrayList<>();
		
		try {
			st=con.createStatement();
			
			rs=st.executeQuery("select * from guide where guide_id='"+id+"'");
			while(rs.next())
			{
				Guide g=new Guide();
				g.setGuide_id(rs.getInt("guide_id"));
				g.setGuide_name(rs.getString("name"));
				g.setGuide_email(rs.getString("email"));
				g.setGuide_phone(rs.getString("phone"));
				g.setGuide_age(rs.getString("age"));
				g.setLocation(rs.getString("location"));
				guide.add(g);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return guide;
	}

	//updating guide details into db
	public String updateGuide(int id, String name, String phone, String email, int age, String city) {
		Statement st=null;
		String status="";
		ResultSet rs=null;
		int count=0;
		try {
			st=con.createStatement();
      
			
			count=st.executeUpdate("update guide set name='"+name+"',phone='"+phone+"',email='"+email+"',age='"+age+"',location='"+city+"' where guide_id='"+id+"'");
			
			if(count>0) {
				status="success";
			}
			else {
				status="failure";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return status;
	}
	
	
}
