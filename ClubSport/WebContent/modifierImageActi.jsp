<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Image de l'activité </title>
<style>


.image-preview{
width: 300px;
min-height: 100px;
 border-radius: 25px;
border: 2px solid black;
border-style: groove;
border-color: white;

margin-top: 15px;
display: flex;

} 
.image-preview__image{
width: 100%;
}

div.conte{
	margin-left:25%;
	margin-top:6%;
	width: 45%;
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
	margin-top:1px;
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
  <form action="editImage2.da" method="get">
  <p class="titre"> Modifier l'image de l'activité</p><br><br>
  <label for="" class="form1" >Image d'Activité </label><br>
 <input type="file" id="inpFile" name="file" required >
 
  <div class="image-preview" id="imagePreview">
  <img alt="Image Preview" src="${image.src_image }"  class="image-preview__image">
  
 </div>
 
<input hidden type="text" class="form-control" placeholder="" name="idd" value="${image.id}">
<input hidden type="text" class="form-control" placeholder="" name="ida" value="${activite.id_a}"><br><br>


  <button type="submit" class="btn btn-primary btn-lg">Enregister</button>
  <a class="btn btn-info btn-lg " id="ann" href="adminlogged.jsp">Annuler</a>
</form>
</div>

<script>
const inpFile= document.getElementById("inpFile");
const previewContainer = document.getElementById("imagePreview");
const previewImage = previewContainer.querySelector(".image-preview__image");

const previewDefaultText = previewContainer.querySelector(".image-preview__default-text");

inpFile.addEventListener("change" , function(){


	previewImage.style.display = "block";
	previewImage.setAttribute("src" , "");
	
	const file = this.files[0];

	if(file){
		const reader = new FileReader();
		reader.addEventListener("load" , function(){
    
			previewImage.setAttribute("src" , this.result);
			
		});
	reader.readAsDataURL(file);	
		console.log(file);
	}
	
});
</script>


</body>
</html>