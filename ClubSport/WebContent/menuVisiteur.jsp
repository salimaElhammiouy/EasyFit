<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<head>


<style>
#navbar1{


   
   background-color: black;
   height: 110px;
box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.25);
/* border-radius: 25px; */
}
ul{
	margin-left:5%;
	margin-top: 3%;

	
}
.form-inline{
margin-top:2%;
position: absolute;
  top: 35px;
  right: 20px;

}
#icon{
background-color :black;
  border: none;
color:white;
padding: 12px 16px;
font-size:16px;
cursor: pointer;
  
 
 
}

/* #insta{

  position: absolute;
  top: 40px;
  right: 30px;
}
#twit{
  top:  50px;
  right: 35px;

} */

#icon:hover {

background-color: black;
color:#A52A2A;
}
.nav-link{
	color: white;
	font-weight: bold;	
	margin-left: -5%;

	
}
.nav-item{
	margins: 20px 20px 20px 20px;

	
	}
.btn-group{

   margin-top: 40px;
  margin-right: 10px;
  margin-left: 200px;
 
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
#links{
color: white ;
font-weight: bold;

}
#link{
color: white ;
font-weight: bold;
margin-top: 0px;
background-color: #A52A2A;


}

</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark" id="navbar1">
  <a class="navbar-brand" href="#"> <img src="images/bbb-01.png" id="logo"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span><i class="far fa-list-alt fa-2x" style="color:white;"></i></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link"  href="preparerCompte.jsp"  onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'" > <span><i class="fas fa-home"></i></span> Accueil<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active" >
        <a class="nav-link"href="aboutUs.jsp" onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'">A propos de nous</a>
      </li>
     
      <li class="nav-item active">
         <a class="nav-link" href="contactezN.jsp" onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'"><span><i class="fas fa-envelope"></i></span> Contactez-Nous</a>
      </li>
    </ul>      
   <div class="btn-group " >
    <a class="btn btn-lg" id="pan" href="paiement.do?id=${ sessionScope.sessionUtilisateur }" onmouseover="style.color='#A52A2A'" onmouseout="style.color='white'"><svg class="bi bi-cart4" width="2.5em" height="2.5em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
</svg> Mon Panier</a>
 <button  type="button" class="btn" id="icon"><i class="fab fa-instagram fa-2x"></i></button>
 <button  type="button" class="btn" id="icon"><i class="fab fa-twitter fa-2x"></i></button>
 <button  type="button" class="btn" id="icon" ><i class="fab fa-facebook-f fa-2x"></i></button>
 </div>
  </div>
</nav>  
</body>
</html>