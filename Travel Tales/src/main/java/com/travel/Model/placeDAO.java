package com.travel.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.travel.Controller.Place;
import com.travel.Entity.City;

import jakarta.servlet.http.HttpSession;

public class placeDAO {
	 private Connection con;
	    HttpSession se;

	    public placeDAO(HttpSession session) {
	        try {

	            Class.forName("com.mysql.cj.jdbc.Driver"); // load the drivers
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_tales", "root", "tiger");
	            // connection with data base
	            se = session;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    public String addPlace(String name,String img, String loc,String desc,String city) {
	        PreparedStatement ps=null;
	        String status = "";
	        
	        try {
	        	Statement st = null;
	            ResultSet rs = null;
	            st = con.createStatement();
	            rs = st.executeQuery("select * from place where NAME='" + name +  "';");
	            boolean b = rs.next();
	            if (b) {
	                status = "existed";
	            } else {
	            	
	            	st=con.createStatement();
	            	rs=null;
	            	rs=st.executeQuery("select CITY_ID from city where CITY_NAME='"+city+"';");
	                ps = (PreparedStatement) con.prepareStatement("insert into place values(0,?,?,?,?,?)");
	                ps.setString(1, name);
	                ps.setString(2, loc);
	                ps.setString(3, img);
	                ps.setInt(4, rs.getInt(1));
	                ps.setString(5, desc);
	              
	                int a = ps.executeUpdate();
	                if (a > 0) {
	                    status = "success";
	                } else {
	                    status = "failure";
	                }
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return status;
	    }
	    
//	    public ArrayList<City> viewCity()
//	    {
//	    	Statement st=null;
//	    	PreparedStatement ps=null;
//	    	ResultSet rs=null;
//	    	
//	    	ArrayList<City> city=new ArrayList<City>();
//	    	
//	    	try {
//				st=con.createStatement();
//				rs=st.executeQuery("select * from city");
//				while(rs.next())
//				{
//					City c=new City();
//					c.setCity_id(rs.getInt("city_id"));
//					c.setCity_name(rs.getString("city_name"));
//					c.setImage(rs.getString("image"));
//					city.add(c);
//				}
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//	    	
//	    	return city;
//	    }

		public String deletePlace(int id) {
			Statement st=null;
			String status="";
			int count=0;
			try {
				st=con.createStatement();
				count=st.executeUpdate("delete from place where place_id='"+id+"';");
				
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
