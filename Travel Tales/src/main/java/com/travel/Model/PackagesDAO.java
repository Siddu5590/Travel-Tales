package com.travel.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.http.HttpSession;

//packagedao model
public class PackagesDAO {
	private Connection con;
    HttpSession se;

    public PackagesDAO(HttpSession session) {
        try {

            Class.forName("com.mysql.cj.jdbc.Driver"); 
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_tales", "root", "tiger");
            se = session;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public String addPackage(String name, String image, double cost, int no_people, int days) {
    	
    	PreparedStatement ps=null;
        String status = "";
        
        try {
        	Statement st = null;
            ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery("select * from package where PACKAGE_NAME='" + name +  "';");
            boolean b = rs.next();
            if (b) {
                status = "existed";
            }
            else {
            	st=con.createStatement();
            	rs=null;
            	
	                ps =  con.prepareStatement("insert into package values(0,?,?,?,?,?)");
	                ps.setString(1, name);
	                ps.setString(2, image);
	                ps.setDouble(3, cost);
	                ps.setInt(4, no_people);
	                ps.setInt(5, days);
	              
	                int a = ps.executeUpdate();
	                if (a > 0) {
	                    status = "success";
	                } else {
	                    status = "failure";
	                }
                 }
            	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
		return status;
    	
    	
    }

}
