<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Travel Tales</title>
     <link rel="icon" href='assets/logo.jpg'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        *{
            padding:0;
            margin: 0;
            font-family: 'Times New Roman', Times, serif;
        }
        .mvv-container{
            max-width: 90%;
            margin: 50px auto 0;
        }

        .mvv-container .mvv-block{
            margin-bottom: 50px;
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
        }
        .mvv-container .mvv-block .image{
            flex: 0 0 auto;
            width: 500px;
            overflow: hidden;
            border-radius: 5px;
            box-shadow: 0 0 10px 5px rgba(0,0,0,.3);
            line-height: 0;
        }
        .mvv-container .mvv-block .image img{
            width: 100%;
            height: 100%;
            transition: .3s;
            transform: scale(1);
        }
        .mvv-container .mvv-block .image:hover img{
            transform: scale(2);
        }
        .mvv-container .mvv-block .content{
            flex: 0 0 auto;
            width: calc(100% - 500px);
            box-sizing: border-box;
            align-self: center;
            text-align: justify;
            font-size: 20px;
        }
        .mvv-container .mvv-block .content h5{
            font-weight: bold;
            font-size: 40px;
            color: blue;
        }
        .mvv-container .mvv-block .content p{
            margin-left: 10px;
        } 
        @media screen and (min-width: 1024px) {
            .mvv-container .mvv-block:nth-child(odd) .image {
                order: 1;
            }
            .mvv-container .mvv-block:nth-child(even) .image {
                order: 2;
            }
            .mvv-container .mvv-block:nth-child(odd) .content {
                order: 2;
                padding-left: 30px;
            }
            .mvv-container .mvv-block:nth-child(even) .content {
                order: 1;
                padding-right: 30px;
            }
        }

        @media screen and (max-width: 1023px) {
            .mvv-container .mvv-block {
                flex-direction: column;
            }
            .mvv-container .mvv-block .image,
            .mvv-container .mvv-block .content {
                width: 100%;
                text-align: center;
            }
            .mvv-container .mvv-block .content h5 {
                font-size: 35px;
                margin-top:10px;
            }
            .mvv-container .mvv-block .content p {
                font-size: 18px;
                padding: 0 10px;
                text-align: justify;
            }
        }

        @media screen and (max-width: 768px) {
            .mvv-container .mvv-block .content h5 {
                font-size: 35px;
                margin-top:10px;
            }
            .mvv-container .mvv-block .content p {
                font-size: 20px;
                text-align: justify;
            }
        }

        @media screen and (max-width: 576px) {
            .mvv-container .mvv-block .image img {
                height: auto;
            }
            .mvv-container .mvv-block .content h5 {
                font-size: 35px;
                margin-top:10px;
            }
            .mvv-container .mvv-block .content p {
                font-size: 20px;
                text-align: justify;
            }
        }

        .blink {
            animation: blink 1.5s linear infinite;
            color: blue;
            font-size: larger;
            font-weight: bolder;
            text-transform: uppercase;
            font-family: Georgia, 'Times New Roman', Times, serif;
        }
        @keyframes blink {
            50% {
                opacity: 0;
            }
        }
        .image-container img {
            border-radius: 50%;
            width: 200px; /* Large size */
            height: 200px;
            object-fit: cover;
            border: 3px solid #ccc;
        }
        .image-container {
            text-align: center;
            margin: 20px 0;
            
        }
        .image-container p {
            margin-top: 5px; 
            font-size: 1.2rem; 
            font-weight: bold;
        }
        
        .founder{
        margin-left: 75px;
        text-decoration: underline;
        color: navy;
        font-weight: bold;
        }
    </style>
</head>
<body style="background-color:#FFFDEC;">
<%@include file="header.jsp" %>
    <marquee class="blink mt-5 fs-2">
        Welcome to Travel Tales!!!
    </marquee>
    <div class="mvv-container">
        <div  class="mvv-block">
            <div class="image">
                <img src="https://www.svmsholidays.com/wp-content/uploads/2020/05/Bali-1-scaled-680x500.jpg" alt="pic">
            </div>
            <div class="content">
                <h5>About us</h5>
                <p>At  Travel Tales Adventures, we believe that travel is more than just visiting new places; it’s about creating memories, connecting with diverse cultures, and discovering the beauty of the world. With a passion for exploration, we specialize in curating unforgettable journeys that combine adventure, relaxation, and cultural enrichment.

                Our team of travel experts works tirelessly to provide personalized itineraries, ensuring each trip is tailored to your unique preferences and desires. Whether you're seeking the thrill of adventure, a serene escape, or an immersive cultural experience, Wanderlust Adventures is your trusted partner in turning travel dreams into reality.</p>
            </div>
        </div>

        <div  class="mvv-block">
            <div class="image">
                <img src="https://thetelityellowpages.com/wp-content/uploads/2015/09/tours-travel.jpg" alt="pic">
            </div>
            <div class="content">
                <h5>Who we are</h5>
                <p>At Travel Tales, we are a passionate and dedicated team of travel experts, committed to providing unforgettable experiences for travelers. With a focus on personalized service, we curate custom tours and travel packages that cater to every type of traveler—from adventurous explorers to those seeking relaxation in exotic locations.
    
            We believe that travel should be more than just a getaway; it’s an opportunity to explore new cultures, forge lasting memories, and connect with people and places in meaningful ways. Our services range from group tours to private trips, offering tailor-made itineraries, transportation, accommodation, and local experiences.
            
            What sets us apart is our deep knowledge of the destinations we serve, our unwavering commitment to quality, and our passion for creating seamless and enjoyable journeys. We work closely with our clients to understand their preferences, ensuring that every trip is crafted to perfection.
            
            Whether you are planning a weekend escape or the adventure of a lifetime, Travel Tales is here to make your travel dreams come true....</p>
            </div>
        </div>

        <div  class="mvv-block">
            <div class="image">
                <img src="https://thetravelshots.com/wp-content/uploads/2021/11/solo-travel.jpg" alt="pic">
            </div>
            <div class="content">
                <h5>Our Mission</h5>
                <p>At Travel Tales, our mission is to inspire a lifelong love for exploration by creating exceptional travel experiences that bring the world closer to our customers. We are dedicated to offering meticulously planned journeys that cater to the unique dreams and desires of every traveler, ensuring a perfect balance of adventure, relaxation, and cultural immersion.

            Through our personalized itineraries and comprehensive travel solutions, we aim to simplify the travel process while delivering unmatched quality and value. Our commitment lies in fostering meaningful connections between travelers and the places they visit, promoting sustainable and responsible tourism practices that preserve the beauty and heritage of destinations for generations to come. With a passion for excellence, we strive to transform every journey into a memorable story of discovery, joy, and inspiration</p>
                
            </div>
        </div>

        <div  class="mvv-block">
            <div class="image">
                <img src="https://www.thestatesman.com/wp-content/uploads/2018/01/Karnataka.jpg" alt="pic">
            </div>
            <div class="content">
                <h5>Our Vision</h5>
                <p>Our vision is to become a globally recognized leader in the travel and tourism industry, setting new standards for excellence, innovation, and sustainability. We aim to inspire individuals and communities to explore the world with an open heart and mind, fostering a deep appreciation for diverse cultures, landscapes, and traditions. By offering personalized and transformative travel experiences, we seek to create lasting memories that enrich the lives of our customers while promoting responsible tourism practices that protect and preserve the beauty of our planet for future generations. Through a commitment to exceptional service, technological innovation, and community engagement, we envision a world where travel serves as a bridge to understanding, connection, and harmony among people from all walks of life.</p>
                
            </div>
        </div>
    </div>
    <h2 class="founder">Founder's Of Travel Tales </h2>
    <br>
    <div class="container">
        <!-- Row 1 -->
        <div class="row justify-content-center">
            <div class="col-4 image-container">
                <img src="assets2/Siddu.jpeg" alt="Siddu">
                <p>Siddaveer Swamy</p>
            </div>
            <div class="col-4 image-container">
                <img src="assets2/Varsha.jpeg" alt="Varsha">
                <p>Varsha</p>
            </div>
            <div class="col-4 image-container">
                <img src="assets2/Shraddha.jpeg" alt="Shraddha">
                <p>Shraddha</p>
            </div>
        </div>
        <!-- Row 2 -->
        <div class="row justify-content-center">
            <div class="col-4 image-container">
                <img src="assets2/Sonashree.jpeg" alt="Sonashree">
                <p>Sonashree</p>
            </div>
            <div class="col-4 image-container">
                <img src="assets2/Shreya.jpeg" alt="Shreya">
                <p>Shreya</p>
            </div>
            <div class="col-4 image-container">
                <img src="assets2/Adi.jpeg" alt="Adi">
                <p>Adi</p>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <%@include file="footer.jsp" %>
</body>
</html>
