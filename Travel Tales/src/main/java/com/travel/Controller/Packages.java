package com.travel.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.travel.Model.PackagesDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/package")
public class Packages extends HttpServlet {
	
	protected void processRequest(HttpServletRequest req, HttpServletResponse res) throws Exception 
	{
		try {
			
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out = res.getWriter();
		HttpSession session=req.getSession();
		PackagesDAO pack=new PackagesDAO(session);
		
		
		//adding packages by admin
		if(req.getParameter("addPackage")!=null)
		{
			String name=req.getParameter("name");
			String image=req.getParameter("image");
			String price=req.getParameter("cost");
//			String numpeople=req.getParameter("no_people");
			String numdays=req.getParameter("days");
			
			Double cost=Double.parseDouble(price);
			//int no_people=Integer.parseInt(numpeople);
			int days=Integer.parseInt(numdays);
			String status=pack.addPackage(name, image, cost,  days);
			
			
			if(status.equals("existed"))
			{
				req.setAttribute("failure", "Package Already Existed.!!");
				RequestDispatcher rd=req.getRequestDispatcher("addPackages.jsp");
				rd.forward(req, res);
			}
			else if(status.equals("success")) {
				req.setAttribute("status", "Package Added Successfully...");
				RequestDispatcher rd=req.getRequestDispatcher("addPackages.jsp");
				rd.forward(req, res);
			}
			else if(status.equals("failure")) {
				req.setAttribute("failure", "Failed to add Package.!!");
				RequestDispatcher rd=req.getRequestDispatcher("addPackages.jsp");
				rd.forward(req, res);
			}
		}
		
		//updating package details by admin
		else if(req.getParameter("updatepackage")!=null)
		{
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("name");
			String image=req.getParameter("image");
			String price=req.getParameter("cost");
//			String numpeople=req.getParameter("no_people");
			String numdays=req.getParameter("days");
			
			Double cost=Double.parseDouble(price);
//			int no_people=Integer.parseInt(numpeople);
			int days=Integer.parseInt(numdays);
			
			String status=pack.updatePack(id,name,image,cost,days);
			if(status.equals("success")) {
				req.setAttribute("status", "Package Updated Successfully...");
				RequestDispatcher rd=req.getRequestDispatcher("editpackage.jsp?p_id="+id);
				rd.forward(req, res);
			}
			else if(status.equals("failure")) {
				req.setAttribute("failure", "Failed to update the  Details.!!");
				RequestDispatcher rd=req.getRequestDispatcher("editpackage.jspp_id="+id);
				rd.forward(req, res);
			}
			
		}
		
		//deleting the packages
		else if(req.getParameter("delete")!=null)
		{
			int id=Integer.parseInt(req.getParameter("cid"));
			
			String status=pack.deletePack(id);
			if(status.equals("success"))
			{
				req.setAttribute("status", "Package Successfully Deleted..");
				RequestDispatcher rd=req.getRequestDispatcher("viewPackage.jsp");
				rd.forward(req, res);
			}
			else if(status.equals("failure"))
			{
				req.setAttribute("failure", "Failed to Delete the Package..");
				RequestDispatcher rd=req.getRequestDispatcher("viewPackage.jsp");
				rd.forward(req, res);
			}
		}
		
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			processRequest(req,resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
