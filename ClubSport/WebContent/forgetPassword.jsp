<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
 <script src="https://kit.fontawesome.com/209a6e480f.js" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<title>Récupérer mot de passe</title>
</head>
<style>
p#tit{
	font-size: x-large;
	font-weight: bold;
}
div.cont {
  height:50%;
  width:28%;
  padding:5px;
  margin-left:14%;
  margin-top:6%;
  background-color: rgba(255,255,255,0.3);
  z-index: 3;
}
label.fo{
	font-weight: bold;	
	margin-left:2%;
	margin-top:2%;
}
button.btn{
	margin-left:32%;
	background-color: #A52A2A;	
}
form{
	margin:2%;	
}
div.form-group{
	margin-top:-2%;
}
#contact{
       background-color: rgba(255,255,255,0.6);
  opacity:0.9;
     
       box-sizing: border-box;
   width: 1000px;
   height: 550px;
   margin-top: 40px;
  margin-bottom: 100px;
  margin-right: 150px;
  margin-left: 150px;
 
}
</style>
<body>
<jsp:include page="Header2.jsp"></jsp:include>
<a href="login.jsp"class="btn btn-outline-danger btn-lg float-right" role="button" id="connect">Se connecter</a>


<div class="cont">
<form action="mail" method="post" class="needs-validation"  novalidate>
<p id="tit">Récupérer votre mot de passe : </p>
<div class="form-group">
    <label for="nom" class="fo">Nom:</label>
    <input type="text" class="form-control" placeholder="Enter votre nom" value="" id="nom" name="nom" required>
     <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>
  <div class="form-group">
    <label for="prenom" class="fo">Prenom:</label>
    <input type="text" class="form-control" placeholder="Enter votre prénom" value="" id="prenom" name="prenom" required>
     <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>
   <div class="form-group">
    <label for="gsm" class="fo">GSM: </label>
    <input type="text" class="form-control" placeholder="" id="gsm" value=""  placeholder="06 ** ** ** **"  name="gsm" required>
     <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
    <p style="color: red ;"><c:out value="${ confirm2 }"></c:out></p>
  </div> 
  <div class="form-group">
    <label class="fo" for="exampleInputEmail1" >Adresse email</label>
    <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="name@example.com" required >
    <div class="invalid-feedback">Remplire ce champs !! .</div>
    <small id="emailHelp" class="form-text text-muted">l'adresse email où vous voulez récupérer votre noueau mot passe.</small>
  </div>

  <button type="submit" class="btn btn-primary 1b">Envoyer </button>           
</form>
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
</body>
</html>