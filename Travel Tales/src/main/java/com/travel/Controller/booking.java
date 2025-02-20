package com.travel.Controller;

import java.io.IOException;

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
			bookingDAO b=new bookingDAO(session);
			
		     // add booking
			if(req.getParameter("book")!=null)
			{
				int user_id=Integer.parseInt(req.getParameter("uid"));
				String name=req.getParameter("name");
				String ph=req.getParameter("phone");
				String email=req.getParameter("email");
			    String city=req.getParameter("city");
			   // System.out.println(city);
				int noPl=Integer.parseInt(req.getParameter("people"));
				String date=req.getParameter("date");
				Double cost=Double.parseDouble(req.getParameter("cost"));
				String desc=req.getParameter("description");
				String loc=req.getParameter("loc");
//				String bookDate=req.getParameter("book_date");
				String id=req.getParameter("id");
				
				
				String status=b.addBooking(user_id,name, ph, email, city, noPl, date, cost, desc, loc);
				if(status.equals("existed")) {
					req.setAttribute("failure", "Already you have Booking on this date");
					RequestDispatcher rd=req.getRequestDispatcher("booking.jsp?city_id="+id);
					rd.forward(req, res);
				}
				else if(status.equals("success"))
				{
					req.setAttribute("status", "Booking Done");
					RequestDispatcher rd=req.getRequestDispatcher("booking.jsp?city_id="+id);
					rd.forward(req, res);
				}
				else if(status.equals("failure"))
				{
					req.setAttribute("failure", "Booking Unsuccessfull due to some error");
					RequestDispatcher rd=req.getRequestDispatcher("booking.jsp?city_id="+id);
					rd.forward(req, res);
				}
				
				//booking cancel by user
			}else if(req.getParameter("cancel")!=null)
			{
				int id=Integer.parseInt(req.getParameter("id"));
				String status=b.cancelBooking(id);
				if(status.equals("success"))
				{
					req.setAttribute("status", "Cancelled Successfully");
					RequestDispatcher rd=req.getRequestDispatcher("status.jsp?city_id="+id);
					rd.forward(req, res);
				}
				else if(status.equals("failure"))
				{
					req.setAttribute("failure", "Canceling Unsuccessfull due to some error");
					RequestDispatcher rd=req.getRequestDispatcher("booking.jsp?city_id="+id);
					rd.forward(req, res);
				}
			}
			
			//booking confirm by guide
			else if(req.getParameter("confirm")!=null)
			{
				int id=Integer.parseInt(req.getParameter("id"));
				String status=b.confirmBooking(id);
				if(status.equals("success"))
				{
					req.setAttribute("status", "Booking Confirmed Successfully");
					RequestDispatcher rd=req.getRequestDispatcher("viewPackageBooking.jsp?city_id="+id);
					rd.forward(req, res);
				}
				else if(status.equals("failure"))
				{
					req.setAttribute("failure", "Failed to Confirm the Booking due to some error");
					RequestDispatcher rd=req.getRequestDispatcher("viewPackageBooking.jsp?city_id="+id);
					rd.forward(req, res);
				}
			}
			
			//booking cancel by admin
			else if(req.getParameter("admincancel")!=null)
			{
				int id=Integer.parseInt(req.getParameter("id"));
				String status=b.admincancelBooking(id);
				if(status.equals("success"))
				{
					req.setAttribute("status", "Cancelled Successfully");
					RequestDispatcher rd=req.getRequestDispatcher("viewBooking.jsp?city_id="+id);
					rd.forward(req, res);
				}
				else if(status.equals("failure"))
				{
					req.setAttribute("failure", "Canceling Unsuccessfull due to some error");
					RequestDispatcher rd=req.getRequestDispatcher("viewBooking.jsp?city_id="+id);
					rd.forward(req, res);
				}
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
