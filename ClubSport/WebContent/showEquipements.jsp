<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nos équipement</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
</head>
<body>
<style>
body {
  font-family: Arial;
  margin: 0;
}

* {
  box-sizing: border-box;
}

img {
  vertical-align: middle;
}

/* Position the image container (needed to position the left and right arrows) */
.container {
  margin-top:2%;
  position: relative;
  height:100%;
  width: 100%;
  
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* Container for image text */
.caption-container {
  text-align: center;
  background-color: #222;
  padding: 2px 16px;
  color: white;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Six columns side by side */
.column {
  float: left;
  width: 16.66%;
}

/* Add a transparency effect for thumnbail images */
.demo {
  opacity: 0.6;
}

.active,
.demo:hover {
  opacity: 1;
}
div.row{
	
}
div#back{
	background-color:#ddd; 
}
div#divi{
	max-height: 80%;
	
}
.co{
text-align: center;

font-weight: bold;
font-family: Lucida Sans Typewriter ;

font-variant: small-caps;
font-size: 30px

}
#centeralign{
font-family: Lucida Sans Typewriter;
    color: black;
font-weight: bold;
text-align: center;
text-transform: uppercase;

	display: table-cell;
	vertical-align: middle;
	font-size: 25px;
	
}
#table {
	display: table;
	width: 90%;
	height: 7%;
	padding:0%;
  background-color: white;
}
</style>
<jsp:include page="menuAdh.jsp"></jsp:include>
<br><div id="table"><h1  id="centeralign">PLUS DE 50  EQUIPEMRNTS DE SPORT DISPONIBLE A  EASYFIT 
 </h1></div>
<!-- Container for the image gallery -->
<div class="container">
 <div id="divi">
  <!-- Full-width images with number text -->
  <div class="mySlides">
    <div class="numbertext">1 / 12</div>
      <img src="images/Aerobic Step.jpg" style="width:100%; height: 70%;">
  </div>

  <div class="mySlides">
    <div class="numbertext">2 / 12</div>
      <img src="images/equips2.jpg" style="width:100% ;height: 70%;">
  </div>

  <div class="mySlides">
    <div class="numbertext">3 / 12</div>
      <img src="images/equips3.jpg" style="width:100% ;height: 70%;">
  </div>

  <div class="mySlides">
    <div class="numbertext">4 / 12</div>
      <img src="images/Lunette de natation.jpg" style="width:100% ;height: 70%;">
  </div>

  <div class="mySlides">
    <div class="numbertext">5 / 12</div>
      <img src="images/equips4.jpg" style="width:100% ;height: 70%;">
  </div>

  <div class="mySlides">
    <div class="numbertext">6 / 12</div>
      <img src="images/equips5.jpg" style="width:100% ;height: 70%;">
  </div>
  
    <div class="mySlides">
    <div class="numbertext">7 / 12</div>
      <img src="images/equips7.jpg" style="width:100% ;height: 70%;">
  </div>
  
      <div class="mySlides">
    <div class="numbertext">8 / 12</div>
      <img src="images/equips7.jpg" style="width:100% ; height: 70%;">
  </div>
      <div class="mySlides">
    <div class="numbertext">9 / 12</div>
      <img src="images/equips7.jpg" style="width:100% ;height: 70%;">
  </div>
      <div class="mySlides">
    <div class="numbertext">10 / 12</div>
      <img src="images/equips7.jpg" style="width:100% ;height: 70%;">
  </div>
      <div class="mySlides">
    <div class="numbertext">11 / 12</div>
      <img src="images/equips7.jpg" style="width: 100% ;height: 70%;">
  </div>
      <div class="mySlides">
    <div class="numbertext">12 / 12</div>
      <img src="images/equips7.jpg" style="width:100% ; height: 70%;">
  </div>
</div>
  <!-- Next and previous buttons -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>

  <!-- Image text -->
  <div class="caption-container">
    <p id="caption"></p>
  </div>

  <!-- Thumbnail images -->
  <div id="back" class="container">
  <div class="row">
    <div class="column">
      <img class="demo cursor" src="images/Aerobic Step.jpg" style="width:100%" onclick="currentSlide(1)" alt="Aerobic Step">
    </div>
    <div class="column">
      <img class="demo cursor" src="images/equips2.jpg" style="width:100%" onclick="currentSlide(2)" alt="La corde andulatoire">
    </div>
    <div class="column">
      <img class="demo cursor" src="images/equips3.jpg" style="width:100%" onclick="currentSlide(3)" alt="Corde de musculation">
    </div>
    <div class="column">
      <img class="demo cursor" src="images/Lunette de natation.jpg" style="width:100%" onclick="currentSlide(4)" alt="Lunette de natation">
    </div>
    <div class="column">
      <img class="demo cursor" src="images/equips4.jpg" style="width:100%" onclick="currentSlide(5)" alt="Cordes à tirer">
    </div>
    <div class="column">
      <img class="demo cursor" src="images/equips5.jpg" style="width:100%" onclick="currentSlide(6)" alt="Machine de traction">
    </div>
    
     <div class="column">
      <img class="demo cursor" src="images/equips7.jpg" style="width:100%" onclick="currentSlide(7)" alt="Sac de boxe">
    </div>
        <div class="column">
      <img class="demo cursor" src="images/equips1.jpg" style="width:100%" onclick="currentSlide(8)" alt="Tapis roulant">
    </div>
    <div class="column">
      <img class="demo cursor" src="images/Aerobic ballon.jpg" style="width:100%" onclick="currentSlide(9)" alt="Ballon d'Aerobic ">
    </div>
    <div class="column">
      <img class="demo cursor" src="images/Gants de boxe.jpg" style="width:100%" onclick="currentSlide(10)" alt="Gants de boxe">
    </div>
    <div class="column">
      <img class="demo cursor" src="images/equips6.jpg" style="width:100%" onclick="currentSlide(11)" alt="Halteres Tonedumbell ">
    </div>
    
     <div class="column">
      <img class="demo cursor" src="images/Banc de presse.jpg" style="width:100%" onclick="currentSlide(12)" alt="Banc de presse">
    </div>
  </div>
  </div>
</div>

<!-- <div   class="row"> -->
<!--   <div  class="column"> -->
<!--     <img  src="images/Aerobic ballon.jpg"> -->
<!--     <img  src="images/Aerobic Step.jpg"> -->
<!--     <img  src="images/equips2.jpg"> -->
<!--     <img  src="images/equips1.jpg"> -->
<!--     <img  src="images/Stepper1.jpg"> -->
<!--     <img  src="images/equips4.jpg"> -->
<!--     <img  src="images/Lunette de natation.jpg"> -->
<!--   </div> -->
 
<!--   <div  class="column"> -->
<!--     <img  src="images/Banc de presse.jpg"> -->
<!--     <img  src="images/equips5.jpg"> -->
<!--     <img  src="images/Barre à Dips.jpg"> -->
<!--     <img  src="images/Gants de boxe.jpg"> -->
<!--     <img  src="images/equips3.jpg"> -->
<!--     <img  src="images/equips4.jpg"> -->
<!--     <img  src="images/equips6.jpg"> -->

<!--   </div> -->

<!--   <div  class="column"> -->
<!--     <img  src="images/Aerobic ballon.jpg"> -->
<!--     <img  src="images/Aerobic Step.jpg"> -->
<!--     <img  src="images/equips1.jpg"> -->
<!--     <img  src="images/Gants de boxe.jpg"> -->
<!--     <img  src="images/equips3.jpg"> -->
<!--     <img  src="images/equips4.jpg"> -->
<!--     <img  src="images/equips5.jpg"> -->
<!--   </div> -->
 
<!--   <div  class="column"> -->
<!--     <img  src="images/Aerobic ballon.jpg"> -->
<!--     <img  src="images/Aerobic Step.jpg"> -->
<!--     <img  src="images/equips1.jpg"> -->
<!--     <img  src="images/equips2.jpg"> -->
<!--     <img  src="images/equips3.jpg"> -->
<!--     <img  src="images/equips4.jpg"> -->
<!-- 	<img  src="images/equips7.jpg"> -->
<!--   </div></div> -->

  



<script>
var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}
</script>


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