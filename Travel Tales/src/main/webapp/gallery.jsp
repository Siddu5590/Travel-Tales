<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Gallery</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .gallery-container {
            padding: 50px 15px;
        }
        .gallery-item img {
            border-radius: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .gallery-item img:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
        }
        .gallery-item .caption {
            margin-top: 10px;
            font-size: 1rem;
        }
        .fullscreen-image {
            height: 70vh;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin-top: 50px;
            width:100%;
            margin-left:120px;
            border-radius: 15px;
        }
        .vsp {
            width: 100%;
            height: 50vh;
            overflow-y: scroll;
            padding-left: 340px;
            border: 3px solid white;
        }
        
        .vsp img {
            width: 70%;
            height: 50vh;
            object-fit: cover;
            border-bottom: 5px solid black;
        }
        h3{
        text-align: center;
        font-weight: bold;
        text-decoration: underline;
        }
        .desc{
        margin-left:10px;
        margin-top:240px;
        text-align:justify;
        margin-right:100px;
        }
        .parent{
        display: flex;
        justify-content: center;
    	}
    	.h51{
    	text-align:center;
    	padding-left:100px;
    	padding-right:100px;
    	font-style: italic;
    	}
    	h4{
    	text-decoration:underline;
    	padding-left:10px;
    	margin-right:1100px;
    	margin-left:30px;
    	}
    	h4:hover{
    	text-decoration:underline;
    	padding-left:10px;
    	margin-right:1100px;
    	margin-left:30px;
    	font-style: oblique;
    	color:red;
    	}
    	
        .scrolling-gallery1 {
            overflow-x: auto;
            white-space: nowrap;
            padding: 20px 0;
            background-color: #e9ecef;
        }
        .scrolling-gallery1 img {
            margin-right: 15px;
            border-radius: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height:300px;
            width:500px;
        }
        .scrolling-gallery1 img:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
        }
        #img1{
        width:350px;
        height:350px;}
        
    </style>
</head>
<body>

<%@include file="header.jsp" %>
    <h3>Travel Tales Gallery</h3>

    <!-- Fullscreen Background Image -->
    <div class="parent">
    <div class="fullscreen-image" style="background-image: url('assets/img8.jpg');" >
    
    </div>
    <div class="desc">
            <h5>The gallery page of our Travel Tales website is a visual showcase of stunning destinations, iconic landmarks, and memorable experiences. 
            <hr>It allows visitors to explore captivating images of various travel spots, inspiring them to plan their next adventure.</h5>
        </div>
	</div>
    <!-- Gallery Section -->
    <div class="gallery-container container">
        <div class="row g-4">
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets/img13.jpg" alt="Udupi Krishna" class="img-fluid">
                <div class="caption text-center">Udupi Krishna Temple</div>
            </div>
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets/img20.jpg" alt="Shivanasamudra" class="img-fluid">
                <div class="caption text-center">Shivanasamudra</div>
            </div>
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets/img19.jpeg" alt="Gol Gumbaz" class="img-fluid">
                <div class="caption text-center">Gol Gumbaz</div>
            </div>
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets/img3.webp" alt="KRS Dam" class="img-fluid">
                <div class="caption text-center">KRS Dam</div>
            </div>
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets/img1.avif" alt="Mysore Palace" class="img-fluid">
                <div class="caption text-center">Mysore Palace</div>
            </div>
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets/img26.jpg" alt="Waterfalls" class="img-fluid">
                <div class="caption text-center">Waterfalls</div>
            </div>
            
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets/img27.jpg" alt="Art of living" class="img-fluid">
                <div class="caption text-center">Art of Living</div>
            </div>
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets/img2.jpg" alt="Mahal" class="img-fluid">
                <div class="caption text-center">Lalith Mahal</div>
            </div>
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets/img8.jpg" alt="Bangalore Palace" class="img-fluid">
                <div class="caption text-center">Bengaluru Palace</div>
            </div>
        </div>
    </div>
    
	<div class="subdiv"> 
	<h5 class="h51">Embark on domestic tours with us. <br>
		Whether you're planning a romantic gateway or a group adventure, we've got you covered. Customize your itinerary, join group tours for added fun, and relay on our 24x7 customer support.
		<br>With our professional media services, your memories will be captured beautifully, choose Travel Tales for your unforgettable journeys.
	</h5>
	</div>
	
    <!-- Vertical Scrolling Images -->
    <div class="containers my-5">
        <h2 class="text-center mb-4">Journey Through The Frames: Explore Stunning Destinations One Scroll at a Time!!!</h2>
        <div class="vsp">
        	<img src="assets/topimg.jpeg" alt="Image 1">
            <img src="assets/img8.jpg" alt="Image 2">
            <img src="assets/img4.jpg" alt="Image 3">
            <img src="assets/img17.jpeg" alt="Image 4">
            <img src="assets/img28.jpeg" alt="Image 5">
            <img src="assets/img14.jpg" alt="Image 6">
            <img src="assets/img23.jpeg" alt="Image 7">
            
        </div>
    </div>

    <!-- Horizontal Scrolling Images -->
    <div class="desc3">
    <h4>Destinations and Candid's : </h4>
    </div>
    <div class="scrolling-gallery1">
        <img src="assets/img12.jpg" alt="Mattu Beach" class="img-fluid">
        <img src="assets/img13.jpg" alt="Udupi Temple" class="img-fluid">
        <img src="assets/img14.jpg" alt="Dharmasthala" class="img-fluid">
        <img src="assets/img15.jpg" alt="Kukke " class="img-fluid">
        <img src="assets/img10.webp" alt="Souda" class="img-fluid">
    </div>
    <br>
    <h4><center>Trips of our beloved Clients :</center></h4>
    <div class="gallery-container container">
        <div class="row g-4">
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets1/s1.jpg" alt="Udupi Krishna" id="img1" class="img-fluid">
                
            </div>
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets1/g8.jpeg" alt="Shivanasamudra" id="img1" class="img-fluid">
               
            </div>
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets1/g2(1).jpeg" alt="Gol Gumbaz" id="img1" class="img-fluid">
                
            </div>
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets1/g101.jpeg" alt="Shivanasamudra" id="img1" class="img-fluid">
               
            </div>
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets1/g102.jpeg" alt="Shivanasamudra" id="img1" class="img-fluid">
                
            </div>
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets1/s2.jpeg" alt="Shivanasamudra" id="img1" class="img-fluid">
               
            </div><div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets1/g1(1).jpeg" alt="Shivanasamudra" id="img1" class="img-fluid">
                
            </div>
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets1/g15.jpeg" alt="Shivanasamudra" id="img1" class="img-fluid">
                
            </div>
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets1/s4.jpeg" alt="Shivanasamudra" id="img1" class="img-fluid">
               
            </div>
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets1/g1.jpeg" alt="Shivanasamudra" id="img1" class="img-fluid">
                
            </div>
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets1/g103.jpeg" alt="Shivanasamudra" id="img1" class="img-fluid">
                
            </div>
            <div class="col-md-4 col-sm-6 gallery-item">
                <img src="assets1/s5.jpeg" alt="Shivanasamudra" id="img1" class="img-fluid">
               
            </div>
            
            
        </div>
    </div>
    
     
    <br>
    <br><br>
    
	<%@include file="footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
