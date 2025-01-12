package com.travel.Model;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.http.HttpSession;

public class cityDAO {
	 private Connection con;
	    HttpSession se;

	    public cityDAO(HttpSession session) {
	        try {

	            Class.forName("com.mysql.jdbc.Driver"); // load the drivers
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_tales", "root", "root");
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
	                ps = (PreparedStatement) con.prepareStatement("insert into city values(?,?)");
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

}
