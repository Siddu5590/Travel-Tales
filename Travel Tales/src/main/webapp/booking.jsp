<%@page import="com.travel.Entity.City"%>
<%@page import="com.travel.Model.cityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Booking Form</title>
   <link rel="icon" href='assets/logo.jpg'>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  

<style>
    
body{
     
     background-color:grey;
  }
  .addbooking{
      border: 5px solid rgb(3, 3, 3);
      box-shadow: 5px 3px 5px 3px;
      border-style: initial;
      border-radius: 20px;
      display: inline-block;
      margin: 20px 0px;
      padding-left: 40px;
      padding-right: 50px;
      padding-top: 10px;
      padding-bottom: 10px;
      position: relative;
      margin-left: 150px;
      font-size: medium;
      
  }
  h1{
      text-align: center;
      color: black;
      font-family:times new roman;
      font-weight:bold;
  }
  .btn{
      font-size:large;
      border-radius: 5px;
      font-family: times new roman;
      font-weight:bolder;
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
      color: black;
      font-size: large;
  }
 
  .login{
  	color:red;
  	margin-top:10px;
  }
  p{
    color: aliceblue;
  }
  input{
  width:300px;
  color:black;
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
  .ip1{
  	 margin-left: 5px;
      font-size: medium;
      background-color: transparent;
      border-radius: 5px;
      
  }
</style>
</head>
<body>
<%@include file="header.jsp" %>

<%if(session.getAttribute("uname")!=null){ %>
<div class="require">
<h3>Password Requirements:</h3>
<p class="pass">	
<%
  int id=Integer.parseInt(request.getParameter("city_id"));
  cityDAO c=new cityDAO(session);
  ArrayList<City> al=c.viewCity(id);
  Iterator itr=al.iterator();
  for(City ci:al){
  %>
  <label>City:<%=ci.getCity_name() %></label>
  <label>Cost:<%=ci.getCost() %></label>
<%} %>
	
</p>
</div>
<form method="POST" action="booking" class="addbooking" id="book">
  <h1 class="head">Book Trip Now</h1>
  <br>
  
  <label>Name:</label>
  <br>
  <input type="text" name="name" class="ip" id="name" placeholder="Enter Your Name" required>
  <br><br>
  <label>Phone Number:</label>
  <br>
  <input type="tel" name="phone" class="ip" id="phone" placeholder="Enter Phone Number" required>
  <br><br>
  <label>Email ID:</label>
  <br>
  <input type="email" name="email" class="ip" id="email" placeholder="Enter email ID" required>
  <br><br>
  <label>Number of People:</label>
  <br>
  <input type="text" name="people" class="ip" id="pl" placeholder="Enter number of people" required>
  <br><br>
  <label>Travel Date:</label>
  <br>
  <input type="date" name="date" class="ip" id="travelDate"  required>
  <br><br>
  <label>Pickup Location:</label>
  <br>
  <input type="text" name="loc" class="ip"  id="pick" placeholder="Enter pickup location" required>
  <br><br>
  <label>Description:(Optional)</label>
  <br>
  <textarea class="ip" id="description" name="description" value=" " rows="2" placeholder="Enter additional details"></textarea>
  <br><br>
  <center>
  <%
  Iterator itr1=al.iterator();
  for(City ci:al){ %>
  <input type="hidden" name="city" value="<%=ci.getCity_name()%>" />
  <input type="hidden" name="cost" value="<%=ci.getCost()%>" />
  <input type="hidden" name="book_date" id="book_date" value=""/>
  <%} %><button type="submit" value="book" name="book" class="btn btn-primary">Book Now</center>
  

</form>
<%@include file="footer.jsp" %>
<%} else { %>
<h3>Please Login to access your profile...</h3>
<%} %>


<script type="text/javascript">
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

jQuery.validator.addMethod("checkemail", function (value, element) {
    return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
});

    jQuery(document).ready(function ($) {
        $("#book").validate({
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
                pl: {
                    required: true,
                   },
                pick:{
                	required:true,
                
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
                pl: {
                    required: "Please enter number of people.",
                    
            },
               pick:{
            	    required:" Enter pickup location"   
               }
               }
            	 
        });
    });


  
  const today = new Date().toISOString().split('T')[0]; // Get today's date in YYYY-MM-DD format
  document.getElementById('travelDate').setAttribute('min', today); // Set min attribute to today's date
  document.getElementById("book_date").value = today;
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>