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

	  //adding place details into db
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
	    
	  //deleting place details from db
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
		
		//retreiving place details from db
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
					p.setPlace_id(rs.getInt("place_id"));
					p.setPlace_name(rs.getString("name"));
					p.setImage(rs.getString("image"));
					p.setLocation(rs.getString("location"));
					p.setCity_id(rs.getInt("city_id"));
					p.setDescription(rs.getString("description"));
					place.add(p);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	    	return place;
	    }

		//retreiving place details from db based on city id
		public ArrayList<Place> viewPlace(int city_id)
	    {
	    	Statement st=null;
	    	PreparedStatement ps=null;
	    	ResultSet rs=null;
	    	
	    	ArrayList<Place> place=new ArrayList<>();
	    	
	    	try {
				st=con.createStatement();
				rs=st.executeQuery("select * from place where CITY_id='"+city_id+"';");
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
		
		//retreiving count of place details from db
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
				e.printStackTrace();			
			}
			return count;
		}

		//retreiving place details from db based on place_id
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

		//updating place details from db
		public String editPlace(int id, String name, String image, String city, String location, String desc ) {
			Statement st=null;
			String status="";
			ResultSet rs=null;
			int count=0;
			try {
				st=con.createStatement();
            	rs=null;
            	PreparedStatement psCity = con.prepareStatement("select CITY_ID from city where CITY_NAME = ?");
            	psCity.setString(1, city);
            	rs = psCity.executeQuery();
				st=con.createStatement();
				
				if(rs.next()) {
				
				count=st.executeUpdate("update place set name='"+name+"',image='"+image+"',city_id='"+rs.getInt("city_id")+"',location='"+location+"',description='"+desc+"' where place_id='"+id+"'");
				
				if(count>0) {
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
		
}
