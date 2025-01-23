<%@page import="com.travel.Entity.City"%>
<%@page import="com.travel.Model.cityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.travel.Model.placeDAO" %>
<%@page import="com.travel.Entity.Place" %>
<%@page import="java.util.*" %>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Booking Form</title>
   <link rel="icon" href='assets/logo.jpg'>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

  <style>
    body {
      background-color: #f8f9fa;
    }
    .form-container {
      max-width: 550px;
      max-height: 850px;
      margin: 30px auto;
      padding: 30px;
      background:white;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);

    }
    .label::after{
      content: "*";
      color:red;
      font-size: 20px;
    }
    .form-group button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-group .update-btn {
            background-color: #4CAF50;
            color: white;
        }
    .form-group .back-btn {
            background-color: #f44336;
            color: white;
            
        }
        .back-btn a{
        	text-decoration:none;
        	color:white;
        	font-size:20px;
        }
  </style>
</head>
<body class="body" style="background:url('assets/booking.jpg') no-repeat center center fixed;background-size: cover; color: rgb(12, 2, 2);">
<%@include file="header.jsp" %>
<div class="form-container">
<%if(session.getAttribute("uname")!=null){ %>
  <h3 class="text-center mb-4">Booking Form</h3><hr>
  
  <form id="travelForm" action="booking" method="post">
  
  <div class="row mb-3">
  <div class="col">
    <label for="numPeople" class="label form-label"><strong>Name</strong></label>
   <input type="text" class="form-control" id="name" name="name" placeholder="Enter Your Name" value="<%=session.getAttribute("uname") %>" required>
  </div>
  
  <div class="col">
    <label for="numPeople" class="label form-label"><strong>Phone Number</strong></label>
   <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter your Phone Number" value="<%=session.getAttribute("phone") %>" required>
  </div>
</div>

<div class="row mb-3">
  <div class="col">
    <label for="numPeople" class="label form-label"><strong>Email</strong></label>
   <input type="email" class="form-control" id="email" name="email" placeholder="Enter Your Email Id" value="<%=session.getAttribute("email") %>" required>
  </div>
  <%cityDAO c=new cityDAO(session);
   int city_id=Integer.parseInt(request.getParameter("city_id"));
    ArrayList<City> al=c.viewCity(city_id);
    for(City ci:al){
    	//System.out.println(ci.getCity_name());
     %>
  <div class="col">
    <label for="numPeople" class="label form-label"><strong>City</strong></label>
   <input type="text" class="form-control" id="city" name="city" value="<%=ci.getCity_name() %>" required>
  </div>
  
</div>


<div class="row mb-3">
  <div class="col">
  <label for="numPeople" class="label form-label"><strong>Number of People</strong></label>
   <input type="number" class="form-control" id="numPeople" name="numpeople" placeholder="Enter number of people" value="1" required>
  </div>
  
  <div class="col">
    <label for="travelDate" class="label form-label"><strong>Date</strong> </label>
      <input type="date" class="form-control" name="date" id="travelDate" required>
  </div>
</div>

<div class="row mb-3">
  <div class="col">
  <label for="cost" class="label form-label"><strong>Cost</strong></label>
  <input type="number" class="form-control" id="cost" name="cost" placeholder="Enter the cost" value="<%=ci.getCost() %>" required>
  </div>
  <% } %>
  
  <div class="col">
    <label for="discount" class="label form-label"><strong>Discount</strong></label>
      <input type="number" class="form-control" id="discount" name="discount" placeholder="Enter discount amount" value="5"required>
  </div>
</div>

      
    <div class="mb-3">
      <label for="description" class="form-label" ><strong>Description</strong> <span style="color: green;">(optional)</span></label>
      <textarea class="form-control" id="description" name="description" value=" " rows="3" placeholder="Enter additional details"></textarea>
    </div>
    <p class="text-center" style="font-size: 20px;">Including Food, Stay and Travelling cost</p>
    
    <center><div class="form-group">
            <button type="submit" class="update-btn w-75" name="book" value="book now">Book Travel</button>
            <a href="index.jsp"><button type="button" class="back-btn w-75">Back</button></a>
        </div></center>
  </form>
</div>

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

  
  const today = new Date().toISOString().split('T')[0]; // Get today's date in YYYY-MM-DD format
  document.getElementById('travelDate').setAttribute('min', today); // Set min attribute to today's date
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>