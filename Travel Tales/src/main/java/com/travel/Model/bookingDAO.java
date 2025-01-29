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
	
	//adding bookings into db
	public String addBooking(int user_id, String name,String ph,String email,String city,int noPl,String date,Double cost,String desc, String loc)
	{
		Statement st=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String status="";
		try {
			st=con.createStatement();
			rs=st.executeQuery("select * from booking where travel_date='"+date+"' and uname='"+name+"' and user_id='"+user_id+"'");
			boolean res=rs.next();
			if(res) {
				status="existed";
			}
			else {
			
			ps=(PreparedStatement) con.prepareStatement("insert into booking  values(0,?,?,?,?,?,?,?,sysdate(),?,?,?,?,?)");
			ps.setInt(1, user_id);
			ps.setString(2,name);
			ps.setString(3,ph);
			ps.setString(4,email);
			ps.setInt(5,noPl);
			ps.setDouble(6,cost);
			//System.out.println(city);
			ps.setString(7,city);
			ps.setString(8,date);
			ps.setString(9,loc);
			ps.setString(10,"pending");
			ps.setString(11,desc);
			ps.setString(12, "\0");
			int a=ps.executeUpdate();
			if(a>0)
				status="success";
			else
				status="failure";
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
		
	}
	
	//retreiving all booking details based on user id
	public ResultSet viewBookings()
	{
		PreparedStatement ps=null;
		ResultSet rs=null;
		ArrayList<Booking> book=new ArrayList<>();
		
		try {
			ps=(PreparedStatement) con.prepareStatement("SELECT b.*, CASE WHEN b.status = 'confirmed' THEN g.name ELSE '\0'  END AS guide_name, CASE WHEN b.status = 'confirmed' THEN g.phone ELSE '\0' END AS g_phone FROM booking b	LEFT JOIN guide_avail ga ON b.booking_id = ga.booking_id LEFT JOIN  guide g ON ga.guide_id = g.guide_id WHERE b.status IN ('Confirmed', 'Cancelled','pending') AND b.user_id='"+se.getAttribute("id")+"';");
			rs=ps.executeQuery();
//			while(rs.next())
//			{
//				Booking b=new Booking();
//				b.setBooking_id(rs.getInt("booking_id"));
//				b.setName(rs.getString("uname"));
//				b.setEmail(rs.getString("email"));
//				b.setPhone(rs.getString("phone"));
//				b.setPeoples(rs.getInt("no_of_people"));
//				b.setCost(rs.getDouble("cost"));
//				b.setCity(rs.getString("city"));
//				b.setBookk_date(rs.getString("book_date"));
//				b.setTravel_date(rs.getString("travel_date"));
//				b.setLocation(rs.getString("pickup_location"));
//				b.setStatus(rs.getString("status"));
//				b.setDesc(rs.getString("description"));
//				b.setRemarks(rs.getString("remarks"));
//				book.add(b);
//			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
		
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
	
	//retreiving all booking details based on city name 
	public ArrayList<Booking>  getBookings()
	{
		PreparedStatement ps=null;
		ResultSet rs=null;
		ArrayList<Booking> book=new ArrayList<>();
		
		try {
			ps=(PreparedStatement) con.prepareStatement("select * from booking where city not in('north karnataka','south karnataka','karnataka')");
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
	
	//retreiving all booking details based on package name
	public ArrayList<Booking>  getPackageBookings()
	{
		PreparedStatement ps=null;
		ResultSet rs=null;
		ArrayList<Booking> book=new ArrayList<>();
		
		try {
			ps=(PreparedStatement) con.prepareStatement("select * from booking where city in ('north karnataka','south karnataka','karnataka') ");
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
	
	//confirm package bookings by admin
	public String confirmBooking(int id) {
		Statement st=null;
		String status="";
		int count=0;
		try {
			st=con.createStatement();
			count=st.executeUpdate("update booking set status='Confirmed', remarks='Your Booking is Confirmed' where booking_id='"+id+"';");
			
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