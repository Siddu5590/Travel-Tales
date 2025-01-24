<%@page import="com.travel.Entity.City"%>
<%@page import="com.travel.Model.cityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    body {
      font-family: Arial, sans-serif;
    }
    .container {
      margin: 30px auto;
      background: #fff;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
    .form-title {
      text-align: center;
      color: black;
      font-family: 'Times New Roman', Times, serif;
      font-weight: bold;
      margin-bottom: 20px;
    }
    label {
      font-size: 1rem;
      color: black;
      margin-top: 10px;
    }
    .form-control {
      margin-bottom: 15px;
      border-radius: 5px;
    }
    .form-textarea {
      resize: none;
      border-radius: 5px;
    }
    .btn {
      font-size: 1rem;
      font-weight: bold;
      width: 40%;
      margin-left: 180px;
    }
    .info-box {
      background-color: #f8f9fa;
      border: 1px solid #ddd;
      border-radius: 10px;
      padding: 15px;
      margin-bottom: 20px;
    }
    .info-box h3 {
      margin-bottom: 10px;
      font-size: 2rem;
      font-weight:bold;
      color: #333;
    }
    .info-box p{
    	font-size:1.3rem;
    }
  </style>
</head>
<body>
<%@include file="header.jsp" %>

<% if (session.getAttribute("uname") != null) { %>
<div class="container w-50">
  <div class="info-box">
    <h3 class="text-center">City Information:</h3>
    <%
      // Fetch the city_id parameter and validate it
      String cityIdParam = request.getParameter("city_id");
      if (cityIdParam != null && !cityIdParam.isEmpty()) {
        try {
          int cityId = Integer.parseInt(cityIdParam);
          cityDAO c = new cityDAO(session);
          ArrayList<City> al = c.viewCity(cityId);

          if (al.isEmpty()) {%>
            <p>No information found for the selected city.</p>
    
          <%} else {
            for (City ci : al) {%>
    		<center><img  src="<%=ci.getImage()%>" width="300px" height="200px" class="rounded">
            <p><strong>City:</strong> <%= ci.getCity_name() %></p>
            <p><strong>Cost: &#8377; </strong> <%= ci.getCost() %></p></center>
    
            <%}
          }
        } catch (NumberFormatException e) {
    %>
          <p>Error: Invalid city ID format.</p>
    <%
        }
      } else {
    %>
        <p>Error: City ID is missing or invalid.</p>
    <%
      }
    %>
  </div>

  <form method="POST" action="booking" id="book">
    <h2 class="form-title">Book Your Trip</h2>

    <label for="name">Name:</label>
    <input type="text" name="name" class="form-control" id="name" placeholder="Enter Your Name" required>

    <label for="phone">Phone Number:</label>
    <input type="tel" name="phone" class="form-control" id="phone" placeholder="Enter Phone Number" required>

    <label for="email">Email ID:</label>
    <input type="email" name="email" class="form-control" id="email" placeholder="Enter Email ID" required>

    <label for="people">Number of People:</label>
    <input type="text" name="people" class="form-control" id="pl" placeholder="Enter Number of People" required>

    <label for="travelDate">Travel Date:</label>
    <input type="date" name="date" class="form-control" id="travelDate" required>

    <label for="pick">Pickup Location:</label>
    <input type="text" name="loc" class="form-control" id="pick" placeholder="Enter Pickup Location" required>

    <label for="description">Description (Optional):</label>
    <textarea class="form-control form-textarea" id="description" name="description" rows="3" placeholder="Enter Additional Details"></textarea>

    <% if (cityIdParam != null && !cityIdParam.isEmpty()) {
        try {
          int cityId = Integer.parseInt(cityIdParam);
          cityDAO c = new cityDAO(session);
          ArrayList<City> al = c.viewCity(cityId);
          for (City ci : al) {
    %>
        <input type="hidden" name="city" value="<%= ci.getCity_name() %>" />
        <input type="hidden" name="cost" value="<%= ci.getCost() %>" />
        <input type="hidden" name="id" value="<%=ci.getCity_id() %>"/>
        <input type="hidden" name="uid" value="<%=session.getAttribute("id") %>"/>
    <% } } catch (NumberFormatException e) { } } %>

    <input type="hidden" name="book_date" id="book_date" value="" />

    <button type="submit" value="book" name="book" class="btn btn-primary text-center">Book Now</button>
  </form>
</div>

<% } else { %>
<div class="container text-center">
  <h3>Please Login to access your profile...</h3>
</div>
<% } %>

<script type="text/javascript">
  const today = new Date().toISOString().split('T')[0];
  document.getElementById('travelDate').setAttribute('min', today);
  document.getElementById("book_date").value = today;

  <% if (request.getAttribute("status") != null) { 
    String message = (String) request.getAttribute("status");
    request.removeAttribute("status");
  %>
  alert("<%= message %>");
  <% } %>

  <% if (request.getAttribute("failure") != null) { 
    String message = (String) request.getAttribute("failure");
    request.removeAttribute("failure");
  %>
  alert("<%= message %>");
  <% } %>
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
