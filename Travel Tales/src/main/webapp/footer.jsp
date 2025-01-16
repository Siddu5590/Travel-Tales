<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Footer</title>
     <link rel="icon" href='assets/logo.jpg'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        footer {
            background-color: #343a40;
            color: white;
        }

        footer h3, footer h4 {
            font-weight: bold;
        }

        footer a {
            text-decoration: none;
            color: white;
        }

        footer a:hover {
            text-decoration: underline;
        }

        .social-media a {
            display: inline-block;
            margin-right: 15px;
            transition: color 0.3s ease-in-out;
        }
  
        /* Responsive Design */
        @media (max-width: 768px) {
            footer .row {
                text-align: center;
            }

            footer .social-media {
                justify-content: center;
                margin-top: 10px;
            }

            footer .social-media a {
                margin-right: 10px;
            }

            footer .p {
                text-align: center;
                margin-top: 15px;
            }
        }
    </style>
</head>
<body>
    <footer class="bg-dark text-light pt-5">
        <div class="container px-5">
            <div class="row">
                <!-- Tour & Travel Section -->
                <div class="col-lg-4 col-md-6 mb-4">
                    <h3>Tour & Travel</h3>
                    <p class="pt-2">321, Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <p class="mb-2">0987654321</p>
                    <p>1234567890</p>
                </div>

                <!-- Terms & Setting Section -->
                <div class="col-lg-4 col-md-6 mb-4">
                    <h3>Terms & Setting</h3>
                    <p class="pt-2"><a href="#">Terms & Policies</a></p>
                    <p><a href="#">Privacy & Cookies</a></p>
                </div>

                <!-- Social Media Links Section -->
                <div class="col-lg-4 text-lg-end text-center">
                    <h4>Social Media Links</h4>
                    <div class="social-media pt-2">
                        <a href="#" class="text-light fs-2"><i class="fa-brands fa-facebook"></i></a>
                        <a href="#" class="text-light fs-2"><i class="fa-brands fa-instagram"></i></a>
                        <a href="#" class="text-light fs-2"><i class="fa-brands fa-whatsapp"></i></a>
                        <a href="#" class="text-light fs-2"><i class="fa-brands fa-twitter"></i></a>
                    </div>
                </div>
            </div>

            <!-- Divider -->
            <hr>

            <!-- Footer Bottom Section -->
            <div class="d-sm-flex justify-content-center py-1">
                <p class="p mb-0">2025 © Tour & Travel. All Rights Reserved.</p>
            </div>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
