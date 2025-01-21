<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
   <style>
     footer {
        background-color: #343a40;
        color: #fff;
     }
     .social-media a i {
        transition: color 0.3s ease;
    }

    .social-media a[href*="facebook"] i {
        color: #3b5998; 
    }

    .social-media a[href*="instagram"] i {
        color: #E4405F;
    }

    .social-media a[href*="whatsapp"] i {
        color: #25D366;
    }

    .social-media a[href*="twitter"] i {
        color: #1DA1F2;
    }

    footer hr {
        border-color: rgba(255, 255, 255, 0.2);
    }
   </style>
</head>
<body>
    <footer class="bg-dark text-light pt-3">
        <div class="container">
            <div class="row">
                <!-- Tour & Travel Section -->
                <div class="col-lg-3 col-md-6 col-sm-12 mb-2">
                    <h3 class="fw-bold">Tour & Travel</h3>
                    <p class="pt-2">321, Travel Tales Bangalore.</p>
                    <p class="mb-2">Tel no: <a href="tel:8896744451" class="text-decoration-none text-white">8896744451</a></p>
                    <p>Tel no: <a href="tel:8896744452" class="text-decoration-none text-white">8896744452</a></p>
                    <p><b>Email:</b><a href="mailto:support@traveltaleswebsite.com" class="text-decoration-none text-white"> support@traveltaleswebsite.com</a></p>
                </div>
    
                <!-- Terms & Setting Section -->
                <div class="col-lg-3 col-md-6 col-sm-12 mb-2">
                    <h3 class="fw-bold">Terms & Setting</h3>
                    <p><a href="#" class="text-light">Terms & Policies</a></p>
                    <p><a href="#" class="text-light">Privacy & Cookies</a></p>
                </div>

                <!-- Support & Help Section -->
                <div class="col-lg-3 col-md-4 col-sm-10 mb-2">
                    <h3 class="fw-bold">Support & Help</h3>
                    <p><a href="aboutus.jsp" class="text-light ms-5">About Us</a></p>
                    <p><a href="contactUs.jsp" class="text-light ms-5">Contact Us</a></p>
                </div>
    
                <!-- Social Media Links Section -->
                <div class="col-lg-3 col-md-6 col-sm-12 text-lg-end">
                    <h4 class="h44">Social Media Links</h4>
                    <div class="social-media pt-2">
                        <a href="https://www.facebook.com" target="_blank" title="facebook" class="text-light fs-2 me-3"><i class="fa-brands fa-facebook"></i></a>
                        <a href="https://www.instagram.com" target="_blank" title="Instagram" class="text-light fs-2 me-3"><i class="fa-brands fa-instagram"></i></a>
                        <a href="https://www.whatsapp.com" target="_blank" title="Whatsapp" class="text-light fs-2 me-3"><i class="fa-brands fa-whatsapp"></i></a>
                        <a href="https://www.twitter.com" target="_blank" title="Twitter" class="text-light fs-2"><i class="fa-brands fa-twitter"></i></a>
                    </div>
                </div>
            </div>
    
            <!-- Divider -->
            <hr>
    
            <!-- Footer Bottom Section -->
            <div class=" py-2">
                <center><p class="mb-0">2025 &copy; Tour & Travel. All Rights Reserved.</p></center>
            </div>
        </div>
    </footer>
</body>
</html>
