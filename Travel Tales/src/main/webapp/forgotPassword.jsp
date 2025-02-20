<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
     <link rel="icon" href='assets/logo.jpg'>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://img.freepik.com/free-photo/flat-lay-hat-notebook-arrangement_23-2148786126.jpg?semt=ais_hybrid');
            background-repeat: no-repeat;
            background-size: cover;
        }
        .reset-password-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .validation-list {
            list-style: none;
            padding: 0;
        }
        .validation-list li {
            display: flex;
            align-items: center;
            margin-bottom: 5px;
        }
        .validation-list li span {
            margin-left: auto;
        }
        .valid {
            color: green;
        }
        .invalid {
            color: red;
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>
    <div class="reset-password-container">
        <h3 class="text-center">Reset Password</h3>
        <form id="resetPasswordForm" action="signup" method="post">
            <div class="mb-3">
                <label for="email" class="form-label"><strong>Email ID</strong></label>
                <input type="email" name="email" id="email" class="form-control" placeholder="Enter your email" required>
            </div>
            <div class="mb-3">
                <label for="newPassword" class="form-label"><strong>New Password</strong></label>
                <input type="password" name="newpassword" id="newPassword" class="form-control" placeholder="Enter new password" required>
                <ul class="validation-list mt-2">
                    <li id="length" class="invalid">At least 8 characters <span>&#10060;</span></li>
                    <li id="uppercase" class="invalid">At least 1 uppercase letter <span>&#10060;</span></li>
                    <li id="lowercase" class="invalid">At least 1 lowercase letter <span>&#10060;</span></li>
                    <li id="special" class="invalid">At least 1 special character <span>&#10060;</span></li>
                </ul>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label"><strong>Confirm Password</strong></label>
                <input type="password" name="confirmpassword" id="confirmPassword" class="form-control" placeholder="Confirm your password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100" name="forgot">Reset Password</button>
        </form>
    </div>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const newPassword = document.getElementById('newPassword');
        const confirmPassword = document.getElementById('confirmPassword');

        const lengthCriteria = document.getElementById('length');
        const uppercaseCriteria = document.getElementById('uppercase');
        const lowercaseCriteria = document.getElementById('lowercase');
        const specialCriteria = document.getElementById('special');

        const passwordRegex = {
            length: /.{8,}/,
            uppercase: /[A-Z]/,
            lowercase: /[a-z]/,
            special: /[^a-zA-Z0-9]/
        };

        newPassword.addEventListener('input', () => {
            validatePassword();
        });

        function validatePassword() {
            validateCriterion(passwordRegex.length, newPassword.value, lengthCriteria);
            validateCriterion(passwordRegex.uppercase, newPassword.value, uppercaseCriteria);
            validateCriterion(passwordRegex.lowercase, newPassword.value, lowercaseCriteria);
            validateCriterion(passwordRegex.special, newPassword.value, specialCriteria);
        }

        function validateCriterion(regex, value, element) {
            if (regex.test(value)) {
                element.classList.remove('invalid');
                element.classList.add('valid');
                element.querySelector('span').innerHTML = '&#10003;';
            } else {
                element.classList.remove('valid');
                element.classList.add('invalid');
                element.querySelector('span').innerHTML = '&#10060;';
            }
        }

        <% if (request.getAttribute("status") != null) { 
            String message = (String) request.getAttribute("status");
            request.removeAttribute("status");
        %>
        Swal.fire({
            icon:"success",
            title: 'Success...',
            text: "<%= message %>"
        });
        <% } %>

        <% if (request.getAttribute("failure") != null) { 
            String message = (String) request.getAttribute("failure");
            request.removeAttribute("failure");
        %>
        Swal.fire({
            icon:"error",
            title: 'Oooops..',
            text: "<%= message %>"
        });
        <% } %>
    </script>
</body>
</html>
