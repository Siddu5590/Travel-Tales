<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        }
        .sidebar a {
            text-decoration: none;
            color: #000;
        }
        .sidebar a:hover {
            color: #007bff;
        }
        .container-fluid{
            display: block;
        }
         main {
            background-image: url('img.jpg'); /* Replace with your image URL */
            background-size: cover; /* Make the image cover the entire main area */
            background-repeat: no-repeat; /* Prevent repeating */
            background-position: center; /* Center the image */
            min-height: 100vh; /* Ensure it fits the viewport height */
            color: white; /* Adjust text color for readability */
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-3 col-lg-2 sidebar">
                <h5 class="mb-3">DashBoard</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2">
                        <a href="page1.html" class="nav-link">Categories</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="page2.html" class="nav-link">Places</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="page3.html" class="nav-link">View Users</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="page4.html" class="nav-link">Booking Status</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="page4.html" class="nav-link">Feedback</a>
                    </li>
                    <li class="nav-item mb-2">
                        <a href="page4.html" class="nav-link">Guides</a>
                    </li>
                </ul>
            </nav>
            <!-- Main Content -->
            <main class="col-md-9 col-lg-10">
            
            <div class="container mt-5">
                <div class="d-flex justify-content-center gap-3">
                    <!-- Card 1 -->
                    <div class="card shadow" style="width: auto;">
                        <div class="card-body">
                            <h5 class="card-title">Total Categories</h5>
                        </div>
                        <hr class="m-0">
                        <div class="card-body">
                            <h5 class="card-title">0</h5>
                        </div>
                    </div>
                    <div class="card shadow" style="width: auto;">
                        <div class="card-body">
                            <h5 class="card-title">Total Bookings</h5>
                        </div>
                        <hr class="m-0">
                        <div class="card-body">
                            <h5 class="card-title">0</h5>
                        </div>
                    </div>
                    <div class="card shadow" style="width: auto;">
                        <div class="card-body">
                            <h5 class="card-title">Total Guides</h5>
                        </div>
                        <hr class="m-0">
                        <div class="card-body">
                            <h5 class="card-title">0</h5>
                        </div>
                    </div>
                    <!-- Card 2 -->
                    <div class="card shadow" style="width: auto;">
                        <div class="card-body">
                            <h5 class="card-title">Total users</h5>
                        </div>
                        <hr class="m-0">
                        <div class="card-body">
                            <h5 class="card-title">0</h5>
                            
                        </div>
                    </div>
                    <!-- Card 3 -->
                    <div class="card shadow" style="width: auto;">
                        <div class="card-body">
                            <h5 class="card-title">Total Places</h5>
                        </div>
                        <hr class="m-0">
                        <div class="card-body">
                            <h5 class="card-title">0</h5>
                        </div>
                    </div>
                     <!-- Card 3 -->
                     <div class="card shadow" style="width: auto;">
                        <div class="card-body">
                            <h5 class="card-title">Total Feedbacks</h5>
                        </div>
                        <hr class="m-0">
                        <div class="card-body">
                            <h5 class="card-title">0</h5>
                        </div>
                    </div>
                    
                </div>
            </div>
            </main>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
