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
    <title>Travel Tales</title>
     <link rel="icon" href='assets/logo.jpg'>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">
    
    <style>
        .carousel-inner img {
            width: 100%;
            height: 500px;
           
        }
.view-product{
        margin-top:50px;
        margin-left:30px;
        margin-bottom:50px;
        
    }
    .view{
    	display: flex;
    	justify-content: space-between;
    }
    
    
    .product-container {
            display: inline-block;
            flex-wrap: wrap;
            gap: 20px;
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
        .product-card a{
        	text-decoration:none;
        }

        .product-card p {
            font-size: 1em;
            color: #555;
        }
        .card-text{
        	color:black;
        	font-weight:bold;
        	margin-top:10px;
        	
        }
        .card-text strong{
        	font-size:20px;
        }
		.search-bar{
			margin-top:30px;
			width:300px;
			box-shadow: 0px 1px 5px gray !important;
		}
		
		@media (max-width: 576px) {
            .carousel-inner img {
                height: 300px;
            }
            .product-card {
                width: 100%;
                max-width: 100%;
            }
        }

    </style>
</head>
<body>
<%@include file="header.jsp" %>

    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active" data-bs-interval="2000">
            <img src="assets/image8.jpg" class="d-block w-100" alt="Slide 1">
          </div>
          <div class="carousel-item" data-bs-interval="2000">
            <img src="assets/image1.jpg" class="d-block w-100" alt="Slide 2">
          </div>
          <div class="carousel-item" data-bs-interval="2000">
            <img src="assets/image3.jpg" class="d-block w-100" alt="Slide 3">
          </div>
          <div class="carousel-item" data-bs-interval="2000">
            <img src="assets/image4.jpg" class="d-block w-100" alt="Slide 4">
          </div>
          <div class="carousel-item" data-bs-interval="2000">
            <img src="assets/image5.jpg" class="d-block w-100" alt="Slide 5">
          </div>
          
          
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
    </div>

    
<!-- search bar -->
    <form class="d-flex search-bar" role="search">



  <center><form class="search-bar" role="search">

  <div style="position: relative; width: 100%;">
    <input class="form-control" id="search" type="text" placeholder="Search city here.." style="padding-right: 35px;">
    <i class="fa fa-search" style="position: absolute; top: 50%; right: 10px; transform: translateY(-50%); cursor: pointer; color: gray;"></i>
  </div>
</form></center>


    <div class="view-product" id="city">
    
    <div class="view">
    <h2>Top Rated City...</h2>
     <a href="allCities.jsp" class="view-more btn btn-primary fs-5 me-5"> <i class="fa-solid fa-chevron-right"></i> View More</a>
    </div>
        
     <%cityDAO city=new cityDAO(session);
     ArrayList<City> al=city.viewCity();
     Iterator<City> it=al.iterator();
     int count=1;
     while(it.hasNext()&& count<=4) {
    	 City c=it.next();%>
    	 
        
        <div class="product-container">
       
    	   <div class="product-card" id="city-name">
    	   <a href="<%=request.getContextPath() + "/place.jsp?city=" + c.getCity_id()%>">
                <div class="profile-pic"><image src="<%=c.getImage() %>" width="220px" height="140px" style="border-radius:5px;" ></div>
                <p class="card-text" ><strong> <%= c.getCity_name() %></strong></p></a>
            </div>
    	
    	</div>
    	<% count++; } %>
    
    </div>
    <h2 id="no-results" style="display: none;" class="text-center mb-3 text-danger">Data not found...!!</h2>
    
    <%@include file="footer.jsp" %>
    
    <script>
    $(document).ready(function () {
    	  $("#search").on("keyup", function () {
    	    var value = $(this).val().toLowerCase();
    	    var hasVisible = false;

    	    $("#city #city-name").filter(function () {
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
