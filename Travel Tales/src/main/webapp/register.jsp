<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup Page</title>
<link rel="icon" href='assets/logo.jpg'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<style>
  body {
      font-family: Arial, sans-serif;
      background-color: #f8f9fa;
      background-image: url('assets/login2.jpg');
      background-repeat: no-repeat;
      background-size: cover;
  }

  .container {
      margin-top: 30px;
  }

  .require {
      background-color: #e9ecef;
      border-radius: 10px;
      padding: 20px;
      height: 100%;
  }

  .require h3 {
      font-size: 30px;
      color: #333333;
      margin-bottom: 10px;
  }

  .require .pass {
      font-size: 20px;
      color: #555555;
  }

  form {
      background-color: #ffffff;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
  }

  .head {
      text-align: center;
      color: #333333;
      font-family: 'Times New Roman', Times, serif;
      font-weight: bold;
      margin-bottom: 20px;
  }

  label {
      color: #555555;
      font-size: 16px;
      margin-bottom: 5px;
  }

  .ip {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ced4da;
      border-radius: 5px;
      font-size: 16px;
  }

  .btn {
      font-size: 18px;
      border-radius: 5px;
      font-family: 'Times New Roman';
      font-weight: bold;
      width: 100%;
      padding: 10px;
  }

  a {
      font-size: 16px;
      color: #0d6efd;
      text-decoration: none;
  }

  a:hover {
      text-decoration: underline;
  }

  .error {
      color: red;
      font-size: 20px;
      margin-bottom:10px;
  }
</style>
<script>
<% if (request.getAttribute("status") != null) { 
    String message = (String) request.getAttribute("status");
    request.removeAttribute("status");
%>
Swal.fire({
    icon: "success",
    title: 'Success...',
    text: "<%= message %>"
});
<% } %>

<% if (request.getAttribute("failure") != null) { 
    String message = (String) request.getAttribute("failure");
    request.removeAttribute("failure");
%>
Swal.fire({
    icon: "error",
    title: 'Oooops..',
    text: "<%= message %>"
});
<% } %>

jQuery.validator.addMethod("checkemail", function (value, element) {
    return /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
});

jQuery.validator.addMethod("strongPassword", function (value, element) {
    return this.optional(element) || 
           /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/.test(value);
}, "Password must have at least 8 characters, including one uppercase, one lowercase, one number, and one special character.");

jQuery(document).ready(function ($) {
    $("#signup").validate({
        rules: {
            name: {
                required: true
            },
            email: {
                required: true,
                checkemail: true
            },
            phone: {
                required: true,
                minlength: 10,
                maxlength: 10
            },
            pw: {
                required: true,
                strongPassword: true
            },
            cp: {
                required: true,
                equalTo: "#pw"
            }
        },
        messages: {
            name: {
                required: "Please enter your name."
            },
            email: {
                required: "Please enter your email.",
                email: "Please enter a valid email ID."
            },
            phone: {
                required: "Please enter your phone number.",
                minlength: "Please enter a 10-digit number.",
                maxlength: "Number cannot exceed 10 digits."
            },
            pw: {
                required: "Please enter your password.",
                strongPassword: "Password must meet the complexity requirements."
            },
            cp: {
                required: "Please re-enter your password.",
                equalTo: "Passwords do not match."
            }
        },
        errorElement: "div",
        errorPlacement: function (error, element) {
            error.addClass("error");
            error.insertAfter(element);
        }
    });
});
</script>
</head>
<body>
<%@include file="header.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-6 h-50">
            <div class="require mt-5">
                <h3>Password Requirements:</h3>
                <p class="pass">    
                    Minimum 8 characters.<br>
                    At least one uppercase letter.<br>
                    At least one lowercase letter.<br>
                    At least one number.<br>
                    At least one special character.
                </p>
            </div>
        </div>
        <div class="col-md-6">
            <form action="signup" method="post" id="signup">
                <h1 class="head">SIGNUP</h1>
                <label for="name">Enter Your Full Name:</label>
                <input type="text" name="name" class="ip" id="name" placeholder="Full Name" required>

                <label for="phone">Enter Your Phone Number:</label>
                <input type="tel" name="phone" class="ip" id="phone" placeholder="Phone Number" required>

                <label for="email">Enter Your Mail ID:</label>
                <input type="email" name="email" class="ip" id="email" placeholder="Mail ID" required>

                <label for="pw">Enter Your Password:</label>
                <input type="password" name="pw" class="ip" id="pw" placeholder="Password" required>

                <label for="cp">Confirm Your Password:</label>
                <input type="password" name="cp" class="ip" id="cp" placeholder="Confirm Password" required>

                <center><input type="submit" value="SignUp" name="signup" class="btn btn-primary w-25"></center>
                <p class="text-center">Already Have an Account? <a href="login.jsp">Login Here</a></p>
            </form>
        </div>
    </div>
</div>
</body>
</html>
