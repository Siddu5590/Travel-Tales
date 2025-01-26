<%@page import="com.travel.Entity.Booking"%>
<%@page import="com.travel.Model.bookingDAO"%>
<%@page import="com.travel.Entity.Packages"%>
<%@page import="com.travel.Model.PackagesDAO"%>
<%@page import="com.travel.Entity.Reviews"%>
<%@page import="com.travel.Model.Feedback"%>
<%@page import="com.travel.Entity.Guide"%>
<%@page import="com.travel.Model.Guide1"%>
<%@page import="com.travel.Entity.Customer"%>
<%@page import="com.travel.Model.Register"%>
<%@page import="com.travel.Entity.City"%>
<%@page import="com.travel.Model.placeDAO" %>
<%@page import="com.travel.Entity.Place" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.travel.Model.cityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%cityDAO c=new cityDAO(session);
    ArrayList<City> city =c.viewCity();
    Register reg=new Register(session);
	ArrayList<Customer> customer=reg.viewUsers();
	Guide1 g=new Guide1(session);;
	ArrayList<Guide> guide = g.viewGuide();
	placeDAO p=new placeDAO(session);
	ArrayList<Place> place=p.viewPlace();
	Feedback fe=new Feedback(session);
	ArrayList<Reviews> re=fe.viewReview();
	PackagesDAO pa=new PackagesDAO(session);
	ArrayList<Packages> pac=pa.viewPackage();
	bookingDAO b=new bookingDAO(session);
	ArrayList<Booking> book=b.getBookings();
	ArrayList<Booking> packBook=b.getPackageBookings();
	
	%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin</title>
    <link rel="icon" href='assets/logo.jpg'>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            height: 100vh;
            font-family: 'Arial', sans-serif;
        }

        /* Sidebar */
        .sidebar {
            background-color: #f8f9fa;
            min-height: 100vh;
            padding: 15px;
            width: 250px;
        }

        .sidebar a {
            text-decoration: none;
            color: #000;
            font-size: 18px;
            padding: 10px;
            display: block;
        }

        .sidebar a:hover {
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .container-fluid {
            margin-left: 270px;
        }

        main {
            background-image: url('assets/Tours.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            min-height: 100vh;
            color: white;
        }

        /* Cards */
        .card {
            width: 200px; /* Set consistent width */
            height: 200px; /* Set consistent height */
            text-align: center;
            margin: 15px;
            text-decoration:none;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px) scale(1.05);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        }

        .card-title {
            font-size: 18px;
            font-weight: bold;
            text-decoration: none;
            
        }
        .title{
        	margin-top: 20px;
        }

        /* Responsive grid layout */
        .card-columns {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            justify-content: center;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container-fluid {
                margin-left: 0;
            }

            .sidebar {
                width: 100%;
                position: relative;
            }

            .sidebar a {
                text-align: center;
            }

            main {
                padding: 15px;
            }
        }
    </style>
</head>
<body>
<%@include file="adminHeader.jsp" %>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-3 col-lg-2 sidebar shadow-lg p-3 bg-body-tertiary">
                <h5 class="mb-3">Dashboard</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="viewCity.jsp" class="nav-link">Cities</a></li>
                    <li class="nav-item mb-2"><a href="viewPlace.jsp" class="nav-link">Places</a></li>
                    <li class="nav-item mb-2"><a href="viewUsers.jsp" class="nav-link">View Users</a></li>
                    <li class="nav-item mb-2"><a href="viewBooking.jsp" class="nav-link">Booking Status</a></li>
                    <li class="nav-item mb-2"><a href="viewPackageBooking.jsp" class="nav-link">Package Bookings</a></li>
                    <li class="nav-item mb-2"><a href="viewReviews.jsp" class="nav-link">Feedback</a></li>
                    <li class="nav-item mb-2"><a href="viewGuide.jsp" class="nav-link">Guides</a></li>
                    <li class="nav-item mb-2"><a href="viewPackage.jsp" class="nav-link">View Packages</a></li>
                </ul>
            </nav>

            <%if(session.getAttribute("uname")!=null){ %>
            <!-- Main Content -->
            <main class="col-md-9 col-lg-10">
                <div class="container mt-5">
                    <div class="card-columns">
                        <!-- Card 1 -->
                        <a href="viewCity.jsp" class="card shadow">
                            <div class="card-body">
                                <h5 class="card-title">Total Cities</h5>
                                <hr class="m-0">
                                <h5 class="title card-title"><%=city.size() %></h5>
                            </div>
                        </a>

                        <!-- Card 2 -->
                        <a href="viewBooking.jsp" class="card shadow">
                            <div class="card-body">
                                <h5 class="card-title">Total Bookings</h5>
                                <hr class="m-0">
                                <h5 class="title card-title"><%=book.size()%></h5>
                            </div>
                        </a>

                        <!-- Card 3 -->
                        <a href="viewPackageBooking.jsp" class="card shadow">
                            <div class="card-body">
                                <h5 class="card-title">Total Package Bookings</h5>
                                <hr class="m-0">
                                <h5 class="title card-title"><%=packBook.size()%></h5>
                            </div>
                        </a>

                        <!-- Card 4 -->
                        <a href="viewGuide.jsp" class="card shadow">
                            <div class="card-body">
                                <h5 class="card-title">Total Guides</h5>
                                <hr class="m-0">
                                <h5 class="title card-title"><%=guide.size() %></h5>
                            </div>
                        </a>

                        <!-- Card 5 -->
                        <a href="viewUsers.jsp" class="card shadow">
                            <div class="card-body">
                                <h5 class="card-title">Total Users</h5>
                                <hr class="m-0">
                                <h5 class="title card-title"><%=customer.size() %></h5>
                            </div>
                        </a>

                        <!-- Card 6 -->
                        <a href="viewPlace.jsp" class="card shadow">
                            <div class="card-body">
                                <h5 class="card-title">Total Places</h5>
                                <hr class="m-0">
                                <h5 class="title card-title"><%=place.size()%></h5>
                            </div>
                        </a>

                        <!-- Card 7 -->
                        <a href="viewReviews.jsp" class="card shadow">
                            <div class="card-body">
                                <h5 class="card-title">Total Feedbacks</h5>
                                <hr class="m-0">
                                <h5 class="title card-title"><%=re.size() %></h5>
                            </div>
                        </a>

                        <!-- Card 8 -->
                        <a href="viewPackage.jsp" class="card shadow">
                            <div class="card-body">
                                <h5 class="card-title">Total Packages</h5>
                                <hr class="m-0">
                                <h5 class="title card-title"><%=pac.size() %></h5>
                            </div>
                        </a>
                    </div>
                </div>
            </main>
            <%} else { %>
            <h3 class="text-center position-absolute top-25 end-0 mt-5">Please Login to access your profile...</h3>
            <%} %>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
