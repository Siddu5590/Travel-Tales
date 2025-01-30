<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Tales</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        .dropdown:hover .dropdown-menu {
            display: block;
            background-color: none;
            margin-top: 37px;
        }
        .navbar-brand img:hover{
        	transform: scale(1.05);
        }
        .dropdown-menu {
            position: relative;
            right: 0;
        }

        .dropdown-item {
            position: relative;
            left: 30px;
            background: none;
            padding: 5px;
        }

        .items a {
            position: relative;
            float: right;
            font-size: 20px;
            margin-right: 30px;
        }

        .navbar-brand {
            color: white;
        }

        .nav-link i {
            font-size: 25px;
        }

        .items i:hover {
            color: yellow;
        }

        .nav-link:hover {
            color: blue;
        }

        .navbar-toggler {
            border: none;
        }

        .navbar-toggler-icon {
            color: white;
            background-color: #f8f9fa; /* Light color for better visibility */
            padding: 5px;
            border-radius: 5px;
        }

        @media (max-width: 768px) {
            .items a {
                float: none;
                text-align: center;
                margin: 10px 0;
            }

            .dropdown-menu {
                position: static;
                left: 0;
            }
            .btn
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-dark">
    <div class="container-fluid">
        <!-- Updated navbar-brand to include a logo -->
        <a class="navbar-brand d-flex align-items-center" href="guideDash.jsp" style="color: white;">
            <img src="assets/logo.jpg" alt="Logo" style="height: 50px; margin-right: 10px; border-radius: 50%"> 
            Travel Tales
        </a>
        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
        >
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                
                <% if (session.getAttribute("uname") != null) { %>
                
                <li class="items nav-item">
                        <a class="nav-link active" aria-current="page" href="guideDash.jsp" style="color: white;">Dashboard</a>
                    </li>
                   
                    <li class="items nav-item">
                        <a class="nav-link active" aria-current="page" href="guideAvail.jsp" style="color: white;">Guide Availability</a>
                    </li>
                    <li class="items nav-item dropdown bg-transparent">
                        <a
                            class="nav-link dropdown-toggle"
                            href="#"
                            role="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                            style="color: white;"
                        >
                            <i class="fa-solid fa-user"></i> <%= session.getAttribute("uname") %>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item mb-2 bg-transparent" href="guideResetPassword.jsp"><i class="fas fa-key"></i> Reset Pin</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <form action="signup" method="post">
                                    <input type="submit" value="Logout" name="logout" class="submit btn btn-danger ms-3" />
                                </form>
                            </li>
                        </ul>
                    </li>
                <% } else { %>
                    <li class="items nav-item">
                        <a class="nav-link active" aria-current="page" href="register.jsp" style="color: white;">Signup</a>
                    </li>
                    <li class="items nav-item">
                        <a class="nav-link active" aria-current="page" href="login.jsp" style="color: white;">Login</a>
                    </li>
                     <li class="items nav-item">
                        <a class="nav-link active" aria-current="page" href="guide_login.jsp" style="color: white;">Guide Login</a>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>


    <script>
        <% if (request.getAttribute("logout") != null) { 
                String message = (String) request.getAttribute("logout");
                request.removeAttribute("logout");
        %>
        Swal.fire({
            icon: "success",
            title: "Success...",
            text: "<%= message %>"
        });
        <% } %>
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12UnZzLNDR+e2LfHbBtCxPjwP+4lm0g4jcpTCtvpPQn5K5VS" crossorigin="anonymous"></script>
</body>
</html>
