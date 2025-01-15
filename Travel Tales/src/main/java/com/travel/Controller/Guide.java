package com.travel.Controller;

import java.io.IOException;

import com.travel.Entity.Customer;
import com.travel.Model.Guide1;
import com.travel.Model.Register;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/guide")
public class Guide extends HttpServlet {
		protected void processRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {

			res.setContentType("text/html;charset=ISO-8859-1");
			
			HttpSession session=req.getSession();
			Register reg=new Register(session);
			Guide1 g=new Guide1(session);
			
			try {
//				Customer Register
				if(req.getParameter("guide")!=null) {
					String name=req.getParameter("name");
					String phone=req.getParameter("phone");
					String email=req.getParameter("email");
					String age=req.getParameter("age");
					
						String status=g.addguide(name,phone,email,age);
						if(status.equals("existed"))
						{
							req.setAttribute("failure", "User Already Existed.!!");
							RequestDispatcher rd=req.getRequestDispatcher("guide.jsp");
							rd.forward(req, res);
						}
						else if(status.equals("success")) {
							req.setAttribute("status", "Guide Added Successfully...");
							RequestDispatcher rd=req.getRequestDispatcher("guide.jsp");
							rd.forward(req, res);
						}
						else if(status.equals("failure")) {
							req.setAttribute("failure", "Failed to add Guide.!!");
							RequestDispatcher rd=req.getRequestDispatcher("guide.jsp");
							rd.forward(req, res);
						}
						
					}
				else if(req.getParameter("deleteGuide")!=null) {
					
				}
					
					
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

		
				
			
