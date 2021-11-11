<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajouter une news </title>
</head>
<body>
<hearder>
<style>
div.conte{
	margin-left:23%;
	width: 55%;
	padding:2%;
	margin-top:6%;
}
p.titre{
	font-size: large;
	text-transform: uppercase;
	font-weight: bolder;
	margin-left:28%;
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
.image-preview{
width: 300px;
height: 150px;
min-height: 100px;
 border-radius: 25px;
border: 2px solid black;
border-style: groove;
border-color: white;
background-color: #DCDCDC;
margin-top: 15px;
display: flex;
align-items: center;
justify-content: center;
font-weight: bold;
color: black;

margin-left:55%;
margin-top:-5%;
}
.image-preview__image{
display: none;
width: 100%;
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
<form action="ajouterArticle.da" class="needs-validation" method="get"   novalidate>
<p class="titre"> Ajouter news </p><br>
  <div hidden class="form-group">
    <label for="" class="form1" >ID </label>
    <input type="text" class="form-control" placeholder="" name="id" />
  </div>
  
   <label for="" class="form1" >Image  </label><br>
 <input type="file" id="inpFile" name="file" required autofocus>
 <div class="valid-feedback">Valid.</div>
 <div class="invalid-feedback">Remplire ce champs !! .</div>
 
  <div class="image-preview" id="imagePreview">
  <img alt="Image Preview" src=""  class="image-preview__image">
  <span class="image-preview__default-text"><i class="far fa-image fa-3x"></i></span>
</div>

  <div class="form-group">
    <label for="" class="form1" >Titre </label>
    <input type="text" class="form-control" placeholder="" name="titre" required autofocus/>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>
  <div class="form-group">
    <label for="" class="form1" >Texte </label>
    <textarea class="form-control" rows="5" name="contenu" required></textarea>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
    <small id="emailHelp" class="form-text text-muted">La date de l'ajout de la news est enregistrée.</small>
  </div>
  <br><button type="submit" class="btn btn-primary btn" >Enregistrer</button>
    <button type="reset" class="btn btn-primary btn"  id="ann">Annuler</button>
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
const inpFile= document.getElementById("inpFile");
const previewContainer = document.getElementById("imagePreview");
const previewImage = previewContainer.querySelector(".image-preview__image");

const previewDefaultText = previewContainer.querySelector(".image-preview__default-text");

inpFile.addEventListener("change" , function(){
	const file = this.files[0];
	if(file){
		const reader = new FileReader();
		
		previewDefaultText.style.display = "none";
		previewImage.style.display = "block";
		reader.addEventListener("load" , function(){
			previewImage.setAttribute("src" , this.result);
			
		});
	reader.readAsDataURL(file);	
		
	}else{
		
		previewDefaultText.style.display = null;
		previewImage.style.display = null;
		previewImage.setAttribute("src" , "");
	}	
});
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