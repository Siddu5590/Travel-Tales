<%@page import="java.util.Iterator"%>
<%@page import="com.travel.Entity.Place"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.travel.Model.placeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Places</title>
     <link rel="icon" href='assets/logo.jpg'>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
    *{
        margin: 0;
        padding: 0;
    }
    body{
    	background-color: #f4f6f9;
    }
    .product{
    	background-color: #34495e;
    	color: white;
    	padding: 25px;
    	text-align: center;
    }
    .btnn{
    	position:absolute;
    	right:30px;
    }
   
    
    .view-product{
        margin-top:50px;
        margin-left:30px;
    }
    
    .product-container {
            display: inline-block;
            flex-wrap: wrap;
            gap: 30px;
            padding: 10px;
            cursor:pointer;
        }

        .product-card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            text-align: center;
            padding: 20px;
            width: 280px;
            height:auto;
            box-shadow: 0 8px 10px 0 rgba(0, 0, 0, 0.2), 0 12px 25px 0 rgba(0, 0, 0, 0.19);
        }
        .product-card:hover{
        	box-shadow: 0 -8px 4px 0 rgba(10, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 10, 0, 0.19);
        }

        .product-card h2 {
            font-size: 1.5em;
            margin: 10px 0;
            color: #8692FC;
        }

        .product-card p {
            font-size: 1em;
            color: #555;
        }
        
    </style>
</head>
<body>
<header class="product">
	<h3>All Places Details</h3>
</header>
	<div class="add-city">
	<a href="addPlace.jsp" class="btn btn-primary mt-3 ms-4"><i class="fa-solid fa-plus"></i>Add Place</a>
	<a href="adminDash.jsp" class="btn btn-secondary btnn ms-3 mt-3">Back to Dashboard</a>
	</div>
	

    <div class="view-product">
        
     <%placeDAO pa=new placeDAO(session);
     ArrayList<Place> al=pa.viewPlace();
     for(Place p:al){%>
        
        <div class="product-container">
       
    	   <div class="product-card">
                <div class="profile-pic"><image src="<%=p.getImage() %>" width="220px" height="140px" style="border-radius:5px;" ></div>
                <h2><%= p.getPlace_id() %></h2>
                <p class="card-text"><strong>Place Name:</strong> <%= p.getPlace_name() %></p>
         
                <div class="table-actions">
                        <form action="Place" method="post" style="display:inline;">
                            <input type="hidden" name="pid" value="<%= p.getPlace_id()%>">
                            <button type="submit" class="btn btn-danger" name="delete" value="delete"><i class="fa-solid fa-trash"></i> Delete</button>
                                <a href="updateplace.jsp?place_id=<%=p.getPlace_id()%>" class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
                            
                        </form>
                    </div>    
            </div>
    	
    	</div>
    	<%} %>
    
    </div>
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