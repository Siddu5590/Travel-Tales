<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
      .dropdown:hover .dropdown-menu {
  display: block;
  margin-top: 0.125em;
}

.container-fluid{
  background-color: grey;
  /* width:30px; */
  height: 60px;
  position: relative;
  float: right;
}
.items a{
  position: relative;
  float: right;
  font-size: 20px;
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
    <div class="container-fluid bg-dark">
      <a class="navbar-brand" href="index.jsp" style="color: white;">Travel Tales</a>
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
            <a class="nav-link active" aria-current="page" href="#" style="color: white;">Booking</a>
          </li>
          <li class="items nav-item">
            <a class="nav-link active" aria-current="page" href="#" style="color: white;">Status</a>
          </li>
          <li class="items nav-item dropdown">
            <a
              class="items nav-link dropdown-toggle"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
              style="color: white;"
            >
              UserName
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">View User</a></li>
              <li><a class="dropdown-item" href="#">Reset Pin</a></li>
              <li><hr class="dropdown-divider"></li>
              <li>
                <a class="dropdown-item" href="#">
                  <input
                    type="submit"
                    value="Logout"
                    name="logout"
                    class="btn1"
                  />
                </a>
              </li>
            </ul>
          </li>
          <%} else { %>
          <li class="items nav-item">
            <a class="nav-link active" aria-current="page" href="signup.jsp" style="color: white;">Signup</a>
          </li>
          <li class="items nav-item">
            <a class="nav-link active" aria-current="page" href="login.jsp" style="color: white;">Login</a>
          </li>
          <%} %>
        </ul>
        
      </div>
    </div>
  </nav>
  
</body>
</html>