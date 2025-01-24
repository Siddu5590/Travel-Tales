package com.travel.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.mysql.cj.xdevapi.Statement;

import jakarta.servlet.http.HttpSession;

public class bookingDAO {
	private Connection con;
	HttpSession se;
	
	public bookingDAO(HttpSession session)
	{
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_tales", "root", "tiger");
		}catch(Exception e)
		{
			e.printStackTrace();
		}	
	}
	public String addBooking(String name,String ph,String email,String city,int noPl,String date,Double cost,String desc, String loc,String bookDate)
	{
		
		PreparedStatement ps=null;
		String status="";
		try {
			ps=(PreparedStatement) con.prepareStatement("insert into booking (booking_id,uname, phone, email,no_of_people, cost, city, book_date,travel_date,pickup_location ,status,description) values(0,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1,name);
			ps.setString(2,ph);
			ps.setString(3,email);
			ps.setInt(4,noPl);
			ps.setDouble(5,cost);
			//System.out.println(city);
			ps.setString(6,city);
			ps.setString(7,bookDate);
			ps.setString(8,date);
			ps.setString(9,loc);
			ps.setString(10,"pending");
			ps.setString(11,desc);
			int a=ps.executeUpdate();
			if(a>0)
				status="success";
			else
				status="failure";
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
		
	}
}
