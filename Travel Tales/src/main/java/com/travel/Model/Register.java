package com.travel.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

import com.travel.Entity.Customer;

import jakarta.servlet.http.HttpSession;

public class Register {

	private Connection con;
	HttpSession se;

	public Register(HttpSession session) {
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

	
	//customer registration
	public String signup(String name, String phone, String mail, String password) {
		String status = "";
		PreparedStatement ps = null;

		try {
			Statement st = null;
			ResultSet rs = null;

			st = con.createStatement();
			rs = st.executeQuery("select * from customer where phone='" + phone + "' or email='" + mail + "';");

			boolean res = rs.next();
			if (res == true) {
				status = "existed";
			} else {
				ps = con.prepareStatement("insert into customer values(0,?,?,?,?)");
				ps.setString(1, name);
				ps.setString(2, phone);
				ps.setString(3, mail);
				ps.setString(4, password);

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

	//customer login and storing customer details in session object
	public String login(String mail, String password) {
		String status1 = "";

		String query = "SELECT * FROM CUSTOMER WHERE EMAIL='" + mail + "'and Password='" + password + "';";

		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery(query);
			boolean b = rs.next();//print
			if (b == true) {
				Customer c = new Customer();
				c.setCustomer_id(rs.getInt("id"));
				c.setC_name(rs.getString("name"));
				c.setC_mail(rs.getString("email"));
				c.setC_phone(rs.getString("phone"));
				c.setPassword(rs.getString("password"));

				se.setAttribute("uname", c.getC_name());//key value jsp
				se.setAttribute("email", c.getC_mail());
				se.setAttribute("phone", c.getC_phone());
				se.setAttribute("id", c.getCustomer_id());
				

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

	
	//changing customer password
	public String forgotPass(String email, String password) {
		PreparedStatement ps;
		String status = "";

		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			ps = (PreparedStatement) con.prepareStatement("update customer set password=? where email=?");
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

	
	//updating customer details
	public String updatedata(String name, String mail, String phone) {
		String status = "";
		PreparedStatement ps = null;
		Customer c = new Customer();

		try {
			Statement st = null;
			ResultSet rs = null;

			st = con.createStatement();

			ps = con.prepareStatement("update customer set name='" + name + "',phone='" + phone + "',email='" + mail
					+ "' where id= '" + se.getAttribute("id") + "' ");
			c.setC_name(name);
			c.setC_phone(phone);
			c.setC_mail(mail);

			se.setAttribute("uname", c.getC_name());
			se.setAttribute("email", c.getC_mail());
			se.setAttribute("phone", c.getC_phone());
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
	
	//retriving customer details from db
	public ArrayList<Customer> viewUsers()
	{
		Statement st=null;
		ResultSet rs=null;
		
		ArrayList<Customer> customer=new ArrayList<>();
		
		
		try {
			st=con.createStatement();
			rs=st.executeQuery("select * from customer");
			while(rs.next())
			{
				Customer c=new Customer();
				c.setCustomer_id(rs.getInt("id"));
				c.setC_name(rs.getString("name"));
				c.setC_mail(rs.getString("email"));
				c.setC_phone(rs.getString("phone"));
				customer.add(c);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return customer;
	}

	
	//deleting customer details from db
	public String deleteUser(int id) {
		Statement st=null;
		int count=0;
		String status="";
		
		try {
			st=con.createStatement();
			count=st.executeUpdate("delete from customer where id='"+id+"';");
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

	

	//getting customer password and email id from db
	public String getPassword(String email, String password) {
		String status = "";
	       PreparedStatement ps = null;
	       ResultSet rs = null;
	       String query = "select * from customer where email=? and password=?";
	       try {
	           ps = con.prepareStatement(query);
	           ps.setString(1, email);
	           ps.setString(2, password);
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

	
	//reseting password
	public String resetPass(String email, String newpass) {
		String status = "";
	       PreparedStatement ps = null;
	       boolean res;
	       try {
	           ps = con.prepareStatement("update customer set password =  ? where  email =  ?");
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
	
	//to check and change the booking status after the date expires
	public void checkBooking()
	{
		Statement st=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			int id;
			id=(Integer)se.getAttribute("id");
			//int id=Integer.parseInt(se.getAttribute("id"));
//			st=con.createStatement();
			ps=con.prepareStatement("select * from booking where user_id=? AND status=?;");
			ps.setInt(1,id);
			ps.setString(2,"pending");
			rs=ps.executeQuery();
			//System.out.println(rs.next());
			
			LocalDate today=LocalDate.now();
			while(rs.next())
			{
				PreparedStatement ps1=null;
				String travelDate=rs.getString("travel_date"); 
				LocalDate tDate = LocalDate.parse(travelDate);
				int res=tDate.compareTo(today);
				if(today.isAfter(tDate) || today.equals(tDate))
				{
					System.out.println(tDate);
					System.out.println(today);
					int bookId=rs.getInt("booking_id");
					ps1=con.prepareStatement("update booking set status=?,remarks=? where booking_id=?;");
					ps1.setString(1, "cancelled");
					ps1.setString(2,"Sorry, our guides are busy to accpet you booking");
					ps1.setInt(3, bookId);
					ps1.executeUpdate();
				}
				
//				System.out.println(dateTime);
//				System.out.println(today);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
	
