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
			
			//adding city by admin
			if(req.getParameter("addCity")!=null) {
				String name=req.getParameter("name");
				String img=req.getParameter("image");
				String costt=req.getParameter("cost");
				double cost=Double.parseDouble(costt);
				
					String status=c.addCity(name,img,cost);
					
					if(status.equals("existed"))
					{
						req.setAttribute("failure", "City Already Existed.!!");
						RequestDispatcher rd=req.getRequestDispatcher("addCity.jsp");
						rd.forward(req, res);
					}
					else if(status.equals("success")) {
						req.setAttribute("status", "City Added Successfully...");
						RequestDispatcher rd=req.getRequestDispatcher("addCity.jsp");
						rd.forward(req, res);
					}
					else if(status.equals("failure")) {
						req.setAttribute("failure", "Failed to add City.!!");
						RequestDispatcher rd=req.getRequestDispatcher("addCity.jsp");
						rd.forward(req, res);
					}
					
				}
			
			//delete city
			else if(req.getParameter("delete")!=null) {
				int id=Integer.parseInt(req.getParameter("cid"));
				
				String status=c.deleteCity(id);
				if(status.equals("success")) {
					req.setAttribute("status", "City Deleted Successfully...");
					RequestDispatcher rd=req.getRequestDispatcher("viewCity.jsp");
					rd.forward(req, res);
					
				}
				else if(status.equals("failure"))
				{
					req.setAttribute("failure", "Failed to Delete the City...");
					RequestDispatcher rd=req.getRequestDispatcher("viewCity.jsp");
					rd.forward(req, res);
				}
				
			}
			
			//update city details
			else if(req.getParameter("updateCity")!=null) {
				int id=Integer.parseInt(req.getParameter("id"));
				double cost=Double.parseDouble(req.getParameter("cost"));
				String City_name=req.getParameter("name");
				String image=req.getParameter("image");
				String status=c.editCity(id, City_name, cost, image);
				if(status.equals("success")) {
					req.setAttribute("status", "City Updated Successfully!!");
					RequestDispatcher rd=req.getRequestDispatcher("viewCity.jsp");
					rd.forward(req, res);
				}
				else if(status.equals("failure"))
				{
					req.setAttribute("failure", "Failed to Update the City...");
					RequestDispatcher rd=req.getRequestDispatcher("viewCity.jsp");
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



