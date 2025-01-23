<%@page import="com.travel.Entity.City"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.travel.Model.cityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add City</title>
 <link rel="icon" href='assets/logo.jpg'>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
    
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

   
    body {
         height: 100vh;
    }

  
    .addcity {
        background-color: #ffffff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(255, 204, 51, 0.3);
        width: 100%;
        max-width: 400px;
        margin-left:500px;
        margin-bottom:20px;
        margin-top:50px;
        text-align: center;
        border: 2px solid #ffcc33;
    }

  
    h1 {
        font-size: 24px;
        color: #333333;
        margin-bottom: 20px;
    }

   
    label {
        display: block;
        font-size: 14px;
        color: #333333;
        margin-bottom: 5px;
        text-align: left;
    }

   
    .update {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ffd966;
        border-radius: 5px;
        font-size: 14px;
        background-color: #fffde7;
    }

    .update:focus {
        border-color: #ffcc33;
        outline: none;
        box-shadow: 0px 0px 8px rgba(255, 204, 51, 0.3);
    }

    
    .update-btn {
        background-color: #ffcc33;
        color: #333333;
        font-size: 16px;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
    }

    .update-btn:hover {
        background-color: #ffb700;
        transform: scale(1.05);
    }
	
        .back-btn:hover{
        	color:white;
        	transform:scale(1.05);
        }
</style>
</head>
<body>
<%@include file="adminHeader.jsp" %>

		
<form method="POST" action="city" class="addcity">
    <h1>Update City</h1>
    <%cityDAO ci=new cityDAO(session);
    ArrayList<City> al=ci.viewCity(Integer.parseInt(request.getParameter("city_id")));
    for(City c:al){
    %>
    
    <label>City Id:</label>
    <input type="text" class="update" name="id" placeholder="Enter City id" value="<%=c.getCity_id()%>" required ><br>
    
    
    <label>City Name:</label>
    <input type="text" class="update" name="name" placeholder="Enter City name" value="<%=c.getCity_name()%>" required><br>
    
    <label>City Image:</label>
    <input type="text" class="update" name="image" placeholder="Enter City image" value="<%=c.getImage() %>" required><br>    
    
    <label>Cost for City:</label>
    <input type="text" class="update" name="cost" placeholder="Enter total cost" value="<%=c.getCost() %>" required><br>
    <%} %>
    
    <center><div class="form-group">
            <button type="submit" class="update-btn w-50 mb-3" name="updateCity">Update City</button>
            <a href="viewCity.jsp" class="back-btn btn btn-success ms-2">Back</a>
            <br>
            <a href="adminDash.jsp" class="back-btn btn btn-success">Back to Dashboard</a>
        </div></center>
</form>

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
</script>
</body>
</html>
