<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-image: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url("assets/contact.jpg");
            background-position: left top;
            background-size: 60% 100%;
            width:100%;
            background-repeat: no-repeat;
            
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
        	
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            padding: 20px;
        }

        .info-section {
            width: 40%;
            color: white;
            margin-top: 60px;
        }

        .info-section h2 {
            text-shadow: 2px 3px 3px black;
            font-family: Cambria, serif;
            font-weight: bold;
        }

        .info-section p {
            background: rgba(0, 0, 0, 0.5);
            border-radius: 50px 0 50px 0;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid white;
        }

        .contact-details {
            background: rgba(0, 0, 0, 0.5);
            border-radius: 0 50px 0 50px;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid white;
        }

        form {
            background-color: rgb(191, 175, 153);
            box-shadow: 4px 2px 4px 3px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            padding: 30px;
            width: 35%;
        }

        form h2 {
            text-align: center;
            font-family: Georgia, serif;
            color: rgb(44, 49, 53);
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            margin-top: 10px;
        }

        input, textarea {
            width: 100%;
            padding: 7px;
            margin-top: 5px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .btn {
            display: block;
            width: 100%;
            padding: 10px;
            font-size: large;
            font-weight: bold;
        }

        .star-rating {
            display: flex;
            justify-content: center;
            font-size: 40px;
            margin: 10px 0;
        }

        .star {
            cursor: pointer;
            color: #f4ecec;
        }

        .star:hover, .star.selected {
            color: gold;
        }

        .marq {
            color: aqua;
            text-align: center;
            margin: 20px 0;
            font-style: italic;
            margin-bottom: 30px;
            font-size: large;
           
        }
    </style>
</head>
<body style="background-color: rgb(191, 175, 153);">
<%@include file="header.jsp" %>
    <div class="container">
        <div class="info-section">
            <h2>GET IN TOUCH WITH US!</h2>

            <marquee behavior="" direction="right" class="marq">"Your Next Adventure Starts Here – Book, Explore, Discover!"</marquee>

            <p>We're here to help you plan your perfect getaway! Whether you have questions about our destinations, need assistance with bookings, or simply want to know more about the services we offer, our team is ready to assist you.</p>
            <div class="contact-details">
            
                <p><b>Email:</b> support@traveltaleswebsite.com</p>
                <p><b>Phone:</b> +123 456 7890</p>
                <p><b>Operating Hours:</b> Monday - Friday, 9:00 AM - 6:00 PM (GMT)</p>
                <p><b>General Inquiries:</b> info@traveltaleswebsite.com</p>
                <p><b>Sales & Partnerships:</b> partnerships@traveltaleswebsite.com</p>
            </div>
        </div>

        <form action="contactus" method="post">
            <h2>Opinion Poll</h2>
            <label for="name">Enter Your Name:</label>
            <input type="text" id="name" name="name" placeholder="Username" required value="<%= session.getAttribute("uname")%>">

            <label for="email">Enter Your Email:</label>
            <input type="email" id="email" name="mail" placeholder="Email ID" required value="<%= session.getAttribute("email")%>">

            <label for="phone">Enter Your Phone Number:</label>
            <input type="tel" id="phone" name="phone" placeholder="Phone Number" required value="<%= session.getAttribute("phone")%>">

            <label for="review">Review:</label>
            <textarea id="review" rows="3" name="review" placeholder="Write your review..."></textarea>

            <p class="text-center rate">Rate Your Experience:</p>
            <div class="star-rating">
                <span class="star" data-value="1">&#9733;</span>
                <span class="star" data-value="2">&#9733;</span>
                <span class="star" data-value="3">&#9733;</span>
                <span class="star" data-value="4">&#9733;</span>
                <span class="star" data-value="5">&#9733;</span>
            </div>
            <p class="text-center"><span id="rating-value"></span></p>

            <input type="submit" class="btn btn-success" value="Submit">
        </form>
    </div>

    <script>
        const stars = document.querySelectorAll('.star');
        const ratingValue = document.getElementById('rating-value');

        stars.forEach(star => {
            star.addEventListener('click', () => {
                const rating = parseInt(star.getAttribute('data-value'));

                stars.forEach(star => star.classList.remove('selected'));
                for (let i = 0; i < rating; i++) {
                    stars[i].classList.add('selected');
                }

                ratingValue.textContent = `You rated: ${rating} star(s)`;
            });
        });
    </script>
</body>
</html>
    