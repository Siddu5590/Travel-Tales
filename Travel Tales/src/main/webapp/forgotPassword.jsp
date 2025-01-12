<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
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
    <div class="reset-password-container">
        <h3 class="text-center">Reset Password</h3>
        <form id="resetPasswordForm">
            <div class="mb-3">
                <label for="email" class="form-label"><strong>Email ID</strong></label>
                <input type="email" id="email" class="form-control" placeholder="Enter your email" required>
            </div>
            <div class="mb-3">
                <label for="newPassword" class="form-label"><strong>New Password</strong></label>
                <input type="text" id="newPassword" class="form-control" placeholder="Enter new password" required>
                <p>Password instructions:</p>
                <ul class="validation-list">
                    <li id="length" class="invalid">At least 8 characters <span>&#10060;</span></li>
                    <li id="uppercase" class="invalid">At least 1 uppercase letter <span>&#10060;</span></li>
                    <li id="lowercase" class="invalid">At least 1 lowercase letter <span>&#10060;</span></li>
                    <li id="special" class="invalid">At least 1 special character <span>&#10060;</span></li>
                </ul>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label"><strong>Confirm Password</strong></label>
                <input type="text" id="confirmPassword" class="form-control" placeholder="Confirm your password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Reset Password</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        const passwordRegex = {
            length: /.{8,}/,
            uppercase: /[A-Z]/,
            lowercase: /[a-z]/,
            special: /[^a-zA-Z0-9]/
        };

        $(document).ready(function () {
            $('#newPassword').on('input', function () {
                const password = $(this).val();
                validateCriterion(passwordRegex.length, password, '#length');
                validateCriterion(passwordRegex.uppercase, password, '#uppercase');
                validateCriterion(passwordRegex.lowercase, password, '#lowercase');
                validateCriterion(passwordRegex.special, password, '#special');
            });

            $('#resetPasswordForm').on('submit', function (e) {
                e.preventDefault();
                const newPassword = $('#newPassword').val();
                const confirmPassword = $('#confirmPassword').val();

                if (newPassword !== confirmPassword) {
                    alert('Passwords do not match.');
                } else if ($('.invalid').length > 0) {
                    alert('Please meet all password criteria.');
                } else {
                    alert('Password reset successfully!');
                }
            });

            function validateCriterion(regex, value, elementId) {
                if (regex.test(value)) {
                    $(elementId).removeClass('invalid').addClass('valid');
                    $(`${elementId} span`).html('&#10003;');
                } else {
                    $(elementId).removeClass('valid').addClass('invalid');
                    $(`${elementId} span`).html('&#10060;');
                }
            }
        });
    </script>
</body>
</html>
    