<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guide Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            /* background-color: #c3eaf4; */
            background-color: rgb(233, 240, 244);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            border: 3px dashed #aefab0; /* Unique border style */
            border-radius: 10px;
            padding: 20px;
            /* background-color: #ffffff; */
            background-color:  rgb(253, 218, 158);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 400px;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .form-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-container input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container button {
            width: 48%;
            padding: 10px;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-container .submit-btn {
            background-color: #4CAF50;
            color: white;
        }
        .form-container .back-btn {
            background-color: #f44336;
            color: white;
        }
        .form-container button:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Guide Form</h2>
        <form action="guide" method="post" >
            <!-- <label for="guide-id">Guide ID:</label>
            <input type="text" id="guide-id" name="guide-id" required> -->

            <label for="guide-name">Guide Name:</label>
            <input type="text" id="guide-name" name="guide-name" required>

            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="age">Age:</label>
            <input type="number" id="age" name="age" min="18" max="100" required>

            <div style="display: flex; justify-content: space-between;">
                <button type="submit" name="guide" class="submit-btn">Submit</button>
                <button type="button" class="back-btn" onclick="window.history.back();">Back</button>
            </div>
        </form>
    </div>
    <script type="text/javascript">
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
