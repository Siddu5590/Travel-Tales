package com.travel.Controller;

import java.io.IOException;

import com.travel.Entity.Customer;
import com.travel.Model.Guide1;
import com.travel.Model.Register;
import com.travel.Model.guideDAO;

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
			
			guideDAO g=new guideDAO(session);
			
			try {
//				Customer Register
				// login
				 if(req.getParameter("login")!=null)
					{
						String mail=req.getParameter("email");
						String password=req.getParameter("password");
						
						String status=g.login(mail, password);
						
						if(status.equals("success")) {
							req.setAttribute("status", "Login Successfull");
							RequestDispatcher rd =req.getRequestDispatcher("guideDash.jsp");
							rd.forward(req, res);
						}
						else if(status.equals("failure")) {
							req.setAttribute("status", "Login failed");
							RequestDispatcher rd = req.getRequestDispatcher("guide_login.jsp");
							rd.forward(req, res);
						}
						
			
					}
				//add guide
//			else if(req.getParameter("guide")!=null) {
//					String name=req.getParameter("name");
//					String phone=req.getParameter("phone");
//					String email=req.getParameter("email");
//					String age=req.getParameter("age");
//					String city=req.getParameter("city");
//					
//						String status=g.addguide(name,phone,email,age,city);
//						if(status.equals("existed"))
//						{
//							req.setAttribute("failure", "User Already Existed.!!");
//							RequestDispatcher rd=req.getRequestDispatcher("guide.jsp");
//							rd.forward(req, res);
//						}
//						else if(status.equals("success")) {
//							req.setAttribute("status", "Guide Added Successfully...");
//							RequestDispatcher rd=req.getRequestDispatcher("guide.jsp");
//							rd.forward(req, res);
//						}
//						else if(status.equals("failure")) {
//							req.setAttribute("failure", "Failed to add Guide.!!");
//							RequestDispatcher rd=req.getRequestDispatcher("guide.jsp");
//							rd.forward(req, res);
//						}
//						
//					}
//				//delete guide
//					else if(req.getParameter("deleteGuide")!=null) {
//					int id=Integer.parseInt(req.getParameter("id"));
//					
//					String status=g.deleteguide(id);
//					if(status.equals("success")) {
//						req.setAttribute("status", "Guide Deleted Successfully...");
//						RequestDispatcher rd=req.getRequestDispatcher("viewGuide.jsp");
//						rd.forward(req, res);
//					}
//					else if(status.equals("failure")) {
//						req.setAttribute("failure", "Failed to delete Guide information.!!");
//						RequestDispatcher rd=req.getRequestDispatcher("viewGuidex.jsp");
//						rd.forward(req, res);
//					}
//				}
//					//update guide
//					else if(req.getParameter("updateguide")!=null) {
//						int id=Integer.parseInt(req.getParameter("id"));
//						String name=req.getParameter("name");
//						String phone=req.getParameter("phone");
//						String email=req.getParameter("email");
//						int age=Integer.parseInt(req.getParameter("age"));
//						String city=req.getParameter("city");
//						
//						String status=g.updateGuide(id,name,phone,email,age,city);
//						if(status.equals("success")) {
//							req.setAttribute("status", "guide Data updated Successfully...");
//							RequestDispatcher rd=req.getRequestDispatcher("updateguide.jsp?guide_id="+id);
//							rd.forward(req, res);
//						}
//						else if(status.equals("failure")) {
//							req.setAttribute("failure", "unable  to update Guide details.!!");
//							RequestDispatcher rd=req.getRequestDispatcher("updateguide.jsp?guide_id="+id);
//							rd.forward(req, res);
//						}
//							
//						}
			}catch (Exception e) {
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

		
				
			
