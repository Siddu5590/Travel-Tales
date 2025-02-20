<%@page import="com.travel.Model.cityDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Place</title>
 <link rel="icon" href='assets/logo.jpg'>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<style>
    
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

   
    body {
         height: 100vh;
    }

  
    .form {
        background-color: #ffffff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(255, 204, 51, 0.3);
        width: 100%;
        max-width: 400px;
        margin-left:500px;
        margin-bottom:20px;
        text-align: center;
        border: 2px solid #ffcc33;
    }

  
    h1 {
        font-size: 24px;
        color: #333333;
        margin-bottom: 20px;
    }

   
   .label {
        display: block;
        font-size: 14px;
        color: #333333;
        margin-bottom: 5px;
        text-align: left;
    }

   
   select, input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ffd966;
        border-radius: 5px;
        font-size: 14px;
        background-color: #fffde7;
    }

    select, input[type="text"]:focus {
        border-color: #ffcc33;
        outline: none;
        box-shadow: 0px 0px 8px rgba(255, 204, 51, 0.3);
    }

    
    .addplace {
        background-color: #ffcc33;
        color: #333333;
        font-size: 16px;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
    }

    .addplace:hover {
        background-color: #ffb700;
        transform: scale(1.05);
    }
</style>
</head>
<body>
<%@include file="adminHeader.jsp" %>
<a href="adminDash.jsp" class="btn btn-secondary btnn ms-3 mt-3">Back to Dashboard</a>

<form action="Place" method="post" class="form">
    <h1>Add New Place</h1>
    
    <label>Place Name:</label>
    <input type="text" name="name" placeholder="Enter Place name" required="required"><br>
    
    <label class="label">Place Image:</label>
    <input type="text" name="image" placeholder="Enter Place image" required="required"><br>
    
    <label for="city">Choose a City:</label><br>

    <!-- Searchable dropdown -->
    <div class="dropdown-container">
       
        <select id="city"  name="city">
         <option type="text"  placeholder="Search for a city..." class="search-input"
            onkeyup="filterCities()" >search</option>
            <option value="" selected="selected">Select City</option>
            <% 
            cityDAO c = new cityDAO(session);
            ArrayList<String> al = c.getCities();
            for (String city : al) {
            %>
                <option value="<%= city %>" data-city-name="<%= city.toLowerCase() %>">
                    <%= city %>
                </option>
            <% } %>
        </select>
    </div>
    
    <label>Location:</label>
    <input type="text" name="loc" placeholder="Enter Location" required="required"><br>
    
    <label>Place Description:</label>
    <input type="text" name="description" placeholder="Enter Place Description" required="required"><br>
    
    <button type="submit" name="addPlace" value="add place" class="addplace">Add Place</button>
</form>

<%@include file="footer.jsp" %>

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


// JavaScript function to filter cities in the dropdown
function filterCities() {
    const searchInput = document.getElementById('citySearch').value.toLowerCase();
    const select = document.getElementById('city');
    const options = select.options;

    for (let i = 1; i < options.length; i++) {
        const cityName = options[i].getAttribute('data-city-name');
        if (cityName.includes(searchInput)) {
            options[i].style.display = cityName; // Show matching option
        } else {
            options[i].style.display = "none"; // Hide non-matching option
        }
    }
}
</script>


</body>
</html>
