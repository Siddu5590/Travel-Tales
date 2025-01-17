<%@page import="com.travel.Model.placeDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.travel.Model.cityDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.travel.Entity.Place"%>
<%@page import="com.travel.Entity.City"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%cityDAO city=new cityDAO(session);
    ArrayList<City> al=city.viewCity();
    
    int selectedCategory = request.getParameter("city")!=null ? Integer.parseInt(request.getParameter("city"))  : -1;
    placeDAO pl= new placeDAO(session);
    ArrayList<Place> al1=pl.viewPlace();
    
    
    int val = 0;
    String cityAttr = request.getParameter("city");
    if (cityAttr != null) {
        try {
            val = Integer.parseInt(cityAttr);
        } catch (NumberFormatException e) {
            val = 0; // Default to all cities
            out.println("<div class='alert alert-danger'>Invalid city selection!</div>");
        }
    }


    int count=pl.getPlacesCount(val);
   
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href='assets/logo.jpg'>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
	<script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<style>
.city-section
 {
	  display: flex;
	  justify-content: flex-start;
	  align-items: center;
	  padding: 5px 10px;
	  gap:15px;
	  width: 100%;
	  overflow-x: auto;
	  max-width: 1800px;
	  margin: 5px auto;
 }
 
 .city-section::placeholder
 {
    width: 2px;
  }
 
 .city-tag{
  padding: 4px 8px;
  border-radius: 30px;
  border:1px solid #efefef !important;
  background: white;
  font-size: 1.0rem;
  cursor: pointer;
  color: black !important;
  text-decoration:none;
  white-space: nowrap;
  box-shadow: 0px 1px 4px gray !important;
 }
 
 .city-tag-acive{
  background: black;
  color: white !important;
 }
 .not-found{
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  height: 70vh;
 }
 .not-found  img{
  width: 200px;
  height: 200px;
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
 
</style>
</head>
<body>
<%@include file="header.jsp" %>
<nav class="city-section">
    <a class="city-tag <%=selectedCategory == -1 ? "city-tag-acive" :"" %>" 
       href="place.jsp">All</a>
    <% for (City c : al) { %>
        <a class="city-tag <%=selectedCategory == c.getCity_id() ? "city-tag-acive" :"" %>" 
           href="place.jsp?city=<%=c.getCity_id()%>">
           <%= c.getCity_name() %>
        </a>
    <% } %>
</nav>
  
  <%ArrayList<Place> placeList = val == 0 ? pl.viewPlace() : pl.viewPlace(val);
  if (placeList.isEmpty()) {
	    %>
	    <div class="not-found">
	        <img alt="not-found" src="https://thumbs.dreamstime.com/b/oops-emoticon-vector-illustration-over-white-56744303.jpg">
	        <p class="text-center">No Place Found...!!!</p>
	    </div>
	    <%
	} else {
	    for (Place p : placeList) {
	        %>
	        <div class="product-container">
	            <div class="product-card">
	                <img src="<%=p.getImage() %>" width="220px" height="140px" style="border-radius:5px;" alt="Place Image">
	                <h2><%= p.getPlace_id() %></h2>
	                <p><strong>Place Name:</strong> <%= p.getPlace_name() %></p>
	            </div>
	        </div>
	        <%
	    }
	}%>

</body>
</html>