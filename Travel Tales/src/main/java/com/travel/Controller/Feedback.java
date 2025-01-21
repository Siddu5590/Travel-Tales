package com.travel.Controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/contactus")
public class Feedback  extends HttpServlet{

	

	protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
	{
		resp.setContentType("text/html;charset=ISO-8859-1");
		
		HttpSession session=req.getSession();
		com.travel.Model.Feedback f=new com.travel.Model.Feedback(session);
		
			
		try {
		//insert reviews
		if(req.getParameter("feedback")!=null)
		{
			String name=req.getParameter("name");
			String phone=req.getParameter("phone");
			String email=req.getParameter("email");
			String review =req.getParameter("review");
			String rating=req.getParameter("rating");
			
			String status=f.insertFeedback(name,phone,email,review,rating);
			if(status.equals("success"))
			{
				req.setAttribute("status", "Feedback Sent Successfully...");
				RequestDispatcher rd=req.getRequestDispatcher("contactUs.jsp");
				rd.forward(req, resp);
			}
			else {
				req.setAttribute("failure", "Failed to send the Feedback...");
				RequestDispatcher rd=req.getRequestDispatcher("contactUs.jsp");
				rd.forward(req, resp);
			}
		}
		//delete review
		else if(req.getParameter("deletereview")!=null)
		{
			int id=Integer.parseInt(req.getParameter("id"));
			
			String status=f.deleteReview(id);
			if(status.equals("success"))
			{
				req.setAttribute("status", "Feedback Deleted Successfully...");
				RequestDispatcher rd=req.getRequestDispatcher("viewReviews.jsp");
				rd.forward(req, resp);
			}
			else {
				req.setAttribute("failure", "Failed to delete the Feedback...");
				RequestDispatcher rd=req.getRequestDispatcher("viewReviews.jsp");
				rd.forward(req, resp);
			}
		}
		
	}
	
	catch (Exception e) {
		e.printStackTrace();
	}

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}
}
