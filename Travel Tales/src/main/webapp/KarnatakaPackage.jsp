<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Karnataka</title>
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
            height: 95vh;
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
        <h1 class="heading"><center> KARNATAKA TOUR</center></h1>
    </section>
    <div class="imagesectionparent">
        <div class="imagesectionchild" id="img1">
            <img class="img1" src="https://res.cloudinary.com/dyiffrkzh/image/upload/c_fill,f_auto,fl_progressive.strip_profile,g_center,h_400,q_auto,w_700/v1691759048/banbanjara/gosayhlgcmymufx5ze4a.jpg">
        </div>


        <div class="imagesectionchild">
            <div class="mid" id="mid2">
               <div class="imagesectionchild_child" id="img2">
                     <img src="https://s3.india.com/wp-content/uploads/2024/09/lesser-kmown-hubli.jpg##image/jpg" width="200px" height="200px">
                </div>
                
                <div class="imagesectionchild_child" id="img imgd1" >
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7YTFcP5VC9puVcUUu7gjsak_b93FDmp2hLw&s" width="200px" height="200px"> 
                </div> 
            </div>
            <div class="mid" id="mid2">
                <div class="imagesectionchild_child" id="img4">
                   <img src="https://www.astagirihomestay.com/img/ethina-buja-chikmagalur.jpg" width="200px" height="200px">
                 </div>
           
                <div class="imagesectionchild_child" id="img">
                  <img src="https://media1.thrillophilia.com/filestore/60zv3p7hoj9ihglp7igcbaha2zi0_1575010669_shutterstock_652879903.jpg?w=753&h=450&dpr=2.0" width="200px" height="200px"> 
                </div>
            </div>
        </div>
        
        <div class="imagesectionchild lastpic" id="img6">
           <img class="img1 img6" src="data:image/jpeg;base64,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" > 
        </div>
    </div>
    <br>
    <section class="bar1">
        <h2>15 Days Tour</h2>
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
                    <li class="nav-item">
                        <a href="#day7" class="nav-link">Day 8</a>
                    </li>
                    <li class="nav-item">
                        <a href="#day7" class="nav-link">Day 9</a>
                    </li>
                    <li class="nav-item">
                        <a href="#day7" class="nav-link">Day 10</a>
                    </li>
                    <li class="nav-item">
                        <a href="#day7" class="nav-link">Day 11</a>
                    </li>
                    <li class="nav-item">
                        <a href="#day7" class="nav-link">Day 12</a>
                    </li>
                    <li class="nav-item">
                        <a href="#day7" class="nav-link">Day 13</a>
                    </li>
                    <li class="nav-item">
                        <a href="#day7" class="nav-link">Day 14</a>
                    </li>
                    <li class="nav-item">
                        <a href="#day7" class="nav-link">Day 15</a>
                    </li>
                </ul>
            </nav>

            <!-- Content Area -->
            <main class="col-md-9 col-lg-10 content">
                <section id="day1">
                    <div class="day-header">Day 1   <i class="fa-duotone fa-solid fa-location-dot"></i> Bidar <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Gulbarga <i class="fa-duotone fa-solid fa-location-dot"></i></div>

                    <div class="day-details">
                        - Vehicle Pickup: Pickup from Bidar Railway Station.<br>
                        -Accommodation: Stay at a local hotel in Bidar.<br>
						-Sightseeing: Explore Bidar Fort, Gurudwara,Bahmani Tombs, Jami Masjid.<br>
						Distance: ~100 km<br>
						- Departure Time: 8:00 AM (after breakfast)<br>
						- Sightseeing in Gulbarga:<br>
						  - Gulbarga Fort<br>
						  - Khwaja Bande Nawaz Dargah<br>
						  - Jama Masjid<br>
						- Meals: Hotel Local restaurant in Gulbarga  Tea and snacks at a local café  Hotel<br>  
						- Accommodation: Stay at a hotel in Gulbarga.<br>
						 - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                <hr>
                <section id="day2">
                    <div class="day-header">Day 2    <i class="fa-duotone fa-solid fa-location-dot"></i> Gulbarga <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i>Bijapur <i class="fa-duotone fa-solid fa-location-dot"></i> </div>
                    <div class="day-details">
                        - Distance:140 km<br>
						- Departure Time:8:00 AM <br>
						- Sightseeing in Bijapur:<br>
						  - Gol Gumbaz<br>
						  - Ibrahim Roza<br>
						  - Jama Masjid<br>
						  - Adil Shahi Tombs<br>
						- Accommodation:Stay in Bijapur.<br>
						- Three time a Day meal is given with snacks and juice in the evening.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
              
                    </div>
                </section>
                <hr>
                <section id="day3">
                    <div class="day-header">Day 3    <i class="fa-duotone fa-solid fa-location-dot"></i> Bijapur <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Raichur<i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Distance:120 km<br>
						- Departure Time:8:00 AM <br>
						- Sightseeing in Raichur:<br>
						  - Raichur Fort<br>
						  - Jogulamba Temple<br>
						-Accommodation: Stay in Raichur.<br>
						- Three time a Day meal is given with snacks and juice in the evening.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                       
                    </div>
                </section>
                <hr>
                <section id="day4">
                    <div class="day-header">Day 4    <i class="fa-duotone fa-solid fa-location-dot"></i> Raichur <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Koppal <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Now morning travel to Raichur with ejoyable music system and active games to make your trip fun and enthusiastic .<br>
                        - Distance:75 km<br>
						- Departure Time: 8:00 AM  <br>
						- Sightseeing in Koppal:Koppal Fort,Anandapura Fort<br>
						- Meals:Local restaurant in Koppal Tea and snacks ,Dinner <br> 
						- Accommodation: Stay in Koppal Hotel.<br>
                        - Three time a Day meal is given with snacks and juice in the evening.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                <hr>
                <section id="day5">
                    <div class="day-header">Day 5    <i class="fa-duotone fa-solid fa-location-dot"></i> Koppal <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Gadag <i class="fa-duotone fa-solid fa-location-dot"></i> </div>
                    <div class="day-details">
                        - Morning travel to Koppal reach our destination by 9AM.<br>
                       - Distance:50 km<br>
						- Departure Time: 9:00 AM  <br>
						- Sightseeing in Gadag:Trikuteshwara Temple,Doddabasappa Temple<br>
						- Meals: Local restaurant in Gadag  
						 Snacks and juice  <br>
						- Accommodation: Stay in Gadag Hotel.<br>
                        - Three time a Day meal is given with snacks and juice in the evening.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                <hr>
                <section id="day6">
                    <div class="day-header">Day 6    <i class="fa-duotone fa-solid fa-location-dot"></i> Gadag <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Bagalkot <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Distance: 75 km<br>
						- Departure Time:9:00 AM  <br>
						- Sightseeing in Bagalkot:Badami Caves,Pattadakal Temples,Aihole<br>
						- Meals: Local restaurant in Bagalkot,Tea and snacks   <br>
						- Accommodation: Stay in Bagalkot.<br>
                        - Three time a Day meal is given with snacks and juice in the evening.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                <hr>
                <section id="day7">
                    <div class="day-header">Day 7    <i class="fa-sharp-duotone fa-solid fa-plane"></i> Bagalkot <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Belgaum <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Distance:180 km<br>
						- Departure Time:7:00 AM  <br>
						- Sightseeing in Belgaum:Belgaum Fort,Gokak Falls<br>
						- Meals:Local restaurant in Belgaum,Tea and snacks <br>   
						- Accommodation: Stay in Belgaum.<br>
                        - Three time a Day meal is given with snacks and juice in the evening.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                 <hr>
                <section id="day8">
                    <div class="day-header">Day 8    <i class="fa-sharp-duotone fa-solid fa-plane"></i> Belgaum <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Dharwad <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Distance:120 km<br>
						- Departure Time:8:00 AM  <br>
						- Sightseeing in Dharwad:Siddharoodha Math,Unkal Lake<br>
						- Meals:Local restaurant in Dharwad,Snacks <br>
						- Accommodation:Stay in Dharwad.<br>
                        - Three time a Day meal is given with snacks and juice in the evening.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                 <hr>
                <section id="day9">
                    <div class="day-header">Day 9   <i class="fa-sharp-duotone fa-solid fa-plane"></i> Dharwad <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Uttarkannada <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Distance:200 km<br>
						- Departure Time:7:00 AM  <br>
						- Sightseeing in Uttarkannada:Gokarna Beach,Om Beach,Mirjan Fort<br>
						- Meals:Local restaurant in Uttarkannada,Tea and snacks    <br>
						- Accommodation: Stay in Uttarkannada.<br>
                        - Three time a Day meal is given with snacks and juice in the evening.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                 <hr>
                <section id="day10">
                    <div class="day-header">Day 10 <i class="fa-sharp-duotone fa-solid fa-plane"></i> Uttarkannada <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Haveri <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Distance:150 km<br>
						- Departure Time:8:00 AM  <br>
						- Sightseeing in Haveri:Jog Falls,Uppinapada Beach <br>
						- Meals: Local restaurant in Haveri,Snacks and juice   <br>
						- Accommodation: Stay in Haveri.<br>
                        - Three time a Day meal is given with snacks and juice in the evening.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                  <hr>
                <section id="day11">
                    <div class="day-header">Day 11<i class="fa-sharp-duotone fa-solid fa-plane"></i> Haveri <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Bellary <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                       - Distance:160 km<br>
						- Departure Time:7:00 AM  <br>
						- Sightseeing in Bellary:Bellary Fort,Hampi Ruins (if time permits)<br>
						- Meals:Local restaurant in Bellary,Tea and snacks   <br>
						- Accommodation: Stay in Bellary.<br>
                        - Three time a Day meal is given with snacks and juice in the evening.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                
                 <hr>
                <section id="day12">
                    <div class="day-header">Day 12<i class="fa-sharp-duotone fa-solid fa-plane"></i> Bellary <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Davangere <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                      - Distance:170 km<br>
						- Departure Time:7:30 AM  <br>
						- Sightseeing in Davangere:Shivgiri Hill,Chandavara Falls<br>
						- Meals:Local restaurant in Davangere,Tea and snacks  <br> 
						- Accommodation: Stay in Davangere.<br>
                        - Three time a Day meal is given with snacks and juice in the evening.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                
                 <hr>
                <section id="day13">
                    <div class="day-header">Day 13<i class="fa-sharp-duotone fa-solid fa-plane"></i> Davangere <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Shimoga(Shivamogga) <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                     - Distance:160 km<br>
						- Departure Time:8:00 AM  <br>
						- Sightseeing in Shimoga:Jog Falls,Tunga River,Bhadravati Temples<br>
						- Meals:Local restaurant in Shimoga,Tea and snacks   <br>
						- Accommodation:Stay in Shimoga.<br>
                        - Three time a Day meal is given with snacks and juice in the evening.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                
                 <hr>
                <section id="day14">
                    <div class="day-header">Day 14<i class="fa-sharp-duotone fa-solid fa-plane"></i> Shimoga <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Udupi <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                     - Distance:150 km<br>
					- Departure Time:8:00 AM  <br>
					- Sightseeing in Udupi:Udupi Sri Krishna Temple
					 ,Malpe Beach,Kaup Beach
					- Meals:Local restaurant in Udupi, Snacks and juice  <br>
					- Accommodation:Stay in Udupi.<br>
                        - Three time a Day meal is given with snacks and juice in the evening.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                
                <hr>
                <section id="day15">
                    <div class="day-header">Day 15<i class="fa-sharp-duotone fa-solid fa-plane"></i> Udupi <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Bengaluru <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                    - Distance:400 km<br>
					- Departure Time:7:00 AM <br> 
					- Sightseeing in Bengaluru:Bangalore Palace,Lalbagh Botanical Garden,Vidhana Soudha,Cubbon Park<br>
					- Meals:Local restaurant in Bengaluru,Snacks  <br>
					 - Dinner: Hotel in Bengaluru  <br>
					- Accommodation: Stay in Bengaluru and return on that day from banglore to bidar.<br>
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