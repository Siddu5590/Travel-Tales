package com.travel.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.travel.Model.placeDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Place")
public class Place extends HttpServlet
{

	protected void processRequest(HttpServletRequest req, HttpServletResponse res) throws Exception 
	{
		res.setContentType("text/html;charset=UTF-8");
		 PrintWriter out = res.getWriter();
		HttpSession session=req.getSession();
		placeDAO c=new placeDAO(session);
		//Customer c=new Customer();
		
		try {
			if(req.getParameter("addPlace")!=null) {
				String name=req.getParameter("name");
				String img=req.getParameter("image");
				String loc=req.getParameter("loc");
				String desc=req.getParameter("description");
				String city=req.getParameter("city");
				
					String status=c.addPlace(name,img,loc,desc,city);
					
					if(status.equals("existed"))
					{
						req.setAttribute("failure", "Place Already Existed.!!");
						RequestDispatcher rd=req.getRequestDispatcher("addPlace.jsp");
						rd.forward(req, res);
					}
					else if(status.equals("success")) {
						req.setAttribute("status", "Place Added Successfully...");
						RequestDispatcher rd=req.getRequestDispatcher("addPlace.jsp");
						rd.forward(req, res);
					}
					else if(status.equals("failure")) {
						req.setAttribute("failure", "Failed to add Place.!!");
						RequestDispatcher rd=req.getRequestDispatcher("addPlace.jsp");
						rd.forward(req, res);
					}
					
				}
			else if(req.getParameter("delete")!=null) {
				int id=Integer.parseInt(req.getParameter("cid"));
				
				String status=c.deletePlace(id);
				if(status.equals("success")) {
					req.setAttribute("status", "Place Deleted Successfully...");
					RequestDispatcher rd=req.getRequestDispatcher("viewPlace.jsp");
					rd.forward(req, res);
					
				}
				else if(status.equals("failure"))
				{
					req.setAttribute("failure", "Failed to Delete the Place...");
					RequestDispatcher rd=req.getRequestDispatcher("viewPlace.jsp");
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

