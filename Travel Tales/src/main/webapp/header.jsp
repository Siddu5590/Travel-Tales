<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
      .dropdown:hover .dropdown-menu {
  display: block;
  background-color:none;
  margin-top:37px;
}
.dropdown-menu{
	position: relative;
	right: 0;
		
}
.dropdown-item{
	position: relative;
	left:30px;
	background:none;
	padding:5px;
}
.container-fluid{
  /* width:30px; */
  height: 60px;
  position: relative;
  float: right;
}
.items a{
  position: relative;
  float: right;
  font-size: 20px;
  margin-right:30px;
} 


  .navbar-brand {
    color: white;
  }

  .nav-link {
    color: lightgray;
  }

  .nav-link:hover {
    color: blue; /* Changes color on hover */
  }


    </style>
</head>
<body>
  <nav class="navbar navbar-expand-lg bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#" style="color: white;">Travel Tales</a>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        
          <li class="items nav-item">
            <a class="nav-link active" aria-current="page" href="index.jsp" style="color: white;">Home</a>
          </li>
          <li class="items nav-item">
            <a class="nav-link active" aria-current="page" href="#" style="color: white;">About us</a>
          </li>
          <li class="items nav-item">
            <a class="nav-link active" aria-current="page" href="#" style="color: white;">Places</a>
          </li>
          <li class="items nav-item">
            <a class="nav-link active" aria-current="page" href="#" style="color: white;">Gallery</a>
          </li>
          <%if(session.getAttribute("uname")!=null) { %>
          <li class="items nav-item">
            <a class="nav-link active" aria-current="page" href="booking.jsp" style="color: white;">Booking</a>
          </li>
          <li class="items nav-item">
            <a class="nav-link active" aria-current="page" href="#" style="color: white;">Status</a>
          </li>
          
          
          <li class="items nav-item dropdown bg-transparent">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
              style="color: white;"
            >
             <i class="fa-solid fa-user"></i> <%= session.getAttribute("uname") %>
            </a>
            
            <ul class="dropdown-menu">
              <li><a class="dropdown-item mb-2 bg-transparent" href="viewprofile.jsp">View User</a></li>
              <li><a class="dropdown-item mb-2 bg-transparent" href="#">Reset Pin</a></li>
              <li><hr class="dropdown-divider"></li>
              <li>
                <form action="signup" method="post">
                  <input type="submit" value="Logout" name="logout" class="btn1 btn btn-danger ms-3" />
                  </form>
              </li>
            </ul>
          </li>
          
          <% } else { %>
          <li class="items nav-item">
            <a class="nav-link active" aria-current="page" href="register.jsp" style="color: white;">Signup</a>
          </li>
          <li class="items nav-item">
            <a class="nav-link active" aria-current="page" href="login.jsp" style="color: white;">Login</a>
          </li>
          <%} %>
        </ul>
        
      </div>
    </div>
  </nav>
  
  <script>
     <% if (request.getAttribute("logout") != null) { 
    	    String message = (String) request.getAttribute("logout");
    	    request.removeAttribute("logout");
    	%>
    	Swal.fire({
    	    icon: "success",
    	    title: "Success...",
    	    text: "<%= message %>"
    	});
    	<% } %>
     </script>
  
</body>
</html>