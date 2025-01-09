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
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
        .card{

            margin-top: 150px;
            margin-left: 100px;
            padding-bottom: 30px;
        }
        #a1{
            margin-left: 160px;
            padding-top: 30px;
            margin-top: 20px;
            
        }
        
    </style>
</head>
<body class="body" style="background: url('/login2.jpg') no-repeat center center fixed; background-size: cover; color: white;">
  
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card w-75" style="background-color: rgba(255, 255, 255, 0.9);">
                    <div class="card-header text-center">
                        <h4>Login</h4>
                    </div>
                    <div class="card-body">
                        <form id="loginForm" action="login" method="post">
                            <div class="mb-3">
                                <label for="email" class="form-label"><strong>Email</strong></label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label"><strong>Password</strong></label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                            </div>
                            <center>
                                <button type="submit" class="btn btn-primary w-25">Login</button>
                            </center>
                            <br>
                            <a id="a1" href="#">Forget password?</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

     

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
