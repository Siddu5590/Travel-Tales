package com.travel.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.travel.Model.cityDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/city")
public class city extends HttpServlet
{
	protected void processRequest(HttpServletRequest req, HttpServletResponse res) throws Exception 
	{
		res.setContentType("text/html;charset=UTF-8");
		 PrintWriter out = res.getWriter();
		HttpSession session=req.getSession();
		cityDAO c=new cityDAO(session);
		//Customer c=new Customer();
		
		try {
			if(req.getParameter("addCity")!=null) {
				String name=req.getParameter("name");
				String img=req.getParameter("image");
				
					String status=c.addCity(name,img);
					
					if(status.equals("existed"))
					{
						req.setAttribute("status", "City Already Existed.!!");
						RequestDispatcher rd=req.getRequestDispatcher("addCity.jsp");
						rd.forward(req, res);
					}
					else if(status.equals("success")) {
						req.setAttribute("status", "City Added Successfully...");
						RequestDispatcher rd=req.getRequestDispatcher("addCity.jsp");
						rd.forward(req, res);
					}
					else if(status.equals("failure")) {
						req.setAttribute("status", "Failed to add City.!!");
						RequestDispatcher rd=req.getRequestDispatcher("addCity.jsp");
						rd.forward(req, res);
					}
					
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



