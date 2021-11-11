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
	margin-left:30%;
	margin-top:6%;
	width: 35%;
	padding:2%;
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
	margin-left: 5%;
	
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
<form action="addSeance.da" class="needs-validation" method="get"   novalidate>
<p class="titre"> Ajouter une séance</p><br>

<div class="form-group">
  <label for="sel1" class="form1">Jour :</label>
  <select class="form-control" name="day" required>
  <div class="invalid-feedback">Remplire ce champs !! .</div>
  <div class="valid-feedback">Valid.</div>
  <option selected   value="">Choisir...</option>
    <option id="">Lundi</option>
    <option id="">Mardi</option>
    <option id="">Mercredi</option>
    <option id="">Jeudi</option>
    <option id="">Samedi</option>
    <option id="">Dimanche</option>
  </select>
</div>

  <div class="form-group">
    <label for="" class="form1" >Horaire :</label>
    <input type="time" class="form-control" placeholder="" name="time" required>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>
  
  <div class="form-group">
  <label for="sel1" class="form1">Sport :</label>
  <select class="form-control" name="sel" required>
  <div class="valid-feedback">Valid.</div>
  <div class="invalid-feedback">Remplire ce champs !! .</div>
  <option selected   value="">Choisir...</option>
	<c:forEach items="${modele.activs}" var="p">
		<option value="${p.nom_activite}">${p.nom_activite}</option>	
	</c:forEach>    
  </select>
</div>
  
  <br><button type="submit" class="btn btn-primary btn-lg">Ajouter</button>
  <button type="reset" class="btn btn-primary btn-lg"  id="ann">Annuler</button>
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