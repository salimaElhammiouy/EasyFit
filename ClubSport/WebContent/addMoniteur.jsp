<%@ page language="java" contentType="text/html; charset=windows-1256"
pageEncoding="windows-1256"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
 <script src="https://kit.fontawesome.com/209a6e480f.js" crossorigin="anonymous"></script>
<title>Ajouter un Moniteur</title>

</head>
<body>
<hearder>
<style>
div.conte{
	margin-left:30%;
	margin-top:6%;
	width: 40%;
	padding:2%;
	height: 60%;
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
	font-size: medium
}
#ann{
	margin-left: 5%;	
}
</style>
</hearder>

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
<form action="addMoniteur.da" class="needs-validation" method="get"   novalidate>
<p class="titre"> Ajouter un moniteur</p><br>
  <div class="form-group">
    <label for="" class="form1" >Nom </label>
    <input type="text" class="form-control" placeholder=""  name="nom"  required>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>
  <div class="form-group">
    <label for="" class="form1" >Prénom</label>
    <input type="text" class="form-control" placeholder="" name="prenom" required>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>
  
  <div class="form-group">
  <label for="sel1" class="form1">Sport :</label>
  <select class="form-control" name="sel" required>
 
  <option selected   value="">Choisir...</option>
	<c:forEach items="${modele.activs}" var="p">
		<option value="${p.nom_activite}">${p.nom_activite}</option>	
	</c:forEach>    
  </select>
   <div class="valid-feedback">Valid.</div>
  <div class="invalid-feedback">Remplire ce champs !! .</div>
</div>
  
  <div class="form-group">
    <label for="" class="form1" >Adresse email </label>
    <input type="email" class="form-control" placeholder="name@exemple.com" name="addresse" required>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>
  <br><button type="submit" class="btn btn-primary btn-lg">Ajouter</button>
  <button type="reset" class="btn btn-primary btn-lg"  id="ann">Annuler</button><br><br>
</form>
</div> <br><br>
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
<script>
function myFunction2() {
  var x = document.getElementById("exampleModal");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
$('[data-toggle="tooltip"]').tooltip();
</script>
</body>
</html>