<%@page import="com.travel.Entity.Booking"%>
<%@page import="com.travel.Model.guideDAO"%>
<%@page import="com.travel.Entity.Guide"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.travel.Model.Register"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Details</title>
 <link rel="icon" href='assets/logo.jpg'>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style type="text/css">

.users {
	margin-left: 20px;
	margin-right: 20px;
	margin-top: 20px;
}

.users a {
	font-size: 16px;
}

.table tbody td {
	background-color: snow;
}

.search-bar {
	margin-top: 60px;
	width: 300px;
	margin-left: 120px;
	box-shadow: 0px 1px 5px gray !important;
}
</style>
</head>
<body>
<%@include file="guideHeader.jsp" %>
<%if(session.getAttribute("uname")!=null) {%>

<form class="search-bar" role="search">
  <div style="position: relative; width: 100%;">
    <input class="form-control" id="search" type="text" placeholder="Search User here.." style="padding-right: 35px;">
    <i class="fa fa-search" style="position: absolute; top: 50%; right: 10px; transform: translateY(-50%); cursor: pointer; color: gray;"></i>
  </div>
</form>

<div class="users">
	<h3 class="bg-primary text-white p-2">All Bookings</h3>
	<table class="table table-bordered table-primary">
		<thead>
			<tr>
				
				<th>Name</th>
				<th>Number</th>
				<th>Email</th>
				<th>Peoples</th>
				<th>Total Cost</th>
				<th>City Name</th>
				<th>Pickup Point</th>
				<th>Travel Date</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody id="table">
		<%guideDAO book=new guideDAO(session);
		ArrayList<Booking> arr=book.viewBookings();
		
		for(Booking b: arr) {%>
			<tr>
				
				<td><%=b.getName() %></td>
				<td><%=b.getPhone() %></td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getPeoples() %></td>
				<td>&#8377; <%=b.getCost() %></td>
				<td><%=b.getCity() %></td>
				<td><%=b.getLocation() %></td>
				<td><%=b.getTravel_date() %></td>
				<%if(b.getStatus().equals("Confirmed")){ %>
				<td class="text text-success"><%=b.getStatus() %></td>
				<%}else if(b.getStatus().equals("Cancelled")){ %>
				<td class="text text-danger"><%=b.getStatus() %></td>
				<%}else if(b.getStatus().equals("pending")){ %>
				<td ><%=b.getStatus() %></td>
				<%} %>
				
				<td>
				<%if(b.getStatus().equals("pending")){ %>
				<form action="guide" method="post">
				<input type="hidden" name="id" value="<%=b.getBooking_id() %>">
				<button class="btn btn-danger btn-sm text-center" name="acceptBook" id="cancel">Accept</button>
				</form>
				<%} %>
				</td>
				
			</tr>
			<%} %>
			
		</tbody>
		
	</table>
	<h2 id="no-results" style="display: none;" class="text-center mb-3 text-danger">Data not found...!!</h2>
</div>
<%} else { %>
    <h3 class="text-center bg-primary p-2 text-white mt-5">Please Login now to access your profile...</h3>
  <%} %>

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
<% if (request.getAttribute("existed") != null) { 
    String message = (String) request.getAttribute("existed");
    request.removeAttribute("existed");
%>
Swal.fire({
    icon:"error",
    title: 'Oooops..',
    text: "<%= message %>"
});
<% } %>

$(document).ready(function () {
    $("#search").on("keyup", function () {
        var value = $(this).val().toLowerCase(); // Get search input and convert to lowercase
        var hasVisibleRows = false; // Flag to check if any rows are visible

        $("#table tr").each(function () {
            var isVisible = $(this).text().toLowerCase().indexOf(value) > -1;
            $(this).toggle(isVisible); // Show/hide rows based on match
            if (isVisible) {
                hasVisibleRows = true; // Set flag to true if a match is found
            }
        });

        // Toggle "Data not found" message based on search results
        if (hasVisibleRows) {
            $("#no-results").hide();
        } else {
            $("#no-results").show();
        }
    });
});
</script>
</body>
</html>
