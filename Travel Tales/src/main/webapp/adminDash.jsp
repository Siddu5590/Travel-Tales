<%@page import="com.travel.Entity.Guide"%>
<%@page import="com.travel.Model.Guide1"%>
<%@page import="com.travel.Entity.Customer"%>
<%@page import="com.travel.Model.Register"%>
<%@page import="com.travel.Entity.City"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.travel.Model.cityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%cityDAO c=new cityDAO(session);
    ArrayList<City> city =c.viewCity();
    Register reg=new Register(session);
	ArrayList<Customer> customer=reg.viewUsers();
	Guide1 g=new Guide1(session);;
	ArrayList<Guide> guide = g.viewGuide();%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            height: 100vh;
        }
        .sidebar {
            background-color: #f8f9fa;
            min-height: 100vh;
            padding: 15px;
            margin-top:50px;
        }
        .sidebar a {
            text-decoration: none;
            color: #000;
            font-size:20px;
        }
        .sidebar a:hover {
            color: #007bff;
        }
        .container-fluid{
            display: block;
        }
         main {
            background-image:url('assets/Tours.jpg');/* Replace with your image URL */
            background-size: cover; /* Make the image cover the entire main area */
            background-repeat: no-repeat; /* Prevent repeating */
            background-position: center; /* Center the image */
            min-height: 100vh; /* Ensure it fits the viewport height */
            color: white; /* Adjust text color for readability */
        }
        .card-title{
            text-align:center;
        }
        .card:hover{
        	transform: scale(1.1);
 			transition: transform 0.3s ease;
        }
    </style>
</head>
<body>
<%@include file="adminHeader.jsp" %>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-3 col-lg-2 sidebar shadow-lg p-3 mb-5 bg-body-tertiary">
                <h5 class="mb-3">DashBoard</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2">
                        <a href="viewCity.jsp" class="nav-link">Cities</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="viewPlace.jsp" class="nav-link">Places</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="viewUsers.jsp" class="nav-link">View Users</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="page4.html" class="nav-link">Booking Status</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="page4.html" class="nav-link">Feedback</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="viewGuide.jsp" class="nav-link">Guides</a>
                    </li>
                    
                </ul>
            </nav>
            <%if(session.getAttribute("uname")!=null){ %>
            <!-- Main Content -->
            <main class="col-md-9 col-lg-10">
            
            <div class="container mt-5">
                <div class="d-flex justify-content-center gap-3">
                    <!-- Card 1 -->
                    <a href="viewCity.jsp" class="card shadow" style="width: auto;">
                        <div class="card-body">
                            <h5 class="card-title">Total Cities</h5>
                        </div>
                        <hr class="m-0">
                        <div class="card-body">
                            <h5 class="card-title"><%=city.size() %></h5>
                        </div>
                    </a>
                    <a href="page.jsp" class="card shadow" style="width: auto;">
                        <div class="card-body">
                            <h5 class="card-title">Total Bookings</h5>
                        </div>
                        <hr class="m-0">
                        <div class="card-body">
                            <h5 class="card-title">0</h5>
                        </div>
                    </a>
                    <a href="page.jsp" class="card shadow" style="width: auto;">
                        <div class="card-body">
                            <h5 class="card-title">Total Guides</h5>
                        </div>
                        <hr class="m-0">
                        <div class="card-body">
                            <h5 class="card-title"><%=guide.size() %></h5>
                        </div>
                    </a>
                    <!-- Card 2 -->
                    <a href="page.jsp" class="card shadow" style="width: auto;">
                        <div class="card-body">
                            <h5 class="card-title">Total users</h5>
                        </div>
                        <hr class="m-0">
                        <div class="card-body">
                            <h5 class="card-title"><%=customer.size() %></h5>
                            
                        </div>
                    </a>
                    <!-- Card 3 -->
                    <a href="viewPlace.jsp" class="card shadow" style="width: auto;">
                        <div class="card-body">
                            <h5 class="card-title">Total Places</h5>
                        </div>
                        <hr class="m-0">
                        <div class="card-body">
                            <h5 class="card-title">0</h5>
                        </div>
                    </a>
                     <!-- Card 3 -->
                     <a href="page.jsp" class="card shadow" style="width: auto;">
                        <div class="card-body">
                            <h5 class="card-title">Total Feedbacks</h5>
                        </div>
                        <hr class="m-0">
                        <div class="card-body">
                            <h5 class="card-title">0</h5>
                        </div>
                    </a>
                    
                </div>
            </div>
            </main>
            
        </div>
        
    </div>
    <%} else { %>
            <h3 class="text-center position-absolute top-25 end-0 mt-5">Please Login now to access your profile...</h3>
            <%} %>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
