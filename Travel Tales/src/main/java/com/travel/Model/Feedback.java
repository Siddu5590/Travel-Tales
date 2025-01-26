package com.travel.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.travel.Entity.Reviews;

import jakarta.servlet.http.HttpSession;
public class Feedback {

	Connection con;
	HttpSession se;
	
	public Feedback(HttpSession session) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_tales","root","tiger");
			
			se=session;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	//adding feedback details into db
	public String insertFeedback(String name, String phone, String email, String review, String rating) {
		Statement st=null;
		String status="";
		ResultSet rs=null;
		PreparedStatement ps=null;
		
		
		try {
			st=con.createStatement();
			ps=con.prepareStatement("insert into feedback values(0,?,?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, phone);
			ps.setString(4, review);
			ps.setString(5, rating);
			
			int a=ps.executeUpdate();
			if(a>0)
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
	
	//retreving all reviews from db
	public ArrayList<Reviews> viewReview()
	{
		Statement st=null;
		ResultSet rs=null;
		ArrayList<Reviews> review=new ArrayList<>();
		
		try {
			st=con.createStatement();
			rs=st.executeQuery("select * from feedback");
			while(rs.next())
			{
				Reviews r=new Reviews();
				r.setFeedback_id(rs.getInt(1));
				r.setC_name(rs.getString(2));
				r.setC_email(rs.getString(3));
				r.setPhone(rs.getString(4));
				r.setMessage(rs.getString(5));
				r.setRating(rs.getString(6));
				review.add(r);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return review;
		
	}

	
	//deleting reviews from db
	public String deleteReview(int id) {
		Statement st=null;
		String status="";
		int count=0;
		
		try {
			st=con.createStatement();
			count=st.executeUpdate("delete from feedback where id='"+id+"'");
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
}
