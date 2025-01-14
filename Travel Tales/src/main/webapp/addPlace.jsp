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

  
    form {
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

   
   label {
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

    
    button[type="submit"] {
        background-color: #ffcc33;
        color: #333333;
        font-size: 16px;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
    }

    button[type="submit"]:hover {
        background-color: #ffb700;
        transform: scale(1.05);
    }
</style>
</head>
<body>
<%@include file="adminHeader.jsp" %>
<a href="adminDash.jsp" class="btn btn-secondary btnn ms-3 mt-3">Back to Dashboard</a>

<form action="Place" method="post">
	
    <h1>Add New Place</h1>
    <label>Place Name:</label>
    <input type="text" name="name" placeholder="Enter Place name"><br>
    
    <label>Place Image:</label>
    <input type="text" name="image" placeholder="Enter Place image"><br>
    
     <label for="city">Choose a City:</label><br>
        <select id="city" name="city">
        <% cityDAO c=new cityDAO(session);
           ArrayList<String> al=c.getCities();
           Iterator<String> itr=al.iterator();
           while(itr.hasNext())
           {  String city=itr.next(); %>
        	   <option value="<%= city%>"><%= city%></option>
         <%  } %> 
            
        </select>
    
    <label>Location:</label>
    <input type="text" name="loc" placeholder="Enter Location"><br>
    
    <label>Place Description:</label>
    <input type="text" name="description" placeholder="Enter Place Description"><br>
    
    
    <button type="submit" name="addPlace" value="add place">Add Place</button>
</form>
<%@include file="footer.jsp" %>
</body>
</html>
