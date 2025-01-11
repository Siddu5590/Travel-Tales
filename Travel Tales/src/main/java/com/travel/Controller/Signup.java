package com.travel.Controller;

import java.io.IOException;

import com.travel.Entity.Customer;
import com.travel.Model.Register;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/signup")
public class Signup extends HttpServlet {

	protected void processRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {

		res.setContentType("text/html;charset=ISO-8859-1");
		
		HttpSession session=req.getSession();
		Register reg=new Register(session);
		Customer c=new Customer();
		
		try {
//			Customer Register
			if(req.getParameter("signup")!=null) {
				String name=req.getParameter("name");
				String phone=req.getParameter("phone");
				String mail=req.getParameter("email");
				String password=req.getParameter("pw");
				String confirm=req.getParameter("cp");
				
				if(password.equals(confirm)) {
					String status=reg.signup(name,phone,mail,password);
					
					if(status.equals("existed"))
					{
						req.setAttribute("failure", "User Already Existed.!!");
						RequestDispatcher rd=req.getRequestDispatcher("register.jsp");
						rd.forward(req, res);
					}
					else if(status.equals("success")) {
						req.setAttribute("status", "Account Created Successfully...");
						RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
						rd.forward(req, res);
					}
					else if(status.equals("failure")) {
						req.setAttribute("failure", "Failed to Signup.!!");
						RequestDispatcher rd=req.getRequestDispatcher("register.jsp");
						rd.forward(req, res);
					}
					
				}
				else {
					req.setAttribute("failure", "Password Mismatch.!!");
					RequestDispatcher rd=req.getRequestDispatcher("register.jsp");
					rd.forward(req, res);
				}
				
			}
			//Customer Login
			else if(req.getParameter("login")!=null) {
				String mail=req.getParameter("email");
				String password=req.getParameter("password");
				
				String status=reg.login(mail, password);
				
				if(status.equals("success")) {
					req.setAttribute("status", "Login Successfull");
					if(session.getAttribute("uname")!=null && session.getAttribute("id").equals("1")) {
					RequestDispatcher rd =req.getRequestDispatcher("adminDash.jsp");
					rd.forward(req, res);
					}else {
						RequestDispatcher rd =req.getRequestDispatcher("index.jsp");
						rd.forward(req, res);
					}
					
				}
				else if(status.equals("failure")) {
					req.setAttribute("status", "Login failed");
					RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
					rd.forward(req, res);
				}
				
		
			}
			//logout
			else if(req.getParameter("logout")!=null) {
				session.invalidate();
				req.setAttribute("logout", "Logged Out Successful now login here...");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.forward(req, res);
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
						RequestDispatcher rd=req.getRequestDispatcher("forgotPassword.jsp");
						rd.forward(req, res);
					}
					else if(status.equals("failure")) {
						req.setAttribute("failure", "Failed to update password.!!");
						RequestDispatcher rd=req.getRequestDispatcher("forgotPassword.jsp");
						rd.forward(req, res);
					}
				}
				else {
					req.setAttribute("failure", "Password Mismatch.!!");
					RequestDispatcher rd=req.getRequestDispatcher("forgotPassword.jsp");
					rd.forward(req, res);
				}
			}
			// update profile
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			processRequest(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
