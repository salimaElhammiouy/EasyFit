<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
 <script src="https://kit.fontawesome.com/209a6e480f.js" crossorigin="anonymous"></script>
<title>Nos Coaches</title>
<style type="text/css">
.co{
text-align: center;

font-weight: bold;
font-family: Lucida Sans Typewriter ;

font-variant: small-caps;
font-size: 30px

}
#coa{
text-align: center;

font-weight: bold;
font-size: 20px;

}
#coac{
color: gray;
text-align: center;
font-weight: bold;

}
#centeralign{
font-family: Lucida Sans Typewriter;
    color: black;
font-weight: bold;
text-align: center;
text-transform: uppercase;

	display: table-cell;
	vertical-align: middle;
	font-size: 30px;
	
}
#table {
	display: table;
	width: 90%;
	height: 7%;
	padding:0%;
  background-color: white;
}
</style>
</head>
<body>
<jsp:include page="menuAdh.jsp"></jsp:include>

<br>

<div id="table"><h1  id="centeralign">PLUS DE 600 COACHS CERTIFIÉS DISPONIBLE A EASYFIT</h1></div>

<div class="container">
<div class="row">
<div class="col">
<img src="images/certificate.png" class="card-img" alt="slide1" style="height: 250px; width: 250px; margin-left: 10%;">
<p id="coa">FORMATION CONTINUE
<p id="coac">Nos coachs suivent 8 formations par an
</div>
<div class="col">
<img src="images/specoach.png" class="card-img" alt="slide1" style="height: 250px; width: 250px; margin-left: 10%;">
<p id="coa">COACHS SPÉCIALISÉS
<p id="coac">Faites vous coacher par activité selon vos objectifs
</div>

<div class="col">
<img src="images/femcoach.png" class="card-img" alt="slide1" style="height: 250px; width: 250px; margin-left: 10%;" >
<p id="coa">100% FEMMES
<p id="coac">Des coachs femmes pour des centres ESZYFIT Lady 100% femmes
</div>

</div>
<hr style="size:50%; text-align: center;">
<br>
<p class="co">NOS COACHS SONT A VOTRE DISPOSITION DANS TOUS LES CATÉGORIE D'ACTIVITÉS</p>
<div class="container">
<div class="row">
<div class="col-md">
<img src="images/functionTr.png" class="card-img" alt="slide1" style="height: 100px; width: 100px; margin-left: 25%; ">
<p id="coac" >ARTS ET MARTIAUX <br> +70

</div>
<div class="col-md">
<img src="images/cardio.png" class="card-img" alt="slide1" style="height: 100px; width: 120px;  margin-left: 25%;">
<p id="coac">CARDIO  <br>+30

</div>
<div class="col-md">
<img src="images/musculation.png" class="card-img" alt="slide1" style="height: 100px; width: 120px;  margin-left: 25%;">
<p id="coac">MUSCULATION<br> +50

</div>
<div class="col-md">
<img src="images/boxicon.png" class="card-img" alt="slide1" style="height: 100px; width: 120px;  margin-left: 25%;">
<p id="coac">BOXE & MMA <br> +70

</div>
<div class="col-md">
<img src="images/yogaIcon.png" class="card-img" alt="slide1" style="height: 100px; width: 100px;  margin-left: 25%;">
<p id="coac">ZENFIT<br>  +50

</div>
</div>
</div>
<br>
</div>


<script type="text/javascript">

function typeEffect(element, speed) {
	var text = element.innerHTML;
	element.innerHTML = "";
	
	var i = 0;
	var timer = setInterval(function() {
    if (i < text.length) {
      element.append(text.charAt(i));
      i++;
    } else {
      clearInterval(timer);
    }
  }, speed);
}


// application
var speed = 75;
var h1 = document.querySelector('h1');

var delay = h1.innerHTML.length * speed + speed;

// type affect to header
typeEffect(h1, speed);




</script>
</body>
</html>