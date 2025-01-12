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
        body{
            background-image:linear-gradient( rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.3)), url("assets/contact.jpg");
            height: 100%;
            background-position: left top;
            background-size: 60% 100%;
            background-repeat: no-repeat;
            padding-bottom: 30px;
            background-color: rgb(191, 175, 153);
        }
        form{
            border: none;
            box-shadow: 4px 2px 4px 3px;
            border-radius: 15px;
            display: inline-block;
            margin: 50px auto;
            margin-left: 800px;
            margin-top: -350px;
            margin-bottom: 40px;
            padding-left: 40px;
            padding-right: 40px;
            padding-bottom: 20px;
            padding-top: 20px;
            backdrop-filter: blur(10px);
        }
        .btn{
            text-align: center;
            font-size: large;
            font-weight: bold;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .ip{
            border-radius: 5px;
            font-size: large;
        }

        .star-rating {
            display: inline-block;
            font-size: 40px;
        }

        .star {
            cursor: pointer;
            color: #f4ecec;
        }

        .star:hover,
        .star.selected {
            color: gold;
        }

        p {
            font-size: 18px;
        }
        .head{
            text-shadow: 2px 3px 3px;
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
            font-weight: 700;
            position: relative;
            bottom: -90px;
            color: white;
            right: -80px;
            
        }
        .feed{
            color: rgb(44, 49, 53);
            font-family: Georgia, 'Times New Roman', Times, serif;
        }
        label{
            color: rgb(35, 35, 36);
            font-size: medium;
            font-weight: bold;
        }
        #text{
            border-radius: 5px;
        }
        .para{
            border: 1px solid white;
            display: inline-block;
            margin-bottom: 40px;
            margin-top: 90px;
            margin-left: 30px;
            text-align: center;
            padding-left: 20px;
            padding-right: 20px;
            color: aliceblue;
            padding-top: 20px;
            padding-bottom: 20px;
            border-radius: 50px 0px 50px 0px;
            
        }
        .rate{
            font-size: medium;
            font-weight: bold;
        }
        .para1{
            border: 1px solid white;
            color: aliceblue;
            display: inline-block;
            position: relative;
            top: 320px;
            margin-left: -528px;
            padding-left: 20px;
            padding-right: 20px;
            padding-top: 20px;
            padding-bottom: 20px;
            border-radius: 0px 50px 0px 50px;
        }
        .marq{
            position: relative;
            bottom: -80px;
            color: aqua;
        }
        .review{
        top: 20px;
        }
        
        
</style>
</head>
<body>
<%@include file="header.jsp" %>
    <div class="background"></div>
    <h2 class="head">GET IN TOUCH WITH US!</h2><br>
    <marquee direction="right" class="marq">"Your Next Adventure Starts Here – Book, Explore, Discover!"</marquee>
    <div>
    <p class="para">We're here to help you plan your perfect getaway!<br>
     Whether you have questions about our destinations,<br>
     need assistance with bookings, or simply want to know more<br>
    about the services we offer, our team is ready to assist you.</p>
    <p class="para1">Email: support@yourtourismwebsite.com<br>
        Phone: +123 456 7890<br>
        Operating Hours: Monday - Friday, 9:00 AM - 6:00 PM (GMT)<br>
        <b>General Inquiries</b><br>
        For general inquiries or to learn more about our offerings,<br>
        contact us at:<br>
        <b>Email:</b> info@yourtourismwebsite.com<br>
        <b>Sales & Partnerships</b><br>
        Interested in collaborating or need info about our partnerships?<br>
        <b>Email: partnerships@yourtourismwebsite.com</b>
    </p>
        
    </div>
    <form action="contactus" method="post">
        <div>
            <center><h2 class="feed">Opinion Poll</h2></center><br>
            <label>Enter Your Name:</label><br>
            <input type="text" name="name" class="ip" placeholder="Username" required><br>
            <label>Enter Your Email:</label><br>
            <input type="email" name="mail" class="ip" placeholder="Email ID" required><br>
            <label>Enter Your Phone Number:</label><br>
            <input type="tel" name="phone" class="ip" placeholder="Phone Number" required><br><br>
            <label class="review">Review:</label>
            <textarea id="text" rows="2" cols="25"></textarea><br>
            <center><p class="rate">Rate Your Experience:</p></center>
            <center>
            <div class="star-rating">
                <span class="star" data-value="1">&#9733;</span>
                <span class="star" data-value="2">&#9733;</span>
                <span class="star" data-value="3">&#9733;</span>
                <span class="star" data-value="4">&#9733;</span>
                <span class="star" data-value="5">&#9733;</span>
            </div>
            <p><span id="rating-value"></span></p>
        </center>
            <script>
                const stars = document.querySelectorAll('.star');
                const ratingValue = document.getElementById('rating-value');
        
                // Add event listener for each star
                stars.forEach(star => {
                    star.addEventListener('click', () => {
                        const rating = parseInt(star.getAttribute('data-value'));
        
                        // Update selected stars
                        stars.forEach(star => {
                            star.classList.remove('selected');
                        });
        
                        for (let i = 0; i < rating; i++) {
                            stars[i].classList.add('selected');
                        }
        
                        // Display the rating value
                        ratingValue.textContent = rating;
                    });
                });
            </script>
           <center> <input type="submit" class="btn btn-success" value="Submit"></center>
        </div>
    </form>
    <%@include file="footer.jsp" %>
</body>
</html>