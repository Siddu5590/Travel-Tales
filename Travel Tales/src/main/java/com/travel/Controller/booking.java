package com.travel.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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
			 PrintWriter out = res.getWriter();
			HttpSession session=req.getSession();
			if(req.getParameter("book")!=null)
			{
				String name=req.getParameter("name");
				String ph=req.getParameter("phone");
				String placeIds=req.getParameter("places");
				String noPl=req.getParameter("numpeople");
				String date=req.getParameter("date");
				String desc=req.getParameter("description");
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
