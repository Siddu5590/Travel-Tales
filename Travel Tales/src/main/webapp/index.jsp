<%@page import="com.travel.Entity.Packages"%>
<%@page import="com.travel.Model.PackagesDAO"%>
<%@page import="com.travel.Model.cityDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.travel.Entity.City"%>
<%@page import="java.util.ArrayList"%>
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
        margin-left:50px;
        margin-bottom:50px;
        
    }
    .view{
    	display: flex;
    	justify-content: space-between;
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
            width: auto;
            height:auto;
            transition: .3s;
            transform: scale(1);
            box-shadow: 0 8px 10px 0 rgba(0, 0, 0, 0.2), 0 12px 25px 0 rgba(0, 0, 0, 0.19);
        }
        .product-card:hover{
        	transform: scale(1.1);
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
        	
        }
        .card-text strong{
        	font-size:20px;
        }
        .video-container{
        	background-color: #FFFBCA;
        }
        .video-container h1{
        	padding:5px;
        	text-align:center;
        }
        .mvv-container{
            max-width: 100%;
            margin-top: 50px;
            background-color: #FFF6B3;
        }

        .mvv-container .mvv-block{
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
        }
        .mvv-container .mvv-block .image{
            flex: 0 0 auto;
            width: 600px;
            overflow: hidden;
            border-radius: 5px;
            box-shadow: 0 0 10px 5px rgba(0,0,0,.3);
            line-height: 0;
        }
        .mvv-container .mvv-block .image img{
            width: 100%;
            height: 100%;
        }
        
        .mvv-container .mvv-block .content{
            flex: 0 0 auto;
            width: calc(100% - 600px);
            box-sizing: border-box;
            align-self: center;
            text-align: justify;
            font-size: 20px;
        }
        .mvv-container .mvv-block .content h5{
            font-weight: bold;
            font-size: 40px;
            color: blue;
        }
        .mvv-container .mvv-block .content p{
            margin-left: 20px;
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
        @media screen and (min-width: 1024px) {
            .mvv-container .mvv-block:nth-child(odd) .image {
                order: 1;
            }
            .mvv-container .mvv-block:nth-child(even) .image {
                order: 2;
            }
            .mvv-container .mvv-block:nth-child(odd) .content {
                order: 2;
                padding-left: 30px;
            }
            .mvv-container .mvv-block:nth-child(even) .content {
                order: 1;
                padding-right: 30px;
            }
        }

        @media screen and (max-width: 1023px) {
            .mvv-container .mvv-block {
                flex-direction: column;
            }
            .mvv-container .mvv-block .image,
            .mvv-container .mvv-block .content {
                width: 100%;
                text-align: center;
            }
            .mvv-container .mvv-block .content h5 {
                font-size: 35px;
                margin-top:10px;
            }
            .mvv-container .mvv-block .content p {
                font-size: 18px;
                padding: 0 10px;
                text-align: justify;
            }
        }

        @media screen and (max-width: 768px) {
            .mvv-container .mvv-block .content h5 {
                font-size: 35px;
                margin-top:10px;
            }
            .mvv-container .mvv-block .content p {
                font-size: 20px;
                text-align: justify;
            }
        }

        @media screen and (max-width: 576px) {
            .mvv-container .mvv-block .image img {
                height: auto;
            }
            .mvv-container .mvv-block .content h5 {
                font-size: 35px;
                margin-top:10px;
            }
            .mvv-container .mvv-block .content p {
                font-size: 20px;
                text-align: justify;
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


	<!-- City Card -->
    <div class="view-product" id="city">
    
    <div class="view">
    <h2>Top Rated City...</h2>
     <a href="allCities.jsp" class="view-more btn btn-primary fs-5 me-5"> <i class="fa-solid fa-chevron-right"></i> View More</a>
    </div>
        
     <%cityDAO city=new cityDAO(session);
     ArrayList<City> al=city.viewCity();
     Iterator<City> it=al.iterator();   //to create iterator reference--by using any of the collection object reference
     int count=1;
     while(it.hasNext()&& count<=4) {
    	 City c=it.next();%>
    	 
        
        <div class="product-container ms-3">
       
    	   <div class="product-card" id="city-name">
    	   <a href="<%=request.getContextPath() + "/place.jsp?city_id=" + c.getCity_id()%>">
                <div class="profile-pic"><image src="<%=c.getImage() %>" width="220px" height="140px" style="border-radius:5px;" ></div>
                <p class="card-text" ><strong> <%= c.getCity_name() %></strong></p></a>
                <p class="card-text mt-3" >Cost: &#8377; <%= c.getCost() %>/person</p>
                <p class="card-text" >Including All Expenses</p>
                
                <%if(session.getAttribute("uname")!=null){ %>
    	<a href="booking.jsp?city_id=<%=c.getCity_id()%>" class="btn btn-success mt-3">Book Now</a>
    	<%} else { %>
    	<a href="login.jsp" class="btn btn-success mt-3">Book Now</a>
    	<%} %>
            </div>
    	
    	</div>
    	<% count++; } %>
    
    </div>
    
    
    <!-- Special Packages -->
     <div class="view-product">
     <div class="view">
    <h2>Special Packages...</h2>
    </div>
     
     <%PackagesDAO pa=new PackagesDAO(session);
     ArrayList<Packages> all=pa.viewPackage();
     Iterator<Packages> itr=all.iterator();
     //nothe package
     if(itr.hasNext()) {
    	 Packages p=itr.next();%>
    	 
    	 
    	 <!-- North Karnataka -->
        <div class="product-container">
       
    	   <div class="product-card ">
    	   		<a href="NorthPackage.jsp">
                <div class="profile-pic">
                <image src="<%=p.getImage() %>" width="220px" height="140px" style="border-radius:5px;" >
                </div></a>
                <p class="card-text"><strong>Package Name:</strong> <%= p.getPackage_name() %></p>
                <p class="card-text"><strong>Cost:</strong> <%= p.getCost() %></p>
                
                <p class="card-text"><strong>No_of_Days:</strong> <%= p.getNo_days() %></p>
         
                <%if(session.getAttribute("uname")!=null){ %>
    	<a href="packageBooking.jsp?pack_id=<%=p.getPackage_id() %>" class="btn btn-success mt-3">Book Now</a>
    	<%} else { %>
    	<a href="login.jsp" class="btn btn-success mt-3">Book Now</a>
    	<%} %>  
            </div>
    	
    	</div>
    	<%} %>
    	
    	 <!-- South Karnataka -->
    	<%if(itr.hasNext()) {
    	 Packages p=itr.next();%>
        <div class="product-container">
       
    	   <div class="product-card ">
    	   		<a href="SouthPackage.jsp">
                <div class="profile-pic">
                <image src="<%=p.getImage() %>" width="220px" height="140px" style="border-radius:5px;" >
                </div></a>
                <p class="card-text"><strong>Package Name:</strong> <%= p.getPackage_name() %></p>
                <p class="card-text"><strong>Cost:</strong> <%= p.getCost() %></p>
                
                <p class="card-text"><strong>No_of_Days:</strong> <%= p.getNo_days() %></p>
         
                <%if(session.getAttribute("uname")!=null){ %>
    	<a href="packageBooking.jsp?pack_id=<%=p.getPackage_id() %>" class="btn btn-success mt-3">Book Now</a>
    	<%} else { %>
    	<a href="login.jsp" class="btn btn-success mt-3">Book Now</a>
    	<%} %>  
            </div>
    	
    	</div>
    	<%} %>
    	
    	
    	 <!-- Overall Karnataka -->
    	<% if(itr.hasNext()) {
    	 Packages p=itr.next();%>
        <div class="product-container">
    	   <div class="product-card ">
    	   		<a href="KarnatakaPackage.jsp">
                <div class="profile-pic">
                <image src="<%=p.getImage() %>" width="220px" height="140px" style="border-radius:5px;" >
                </div></a>
                <p class="card-text"><strong>Package Name:</strong> <%= p.getPackage_name() %></p>
                <p class="card-text"><strong>Cost:</strong> <%= p.getCost() %></p>
                
                <p class="card-text"><strong>No_of_Days:</strong> <%= p.getNo_days() %></p>
         
                <%if(session.getAttribute("uname")!=null){ %>
    	<a href="packageBooking.jsp?pack_id=<%=p.getPackage_id() %>" class="btn btn-success mt-3">Book Now</a>
    	<%} else { %>
    	<a href="login.jsp" class="btn btn-success mt-3">Book Now</a>
    	<%} %>  
            </div>
    	
    	</div>
    	<%} %>
 
 
    
    </div>
    
    <div class="video-container m-3 rounded">
    <h1>Happy Moments...</h1>
    <div class="video m-4">
    <iframe class="video-stream" width="100%" height="525" src="https://www.youtube.com/embed/TUzYlhcdJOI?autoplay=1&mute=1"
        title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen></iframe>
</div>
    </div>
    
    <div class="mvv-container ms-3 mt-5 me-3 rounded">
    
    <div  class="mvv-block p-2">
            <div class="image">
                <img src="https://media.assettype.com/startupcityindia%2F2024-04%2F2ddeff0f-0e37-4936-a12b-0e2cde3422eb%2FKarnataka_sc.jpg" alt="">
            </div>
            <div class="content">
                <h5>We are Travel Tales</h5>
                <p>At  Travel Tales Adventures, we believe that travel is more than just visiting new places; it’s about creating memories, connecting with diverse cultures, and discovering the beauty of the world. With a passion for exploration, we specialize in curating unforgettable journeys that combine adventure, relaxation, and cultural enrichment.

                Our team of travel experts works tirelessly to provide personalized itineraries, ensuring each trip is tailored to your unique preferences and desires. Whether you're seeking the thrill of adventure, a serene escape, or an immersive cultural experience, Wanderlust Adventures is your trusted partner in turning travel dreams into reality.</p>
            </div>
        </div>
       
    </div>
     <center><a href="aboutus.jsp" class="btn btn-primary mb-3 p-2">View More</a></center>
    
    <%@include file="footer.jsp" %>
    
    <script>
    $(document).ready(function () {
    	  $("#search").on("keyup", function () {
    	    var value = $(this).val().toLowerCase();
    	    var hasVisible = false;

    	    $("#city #city-name").filter(function () {
    	      var isVisible = $(this).text().toLowerCase().indexOf(value) > -1;
    	      $(this).toggle(isVisible);//hide  unwanted data
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
