<%@page import="com.travel.Entity.City"%>
<%@page import="com.travel.Model.cityDAO"%>
<%@page import="com.travel.Entity.Place"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.travel.Model.placeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%placeDAO p=new placeDAO(session);
    	ArrayList<Place> al=p.getPlace(Integer.parseInt(request.getParameter("place")));
    	cityDAO city=new cityDAO(session);%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Place Details</title>
<link rel="icon" href='assets/logo.jpg'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
.container {
    max-width: 1200px;
    margin: auto;
    padding: 20px;
    
}
.product-card {
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
    transition: transform 0.3s;
}

.product-card:hover {
    transform: scale(1.03);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
}

.product-image {
    width: 100%;
    border-radius: 10px;
}
.description{
	background-color: #ffeeba;
    border-radius: 8px;
    padding: 20px;
    margin-top: 20px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    width:100%;
}
.description h4{
	text-align: justify;
}
</style>
</head>
<body style="background-color: #FBF5DD">
<%@include file="header.jsp" %>
<div class="container mt-4 ms-5 bg-">
<%for(Place place:al){%>
<%if(session.getAttribute("uname")!=null){ %>
<%ArrayList<City> c=city.viewCity(place.getCity_id()); 
       for(City ci:c){%>
    	<a href="booking.jsp?city_id=<%=ci.getCity_id()  %>" class="btn btn-success me-5 mb-5">Book Your Trip here</a>
    	<%} } else { %>
    	<a href="login.jsp" class="btn btn-success me-5 mb-5">Book Your Trip here</a>
    	<%} %>


<div class="product-card p-4 m-5">
                <div class="row">
                
                   <center><div class="col-md-6 mb-2">
                   	<h1><strong><%=place.getPlace_name() %></strong></h1>
                        <img id="mainProductImage" src="<%=place.getImage() %>" alt="<%= place.getPlace_name() %>" class="product-image">
                    </div></center>
                </div>
                 <h3 class="text-primary fw-bold">About the Place !!!</h3>
                <div class="description">
                        
                        <%ArrayList<City> c=city.viewCity(place.getCity_id()); 
                        for(City cii:c){%>
                    	<h4><strong>City Name: <%=cii.getCity_name() %></strong></h4><br><hr>
                    	<%} %>
                    	<h4><strong>Location: </strong><a href="<%=place.getLocation() %>" target="_blank"><%=place.getLocation()%></a></h4>
                       	<br><hr>
                       	<h4><strong>Description About the Place: <br><br></strong><%=place.getDescription() %></h4>
                    </div>
            </div>
<% } %>
</div>
<%@include file="footer.jsp" %>
</body>
</html>