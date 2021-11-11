<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajouter un équipement</title>
</head>
<body>
<hearder>
<style>
div.conte{
	margin-left:32%;
	margin-top:6%;
	width: 35%;
}
p.titre{
	font-size: large;
	text-transform: uppercase;
	font-weight: bolder;
	margin-left:22%;
	text-decoration: underline;
}
button.btn{
	background-color:#A52A2A;
	margin-left:37%;
}
label.form1{
	font-weight: bold;
	font-size: medium;
}
#ann{
	margin-left:2%;
}
div.card{
	padding:2%;
	
}
div.alert{
	margin-top:-60%;
}
</style>
</hearder>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="menuAdmin.jsp"></jsp:include>

<c:choose>
<c:when test="${etat==true}">
<div class="alert alert-success alert-dismissible fade show" role="alert" id="confirm" style='margin-top:4%;width: 50%;margin-left:20%'>
  <strong style='text-aligh:center'> <c:out value="${alerte}"></c:out></strong> 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</c:when>
<c:when test="${etat== false}">
</c:when>
</c:choose>
 
 <div class="conte card">
<form action="addEquipement.da" class="needs-validation" method="get"   novalidate>
<p class="titre"> Ajouter une Machine</p><br>
  <div class="form-group">
    <label for="" class="form1" >Nom de la machine :</label>
    <input type="text" class="form-control" placeholder="" name="nomma" required autofocus>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>
  <div class="form-group">
    <label for="" class="form1" >La marque :</label>
    <input type="text" class="form-control" placeholder="" name="marque" required >
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>
  <div class="form-group">
    <label for="installe" class="form1" >La date d'installation :</label>
    <input type="date" class="form-control" placeholder="" name="installe" required>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>  
  <br><button type="submit" class="btn btn-primary btn-lg">Ajouter</button>
  <button type="reset" class="btn btn-primary btn-lg" id="ann">Annuler</button>
</form>
</div>
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
</body>
</html>