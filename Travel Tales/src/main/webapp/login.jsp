<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
        .card{

            margin-top: 50px;
            margin-left: 100px;
            padding-bottom: 30px;
        }
        #a1{
            margin-left: 250px;
            
        }
        
    </style>
</head>
<%@include file="header.jsp" %>
<body class="body" style="background: url('/login2.jpg') no-repeat center center fixed; background-size: cover; color: white;">
  
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card w-75" style="background-color: rgba(255, 255, 255, 0.9);">
                    <div class="card-header text-center">
                        <h4>Login</h4>
                    </div>
                    <div class="card-body">
                        <form id="loginForm" action="signup" method="post">
                            <div class="mb-3">
                                <label for="email" class="form-label"><strong>Email</strong></label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label"><strong>Password</strong></label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                            </div>
                            <a id="a1" href="forgotPassword.jsp" class="forgot">Forget password?</a>
                            <center>
                                <button type="submit" class="btn btn-primary w-25 mb-3 mt-3" name="login">Login</button>
                            </center>
                            
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

     <script>
     <% if (request.getAttribute("status") != null) { 
    	    String message = (String) request.getAttribute("status");
    	    request.removeAttribute("status");
    	%>
    	Swal.fire({
    	    icon: "error",
    	    title: "Oops...",
    	    text: "<%= message %>"
    	});
    	<% } %>
    	
    	
     </script>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
