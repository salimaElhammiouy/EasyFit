<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
 <script src="https://kit.fontawesome.com/209a6e480f.js" crossorigin="anonymous"></script>

<title>Decouvrez nos programme</title>
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
h2{
font-color: #A52A2A;
font-size: 30px;
position: centre;
font-weight: bold;
font-family: Lucida Sans Typewriter;

}


.flip-box {
  background-color: transparent;
  width: 350px;
  height: 200px;
  border: 1px solid #f1f1f1;
  perspective: 1000px;
}
.flip-box-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;
}

.flip-box:hover .flip-box-inner {
  transform: rotateX(180deg);
}

.flip-box-front, .flip-box-back {
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
}
#equilibre{
background-image:   url(images/box3.jpg);
 background-repeat: no-repeat;
 background-size:      cover  ;
  color: black;

}
#minceur{

background-image:   url(images/natation.jpg);
 background-repeat: no-repeat;
 background-size:      cover  ;
  color: black;

}
#cardio{

background-image:   url(images/musculation.jpg);
 background-repeat: no-repeat;
 background-size:      cover  ;
  color: black;
}
.flip-box-back {
  background-color: white;
  color: black;
  transform: rotateX(180deg);
}
#army{
background-image:   url(images/Army.jpg);
 background-repeat: no-repeat;
 background-size:      cover  ;
  color: black;

}
#dance{
background-image:   url(images/dance3.jpeg);
 background-repeat: no-repeat;
 background-size:      cover  ;
  color: black;
}
#defense{
background-image:   url(images/tay1.jpeg);
 background-repeat: no-repeat;
 background-size:      cover  ;
  color: black;

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
#addPanier{
position: absolute;
right: 510px;
display: flex;

}

#pan{

background-color :black;
  border: none;
color:white;
font-weight: bold;
font-size:15px;
cursor: pointer;
height: 20px;

}

</style>
</head>
<body>




<c:choose>
<c:when test="${etat2==true }">
<jsp:include page="menuVisiteur.jsp"></jsp:include>
<div class="links"><a href="preparerCompte.jsp" id="links">Préparer mon compte  <span><i class="fas fa-angle-right"></i></span></a><a href="preparerCompte.jsp" id="links">Découvrir nos programmes <span><i class="fas fa-angle-right"></i></span></a><a href="decouvrirProg.do?id=${ sessionScope.sessionUtilisateur }" id="links">Nos programmes</a></div>
</c:when>
<c:otherwise>
<jsp:include page="menuAdh.jsp"></jsp:include>
<div class="links"><a href="decouvrirProg.do?id=${ sessionScope.sessionUtilisateur }" id="links">Nos programmes</a></div>
</c:otherwise>
</c:choose>

<br>

<div class="container">
  <div class="row">
    <div class="col-lg">
      <div class="flip-box">
  <div class="flip-box-inner">
    <div class="flip-box-front" id="equilibre">
    <br><br><br>
      <h2>Easy-Equilibre</h2>
    </div>
    <div class="flip-box-back">
     <div class="card-body">
        <h5 class="card-title"></h5>
        <p class="card-text">C'est un type d'activité qui fait travailler les grands muscles des bras des jambes, sur un rythme musical très </p>
    <a href="EasyEquilibre.do?id=${ sessionScope.sessionUtilisateur }" class="btn btn-outline-secondary">On savoir plus!!</a>
      </div>
    </div>
  </div>
</div>
    </div>
    <div class="col-lg">
            <div class="flip-box">
  <div class="flip-box-inner">
    <div class="flip-box-front"  id="minceur">
    <br><br><br>
      <h2>Easy-Minceur</h2>
    </div>
    <div class="flip-box-back">
     <div class="card-body">
        <h5 class="card-title"></h5>
        <p class="card-text">C'est un type d'activité qui fait travailler les grands muscles des bras des jambes, sur un rythme musical très </p>
    <a href="easyMinceur.do?id=${ sessionScope.sessionUtilisateur }" class="btn btn-outline-secondary">On savoir plus!!</a>
      </div>
    </div>
  </div>
</div>
    </div>
    <div class="col-lg">
            <div class="flip-box">
  <div class="flip-box-inner">
    <div class="flip-box-front" id="cardio">
    <br><br><br>
      <h2>Easy-Cardio</h2>
    </div>
    <div class="flip-box-back">
     <div class="card-body">
        <h5 class="card-title"></h5>
        <p class="card-text">C'est un type d'activité qui fait travailler les grands muscles des bras des jambes, sur un rythme musical très </p>
    <a href="EasyCardio.do?id=${ sessionScope.sessionUtilisateur }" class="btn btn-outline-secondary">On savoir plus!!</a>
      </div>
    </div>
  </div>
</div>
    </div>
  </div>
</div>

<br><br>
<div class="container">
  <div class="row">
    <div class="col-lg">
      <div class="flip-box">
  <div class="flip-box-inner">
    <div class="flip-box-front" id="army">
    <br><br><br>
      <h2>Easy-Army</h2>
    </div>
    <div class="flip-box-back">
     <div class="card-body">
        <h5 class="card-title"></h5>
        <p class="card-text">C'est un type d'activité qui fait travailler les grands muscles des bras des jambes, sur un rythme musical très </p>
    <a href="EasyArmy.do?id=${ sessionScope.sessionUtilisateur }" class="btn btn-outline-secondary">On savoir plus!!</a>
      </div>
    </div>
  </div>
</div>
    </div>
    <div class="col-lg">
            <div class="flip-box">
  <div class="flip-box-inner">
    <div class="flip-box-front" id="dance">
    <br><br><br>
      <h2>Easy-Dance</h2>
    </div>
    <div class="flip-box-back">
     <div class="card-body">
        <h5 class="card-title"></h5>
        <p class="card-text">C'est un type d'activité qui fait travailler les grands muscles des bras des jambes, sur un rythme musical très </p>
    <a href="EasyDance.do?id=${ sessionScope.sessionUtilisateur }" class="btn btn-outline-secondary">On savoir plus!!</a>
      </div>
    </div>
  </div>
</div>
    </div>
    <div class="col-lg">
            <div class="flip-box">
  <div class="flip-box-inner">
    <div class="flip-box-front" id="defense">
    <br><br><br>
      <h2>Easy-Defense</h2>
    </div>
    <div class="flip-box-back">
     <div class="card-body">
        <h5 class="card-title"></h5>
        <p class="card-text">C'est un type d'activité qui fait travailler les grands muscles des bras des jambes, sur un rythme musical très </p>
    <a href="EasyDefense.do?id=${ sessionScope.sessionUtilisateur }" class="btn btn-outline-secondary">On savoir plus!!</a>
      </div>
    </div>
  </div>
</div>
    </div>
  </div>
</div>































 




</body>
</html>