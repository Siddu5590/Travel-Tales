package com.travel.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.cj.protocol.Resultset;
import com.travel.Entity.Packages;

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
    
    //adding package details into db
    public String addPackage(String name, String image, double cost, int days) {
    	
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
            	
	                ps =  con.prepareStatement("insert into package values(0,?,?,?,?)");
	                ps.setString(1, name);
	                ps.setString(2, image);
	                ps.setDouble(3, cost);
//	                ps.setInt(4, no_people);
	                ps.setInt(4, days);
	              
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
    
    //retreiving package details from db
    public ArrayList<Packages> viewPackage()
    {
    	Statement st=null;
    	ResultSet rs=null;
    	ArrayList<Packages> pa=new ArrayList<>();
    	try {
			st=con.createStatement();
			rs=st.executeQuery("select * from package");
			while(rs.next())
			{
				Packages p=new Packages();
				p.setPackage_id(rs.getInt("package_id"));
				p.setPackage_name(rs.getString("package_name"));
				p.setImage(rs.getString("image"));
				p.setCost(rs.getDouble("cost"));
//				p.setNo_of_people(rs.getInt("no_people"));
				p.setNo_days(rs.getInt("days"));
				pa.add(p);
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
		return pa;
    	
    }
    
  //retreiving package details from db based on package Id
    public ArrayList<Packages> viewPackage(int id)
    {
    	Statement st=null;
    	ResultSet rs=null;
    	ArrayList<Packages> pa=new ArrayList<>();
    	try {
			st=con.createStatement();
			rs=st.executeQuery("select * from package where package_id='"+id+"';");
			while(rs.next())
			{
				Packages p=new Packages();
				p.setPackage_id(rs.getInt("package_id"));
				p.setPackage_name(rs.getString("package_name"));
				p.setImage(rs.getString("image"));
				p.setCost(rs.getDouble("cost"));
//				p.setNo_of_people(rs.getInt("no_people"));
				p.setNo_days(rs.getInt("days"));
				pa.add(p);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
		return pa;
    	
    }

  //Updating package details from db
	public String updatePack(int id, String name, String image, Double cost, int days) {
		Statement st=null;
		String status="";
		try {
			st=con.createStatement();
			int a=st.executeUpdate("update package set package_name='"+name+"',image='"+image+"',cost='"+cost+"',days='"+days+"' where package_id='"+id+"';");
			if(a>0)
			{
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

	//Deleting package details from db
	public String deletePack(int id) {
		Statement st=null;
		int count=0;
		String status="";
		try {
			st=con.createStatement();
			count=st.executeUpdate("delete from package where package_id='"+id+"'");
			if(count>0)
			{
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
