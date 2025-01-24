<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navbar with Hover Dropdown</title>
    <link rel="icon" href='assets/logo.jpg'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: black;
        }

        .logo {
            color: white;
        }

        .logo:hover {
            color: white;
            transform: scale(1.05);
        }

        .nav-item {
            font-size: 20px;
            margin-right: 40px;
        }

        .dropdown:hover .dropdown-menu {
            display: block;
            color: blue;
            transform: scale(1.05);
        }

        /* Ensure the dropdown works well on mobile devices */
        .navbar-nav {
            display: flex;
            flex-direction: row;
        }

        /* Custom toggle button color */
        .navbar-toggler {
            border-color: white;
        }

        .navbar-toggler-icon {
            background-color: white; /* Makes the toggle button icon white */
        }

        /* Adjust navbar links for mobile view */
        @media (max-width: 768px) {
            .navbar-nav {
                text-align: right; /* Align the links to the right */
                margin-top: 10px;
            }

            .nav-item {
                margin-right: 0;
            }

            .navbar-nav .dropdown-menu {
                position: static;
                float: none;
            }

            .dropdown-menu {
                width: 100%;
            }

            .nav-link {
                padding: 10px 0;
            }

            .logo {
                font-size: 18px;
                text-align: center;
                margin: auto;
            }
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <!-- Logo -->
            <a class="logo navbar-brand" href="adminDash.jsp">
                <img src="assets/logo.jpg" alt="Logo" width="40" height="40" class="rounded">
                Travel Tales
            </a>

            <!-- Toggler for mobile view -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navbar Links -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <% if (session.getAttribute("uname") != null) { %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle d-flex align-items-center text-white" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-solid fa-user me-2"></i> <%= session.getAttribute("uname") %>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                            <li><a class="dropdown-item" href="viewprofile.jsp">View Profile</a></li>
                            <li><a class="dropdown-item" href="resetPassword.jsp">Reset PIN</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <form action="signup" method="post">
                                    <input type="submit" value="Logout" name="logout" class="btn1 btn btn-danger ms-3" />
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
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
