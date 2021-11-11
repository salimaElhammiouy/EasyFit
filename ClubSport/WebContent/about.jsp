<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="">
<title>A propos de nous</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
 crossorigin="anonymous">
</head>

<body>
<style>
body{
	background-image: url('album/aa.jpg');
    background-repeat: no-repeat;
    background-attachment:fixed;
    background-size: cover;
}
p.titre{
	color: #A52A2A;
	padding:25%;
	font-family: Courier New;
	font-weight: bolder;
	font-size: 40px;;
}
div.cont{
	margin-left:0%;
	width:100%;
	background-color:white;
}
p.address{
	color: black;
	font-family: cursive;		
}
iframe{
	margin-left:30%;
}
div.about{
	font-family:Comic Sans MS;
	padding:3%;
	
}
p.coord{
	color: black;
	font-size: 28px;
	font-family: monospace;
	font-weight: bold;
	text-decoration: underline;
}
</style>
<%@ include file="taglibs.jsp" %>
<%@ include file="menu.jsp" %>

<p class="titre">Nous ne sommes pas comme les autres salles de sport</p>

<div class="cont">
<div class=" about">
Un centre de fitness 7j/7 avec Piscine de 210 m², sauna et hammam turc 
Venez découvrir nos activités: AQUAGYM- STEP- YOGA- MUSCULATION- GYM BALL-
DANSE ORIENTALE- ZUMBA ... 
Rejoignez nous pour atteindre vos objectifs ! <br>
Créé il y a plus de 2 ans, le concept Life-Fit a connu un succès immédiat. 
Présent actuellement sur Fès, Life-Fit prévoit l’élargissement de 
ses établissements avec des ouvertures prochaines sur plusieurs villes du royaume.<br>
pour nous définir en trois mots,  Qualité, Service et Hygiène sont les termes
en adéquation avec notre volonté croissante d’aller toujours de l’avant et 
d’apporter un service d’avant-garde à nos clients.<br>
On est ouvert chaque jour de 6h30 a 21h30 non stop !<br>
Il n'est jamais trop tard 
</div>

<div>
<p class="coord" ><i class="fa fa-phone"></i> GSM : +212 652397877 </p>
<p class="coord"><i class="fa fa-print"></i> Faxe : +212 652397877</p>
<p class="coord"><i class="fa fa-tty"></i> Fixe : +212 652397877</p>
<p class="coord"><i class="fa fa-at"></i> Adresse mail : easyfit.fes@gmail.com</p>
</div>

<p class="address"><i class="fa fa-directions"></i> Adresse :</p>

<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3307.723347401766!2d-4.991932285302128!3d33.99963912794878!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd9f8b9ae415fdf5%3A0x7447660c4c38d15e!2sFacult%C3%A9%20des%20Sciences%20et%20Techniques!5e0!3m2!1sfr!2sma!4v1587694480577!5m2!1sfr!2sma"
		 width="600" height="450" frameborder="0" style="border:0;" 
		 allowfullscreen="" aria-hidden="false" tabindex="0">
</iframe>
</div>



</body>
</html>