package com.travel.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.travel.Entity.Place;

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
	            	PreparedStatement psCity = con.prepareStatement("select CITY_ID from city where CITY_NAME = ?");
	            	psCity.setString(1, city);
	            	 rs = psCity.executeQuery();
                 if(rs.next())
                 { 
                	int cityID=rs.getInt("CITY_ID");
	                ps =  con.prepareStatement("insert into place values(0,?,?,?,?,?)");
	                ps.setString(1, name);
	                ps.setString(2, loc);
	                ps.setString(3, img);
	                ps.setInt(4, cityID);
	                ps.setString(5, desc);
	              
	                int a = ps.executeUpdate();
	                if (a > 0) {
	                    status = "success";
	                } else {
	                    status = "failure";
	                }
                 }
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return status;
	    }
	    
	    public ArrayList<Place> viewPlace()
	    {
	    	Statement st=null;
	    	PreparedStatement ps=null;
	    	ResultSet rs=null;
	    	
	    	ArrayList<Place> place=new ArrayList<>();
	    	
	    	try {
				st=con.createStatement();
				rs=st.executeQuery("select * from place");
				while(rs.next())
				{
					Place p=new Place();
					p.setPlace_id(rs.getInt("PLACE_ID"));
					p.setPlace_name(rs.getString("NAME"));
					p.setLocation(rs.getString("LOCATION"));
					p.setImage(rs.getString("IMAGE"));
					p.setCity_id(rs.getInt("CITY_ID"));
					p.setDescription(rs.getString("DESCRIPTION"));
					place.add(p);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	    	return place;
	    }

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
		
		public ArrayList<Place> viewPlace(int id)
	    {
	    	Statement st=null;
	    	PreparedStatement ps=null;
	    	ResultSet rs=null;
	    	
	    	ArrayList<Place> place=new ArrayList<>();
	    	
	    	try {
				st=con.createStatement();
				rs=st.executeQuery("select * from place where CITY_id='"+id+"';");
				while(rs.next())
				{
					Place p=new Place();
					p.setPlace_id(rs.getInt("PLACE_ID"));
					p.setPlace_name(rs.getString("NAME"));
					p.setLocation(rs.getString("LOCATION"));
					p.setImage(rs.getString("IMAGE"));
					p.setCity_id(rs.getInt("CITY_ID"));
					p.setDescription(rs.getString("DESCRIPTION"));
					place.add(p);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	    	return place;
	    }
		public int getPlacesCount(int id)
		{
			int count=0;
			Statement st=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			try {
				st=con.createStatement();
				rs=st.executeQuery("SELECT COUNT(*) AS CON FROM place WHERE CITY_ID='"+id+"';");
				if(rs.next())
				{
					count=rs.getInt("CON");
				}
				
			}catch(SQLException e)
			{
				e.printStackTrace();			}
			return count;
		}

		
		public ArrayList<Place> getPlace(int id)
	    {
	    	Statement st=null;
	    	PreparedStatement ps=null;
	    	ResultSet rs=null;
	    	
	    	ArrayList<Place> place=new ArrayList<>();
	    	
	    	try {
				st=con.createStatement();
				rs=st.executeQuery("select * from place where place_id='"+id+"';");
				while(rs.next())
				{
					Place p=new Place();
					p.setPlace_id(rs.getInt("PLACE_ID"));
					p.setPlace_name(rs.getString("NAME"));
					p.setLocation(rs.getString("LOCATION"));
					p.setImage(rs.getString("IMAGE"));
					p.setCity_id(rs.getInt("CITY_ID"));
					p.setDescription(rs.getString("DESCRIPTION"));
					place.add(p);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	    	return place;
	    }

}
