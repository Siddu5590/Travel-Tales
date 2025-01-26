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
	Guide g=new Guide();

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
				
				g.setGuide_id(rs.getInt("guide_id"));
				g.setGuide_name(rs.getString("name"));
				g.setLocation(rs.getString("location"));
				
				se.setAttribute("id",g.getGuide_id());
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
	
	public String acceptBooking(int id) {
	    String status = "failure"; // Default status
	    String dateStatus = "Available";
	    String confirmStatus = "Confirmed";
	    String remarks = "Guide Accepted the Booking";

	    String updateBookingQuery = "UPDATE booking SET status = ?, remarks = ? WHERE booking_id = ?";
	    String selectTravelDateQuery = "SELECT travel_date FROM booking WHERE booking_id = ?";
	    String selectAvailabilityQuery = "SELECT slot_time FROM guide_avail WHERE guide_id = ?";
	    String insertAvailabilityQuery = "INSERT INTO guide_avail VALUES (0, ?, ?, ?, ?)";

	    try (PreparedStatement updateBookingStmt = con.prepareStatement(updateBookingQuery);
	         PreparedStatement selectTravelDateStmt = con.prepareStatement(selectTravelDateQuery);
	         PreparedStatement selectAvailabilityStmt = con.prepareStatement(selectAvailabilityQuery);
	         PreparedStatement insertAvailabilityStmt = con.prepareStatement(insertAvailabilityQuery)) {

	        // Update booking status
	        updateBookingStmt.setString(1, confirmStatus);
	        updateBookingStmt.setString(2, remarks);
	        updateBookingStmt.setInt(3, id);
	        int updateCount = updateBookingStmt.executeUpdate();

	        // Fetch travel date
	        selectTravelDateStmt.setInt(1, id);
	        try (ResultSet rs = selectTravelDateStmt.executeQuery()) {
	            if (rs.next()) {
	                String travelDate = rs.getString("travel_date");
	                System.out.println(travelDate);
	                
	                // Check guide availability
	                selectAvailabilityStmt.setInt(1, g.getGuide_id());
	                try (ResultSet rs1 = selectAvailabilityStmt.executeQuery()) {
	                    while (rs1.next()) {
	                        if (travelDate.equals(rs1.getString("slot_time"))) {
	                            dateStatus = "Unavailable";
	                            status="Your slot is unavailable for this booking time";
	                            return status;
	                            
	                        }
	                        System.out.println(rs1.getString("slot_time"));
	                    }
	                }
	                Object idObj = se.getAttribute("id");

	                int gid = 0; // Default value
	                if (idObj != null) {
	                    if (idObj instanceof Integer) {
	                        // If the object is already an Integer
	                        gid = (Integer) idObj;
	                    } else if (idObj instanceof String) {
	                        // If the object is a String
	                        try {
	                            gid = Integer.parseInt((String) idObj);
	                        } catch (NumberFormatException e) {
	                            System.err.println("Invalid number format: " + idObj);
	                            // Handle the exception (e.g., log it or throw a custom exception)
	                        }
	                    } else {
	                        System.err.println("Invalid attribute type: " + idObj.getClass());
	                    }
	                } else {
	                    System.err.println("Attribute 'id' is null.");
	                }

	                
	                // Insert availability record
	                insertAvailabilityStmt.setString(1, travelDate);
	                insertAvailabilityStmt.setString(2, dateStatus);
	                insertAvailabilityStmt.setInt(3, gid);
	                insertAvailabilityStmt.setInt(4, id);
	                insertAvailabilityStmt.executeUpdate();
	            }
	        }

	        // Determine final status
	        if (updateCount > 0) {
	            status = "success";
	        }

	    } catch (SQLException e) {
	        e.printStackTrace(); // Replace with proper logging in production
	        status = "error: " + e.getMessage();
	    }

	    return status;
	}

	
}
	
