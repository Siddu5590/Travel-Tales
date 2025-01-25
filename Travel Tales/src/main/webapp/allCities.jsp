<%@page import="java.util.Iterator"%>
<%@page import="com.travel.Entity.City"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.travel.Model.cityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All City</title>
     <link rel="icon" href='assets/logo.jpg'>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
	<script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
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
        margin-left:50px;
    }
    
    .product-container {
            display: inline-block;
            flex-wrap: wrap;
            padding: 20px;
            cursor:pointer;
        }

        .product-card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            text-align: center;
            padding: 30px;
            width: 280px;
            transition: .3s;
            transform: scale(1);
            height:auto;
            box-shadow: 0 8px 10px 0 rgba(0, 0, 0, 0.2), 0 12px 25px 0 rgba(0, 0, 0, 0.19);
        }
        
        .product-card a{
        	text-decoration: none;
        }
        
        .product-card:hover{
        	transform: scale(1.2);
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
        .card-text{
        	font-weight:bold;
        }
        .search-bar{
			margin-top:30px;
			width:300px;
			box-shadow: 0px 1px 5px gray !important;
		}
        
    </style>
</head>
<body>
<%@include file="header.jsp" %>
<header class="product">
	<h3>All Cities</h3>
</header>
	
	<center><form class="search-bar" role="search">
  <div style="position: relative; width: 100%;">
    <input class="form-control" id="search" type="text" placeholder="Search city here.." style="padding-right: 35px;">
    <i class="fa fa-search" style="position: absolute; top: 50%; right: 10px; transform: translateY(-50%); cursor: pointer; color: gray;"></i>
  </div>
</form></center>

    <div class="view-product" id="place">
        
     <%cityDAO city=new cityDAO(session);
     ArrayList<City> al=city.viewCity();
     Iterator<City> it=al.iterator();
     while(it.hasNext()) {
    	 City c=it.next();%>
        
        <div class="product-container" id="place-details">
       
    	   <div class="product-card">
                <a href="<%=request.getContextPath() + "/place.jsp?city_id=" + c.getCity_id()%>">
                <div class="profile-pic"><image src="<%=c.getImage() %>" width="220px" height="140px" style="border-radius:5px;" ></div>
                <p class="card-text mt-2" ><strong>City Name: <%= c.getCity_name() %></strong></p></a>
                <p class="card-text mt-3" >Cost: &#8377; <%= c.getCost() %>/person
                Including All Expenses</p>
                
                <a href="booking.jsp?city_id=<%=c.getCity_id() %>" class="btn btn-success mt-2">Book Now</a>
            </div>
    	</div>
    	<%} %>
    <h2 id="no-results" style="display: none;" class="text-center mb-3 text-danger">Data not found...!!</h2>
    </div>
    
    <script>
    $(document).ready(function () {
    	  $("#search").on("keyup", function () {
    	    var value = $(this).val().toLowerCase();
    	    var hasVisible = false;

    	    $("#place #place-details").filter(function () {
    	      var isVisible = $(this).text().toLowerCase().indexOf(value) > -1;
    	      $(this).toggle(isVisible);
    	      if (isVisible) {
    	        hasVisible = true;
    	      }
    	    });

    	    // Check if any articles are visible
    	    if (!hasVisible) {
    	      $("#no-results").show(); // Show "Data not found" message
    	    } else {
    	      $("#no-results").hide(); // Hide message if results are found
    	    }
    	  });
    	});


</script>
   
</body>
</html>