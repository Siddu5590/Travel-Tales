package com.travel.Controller;

import com.travel.Model.Customer;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/signup")
public class Signup extends HttpServlet {

	protected void processRequest(HttpServletRequest req, HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=ISO-8859-1");
		
		HttpSession sesssion=req.getSession();
		Customer c=new Customer(sesssion);
		
		try {
			if(req.getParameter("btn")!=null) {
				String name=req.getParameter("Fname");
				String phone=req.getParameter("phno");
				String mail=req.getParameter("mail");
				String password=req.getParameter("password");
				String confirm=req.getParameter("confirm");
				
				if(password.equals(confirm)) {
					String status=c.signup(name,phone,mail,password);
				}
				
				
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
