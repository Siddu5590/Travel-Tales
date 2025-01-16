<%@page import="com.travel.Entity.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%Customer c=new Customer(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profile</title>
     <link rel="icon" href='assets/logo.jpg'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-image:url('assets/view.jpg');
            background-repeat: no-repeat;
            background-size: cover;
        }
        .form-container {
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input {
            width: 80%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
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
        .error {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
<% if(!session.getAttribute("id").equals(1)){%>
<%@include file="header.jsp" %>
<%} else if(session.getAttribute("id").equals(1)){%>
<%@include file="adminHeader.jsp" %>
<%} %>

<div class="form-container shadow-lg p-3 mb-5 rounded">
<%if(session.getAttribute("uname")!=null){ %>
    <h2>View Profile</h2>
    
    <form id="profileForm" action="signup" method="post">
        <div class="form-group">
            <label for="customerId">Customer ID</label>
            <input type="text" id="customerId" name="customerId" class="form-control w-100" value="<%=session.getAttribute("id")%>" disabled="disabled">
        </div>
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" class="form-control w-100" value="<%=session.getAttribute("uname")%>" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="text" id="phone" name="phone" class="form-control w-100" value="<%=session.getAttribute("phone")%>" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" class="form-control w-100" value="<%=session.getAttribute("email")%>" required>
        </div>
        <%if(session.getAttribute("uname")!=null){ %>
        <center><div class="form-group">
            <button type="submit" class="update-btn w-75" name="update">Update Profile</button>
            <% if(session.getAttribute("id").equals(1)){%>
            <a href="adminDash.jsp"><button type="button" class="back-btn w-75">Back</button></a>
            <%}else { %>
             <a href="index.jsp"><button type="button" class="back-btn w-75">Back</button></a>
            <%} %>
        </div></center>
        <%} %>
    </form>
    
</div>

<%@include file="footer.jsp" %>
<%} else {%>
<h3>Please Login to access your profile...</h3>
<%} %>

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
