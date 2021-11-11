<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
 <script src="https://kit.fontawesome.com/209a6e480f.js" crossorigin="anonymous"></script>

<title>Ajouter activité</title>
<style>

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

margin-left:80%;
margin-top:-5%;
}
.image-preview__image{
display: none;
width: 100%;
}
div.conte{
	margin-left:25%;
	margin-top:6%;
	width: 45%;
}
p.titre{
	font-size: large;
	text-transform: uppercase;
	font-weight: bolder;
	margin-left:46%;
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
	margin-top:1px;
}
div.card{
	padding-left:2%;
	padding-top:2%;
	padding-bottom:2%;
	padding-right:18%;
	width: 60%;
	margin-left:20%;
}
div#nom{
	margin-top:-9%;
}
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color:black;
   height:5%;
   box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.25);
   color: white;
   text-align: center;
}
p#foot{
	font-size: medium;
	font-weight: bold;
	margin-top:3px;
}
</style>

</head>
<body>

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
  <form action="ajouterActivite.da" class="needs-validation" method="get"   novalidate>
  <p class="titre"> Ajouter une activité</p><br>
  <label for="" class="form1" >Image d'Activité </label><br>
 <input type="file" id="inpFile" name="file" required autofocus>
 <div class="valid-feedback">Valid.</div>
 <div class="invalid-feedback">Remplire ce champs !! .</div>
 
  <div class="image-preview" id="imagePreview">
  <img alt="Image Preview" src=""  class="image-preview__image">
  <span class="image-preview__default-text"><i class="far fa-image fa-3x"></i></span>
</div>

<br><br>
<div class="form-group" id="nom">
    <label class="form1" for="nom">Nom d'activité :</label>
    <input type="text" class="form-control" placeholder="" name="nom" required>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>
  
  <div class="form-group">
    <label class="form1" for="niveau">Catégorie :</label>
  <select class="form-control" id="categorie" name="categorie" required>
  <div class="valid-feedback">Valid.</div>
  <div class="invalid-feedback">Remplire ce champs !! .</div>
  <option selected  value="">Choisir ..</option>
    <option value="Aquagym">Aquagym</option>
    <option value="">Arts martiaux</option>
    <option value="Arts martiaux">Zenfit</option>
    <option value="Cardio">Cardio</option>
    <option value="Boxemma">Boxemma</option>
    <option value="Musculation">Musculation</option>
  </select>
  </div>
    
  <div class="form-group">
    <label class="form1" for="description">Description :</label>
    <textarea  class="form-control" placeholder="" name="description" required></textarea>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>
  <div class="form-group">
    <label class="form1" for="duree">Durée :</label>
    <input type="text" class="form-control" placeholder="00 min" name="duree" required >
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>
  <div class="form-group">
    <label class="form1" for="niveau">Niveau :</label>
  <select class="form-control" id="niveau" name="niveau" required>
  
  <option selected   value="">Choisir...</option>
    <option value="Hard">HARD</option>
    <option value="Meduim">Medium</option>
    <option value="Easy">Easy</option>
  </select>
  <div class="valid-feedback">Valid.</div>
  <div class="invalid-feedback">Remplire ce champs !! .</div>
</div>
 
  <div class="form-group">
    <label class="form1" for="calori">Calories:</label>
    <input type="text" class="form-control" placeholder="300 kcal" name="calori" required >
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>
  <div class="form-group">
    <label class="form1" for="prix">Prix:</label>
    <input type="text" class="form-control" placeholder="000.00" name="prix"  required >
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
    <small id="emailHelp" class="form-text text-muted">Par séance</small> <br>
  </div>
  <button type="submit" class="btn btn-primary btn-lg">Enregister</button>
  <button type="reset" class="btn btn-primary btn-lg"  id="ann">Annuler</button>
</form>
</div><br>
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