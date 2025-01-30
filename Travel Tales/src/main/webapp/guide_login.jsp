<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
     <link rel="icon" href='assets/logo.jpg'>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>

    <style>
        .card {
            margin-top: 50px;
            margin-left: 100px;
            padding-bottom: 30px;
        }
        #a1 {
            margin-left: 250px;
            color: black;
            font-weight: bold;
            font-size: 18px;
        }
    </style>
</head>
<%@include file="header.jsp" %>
<body class="body" style="background: url('assets/login2.jpg') no-repeat center center fixed; background-size: cover; color: white;">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg p-3 mb-5 rounded" style="background-color: transparent;">
                    <div class="card-header text-center">
                        <h4>Guide Login</h4>
                    </div>
                    <div class="card-body">
                        <form id="g_login" action="guide" method="post">
                            <div class="mb-3 input-group">
                                <span class="input-group-text bg-light">
                                    <i class="fas fa-envelope"></i>
                                </span>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                            </div>
                            <div class="mb-3 input-group">
                                <span class="input-group-text bg-light">
                                    <i class="fas fa-lock"></i>
                                </span>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                            </div>
                            <a id="a1" href="guideforgotPassword.jsp" class="forgot text-end">Forget password?</a>
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
        icon: "success",
        title: "Success...",
        text: "<%= message %>"
    });
    <% } %>
    
    <% if (request.getAttribute("failure") != null) { 
        String message = (String) request.getAttribute("failure");
        request.removeAttribute("failure");
    %>
    Swal.fire({
        icon: "error",
        title: "Oops...",
        text: "<%= message %>"
    });
    <% } %>

    jQuery.validator.addMethod("checkemail", function (value, element) {
        return /^(([^<>()[\]\.,;:\s@"]+(\.[^<>()[\]\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
    });

    jQuery(document).ready(function ($) {
        $("#login").validate({
            rules: {
                email: {
                    required: true,
                    checkemail: true
                },
                password: {
                    required: true,
                }
            },
            messages: {
                email: {
                    required: "Please enter the email.",
                    email: "Please enter a valid email ID."
                },
                password: {
                    required: "Please enter the password.",
                }
            }
        });
    });
    </script>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
