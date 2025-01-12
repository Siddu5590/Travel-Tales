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

	    public String addCity(String name,String img) {
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
	                ps = (PreparedStatement) con.prepareStatement("insert into city values(0,?,?)");
	                ps.setString(1, name);
	                ps.setString(2, img);
	              
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
					city.add(c);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	    	return city;
	    }
}
