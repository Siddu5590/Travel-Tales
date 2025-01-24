<%@page import="com.travel.Entity.Guide"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.travel.Model.Guide1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Users</title>
<link rel="icon" href='assets/logo.jpg'>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style type="text/css">
  .add-guide {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 10px;
  }

  .search-bar {
    margin: 20px auto;
    max-width: 600px;
    box-shadow: 0px 1px 5px gray !important;
  }

  .users {
    margin: 20px auto;
    padding: 10px;
  }

  .table {
    text-align: center;
  }

  @media (max-width: 768px) {
    .add-guide {
      flex-direction: column;
      align-items: center;
    }

	.table{
		width:100%;
	}
    .table th, .table td {
      font-size: 15px;
      
    }

    .search-bar {
      width: 90%;
    }
  }

  @media (max-width: 576px) {
    .table th, .table td {
      font-size: 10px;
    }
  }
</style>
</head>
<body>
<%@include file="adminHeader.jsp" %>

<div class="container">
  <div class="add-guide mt-4">
    <a href="guide.jsp" class="btn btn-primary"><i class="fa-solid fa-plus"></i> Add Guide</a>
    <a href="adminDash.jsp" class="btn btn-secondary">Back to Dashboard</a>
  </div>

  <% if(session.getAttribute("uname") != null) { %>
    <form class="search-bar" role="search">
      <div style="position: relative;">
        <input class="form-control" id="search" type="text" placeholder="Search Guide here..." style="padding-right: 35px;">
        <i class="fa fa-search" style="position: absolute; top: 50%; right: 10px; transform: translateY(-50%); cursor: pointer; color: gray;"></i>
      </div>
    </form>

    <div class="users">
      <h3 class="bg-primary p-2 text-white">All Guide Details</h3>
      <div class="table-responsive">
        <table class="table table-bordered table-striped">
          <thead class="table-primary">
            <tr>
              <th>Guide Id</th>
              <th>Guide Name</th>
              <th>Guide Phone</th>
              <th>Guide Email</th>
              <th>Guide Age</th>
              <th>Guide Location</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody id="table">
            <% Guide1 g = new Guide1(session);
               ArrayList<Guide> guide = g.viewGuide();
               for (Guide c : guide) { %>
                <tr>
                  <td><%= c.getGuide_id() %></td>
                  <td><%= c.getGuide_name() %></td>
                  <td><%= c.getGuide_phone() %></td>
                  <td><%= c.getGuide_email() %></td>
                  <td><%= c.getGuide_age() %></td>
                  <td><%= c.getLocation() %></td>
                  <td>
                    <form action="guide" method="post">
                      <input type="hidden" name="id" value="<%= c.getGuide_id() %>">
                      <button class="btn btn-danger btn-sm" name="deleteGuide"><i class="fa-solid fa-trash"></i> Delete</button>
                      <a href="updateguide.jsp?guide_id=<%=c.getGuide_id()%>" class="btn btn-primary btn-sm" name="edit" value="edit"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
                      
                      
                    </form>
                  </td>
                </tr>
            <% } %>
          </tbody>
        </table>
      </div>

      <h2 id="no-results" style="display: none;" class="text-center mb-3 text-danger">Data not found...!!</h2>
    </div>
  <% } else { %>
    <h3 class="text-center bg-primary p-2 text-white mt-5">Please Login now to access your profile...</h3>
  <% } %>
</div>

<script>
<% if (request.getAttribute("status") != null) { 
    String message = (String) request.getAttribute("status");
    request.removeAttribute("status"); %>
  Swal.fire({
    icon: "success",
    title: 'Success...',
    text: "<%= message %>"
  });
<% } %>

<% if (request.getAttribute("failure") != null) { 
    String message = (String) request.getAttribute("failure");
    request.removeAttribute("failure"); %>
  Swal.fire({
    icon: "error",
    title: 'Oooops..',
    text: "<%= message %>"
  });
<% } %>

$(document).ready(function () {
  $("#search").on("keyup", function () {
    var value = $(this).val().toLowerCase();
    var hasVisibleRows = false;

    $("#table tr").each(function () {
      var isVisible = $(this).text().toLowerCase().indexOf(value) > -1;
      $(this).toggle(isVisible);
      if (isVisible) {
        hasVisibleRows = true;
      }
    });

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
