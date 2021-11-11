<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
 <script src="https://kit.fontawesome.com/209a6e480f.js" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<title>Preparer  Votre Compte</title>
<style>

  /* Make the image fully responsive */
.carousel-inner img {
    width: 60%;
    height: 50%;
  }
  
.jumbotron{
background-image: url(images/motivation.jpg);
 background-attachment:      fixed;
 background-repeat: no-repeat;
 background-size:      cover  ;
  width: 100%;
    height: 300px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.25);
 
}
.pro{
background-color :bleu;
  border: none;
color:white;
padding: 12px 16px;
font-size:16px;
cursor: pointer;
}
#choix{

background-color :#A52A2A;
font-color:white;
font-style: italic;
height:200px;

    border: 1px solid;
  padding: 10px;
  box-shadow: 5px 10px 8px 10px #888888;
border-radius: 15px 50px;
  transition: width 2s, height 2s, transform 2s;
    

}


#choix:hover {
  width: 300px;
  height: 300px;
 
}
h3{
font-color: #A52A2A;
font-size: 30px;
font-style: inherit;
position: centre;

}
.container{

height: 200px;

}
 .carousel-item img {
    width: 100%;
    height: 100%;
  }
  .card-title{
  font-color: #A52A2A;
font-size: 30px;
font-style: inherit;
position: centre;
  
  }
 #decouvrir {
background-color: #A52A2A;
margin-left: 30%;
}
#personaliser{
background-color: #A52A2A;
margin-left: 20%;

} 
.links{
font-color: white ;
font-weight: bold;
background-color: #A52A2A; 


}
.links , a{
color: white ;
font-weight: bold;

}

.image-preview{
width: 300px;
min-height: 100px;
border: 2px solid #dddddd;
margin-top: 15px;
display: flex;
align-items: center;
justify-content: center;
font-weight: bold;
color: #cccccc;
}
.image-preview__image{
display: none;
width: 100%;

}

</style>
</head>
<body>


<jsp:include page="menuVisiteur.jsp"></jsp:include>


 
<div class="links"><a href="preparerCompte.jsp" id="links">Préparer mon compte  <span><i class="fas fa-angle-right"></i></span></a></div>
<br>
<p><h3 style=" text-align: center; font-family: Bradley Hand, cursive;"><strong>B</strong>ienvenue ${ sessionScope.nomAdherent } dans votre espace adhérent</h3>




<div class="card bg-dark text-white">
  <img src="images/prepaC.JPG" class="card-img" alt="slide1">
  <div class="card-img-overlay">
   
    <br><br><br><br><br><br>  <br><br><br><br>    
    <div class="row">
    <div class="col-6"><a href="decouvrirProg.do?id=${ sessionScope.sessionUtilisateur }" class="btn btn-danger btn-lg" id="decouvrir" data-toggle="tooltip" data-placement="bottom" title="Découvrir et choisir le programme qui vous convient">Découvrir nos programmes</a></div>
   <div class="col-6"> <a href="personnaliserProg.do?id=${ sessionScope.sessionUtilisateur }"  class="btn btn-danger btn-lg" id="personaliser" data-toggle="tooltip" data-placement="bottom" title="Choisir vos Activités préférées">Personnaliser mon programme</a>
  
  </div>
  </div>
  </div>
</div>


 

 













<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>