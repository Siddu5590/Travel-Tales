package com.travel.Model;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.travel.Entity.City;

import jakarta.servlet.http.HttpSession;

public class cityDAO {
	 private Connection con;
	    HttpSession se;

	    public cityDAO(HttpSession session) {
	        try {

	            Class.forName("com.mysql.cj.jdbc.Driver"); // load the drivers
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_tales", "root", "tiger");
	            // connection with data base
	            se = session;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    //adding city to db
	    public String addCity(String name,String img, double cost) {
	        PreparedStatement ps;
	        String status = "";
	        try {
	            Statement st = null;
	            ResultSet rs = null;
	            st = con.createStatement();
	            rs = st.executeQuery("select * from city where CITY_NAME='" + name +  "';");
	            boolean b = rs.next();
	            if (b) {
	                status = "existed";
	            } else {
	                ps = (PreparedStatement) con.prepareStatement("insert into city values(0,?,?,?)");
	                ps.setString(1, name);
	                ps.setString(2, img);
	                ps.setDouble(3, cost);
	              
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
	    
	    //retreving city details from db
	    public ArrayList<City> viewCity()
	    {
	    	Statement st=null;
	    	PreparedStatement ps=null;
	    	ResultSet rs=null;
	    	
	    	ArrayList<City> city=new ArrayList<City>();
	    	
	    	try {
				st=con.createStatement();
				rs=st.executeQuery("select * from city");
				while(rs.next())
				{
					City c=new City();
					c.setCity_id(rs.getInt("city_id"));
					c.setCity_name(rs.getString("city_name"));
					c.setImage(rs.getString("image"));
					c.setCost(rs.getDouble("cost"));
					city.add(c);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	    	return city;
	    }

	  //deleting city details from db
		public String deleteCity(int id) {
			Statement st=null;
			String status="";
			int count=0;
			
			
			try {
				st=con.createStatement();
				count=st.executeUpdate("delete from city where city_id='"+id+"';");
				
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
		
		//Updating city details and storing modified details in db
		public String editCity(int id, String City_name, double cost, String image) {
			// TODO Auto-generated method stub
			Statement st=null;
			String status="";
			int count=0;
			
			try {
				st=con.createStatement();
				count=st.executeUpdate("update city set city_name='" + City_name+"',cost='" + cost+"',image='"+image+"' where city_id='"+id+"';");
				if(count>0) {
					status="success";
				}
				else {
					status="failure";
				}
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return status;
		}
		
		
	
		//retreving city details from db based on city name
		public ArrayList<String> getCities()
		{
			ArrayList<String> al=new ArrayList<>();
			 try {
				 	Statement st = null;
				 	ResultSet rs = null;
				 	st = con.createStatement();
					rs = st.executeQuery("select CITY_NAME from city ;");
					while(rs.next())
					{
						String city;
						city=rs.getString("city_name");
						al.add(city);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 return al;
		}
		
		//retreving city details from db based on city id
		public ArrayList<City> viewCity(int id)
	    {
	    	Statement st=null;
	    	PreparedStatement ps=null;
	    	ResultSet rs=null;
	    	
	    	ArrayList<City> city=new ArrayList<City>();
	    	
	    	try {
				st=con.createStatement();
				rs=st.executeQuery("select * from city where city_id='"+id+"';");
				while(rs.next())
				{
					City c=new City();
					c.setCity_id(rs.getInt("city_id"));
					c.setCity_name(rs.getString("city_name"));
					c.setImage(rs.getString("image"));
					c.setCost(rs.getDouble("cost"));
					city.add(c);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	    	return city;
	    }

}
