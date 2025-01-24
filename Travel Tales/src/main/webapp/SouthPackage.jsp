<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>South Karnataka</title>
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
            font-weight: bolder;
            animation: heading 1s ease-in;
            text-decoration: underline;
            background-color:#E195AB;
            color: black;
            height: 50px;
            font-family:Times-New-Roman;
            
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
            height: 63vh;
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
        <h1 class="heading"><center>SOUTH KARNATAKA TOUR</center></h1>
    </section>
    <div class="imagesectionparent">
        <div class="imagesectionchild" id="img1">
            <img class="img1" src="assestsPackage/s_image1.jpg">
        </div>


        <div class="imagesectionchild">
            <div class="mid" id="mid2">
               <div class="imagesectionchild_child" id="img2">
                     <img src="assestsPackage/s_image2.jpeg" width="200px" height="200px">
                </div>
                
                <div class="imagesectionchild_child" id="img imgd1" >
                    <img src="assestsPackage/s_image3.webp" width="200px" height="200px"> 
                </div> 
            </div>
            <div class="mid" id="mid2">
                <div class="imagesectionchild_child" id="img4">
                   <img src="assestsPackage/s_image4.jpg" width="200px" height="200px">
                 </div>
           
                <div class="imagesectionchild_child" id="img">
                  <img src="assestsPackage/s_image6.jpg" width="200px" height="200px"> 
                </div>
            </div>
        </div>
        
        <div class="imagesectionchild lastpic" id="img6">
           <img class="img1 img6" src="assestsPackage/s_image5.jpeg" > 
        </div>
    </div>
    <br>
    <section class="bar1">
        <h2>10 Days Tour</h2>
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
                        <a href="#day8" class="nav-link">Day 8</a>
                    </li>
                    <li class="nav-item">
                        <a href="#day9" class="nav-link">Day 9</a>
                    </li>
                    <li class="nav-item">
                        <a href="#day10" class="nav-link">Day 10</a>
                    </li>
                </ul>
            </nav>

            <!-- Content Area -->
            <main class="col-md-9 col-lg-10 content">
                <section id="day1">
                    <div class="day-header">Day 1   <i class="fa-duotone fa-solid fa-location-dot"></i> Bengaluru <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Ramanagara <i class="fa-duotone fa-solid fa-location-dot"></i> <i class="fa-sharp-duotone fa-solid fa-arrow-right"> </i> Mandya <i class="fa-duotone fa-solid fa-location-dot"></i></div>

                    <div class="day-details">
                        - Attractions: Bengaluru Palace, Lalbagh Botanical Garden, Bannerghatta National Park.<br>
                        - Ramanagar: Ramdevarabetta Vulture Sanctuary, Kanva Reservoir.<br>
                        - Followed by Janapada Loka, Savandurga Hill, SRS Hills.<br>
                        - Mandya: Bharachikki Waterfalls, Tippu Sultan Palace, Srirangapatna Fort. <br>
                        - Followed by Balamuri Falls, Shivanasamudra, Sri Ranganatha Swamy Temple.<br>
                        - Food: Masala Dosa for breakfast, Bisi Bele Bath for lunch,<br>
                        - Banana Chips and fruit juice for snacks and Full Meals for Night<br>
                        - Stay: Mandya, find a cozy budget or mid-range hotel to relax.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                <hr>
                <section id="day2">
                    <div class="day-header">Day 2    <i class="fa-duotone fa-solid fa-location-dot"></i> Mandya <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Mysore <i class="fa-duotone fa-solid fa-location-dot"></i> <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Chamarajanagar <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Attractions: Mysore Palace, Lalith Mahal, Chamundeshwari Hills, Brindavan Garden, GRS Fantasy Park, KRS. <br>
                        - Chamarajanagar: Male Mahadeshwara Hills, Gopalswami Hills, Biligiri Ranganatha Swamy Hills. <br>
                        - Followed by Himavad Gopalswamy Temple, Kanteshwara Temple.<br>
                        - Food: Mysore Masala Dosa for breakfast, Pandi Curry with rice for lunch,<br>
                        - Mysore Banana Chips and juice for snacks and Full Meala for Night.<br>
                        - Stay: Chamarajanagar offers peaceful stays close to nature.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                <hr>
                <section id="day3">
                    <div class="day-header">Day 3    <i class="fa-duotone fa-solid fa-location-dot"></i> Kodagu <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Hassan <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Attractions: Raja Seat Garden, Iruppu Waterfalls, Mandalapatti Peak.<br>
                        - Followed by Talakaveri Temple, Omkareshwara Temple, Madikeri Fort.<br>
                        - Hassan: Maharaja Park, Hasanamba Temple, Sri Kedareshwara Temple, Shravanabelagola (Bahubali statue).<br>
                        - Food: Rava Upma for breakfast, Akki Rotti for lunch,<br>
                        - Chakli with tea for snacks and Full Meals for Night.<br>
                        - Stay: Stay at a heritage property or homestay in Hassan for a serene experience.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                <hr>
                <section id="day4">
                    <div class="day-header">Day 4    <i class="fa-duotone fa-solid fa-location-dot"></i> Hassan <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Tumkuru <i class="fa-duotone fa-solid fa-location-dot"></i> <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Kolar <i class="fa-duotone fa-solid fa-location-dot"></i> </div>
                    <div class="day-details">
                        - Attractions: Sri Siddaganga Matt, Markonahalli Dam, Devarayana Durga.<br>
                        - Sri Chennakeshava Swamy Temple, Pavagada Fort, Madhugiri.<br>
                        - Kolar: Kotilingeshwara Temple, Someshwara Temple, Antara Gange, Tipu’s Drop, Kolar Gold Fields.<br>
                        - Food: Idli-Vada for breakfast, Jolada Rotti with curry for lunch,<br>
                        - Samosas and coffee for snacks and Full Meals for Night.<br>
                        - Stay: A budget guesthouse or a temple-style stay in Kolar.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                <hr>
                <section id="day5">
                    <div class="day-header">Day 5    <i class="fa-duotone fa-solid fa-location-dot"></i> Kolar <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Chitradurga <i class="fa-duotone fa-solid fa-location-dot"></i> </div>
                    <div class="day-details">
                        - Mode of Travel: Car or Bus (based on the size of the people).<br>
                        - Attractions: Chitradurga Fort, Chandravali Site, Hidambeshwara Gudi, Ankali Mutt.<br>
                        - Followed by Vani Vilasapura Dam, Kogo Bande & Shouting Rock, Vijaya Vittala Temple.<br>
                        - Food: Akki Rotti for breakfast, Jolada Rotti with vegetable curry for lunch,<br>
                        - Roasted Corn for snacks and Full Meals for Night.<br>
                        - Stay: Stay near the Chitradurga Fort for a historic experience.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                <hr>
                <section id="day6">
                    <div class="day-header">Day 6    <i class="fa-duotone fa-solid fa-location-dot"></i> Chitradurga <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Davangere <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Mode of Travel: Car or Bus (based on the size of the people).<br>
                        - Attractions: Sri Harihareshwara Temple, Bathi Hill, Sri Kalleshwara Temple.<br>
                        - Followed by Karanji Honda, Shanti Sagara, Anekonda.<br>
                        - Food: Rava Dosa for breakfast, Bisi Bele Bath for lunch,
                        - Chakli with juice for snacks and Full Meals for Night.<br>
                        - Stay: Stay at a local hotel for a relaxed overnight stay.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                <hr>
                <section id="day7">
                    <div class="day-header">Day 7    <i class="fa-duotone fa-solid fa-location-dot"></i> Davangere <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Shimogga <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Mode of Travel: Car or Bus (based on the size of the people).<br>
                        - Attractions: Jog Falls, Kodachadri, Siganduru, Agumbe, Sharavathi.<br>
                        - Followed by Gajanur Dam, Keladi, Linganamakki Dam, Dabbe Falls.<br>
                        - Food: Poha with chutney for breakfast, Neer Dosa with fish curry for lunch,<br>
                        - Vada with coffee for snacks and Full Meals for Night.<br>
                        - Stay: Stay in a nature resort near the falls.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                <hr>
                <section id="day8">
                    <div class="day-header">Day 8    <i class="fa-duotone fa-solid fa-location-dot"></i> Shimogga <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Udupi <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Mode of Travel: Car or Bus (based on the size of the people).<br>
                        - Attractions: Udupi Sri Krishna Temple, Malpe Beach, Kolluru, Karkala, St. Mary's Islands. <br>
                        - Followed by Maravanthe Beach, Anegudde Temple, Padubidri Beach.<br>
                        - Food: Neer Dosa with Sambar for breakfast, Fish Curry Rice for lunch,<br>
                        - Banana Fritters for snacks and Full Meals for Night.<br>
                        - Stay: Opt for a stay near the beach for a relaxing time.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                <hr>
                <section id="day9">
                    <div class="day-header">Day 9    <i class="fa-duotone fa-solid fa-location-dot"></i> Udupi <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Chikkaballapur <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Mode of Travel: Car or Bus (based on the size of the people).<br>
                        - Attractions: Nandi Hills, Adiyogi, Lepakshi Temple, Gudibanda, Manchenahalli Lake.<br>
                        - Food: Rava Idli with chutney for breakfast,  rice with sambar for lunch,<br>
                        - Sundal as a snack and Full Meals for Night.<br>
                        - Stay: Book a cozy homestay or a resort near Nandi Hills for a peaceful night.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                    </div>
                </section>
                <hr>
                <section id="day10">
                    <div class="day-header">Day 10    <i class="fa-sharp-duotone fa-solid fa-plane"></i> Chikkaballapur <i class="fa-sharp-duotone fa-solid fa-arrow-right"></i> Bengaluru <i class="fa-duotone fa-solid fa-location-dot"></i></div>
                    <div class="day-details">
                        - Mode of Travel: Car or Bus (based on the size of the people).<br>
                        - Attractions: Relax and enjoy a few spots in Bangalore like Vidhana Soudha or UB City before heading home.<br>
                        - Food: Idli Vada for breakfast, Roti with vegetable curry for lunch, and Sweet Pongal for a snacks.<br>
                        - Traveling charges along with special entry is taken care by us Travel-Tales.<br>
                        - End of the Trip: Arrive back in Bangalore and reflect on your enriching journey through Karnataka.<br>
                    </div>
                </section>
                
            </main>
        </div>
    </div>
    <%@include file="footer.jsp" %>

  
</body>
</html>