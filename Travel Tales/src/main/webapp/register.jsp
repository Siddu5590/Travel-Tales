<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>

</head>
<body>
<script>
<% if (request.getAttribute("status") != null) { 
    String message = (String) request.getAttribute("status");
    request.removeAttribute("status");
%>
Swal.fire({
    icon:"success",
    title: 'Success...',
    text: "<%= message %>"
});
<% } %>

<% if (request.getAttribute("failure") != null) { 
    String message = (String) request.getAttribute("failure");
    request.removeAttribute("failure");
%>
Swal.fire({
    icon:"error",
    title: 'Oooops..',
    text: "<%= message %>"
});
<% } %>

// Custom method for email validation remains unchanged
jQuery.validator.addMethod("checkemail", function (value, element) {
    return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
});

// Custom method for password validation
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
                strongPassword: true // Use the custom password validation rule
            },
            cp: {
                required: true,
                equalTo: "#pw" // Ensure it matches the password field
            }
        },
        messages: {
            name: {
                required: "Please enter the name."
            },
            email: {
                required: "Please enter the email.",
                email: "Please enter a valid email ID."
            },
            phone: {
                required: "Please enter the number.",
                minlength: "Please enter a 10-digit number.",
                maxlength: "Number cannot exceed 10 digits."
            },
            pw: {
                required: "Please enter the password.",
                strongPassword: "Password must meet the complexity requirements."
            },
            cp: {
                required: "Please re-enter the password.",
                equalTo: "Passwords do not match."
            }
        }
    });
});

</script>
<style>
  body{
      background-image: url('assets/signuptour.jpg');
      background-size: cover;
      background-repeat: no-repeat;
  }
  form{
      border: 5px solid rgb(3, 3, 3);
      box-shadow: 5px 3px 5px 3px;
      border-style: initial;
      border-radius: 20px;
      display: inline-block;
      margin: 20px 0px;
      padding-left: 50px;
      padding-right: 50px;
      padding-top: 10px;
      padding-bottom: 10px;
      position: relative;
      margin-left: 150px;
      font-size: medium;
      backdrop-filter: blur(10px);
  }
  h1{
      text-align: center;
      color: rgb(192, 249, 254);
  }
  .btn{
      font-size:x-large;
      border-radius: 5px;
      font-family: 'Times New Roman', Times, serif;
      background-color: rgb(45, 45, 195);
      color: aliceblue;
      font-weight: bolder;
      width:100px;
  }
  ::placeholder{
      font-size: medium;
      font-weight: lighter;
      opacity: 0.5;
      color: rgb(252, 252, 252);
      
      
      
  }
  .ip{
      margin-left: 20px;
      font-size: medium;
      background-color: transparent;
      border-radius: 5px;
  }
  label{
      margin-left: 20px;
      color: rgb(255, 239, 239);
      font-size: large;
  }
  a{
      font-size: 19px ;
      color: rgb(142, 249, 189);
      text-decoration: none;   
  }
  .login{
  	color:white;
  	margin-top:10px;
  }
  p{
    color: aliceblue;
  }
  input{
  width:300px;
  color:white;
  font-weight: 500;
  }
  .require{
  	margin-top:130px;
  	margin-left:30px;
  	float:left;
  	width:auto;
  	color:black;
  	padding:20px;
  	background-color:white;
  	border-top-left-radius:30px;
  	border-bottom-right-radius:30px;
  }
  .require .pass{
  	font-size:20px;	
  	color:black;
  }
  
</style>
<body>
<%@include file="header.jsp" %>
<div class="require">
<h3>Password Requirements:</h3>
<p class="pass">	
Minimum 8 characters.<br>
At least one uppercase letter.<br>
At least one lowercase letter.<br>
At least one number.<br>
At least one special character.
	
</p>
</div>
  <form action="signup" method="post" id="signup">
  <h1>SIGNUP</h1>
  <br>
  <label>Enter Your Full Name:</label>
  <br>
  <input type="text" name="name" class="ip" id="name" placeholder="Full Name" required>
  <br><br>
  <label>Enter Your Phone Number:</label>
  <br>
  <input type="tel" name="phone" class="ip" id="phone" placeholder="Phone Number" required>
  <br><br>
  <label>Enter Your Mail ID:</label>
  <br>
  <input type="email" name="email" class="ip" id="email" placeholder="Mail ID" required>
  <br><br>
  <label>Enter Your Password:</label>
  <br>
  <input type="password" name="pw" class="ip" id="pw" placeholder="Password" required>
  <br><br>
  <label>Confirm Your Password:</label>
  <br>
  <input type="password" name="cp" class="ip" id="cp" placeholder="Confirm password" required>
  <br><br>
  <center><input type="submit" value="SignUp" name="signup" class="btn btn-primary"></center>
  <p>Already Have an Account? <a href="login.jsp" class="login">Login Here</a></p>

</form>
</body>
</html>