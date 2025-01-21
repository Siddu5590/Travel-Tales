package com.travel.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.travel.Model.bookingDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/booking")
public class booking extends HttpServlet{
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			res.setContentType("text/html;charset=UTF-8");
			HttpSession session=req.getSession();
			if(req.getParameter("book")!=null)
			{
				String name=req.getParameter("name");
				String ph=req.getParameter("phone");
				String email=req.getParameter("email");
				String city=req.getParameter("city");
				System.out.println(req.getParameter("city"));
				int noPl=Integer.parseInt(req.getParameter("numpeople"));
				String date=req.getParameter("date");
				Double cost=Double.parseDouble(req.getParameter("cost"));
				String desc=req.getParameter("description");
				
				bookingDAO b=new bookingDAO(session);
				String status=b.addBooking(name, ph, email, city, noPl, date, cost, desc);
				
				if(status.equals("success"))
				{
					session.setAttribute("status", "Booking Done");
					RequestDispatcher rd=req.getRequestDispatcher("booking.jsp");
					rd.forward(req, res);
				}
				else if(status.equals("failure"))
				{
					session.setAttribute("failure", "Booking Unsuccessfull due to some error");
					RequestDispatcher rd=req.getRequestDispatcher("booking.jsp");
					rd.forward(req, res);
				}
				
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
