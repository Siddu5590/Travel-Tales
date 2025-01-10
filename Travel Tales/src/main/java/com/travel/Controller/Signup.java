package com.travel.Controller;

import com.travel.Entity.Customer;
import com.travel.Model.Register;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/signup")
public class Signup extends HttpServlet {

	protected void processRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {

		res.setContentType("text/html;charset=ISO-8859-1");
		
		HttpSession sesssion=req.getSession();
		Register reg=new Register(sesssion);
		Customer c=new Customer();
		
		try {
//			Customer Register
			if(req.getParameter("signup")!=null) {
				String name=req.getParameter("Fname");
				String phone=req.getParameter("phno");
				String mail=req.getParameter("mail");
				String password=req.getParameter("password");
				String confirm=req.getParameter("confirm");
				
				if(password.equals(confirm)) {
					String status=reg.signup(name,phone,mail,password);
					
					if(status.equals("existed"))
					{
						req.setAttribute("status", "User Already Existed.!!");
						RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
						rd.forward(req, res);
					}
					else if(status.equals("success")) {
						req.setAttribute("status", "Account Created Successfully...");
						RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
						rd.forward(req, res);
					}
					else if(status.equals("failure")) {
						req.setAttribute("status", "Failed to Signup.!!");
						RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
						rd.forward(req, res);
					}
					
				}
				
			}
			//Customer Login
			else if(req.getParameter("login")!=null) {
				String mail=req.getParameter("email");
				String password=req.getParameter("password");
				
				String status=reg.login(mail, password);
				
				if(status.equals("success")) {
					if(c.getCustomer_id()==1) {
						RequestDispatcher rd=req.getRequestDispatcher("adminDash.jsp");
						rd.forward(req, res);
					}
					else {
					RequestDispatcher rd=req.getRequestDispatcher("index.jsp");
					rd.forward(req, res);
				}
				}
				else if(status.equals("failure")) {
					req.setAttribute("status", "Invalid Credentials.!!");
					RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
					rd.forward(req, res);
				}
				
			}
			
			//Forgot password
			else if(req.getParameter("forgot")!=null) {
				String email=req.getParameter("email");
				String password=req.getParameter("newpassword");
				String confirm =req.getParameter("confirmpassword");
				
				if(password.equals(confirm)) {
					String status=reg.forgotPass(email,password);
					
				 if(status.equals("success")) {
					 	req.setAttribute("status", "Password Updated Successfully...");
						RequestDispatcher rd=req.getRequestDispatcher("fotgotPassword.jsp");
						rd.forward(req, res);
					}
					else if(status.equals("failure")) {
						req.setAttribute("status", "Failed to update password.!!");
						RequestDispatcher rd=req.getRequestDispatcher("fotgotPassword.jsp");
						rd.forward(req, res);
					}
				}
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
