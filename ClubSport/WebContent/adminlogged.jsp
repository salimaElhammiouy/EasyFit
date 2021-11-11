<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
  <link type="text/css" rel="stylesheet" href="inc/style.css" /> 
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
 crossorigin="anonymous">
<title>Espace admin</title>



</head>
<body>
<header>
<style>
a.titres{
	color:black;
	padding-top:30px;
	font-weight: bold;
	font-size: x-large;
}
h2{
	color:white;
	font-weight: bolder;
}
#pic1{
	background-image:  url("album/ab0.jpg");
	background-repeat: no-repeat;
	background-size: cover  ;
	color: black;
}
#pic2{
	background-repeat: no-repeat;
	background-size: cover  ;
	color: black;
	background-image: url("album/ab1.jpg");
}
#pic3{
	background-repeat: no-repeat;
	background-size: cover  ;
	color: black;
	background-image: url("album/ab2.jpg");
}
#pic4{
	background-repeat: no-repeat;
	background-size: cover  ;
	color: black;
	background-image: url("album/ab3.jpg");
}
#pic5{
	background-repeat: no-repeat;
	background-size: cover  ;
	color: black;
	background-image: url("album/ab4.jpg");
}
#pic7{
	background-repeat: no-repeat;
	background-size: cover  ;
	color: black;
	background-image: url("album/ab6.jpg");
}
#msg{
	margin-left:2%;
}
.flip-box-back {
  background-color: white;
  color: black;
  transform: rotateX(180deg);
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
#conte{
	margin-top:5%;
	margin-left:6%;
}
#conte2{
	margin-left:10%;
}
</style>
</header>
<jsp:include page="menuAdmin.jsp"></jsp:include>
	

<div class="container" id="conte">
  <div class="row">
    <div class="col-lg">
      <div class="flip-box">
  <div class="flip-box-inner">
    <div class="flip-box-front" id="pic1">
    <br><br><br>
      <h2>Equipements</h2>
    </div>
    <div class="flip-box-back">
     <div class="card-body">
        <h5 class="card-title"></h5>
        <p class="card-text"></p>
          <a  href="voirEquips.da"  type="button" class="btn bata btn-outline-secondary">Voir plus !!</a>	
      </div>
    </div>
  </div>
</div>
    </div>
    <div class="col-lg">
            <div class="flip-box">
  <div class="flip-box-inner">
    <div class="flip-box-front"  id="pic7">
    <br><br><br>
      <h2>Messages</h2>
    </div>
    <div class="flip-box-back">
     <div class="card-body">
        <h5 class="card-title"></h5>
        <p class="card-text"></p>
        <a  href="voirMsg.da"  type="button" class="btn bata btn-outline-secondary">Voir plus !!</a>       
      </div>
    </div>
  </div>
</div>
    </div>
    <div class="col-lg">
            <div class="flip-box">
  <div class="flip-box-inner">
    <div class="flip-box-front" id="pic2">
    <br><br><br>
      <h2>Activités</h2>
    </div>
    <div class="flip-box-back">
     <div class="card-body">
        <h5 class="card-title"></h5>
        <p class="card-text"></p>
        <a  href="voirActivs.da"  type="button" class="btn bata btn-outline-secondary">Voir plus !!</a> 
      </div>
    </div>
  </div>
</div>
</div>
</div>
</div>
<br><br>

<div class="container" id="conte2">
  <div class="row">
    <div class="col-lg">
      <div class="flip-box">
  <div class="flip-box-inner">
    <div class="flip-box-front" id="pic3">
    <br><br><br>
      <h2>Moniteurs</h2>
    </div>
    <div class="flip-box-back">
     <div class="card-body">
        <h5 class="card-title"></h5>
        <p class="card-text"></p>
         <a  href="voirMoniteurs.da" type="button" class="btn bata btn-outline-secondary">Voir plus !!</a> 
      </div>
    </div>
  </div>
</div>
    </div>
    <div class="col-lg">
            <div class="flip-box">
  <div class="flip-box-inner">
    <div class="flip-box-front"  id="pic5">
    <br><br><br>
      <h2>Newsletters</h2>
    </div>
    <div class="flip-box-back">
     <div class="card-body">
        <h5 class="card-title"></h5>
        <p class="card-text"></p>
         <a  href="voirNews.da" type="button" class="btn bata btn-outline-secondary">Voir plus !!</a>
      </div>
    </div>
  </div>
</div>
    </div>
   
</div>
</div>












<!-- <form action="voirEquips.do" method="post" >
    <button type="submit" class="btn btn-primary" id="pic1">Equipements</button>                   
</form>

<form action="voirMsg.do" method="post" >
    <button type="submit" class="btn btn-primary" id="pic7"> Messages </button>                   
</form>

<form action="voirActivs.do" method="post" >
    <button type="submit" class="btn btn-primary" id="pic2">Activités</button>                   
</form>

<form action="voirMoniteurs.do" method="post" >
    <button type="submit" class="btn btn-primary" id="pic3">Moniteurs</button>                   
</form>


<form action="voirNews.do" method="post" >
    <button type="submit" class="btn btn-primary" id="pic5"> Newsletter</button>                   
</form> -->

 <br>
<br>

</body>
</html>