<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contacter-nous</title>
<link  href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<style>
#contact{
	background-color: rgba(255,255,255,0.3);    
       box-sizing: border-box;
   width: 1000px;
   height: 100%;
   margin-top: 50px;
  margin-bottom: 100px;
  margin-right: 150px;
  margin-left: 150px;
}
#problem {
  width: 100%;
  height: 150px;
  padding: 12px 20px;
  box-sizing: border-box;
  resize: none;
} 
label {
font-style: oblique;
font-weight: bold;
font-size:small;
}
.card-header{
font-style: normal;
font-weight: bold;
font-size: 20px;
}
.invalid-feedback{
color: black;
}
button.btn{
	background-color: #A52A2A;
	margin-left:40%;
}
</style>

<%@ include file="menu.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="card" id="contact">
  <h5 class="card-header">CONTACTEZ-NOUS</h5>
  <div class="card-body">
  
<form action="contacter1.da" class="needs-validation" method="get"   novalidate>
  <div class="form-group">
    <label for="name">NOM et PRENOM:</label>
    <input type="text" class="form-control" id="name" placeholder="Enter votre nom" name="name" required autofocus>
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
    
     <textarea id="subject" class="form-control" name="subject" placeholder="Ecrire ici .." style="height:200px" required></textarea>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! </div>
  </div>

  <button type="submit" class="btn btn-light btn-lg">Envoyer</button>
</form>
   
  </div>
</div>

<script>
// Disable form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    var forms = document.getElementsByClassName('needs-validation');
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
</body>
</html>