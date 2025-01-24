package com.travel.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.travel.Entity.Booking;
import com.travel.Entity.Guide;

import jakarta.servlet.http.HttpSession;

public class guideDAO {

	private Connection con;
	HttpSession se;

	public guideDAO(HttpSession session) {
		String url = "jdbc:mysql://localhost:3306/travel_tales";
		String user = "root";
		String pass = "tiger";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			con = DriverManager.getConnection(url, user, pass);

			se = session;

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	public String login(String mail, String password) {
		String status1 = "";
		String query = "SELECT * FROM GUIDE WHERE EMAIL='" + mail + "'and PASSWORD='" + password + "';";

		try {
			Statement st = null;
			ResultSet rs = null;
			
			st = con.createStatement();
			rs = st.executeQuery(query);
			boolean b = rs.next();//print
			
			if (b == true) {
				Guide g=new Guide();
				g.setGuide_name(rs.getString("name"));
				g.setLocation(rs.getString("location"));
				se.setAttribute("uname",g.getGuide_name());
				se.setAttribute("loc", g.getLocation());
				status1 = "success";

			} else {
				status1 = "failure";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return status1;

	}
	
	public ArrayList<Booking>  viewBookings()
	{
		PreparedStatement ps=null;
		ResultSet rs=null;
		ArrayList<Booking> book=new ArrayList<>();
		
		try {
			ps=(PreparedStatement) con.prepareStatement("select * from booking where city='"+se.getAttribute("loc")+"'");
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

	public String forgotPass(String email, String password) {
		PreparedStatement ps;
		String status = "";

		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			ps = (PreparedStatement) con.prepareStatement("update guide set password=? where email=?");
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

	public String updatedata(String name, String mail, String phone,String pass) {
		String status = "";
		PreparedStatement ps = null;
		Guide g = new Guide();

		try {
			Statement st = null;
			ResultSet rs = null;

			st = con.createStatement();

			ps = con.prepareStatement("update guide set name='" + name + "',phone='" + phone + "',email='" + mail+"',password='"+pass            
					+ "' where id= '" + se.getAttribute("id") + "' ");
		
			int a = ps.executeUpdate();
			if (a > 0) {
				status = "success";
			} else {
				status = "failure";
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return status;
	}
	
	public String getPassword(String email, String oldpass) {
		   String status = "";
	       PreparedStatement ps = null;
	       ResultSet rs = null;
	       String query = "select * from guide where email=? and password=?";
	       try {
	           ps = con.prepareStatement(query);
	           ps.setString(1, email);
	           ps.setString(2, oldpass);
	           rs = ps.executeQuery();
	           if (rs.next()) {
	               status = "success";
	           } else {
	               status = "failed";
	           }
	       } catch (SQLException e) {
	           e.printStackTrace();
	       }
	       //System.out.println(status);
	       return status;
	}

	public String resetPass(String email, String newpass) {
		String status = "";
	       PreparedStatement ps = null;
	       boolean res;
	       try {
	           ps = con.prepareStatement("update guide set password =  ? where  email =  ?");
	           ps.setString(1, newpass);
	           ps.setString(2, email);
	           int rc = ps.executeUpdate();
	           if (rc > 0) {
	               status = "success";
	           } else {
	               status = "failed";
	           }
	       } catch (SQLException e) {
	// TODO Auto-generated catch block
	           e.printStackTrace();
	       }
	       return status;
	}
}
	
