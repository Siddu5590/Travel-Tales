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

		HttpSession session = req.getSession();

		guideDAO g = new guideDAO(session);
		Guide1 g1 = new Guide1(session);

		try {
			// guide login
			if (req.getParameter("login") != null) {
				String mail = req.getParameter("email");
				String password = req.getParameter("password");

				String status = g.login(mail, password);

				if (status.equals("success")) {
					req.setAttribute("status", "Login Successfull");
					RequestDispatcher rd = req.getRequestDispatcher("guideDash.jsp");
					rd.forward(req, res);
				} else if (status.equals("failure")) {
					req.setAttribute("failure", "Login failed");
					RequestDispatcher rd = req.getRequestDispatcher("guide_login.jsp");
					rd.forward(req, res);
				}

			}
			
			//booking confirmed by guide
			else if(req.getParameter("acceptBook")!=null)
			{
				int book_id=Integer.parseInt(req.getParameter("id"));
				
				
				String status=g.acceptBooking(book_id);
				if (status.equals("success")) {
					req.setAttribute("status", "Booking Accepted");
					RequestDispatcher rd = req.getRequestDispatcher("guideDash.jsp");
					rd.forward(req, res);
				} else if (status.equals("failure")) {
					req.setAttribute("failure", "failed to accept the booking");
					RequestDispatcher rd = req.getRequestDispatcher("guideDash.jsp");
					rd.forward(req, res);
				}else if(status.equals("existed")) {
					req.setAttribute("existed", "You have another booking on the slot ");
					RequestDispatcher rd = req.getRequestDispatcher("guideDash.jsp");
					rd.forward(req, res);
				}
			}
			
			// add guide by admin
			else if (req.getParameter("guide") != null) {
				String name = req.getParameter("name");
				String phone = req.getParameter("phone");
				String email = req.getParameter("email");
				String age = req.getParameter("age");
				String city = req.getParameter("city");

				String status = g1.addguide(name, phone, email, age, city);
				if (status.equals("existed")) {
					req.setAttribute("failure", "User Already Existed.!!");
					RequestDispatcher rd = req.getRequestDispatcher("guide.jsp");
					rd.forward(req, res);
				} else if (status.equals("success")) {
					req.setAttribute("status", "Guide Added Successfully...");
					RequestDispatcher rd = req.getRequestDispatcher("guide.jsp");
					rd.forward(req, res);
				} else if (status.equals("failure")) {
					req.setAttribute("failure", "Failed to add Guide.!!");
					RequestDispatcher rd = req.getRequestDispatcher("guide.jsp");
					rd.forward(req, res);
				}

			}
			// delete guide by admin
			else if (req.getParameter("deleteGuide") != null) {
				int id = Integer.parseInt(req.getParameter("id"));

				String status = g1.deleteguide(id);
				if (status.equals("success")) {
					req.setAttribute("status", "Guide Deleted Successfully...");
					RequestDispatcher rd = req.getRequestDispatcher("viewGuide.jsp");
					rd.forward(req, res);
				} else if (status.equals("failure")) {
					req.setAttribute("failure", "Failed to delete Guide information.!!");
					RequestDispatcher rd = req.getRequestDispatcher("viewGuidex.jsp");
					rd.forward(req, res);
				}
			}
			
			// update guide details by admin
			else if (req.getParameter("updateguide") != null) {
				int id = Integer.parseInt(req.getParameter("id"));
				String name = req.getParameter("name");
				String phone = req.getParameter("phone");
				String email = req.getParameter("email");
				int age = Integer.parseInt(req.getParameter("age"));
				String city = req.getParameter("city");

				String status = g1.updateGuide(id, name, phone, email, age, city);
				if (status.equals("success")) {
					req.setAttribute("status", "guide Data updated Successfully...");
					RequestDispatcher rd = req.getRequestDispatcher("updateguide.jsp?guide_id=" + id);
					rd.forward(req, res);
				} else if (status.equals("failure")) {
					req.setAttribute("failure", "unable  to update Guide details.!!");
					RequestDispatcher rd = req.getRequestDispatcher("updateguide.jsp?guide_id=" + id);
					rd.forward(req, res);
				}

			}
			//Forgot password for guide
			else if(req.getParameter("forgot")!=null) {
				String email=req.getParameter("email");
				String password=req.getParameter("newpassword");
				String confirm =req.getParameter("confirmpassword");
				
				if(password.equals(confirm)) {
					String status=g.forgotPass(email,password);
					
				 if(status.equals("success")) {
					 	req.setAttribute("status", "Password Updated Successfully...");
						RequestDispatcher rd=req.getRequestDispatcher("guideforgotPassword.jsp");
						rd.forward(req, res);
					}
					else if(status.equals("failure")) {
						req.setAttribute("failure", "Failed to update password.!!");
						RequestDispatcher rd=req.getRequestDispatcher("guideforgotPassword.jsp");
						rd.forward(req, res);
					}
				}
				else {
					req.setAttribute("failure", "Password Mismatch.!!");
					RequestDispatcher rd=req.getRequestDispatcher("guideforgotPassword.jsp");
					rd.forward(req, res);
				}
			}
			
			//reset password for guide
			else if(req.getParameter("reset")!=null)
			{
				String eamil = req.getParameter("email");
                String password = req.getParameter("password");
                String newpassword = req.getParameter("newpassword");
                if (password.equals(newpassword)) {

                    String s = g.getPassword(eamil, password);
                    
                    if (s.equals("success") && (password.equals(newpassword))) {
                        req.setAttribute("failure", "New Password is same as old Password");
                        RequestDispatcher rd = req.getRequestDispatcher("guideResetPassword.jsp");
                        rd.forward(req, res);
                         
                    }
                } else {
                    String status = g.resetPass(eamil, newpassword);
                     if (status.equals("success")) {
                        req.setAttribute("status", "Password changed successfully");
                        RequestDispatcher rd = req.getRequestDispatcher("guideDash.jsp");
                        rd.forward(req, res);
                     }
                     else if(status.equals("failure"))
                     {
                    	 req.setAttribute("failure", "failed to change the Password ");
                         RequestDispatcher rd = req.getRequestDispatcher("guideResetPassword.jsp");
                         rd.forward(req, res); 
                     }
                }
			}
			
		
		} catch (Exception e) {
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