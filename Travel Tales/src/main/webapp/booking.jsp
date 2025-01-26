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
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>

  <style>
    body {
      font-family: Arial, sans-serif;
    }
    .container {
      margin: 30px auto;
      display: flex;
      justify-content: space-between;
    }
    .info-box {
      width: 45%;
      background-color: #f8f9fa;
      border: 1px solid #ddd;
      border-radius: 10px;
      padding: 15px;
      margin-right: 20px;
      height: 400px;
      box-shadow: 0 8px 12px rgba(0, 0, 0, 0.3);
    }
    .info-box h3 {
      margin-bottom: 10px;
      font-size: 2rem;
      font-weight: bold;
      color: #333;
      text-align: center;
    }
    .info-box p {
      font-size: 1.3rem;
      text-align: center;
    }
    .form-container {
      width: 45%;
      background: #fff;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 8px 12px rgba(0, 0, 0, 0.3);
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
      margin-top: 20px;
    }
  </style>
</head>
<body>
<%@include file="header.jsp" %>

<% if (session.getAttribute("uname") != null) { %>
<div class="container">
  <div class="info-box">
    <h3>City Information:</h3>
    <%
      String cityID = request.getParameter("city_id");
      if (cityID != null && !cityID.isEmpty()) {
        try {
          int city_id = Integer.parseInt(cityID);
          cityDAO c = new cityDAO(session);
          ArrayList<City> al = c.viewCity(city_id);

          if (al.isEmpty()) {%>
            <p>No information found for the selected city.</p>
          <%} else {
            for (City ci : al) {%>
            <center><img src="<%=ci.getImage()%>" width="300px" height="200px" class="rounded">
            <p><strong>City:</strong> <%= ci.getCity_name() %></p>
            <p><strong>Cost: &#8377; </strong> <span id="cost"><%= ci.getCost() %></span></p>
            <p><strong>Total People:</strong> <span id="totalPeople">1</span></p></center>
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

  <div class="form-container">
    <form method="POST" action="booking" id="book">
      <h2 class="form-title">Book Your Trip</h2>

      <label for="name">Name:</label>
      <input type="text" name="name" class="form-control" id="name" placeholder="Enter Your Name" required>

      <label for="phone">Phone Number:</label>
      <input type="tel" name="phone" class="form-control" id="phone" placeholder="Enter Phone Number" min="10" maxlength="10" required>

      <label for="email">Email ID:</label>
      <input type="email" name="email" class="form-control" id="email" placeholder="Enter Email ID" required>

      <label for="people">Number of People:</label>
      <input type="number" name="people" class="form-control" id="people" value="1" min="1" max="12" required>

      <label for="travelDate">Travel Date:</label>
      <input type="date" name="date" class="form-control" id="travelDate" required>

      <label for="pick">Pickup Location:</label>
      <input type="text" name="loc" class="form-control" id="pick" placeholder="Enter Pickup Location" required>

      <label for="description">Description (Optional):</label>
      <textarea class="form-control form-textarea" id="description" name="description" rows="3" placeholder="Enter Additional Details"></textarea>

      <% if (cityID != null && !cityID.isEmpty()) {
          try {
        	  int city_id = Integer.parseInt(cityID);
              cityDAO c = new cityDAO(session);
              ArrayList<City> al = c.viewCity(city_id);
            for (City pi : al) {
      %>
          <input type="hidden" name="city" value="<%=pi.getCity_name()  %>" />
          <input type="hidden" name="cost" id="initialCost" value="<%= pi.getCost() %>" />
          <input type="hidden" name="id" value="<%=pi.getCity_id() %>"/>
          <input type="hidden" name="uid" value="<%=session.getAttribute("id") %>"/>
          
      <% } } catch (NumberFormatException e) { } } %>

      <input type="hidden" name="book_date" id="book_date" value="" />

      <center><button type="submit" value="book" name="book" class="btn btn-primary w-50">Book Now</button></center>
    </form>
  </div>
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

  document.addEventListener('DOMContentLoaded', () => {
	  // Fetching initial elements
	  const initialCost = document.getElementById('initialCost');
	  const displayedCost = document.getElementById('cost');
	  const costInput = document.querySelector("input[name='cost']"); // Input field for cost
	  const peopleInput = document.getElementById('people');
	  const totalPeopleDisplay = document.getElementById('totalPeople');

	  // Getting the base cost from initial hidden field
	  let baseCost = parseInt(initialCost.value, 10);

	  // Event listener for the number of people input
	  peopleInput.addEventListener('input', () => {
	    const numPeople = parseInt(peopleInput.value, 10) || 1; // Default to 1 if invalid
	    const totalCost = baseCost * numPeople;

	    // Update displayed cost and hidden input cost
	    displayedCost.textContent = totalCost;
	    costInput.value = totalCost; // Updating the hidden input field with the new cost
	    totalPeopleDisplay.textContent = numPeople;
	  });
	});


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
	
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
