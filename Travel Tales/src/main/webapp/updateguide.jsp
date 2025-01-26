<%@page import="com.travel.Entity.City"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.travel.Model.cityDAO"%>
<%@page import="com.travel.Entity.Guide"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.travel.Model.Guide1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guide Form</title>
     <link rel="icon" href='assets/logo.jpg'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    
    <style>
    	
        .body {
            
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            border: 3px dashed #aefab0;
            border-radius: 10px;
            padding: 20px;
            background-color: rgb(253, 218, 158);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 400px;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .form-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-container input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container button {
            width: 48%;
            padding: 10px;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-container .submit-btn {
            background-color: #4CAF50;
            color: white;
        }
        .form-container .back-btn {
            background-color: #f44336;
            color: white;
        }
        .form-container button:hover {
            opacity: 0.9;
        }
        .error {
            color: red;
            font-size: 0.9em;
        }
    </style>
</head>
<body style="background-color: rgb(233, 240, 244);">
<%@include file="adminHeader.jsp" %>
<a href="adminDash.jsp" class="btn btn-secondary btnn ms-3 mt-3">Back to Dashboard</a>
	<div class="body">
	
    <div class="form-container">
    <%Guide1 gu=new Guide1(session);
        ArrayList<Guide> guide=gu.viewGuide(Integer.parseInt(request.getParameter("guide_id")));
        for(Guide g:guide){%>
        <h2>Guide Form</h2>
        
        <form id="guide-form" action="guide" method="post">
        	
        	<label for="guide-name">Guide id:</label>
            <input type="text" id="guide-id" name="id" value="<%=g.getGuide_id()%>">
            
            <label for="guide-name">Guide Name:</label>
            <input type="text" id="guide-name" name="name" value="<%=g.getGuide_name()%>">

            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" value="<%=g.getGuide_phone()%>">

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%=g.getGuide_email()%>">

            <label for="age">Age:</label>
            <input type="number" id="age" name="age" min="18" max="60" value="<%=g.getGuide_age()%>">
            
           <% cityDAO c=new cityDAO(session);
           ArrayList<City> al=c.viewCity(g.getGuide_id());
           Iterator<City> itr=al.iterator();
           while(itr.hasNext())
           {  City city=itr.next(); %>
        <label for="city">Guide Location:</label>
        <input type="text" name="city" value="<%=city.getCity_name()%>">
        <%} %>

            <div style="display: flex; justify-content: space-between;">
                <button type="submit" name="updateguide" class="submit-btn">Submit</button>
                <button type="button" class="back-btn" onclick="window.history.back();">Back</button>
            </div>
            
        </form>
        <%} %>
    </div>
    </div>
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
    
    
        $(document).ready(function () {
            $("#guide-form").validate({
                rules: {
                    name: {
                        required: true,
                        minlength: 3
                    },
                    phone: {
                        required: true,
                        digits: true,
                        minlength: 10,
                        maxlength: 10
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    age: {
                        required: true,
                        number: true,
                        min: 18,
                        max: 100
                    }
                },
                messages: {
                    name: {
                        required: "Please enter your name.",
                        minlength: "Name must be at least 3 characters long."
                    },
                    phone: {
                        required: "Please enter your phone number.",
                        digits: "Please enter only digits.",
                        minlength: "Phone number must be exactly 10 digits.",
                        maxlength: "Phone number must be exactly 10 digits."
                    },
                    email: {
                        required: "Please enter your email.",
                        email: "Please enter a valid email address."
                    },
                    age: {
                        required: "Please enter your age.",
                        number: "Please enter a valid number.",
                        min: "Age must be at least 18.",
                        max: "Age cannot exceed 100."
                    }
                },
                errorPlacement: function (error, element) {
                    error.insertAfter(element);
                }
            });
        });
    </script>
</body>
</html>

    </script>
</body>
</html>
