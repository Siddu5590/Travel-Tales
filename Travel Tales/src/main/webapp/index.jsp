<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Tales</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">
    
    <style>
        .carousel-inner img {
            width: 100%;
            height: 500px;
           
        }
        .category{
        	margin:20px;
        }
        .category-wrapper {
	width: 100%;
	margin: 10px auto;
	padding: 20px;
}

.category-wrapper h2 {
	margin-bottom: 10px;
	font-weight: 400;
	font-size: 1.5rem;
}

.category-items {
	display: flex;
	justify-content: flex-start;
	align-items: flex-start;
	flex-wrap: wrap;
	margin-bottom:30px;
}

.category-card {
	width: 180px;
	height: 180px;
	display: flex;
	justify-content: center;
	align-items: center;
	text-decoration:none;
	flex-direction: column;
	margin: 10px;
	flex-shrink: 0;
	flex-grow: 0;
	padding: 5px;
	color:black;
	border-radius: 5px;
	box-shadow: 0px 1px 5px #efefef !important;
	transition: 0.75s all;
}

.category-card:hover {
	box-shadow: 0px 1px 5px gray !important;
	cursor: pointer;
	text-decoration:none;
	color:black;
	transform: scale(1.1);
}

.category-card img {
	width: 100%;
	height: 100px;
	border-radius: 10px;
}

.category-card .category-title {
	font-size: 1.2rem;
	font-weight: bold;
	margin-bottom: 0;
    background-color: black;
    color: white;
    padding: 3px;
	
}
.search-bar{
	margin-top:30px;
	width:300px;
	margin-left:450px;
	box-shadow: 0px 1px 5px gray !important;
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
           <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5" aria-label="Slide 5"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="6" aria-label="Slide 5"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active" data-bs-interval="2000">
            <img src="assets/image1.jpg" class="d-block w-100" alt="Slide 1">
          </div>
          <div class="carousel-item" data-bs-interval="2000">
            <img src="assets/image2.jpg" class="d-block w-100" alt="Slide 2">
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
          <div class="carousel-item" data-bs-interval="2000">
            <img src="assets/image6.jpg" class="d-block w-100" alt="Slide 5">
          </div>
          <div class="carousel-item" data-bs-interval="2000">
            <img src="assets/image7.jpg" class="d-block w-100" alt="Slide 5">
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


    <form class="d-flex search-bar" role="search">
  <div style="position: relative; width: 100%;">
    <input class="form-control" id="search" type="text" placeholder="Search city here.." style="padding-right: 35px;">
    <i class="fa fa-search" style="position: absolute; top: 50%; right: 10px; transform: translateY(-50%); cursor: pointer; color: gray;"></i>
  </div>
</form>


    <div class="category" id="city">
        <h3>Top Rated Places...</h3>
        <article class="category-items">
        
				<a class="category-card" href="#">

					<img
					src="assets/image3.jpg"
					alt="">
					<h2 class="category-title mt-1 rounded">Mysore</h2>

				</a>
			</article>
    </div>
    <h2 id="no-results" style="display: none;" class="text-center mb-3 text-danger">Data not found...!!</h2>
    
    <%@include file="footer.jsp" %>
    
    <script>
    $(document).ready(function () {
    	  $("#search").on("keyup", function () {
    	    var value = $(this).val().toLowerCase();
    	    var hasVisible = false;

    	    $("#city article").filter(function () {
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
