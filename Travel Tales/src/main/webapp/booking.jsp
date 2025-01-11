<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Booking Form</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <style>
    body {
      background-color: #f8f9fa;
    }
    .form-container {
      max-width: 400px;
      max-height: 800px;
      margin: 50px auto;
      padding: 30px;
      background:white;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);

    }
  </style>
</head>
<body class="body" style="background:url('/booking.jpeg') no-repeat center center fixed;background-size: cover; color: rgb(12, 2, 2);">

<div class="form-container">
  <h3 class="text-center mb-4">Booking Form</h3>
  <form id="travelForm">
    <div class="mb-3">
      <label for="name" class="form-label"><strong>Name</strong></label>
      <input type="text" class="form-control" id="name" placeholder="Enter your name" required>
    </div>
    <div class="mb-3">
      <label for="phone" class="form-label"><strong>Phobe Number</strong></label>
      <input type="tel" class="form-control" id="phone" placeholder="Enter your phone number" required>
    </div>
    <div class="mb-3">
      <label for="numPeople" class="form-label"><strong>Number of People</strong></label>
      <input type="number" class="form-control" id="numPeople" placeholder="Enter number of people" required>
    </div>
    <div class="mb-3">
      <label for="travelDate" class="form-label"><strong>Date</strong> </label>
      <input type="date" class="form-control" id="travelDate" required>
    </div>
    <div class="mb-3">
      <label for="cost" class="form-label"><strong>Cost</strong></label>
      <input type="number" class="form-control" id="cost" placeholder="Enter the cost" required>
    </div>
    <div class="mb-3">
      <label for="discount" class="form-label"><strong>Discount</strong></label>
      <input type="number" class="form-control" id="discount" placeholder="Enter discount amount" required>
    </div>
    <div class="mb-3">
      <label for="description" class="form-label"><strong>Description</strong></label>
      <textarea class="form-control" id="description" rows="3" placeholder="Enter additional details"></textarea>
    </div>
    <button type="button" class="btn btn-primary w-100" id="submitButton">Submit</button>
  </form>
</div>

<!-- <script>
  $(document).ready(function () {
    $('#submitButton').on('click', function () {
      const name = $('#name').val();
      const phone = $('#phone').val();
      const numPeople = $('#numPeople').val();
      const travelDate = $('#travelDate').val();
      const cost = $('#cost').val();
      const discount = $('#discount').val();
      const description = $('#description').val();

      if (name && phone && numPeople && travelDate && cost && discount) {
        alert(Form Submitted Successfully!\nName: ${name}\nPhone: ${phone}\nNumber of People: ${numPeople}\nTravel Date: ${travelDate}\nCost: ${cost}\nDiscount: ${discount}\nDescription: ${description});
      } else {
        alert('Please fill in all the required fields.');
      }
    });
  });
</script> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>