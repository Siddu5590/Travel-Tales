<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>North Karnataka</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        *{
            margin: 0;
            padding: 0;
           
        }
        /* heading */
        .heading{
            font-size:xx-large;
            font-weight: bold;
            animation: heading 1s ease-in;
            text-decoration: underline;
            background-color:#E195AB;
            color: black;
            height: 50px;
            
        }
        @keyframes heading{
            from{
                transform: translateX(-40px);
            }
            to{
                transform: translateX(0);
            }
        }
        /* images */
        .imagesectionparent{
            display: flex;
           
        }
        .img1{
            width: 400px;
            height: 400px;
            margin-left: 20%;
        
        }
        .imagesectionchild{
            width: 400px;
            height: 400px;
           
        }
        .mid{
            display: flex;
      
        }
       
       .img6{
        margin-left: 55%;
       }
       #mid2{
        padding-left: 150px;
       }
       /* no of days bar */
       .bar1{
        width: 100%;
        background-color: #C30E59;
        color: black;
        padding-left:75px;
       }
      /* sidebar +main content */
      .sidebar {
            height: 47vh;
            position: sticky;
            top: 0;
            border: 2px solid black ;
            background-color:#FCC6FF;
            color: black;
            padding-top: 20px;
        }

        .sidebar a {
            color: black;
            text-decoration: none;
            display: block;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .sidebar a:hover, .sidebar a.active {
            background-color: #495057;
            color: whitesmoke;
        }

        .content {
            padding: 20px;
        }

        .day-header {
            font-size: 24px;
            font-weight: bold;
            background-color: #C890A7;
            padding-left: 15px;
            color: black;
           
        }

        .day-details {
            font-size: 16px;
            margin-top: 10px;
            color: black;
        } 
        
    </style>
</head>
<body style="background-color:#FCC6FF;">
<%@include file="header.jsp" %>

    <section>
        <h1 class="heading"><center>NORTH KARNATAKA TOUR</center></h1>
    </section>
    <div class="imagesectionparent">
        <div class="imagesectionchild" id="img1">
            <img class="img1" src="assestsPackage/pic1.jpg">
        </div>


        <div class="imagesectionchild">
            <div class="mid" id="mid2">
               <div class="imagesectionchild_child" id="img2">
                     <img src="assestsPackage/pic3.jpg" width="200px" height="200px">
                </div>
                
                <div class="imagesectionchild_child" id="img imgd1" >
                    <img src="assestsPackage/pic6.jpg" width="200px" height="200px"> 
                </div> 
            </div>
            <div class="mid" id="mid2">
                <div class="imagesectionchild_child" id="img4">
                   <img src="assestsPackage/pic4.jpg" width="200px" height="200px">
                 </div>
           
                <div class="imagesectionchild_child" id="img">
                  <img src="assestsPackage/pic5.webp" width="200px" height="200px"> 
                </div>
            </div>
        </div>
        
        <div class="imagesectionchild lastpic" id="img6">
           <img class="img1 img6" src="assestsPackage/pic2.jpg" > 
        </div>
    </div>
    <br>
    <section class="bar1">
        <h2>7 Days Tour</h2>
    </section>

    <!-- main content -->
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-3 col-lg-2 sidebar">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a href="#day1" class="nav-link active">Day 1</a>
                    </li>
                    <li class="nav-item">
                        <a href="#day2" class="nav-link">Day 2</a>
                    </li>
                    <li class="nav-item">
                        <a href="#day3" class="nav-link">Day 3</a>
                    </li>
                    <li class="nav-item">
                        <a href="#day4" class="nav-link">Day 4</a>
                    </li>
                    <li class="nav-item">
                        <a href="#day5" class="nav-link">Day 5</a>
                    </li>
                    <li class="nav-item">
                        <a href="#day6" class="nav-link">Day 6</a>
                    </li>
                    <li class="nav-item">
                        <a href="#day7" class="nav-link">Day 7</a>
                    </li>
                </ul>
            </nav>

            <!-- Content Area -->
            <main class="col-md-9 col-lg-10 content">
                <section id="day1">
                    <div class="day-header">Day 1   <i class="fa-duotone fa-solid fa-location-dot"></i> Karwar <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Gokarna <i class="fa-duotone fa-solid fa-location-dot"></i></div>

                    <div class="day-details">
                        - Travel Tales vechile Pickup from Karwar railway station (KAWR) at 9A.M<br>
                        - Hotel Stay at Amrut Aura.<br>
                        - Start visiting places at Uttar Kannada, we start visting Gokarna by 11AM<br>
                        - Followed by Yana Rocks, Shri Idagunji Mahaganapathi Temple.<br>
                        - Sahasralinga, Om Beach and Shri Murdeshwara Beach.<br>
                        - Night private stay at Beach.<br>
                        - Three times a Day meal is given with snacks and juice in the evening.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                <hr>
                <section id="day2">
                    <div class="day-header">Day 2    <i class="fa-duotone fa-solid fa-location-dot"></i> Gokarna <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Haveri <i class="fa-duotone fa-solid fa-location-dot"></i> <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Belagavi <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Checkout from Private beach Hotel at 6AM<br>
                        - Start our journey at Haveri to visit places Ancient Chalukya Shri Siddeshwara Swamy Temple, Shri Muktheshwara Temple, Shri Galageshwara Swamy Temple.<br>
                        - Followed by night travel to Belagavi.<br>
                        - Three time a Day meal is given with snacks and juice in the evening.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                <hr>
                <section id="day3">
                    <div class="day-header">Day 3    <i class="fa-duotone fa-solid fa-location-dot"></i> Belgaum <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Belgaum <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Visit Belagavi fort, Belgaum Kamal Basti and Rajhansgad Yellur Fort. <br>
                        - A rapid travel to Bagalkote, Shree Badami Shakambhari Shakti Peetham.<br>
                        - Night rest at a Star Plus Hotel.<br>
                        - Fresh morning with magnificent visit to Badami Cave Temples, Bagalkote Aihole, Bagalkote Pattadakal.<br>
                        - enjoy an flushing evening at Agasthya Lake.<br>
                        - Three time a Day meal is given with snacks and juice in the evening. <br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                <hr>
                <section id="day4">
                    <div class="day-header">Day 4    <i class="fa-duotone fa-solid fa-location-dot"></i> Yadgir <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Yadgir <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Now morning travel to Yadgir with ejoyable music system and active games to make your trip fun and enthusiastic .<br>
                        - An halt at resort and then visit Yadgir Fort, Basava Sagar Reservoir.<br>
                        - create and Funfull, relaxing evening at the resort with all indoor and outdoor activities. <br>
                        - Extra food from restort can be ordered but on client's expenses.<br>
                        - Three time a Day meal is given with snacks and juice in the evening.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                <hr>
                <section id="day5">
                    <div class="day-header">Day 5    <i class="fa-duotone fa-solid fa-location-dot"></i> Yadgir <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Bijapur <i class="fa-duotone fa-solid fa-location-dot"></i> <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Kalburgi <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Morning travel to Bijapur reach our destination by 9AM.<br>
                        - Visit Gol Gumbaz, Bara Kaman, Ibrahim Roza - Vijayapura. <br>
                        - Night travel to Kalburagi.<br>
                        - Three time a Day meal is given with snacks and juice in the evening.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                <hr>
                <section id="day6">
                    <div class="day-header">Day 6    <i class="fa-duotone fa-solid fa-location-dot"></i> Kalburgi <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Bidar <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Reach Kalburgi and then visit Dargah Khwaja Bandanawaz, Gulbarga Fort.<br>
                        - Another monument of Sharana Basaveshwara Temple, The Haft Gumbaz Tomb<br>
                        - Morning travel to Bidar.<br>
                        - Three time a Day meal is given with snacks and juice in the evening.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                <hr>
                <section id="day7">
                    <div class="day-header">Day 7    <i class="fa-sharp-duotone fa-solid fa-plane"></i> Bidar <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Bengaluru <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Flushing a day with Narasimha Jhira Cave Temple, Bidar fort, Gurudwara Nanak Jhira Sahib and Basavakalyan<br>
                        - This comes to the end of the trip.<br>
                        - A mid-night flight to Bengaluru International Airport.<br>
                        - Three time a Day meal is given with snacks and juice in the evening.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
            </main>
        </div>
    </div>
    <%@include file="footer.jsp" %>

  
</body>
</html>