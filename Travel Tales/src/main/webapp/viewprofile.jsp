<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profile</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.19.3/jquery.validate.min.js"></script>
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
        .error {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>

<div class="form-container shadow-lg p-3 mb-5 rounded">
    <h2>View Profile</h2>
    <form id="profileForm">
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
            <button type="submit" class="update-btn w-75">Update Profile</button>
            <button type="button" class="back-btn w-75" onclick="window.history.back();">Back</button>
        </div></center>
        <%} %>
    </form>
</div>

<%@include file="footer.jsp" %>
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
