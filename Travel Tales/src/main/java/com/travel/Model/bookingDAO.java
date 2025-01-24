package com.travel.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.travel.Entity.Booking;

import jakarta.servlet.http.HttpSession;

public class bookingDAO {
	private Connection con;
	HttpSession se;
	
	public bookingDAO(HttpSession session)
	{
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_tales", "root", "tiger");
		se=session;
		}catch(Exception e)
		{
			e.printStackTrace();
		}	
	}
	public String addBooking(int user_id, String name,String ph,String email,String city,int noPl,String date,Double cost,String desc, String loc,String bookDate)
	{
		
		PreparedStatement ps=null;
		String status="";
		try {
			ps=(PreparedStatement) con.prepareStatement("insert into booking (booking_id,uname, phone, email,no_of_people, cost, city, book_date,travel_date,pickup_location ,status,description,user_id) values(0,?,?,?,?,?,?,?,sysdate(),?,?,?,?)");
			ps.setString(1,name);
			ps.setString(2,ph);
			ps.setString(3,email);
			ps.setInt(4,noPl);
			ps.setDouble(5,cost);
			//System.out.println(city);
			ps.setString(6,city);
			ps.setString(7,date);
			ps.setString(8,loc);
			ps.setString(9,"pending");
			ps.setString(10,desc);
			ps.setInt(11, user_id);
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
	
	public ArrayList<Booking>  viewBookings()
	{
		PreparedStatement ps=null;
		ResultSet rs=null;
		ArrayList<Booking> book=new ArrayList<>();
		
		try {
			ps=(PreparedStatement) con.prepareStatement("select * from booking where user_id='"+se.getAttribute("id")+"'");
			rs=ps.executeQuery();
			while(rs.next())
			{
				Booking b=new Booking();
				b.setBooking_id(rs.getInt("booking_id"));
				b.setName(rs.getString("uname"));
				b.setEmail(rs.getString("email"));
				b.setPhone(rs.getString("phone"));
				b.setPeoples(rs.getInt("no_of_people"));
				b.setCost(rs.getDouble("cost"));
				b.setCity(rs.getString("city"));
				b.setBookk_date(rs.getString("book_date"));
				b.setTravel_date(rs.getString("travel_date"));
				b.setLocation(rs.getString("pickup_location"));
				b.setStatus(rs.getString("status"));
				b.setDesc(rs.getString("description"));
				b.setRemarks(rs.getString("remarks"));
				book.add(b);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return book;
		
	}
	//booking cancel method for user
	public String cancelBooking(int book_id)
	{
		Statement st=null;
		String status="";
		int count=0;
		try {
			st=con.createStatement();
			count=st.executeUpdate("update booking set status='Cancelled',remarks='Booking Cancel' where booking_id='"+book_id+"';");
			
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
	public ArrayList<Booking>  getBookings()
	{
		PreparedStatement ps=null;
		ResultSet rs=null;
		ArrayList<Booking> book=new ArrayList<>();
		
		try {
			ps=(PreparedStatement) con.prepareStatement("select * from booking");
			rs=ps.executeQuery();
			while(rs.next())
			{
				Booking b=new Booking();
				b.setBooking_id(rs.getInt("booking_id"));
				b.setName(rs.getString("uname"));
				b.setEmail(rs.getString("email"));
				b.setPhone(rs.getString("phone"));
				b.setPeoples(rs.getInt("no_of_people"));
				b.setCost(rs.getDouble("cost"));
				b.setCity(rs.getString("city"));
				b.setBookk_date(rs.getString("book_date"));
				b.setTravel_date(rs.getString("travel_date"));
				b.setLocation(rs.getString("pickup_location"));
				b.setStatus(rs.getString("status"));
				b.setDesc(rs.getString("description"));
				book.add(b);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return book;
		
	}
	//booking confirmed admin
	public String confirmBooking(int id) {
		Statement st=null;
		String status="";
		int count=0;
		try {
			st=con.createStatement();
			count=st.executeUpdate("update booking set status='Confirmed',remarks='Your Booking Confirmed' where booking_id='"+id+"';");
			
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
	
	//admin booking cancel
	public String admincancelBooking(int book_id)
	{
		Statement st=null;
		String status="";
		int count=0;
		try {
			st=con.createStatement();
			count=st.executeUpdate("update booking set status='Cancelled', remarks='Booking slot not available' where booking_id='"+book_id+"';");
			
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

