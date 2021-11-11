<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
  <link type="text/css" rel="stylesheet" href="inc/style.css" /> 
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
 crossorigin="anonymous">
<title>S'inscrire</title>
</head>
<body>
<style>
#message {
  display:none;
  background: none;
  color: #000;
  position: relative;
  padding: 2px;;
  opacity: 0,6;
  font-weight: bold;
  margin-top:-2%;
}
#message p {
 margin-top:-1%;
 margin-left:-3%;
  font-size: 14px;
}
.valid {
  color: green;
}
.valid:before {
  position: relative;
 
  content: "✔";
   margin-left: 10%;
}
.invalid {
  color: red;
  margin-left: 6%;
}
.invalid:before {
  position: relative;
  left: -35px;
   content: "✖";
    margin-left: 10%;
}
fa{
font-size: 20px;
cursor: pointer;
}  
#reserveP{
 background-color: rgba(255,255,255,0.3);
 box-sizing: border-box;
   width: 70%;
   height: 60%;
   margin-top: 2%;
  margin-bottom:2%;
  margin-left: 14%;
}
label {
font-size:small;
font-style: oblique;
font-weight: bold;
}
input.form-control{
	height: 30px;
}
.card-header{
font-style: normal;
font-weight: bold;
font-size: 20px;
}
.invalid-feedback{
color: black;
}
.invalid-feedback{
font-color: red;
font-size: 12px;
font-style: normal;
}
form{
	margin-top:-1%;
}
#myBtn{
	background-color: #A52A2A;
	margin-left:40%;
}
.input-icons i { 
    position: absolute; 
}          
.input-icons { 
    width: 100%; 
    margin-bottom: 10px; 
}          
.icon { 
    padding: 10px; 
    min-width: 40px; 
    margin-left:35%;
}          
.input-field { 
    width: 100%; 
    padding: 10px; 
    text-align: center; 
}
div.form-group{
	margin-top:-1%;;
}
h6{
	font-weight: bold;
	font-size: medium;
}
#me{
	width: 40%;
	margin-left:55%;
	margin-top:-7.5%;
	position:absolute;
}
#me1{
	width: 40%;
}
#sexe{
	margin-top:-2%;
}
p#err{
	font-size: x-small;
}
</style>

<jsp:include page="Header2.jsp"></jsp:include>

<div class="card" id="reserveP">
  <h6 class="card-header">REJOIGNEZ-NOUS</h6>
  <div class="card-body">
   
<form action="reserverPlace.do" class="needs-validation" method="get"   novalidate>
<div class="form-group">
    <label for="nom">Nom:</label>
    <input type="text" class="form-control" placeholder="Enter votre nom" value="${ in.nomA }" id="nom" name="nom" required>
     <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>
  <div class="form-group">
    <label for="prenom">Prenom:</label>
    <input type="text" class="form-control" placeholder="Enter votre prénom" value="${ in.prenomA }" id="prenom" name="prenom" required>
     <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>
  
 
    <div class="custom-control custom-radio">
    <input type="radio" class="custom-control-input" id="femme" name="radio" value="femme" required>
    <label class="custom-control-label" for="femme">Femme</label>
  </div>
  <div class="custom-control custom-radio mb-3">
    <input type="radio" class="custom-control-input" id="homme" name="radio"  value="homme" required>
    <label class="custom-control-label" for="homme">Homme</label>
    <div class="invalid-feedback">Veuillez cocher un choix</div>
  </div>
 
  <div class="form-group">
    <label for="gsm">GSM: </label>
    <input type="text" class="form-control" placeholder="" id="gsm" value="${ in.gsm }"  placeholder="06 ** ** ** **"  name="gsm" size="10" maxlength="10" required>
     <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
    <p style="color: red ;" id="err"><c:out value="${ confirm2 }"></c:out></p>
  </div>    
  <div class="form-group">
    <label for="email">Email:</label>
    <input type="email" class="form-control" placeholder="Enter email" id="email" value="${ in.emailA }" name="email" required>
     <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>   
    <div class="form-group" id="me1">
    <label for="password1">Mot de passe:</label>
    
    <div class="input-icons">
    <i class="fas fa-eye icon" id="aye" onclick="toggle()"></i>
    <input type="password" class="form-control input-field" placeholder="" name="password1" id="password1" value="${ t }" required>   
	</div>
    
     <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
      <p style="color: red ;" id="err"><c:out value="${ confirm }"></c:out></p>
    
    <div class="form-group" id="me">
    <label for="password2" >Confirmer Mot de Passe:</label>
    <input type="password" class="form-control" placeholder="confirmer votre mot de passe" name="password2" id="password2"  size="8" maxlength="8"  >

     <p style="color: red ;" id="err"><c:out value="${ confirm }"></c:out></p>
  </div> 
    
    <div id="message">
  <small style="font-family: Bradley Hand, cursive; margin-top: 2px;">Le Mot de passe doit contenir les éléments suivants</small>
  <p id="capital" class="invalid">Une  lettre <b>Majuscule</b></p>
  <p id="number" class="invalid">des <b>Nombres</b></p>
  <p id="length" class="invalid">au moin <b>8 charactéres</b></p>
</div> 
  </div>     
 <button type="submit" class="btn btn-light btn-lg"  id="myBtn">Envoyer</button> 
</form>
</div>
</div>

<script >
var state= false;
function toggle(){
	if(state)
	{document.getElementById("password1").setAttribute("type", "password1");
	document.getElementById("aye").style.color='#7a797e';
	state= false;
	}
	else {		
		document.getElementById("password1").setAttribute("type", "text");
		document.getElementById("aye").style.color='#5887ef';
		state= true;
	}	
}
</script>
 <script>
function myFunction() {
  var txt;
  if (confirm("Voulez-vous vraiment envoyer?")) {
    txt = "You pressed OK!";
  } else {
    txt = "You pressed Cancel!";
  }
  document.getElementById("demo").innerHTML = txt;
}
</script> 

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

<script type="text/javascript">
var myInput = document.getElementById("password1");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");
var pass2 = document.getElementById("password2");

// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
  document.getElementById("message").style.display = "block";
}

// When the user clicks outside of the password field, hide the message box
myInput.onblur = function() {
  document.getElementById("message").style.display = "none";
}

// When the user starts to type something inside the password field
myInput.onkeyup = function() {
	
  // Validate capital letters
  var upperCaseLetters = /[A-Z]/g;
  if(myInput.value.match(upperCaseLetters)) {
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }
  // Validate numbers
  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }
  // Validate length
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}
</script>
<script type="text/javascript">
</script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</body>
</html>