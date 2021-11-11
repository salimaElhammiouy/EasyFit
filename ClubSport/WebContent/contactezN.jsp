<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
  <link type="text/css" rel="stylesheet" href="inc/style.css" /> 
<title>Insert title here</title>

</head>
<body >
<jsp:include page="Header1.jsp"></jsp:include>





<div class="col-sm-3 col-md-6 col-lg-4 col-xl-2">





<div class="card" id="contact">
  <h5 class="card-header">CONTACTEZ-NOUS</h5>
  <div class="card-body">
  
<form action="contactezN.do" class="needs-validation" method="get"   novalidate>
  <div class="form-group">
    <label for="name">NOM et PRENOM:</label>
    <input type="text" class="form-control" id="name" placeholder="Enter votre nom" name="name" required>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>
  <div class="form-group">
    <label for="email">E-MAIL:</label>
    <input type="email" class="form-control" id="email" placeholder="Enter votre E-mail" name="email" required>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! </div>
  </div>
  <div class="form-group">
    <label for="subject">SUJET:</label>
    
     <textarea id="subject" class="form-control" name="subject" placeholder="Write something.." style="height:200px" required></textarea>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! </div>
  </div>

  <button type="submit" class="btn btn-light btn-lg">Envoyer</button>
</form>
   
  </div>
</div>
</div>
<script>
// Disable form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Get the forms we want to add validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>

















































<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>