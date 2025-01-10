<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup Page</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
    
    text: "<%= message %>"
});
<% } %>



            //            jQuery.validator.addMethod( name, method [, message ] )
//            
// value---> "current value of the validated element".
//elememt---> " element to be validated ".

            jQuery.validator.addMethod("checkemail", function(value, element) {
                return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
            });
            jQuery(document).ready(function($) {
                $("#signup").validate({
                    
                    rules: {
                        name: {
                            required: true
                        },
                        email: {
                            required: true,
                            mail: true
                        },
                        phone: {
                            required: true,
                            minlength: 10,
                            maxlength: 10
                        },
                        pw: {
                            required: true,
                            minlength: 6
                        },
                        cp: {
                            required: true,
                            minlength: 6,
                            equalTo: "#password"
                        }
                    },
                    messages: {
                        name: {
                            required: "Please enter the name."
                        },
                        email: {
                            required: "Please enter the email.",
                            mail: "Please enter valid email id"
                        },
                        phone: {
                            required: "Please enter the number.",
                            minlength: "Please enter the  10 digit number .",
                            maxlength: "less than or equal to 10 digits."
                        },
                        pw: {
                            required: "Please enter the password.",
                            minlength: "Please enter the password greater than or equal to  6.",
                        },
                        cp: {
                            required: "Please re-enter the password.",
                            minlength: "Please enter the password greater than or equal to 6.",
                            equalTo: "mismatch password"
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
      margin: 50px auto;
      padding-left: 50px;
      padding-right: 50px;
      padding-top: 10px;
      padding-bottom: 10px;
      position: relative;
      margin-left: 450px;
      font-size: medium;
      backdrop-filter: blur(10px);
  }
  h1{
      text-align: center;
      color: rgb(192, 249, 254);
  }
  .btn{
      margin-left: 80px;
      font-size:x-large;
      border-radius: 5px;
      font-family: 'Times New Roman', Times, serif;
      background-color: rgb(45, 45, 195);
      color: aliceblue;
      font-weight: bolder;
  }
  ::placeholder{
      font-size: medium;
      font-weight: lighter;
      opacity: 0.3;
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
 
  p{
    color: aliceblue;
  }
  input:hover{
  color:white;
  }
</style>
<body>
<%@include file="header.jsp" %>
  <form action="signup" method="post" id="signup">
  <h1>SIGNUP</h1>
  <br>
  <label>Enter Your Full Name:</label>
  <br>
  <input type="text" name="name" class="ip" id="name" placeholder="Full Name" required>
  <br><br>
  <label>Enter Your Phone Number:</label>
  <br>
  <input type="tel" name="phno" class="ip" id="phone" placeholder="Phone Number" required>
  <br><br>
  <label>Enter Your Mail ID:</label>
  <br>
  <input type="email" name="mail" class="ip" id="email" placeholder="Mail ID" required>
  <br><br>
  <label>Enter Your Password:</label>
  <br>
  <input type="password" name="password" class="ip" id="pw" placeholder="Password" required>
  <br><br>
  <label>Confirm Your Password:</label>
  <br>
  <input type="password" name="confirm" class="ip" id="cp" placeholder="Confirm password" required>
  <br><br>
  <input type="submit" value="SignUp" name="signup" class="btn">
  <p>Already Have an Account? <a href="login.jsp">Login Here</a></p>

</form>
</body>
</html>