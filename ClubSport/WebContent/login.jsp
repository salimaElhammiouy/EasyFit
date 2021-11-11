<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
  <link type="text/css" rel="stylesheet" href="inc/style.css" /> 
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
 crossorigin="anonymous">
  
<title>SE CONNECTER</title>
<style>
h4{
	
   text-align: center;
	visibility:visible;
	color:red;
}

/* span{
position: absolute;
right: 15px;
transform: translate(5,-50%);
cursor: pointer;

}*/

body {
  background-image: url('images/back2.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}

#login {
  height:60%;
  width:40%;
  padding:3px;
  margin-left:30%;
  margin-top:5%;
 background-color: rgba(255,255,255,0.6);
  opacity:0.9;
  border-radius: 5%;


}

form{
	margin:3%;	
}

label.fo{
	font-weight: bold;	
	margin-left:2%;
	margin-top:2%;
}

button.btn{
	margin-right:36%;
	background-color: #A52A2A;
	border:none;


}
fa{
font-size: 20px;
cursor: pointer;
} 
#mot{
height:80px;
width: 30px;
margin-left: 95%; 
margin-top: 20%;
cursor: pointer;
}
.form-control{


}
div.cont{
height:50%;
  width:28%;
  padding:5px;
  margin-left:14%;
  margin-top:10%;
  background-color: rgba(255,255,255,0.3);
  z-index: 3;}
.input-icons i { 
            position: absolute; 
        } 
          
.input-icons { 
            width: 100%; 
            margin-bottom: 10px; 
        }        
.icon { 
            padding: 10px; 
            min-width: 40px; 
            margin-left:23%;
        }           
.input-field { 
            width: 100%; 
            padding: 10px; 
            text-align: center; 
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

<jsp:include page="Header2.jsp"></jsp:include>


<div class="cont">
<h4>${ message }</h4>
<form action="login.da" class="needs-validation" method="post"   novalidate>
  
   <button type="button" class="close"aria-label="Close" onmouseover="style.color='#A52A2A'" onmouseout="style.color='black'" style="color: black;">
  <span aria-hidden="true">&times;</span>
</button>
     <div class="form-group">
    <label class="fo" for="emailr" >Adresse mail</label>
    <input type="email" class="form-control" id="email" name="email"  value="${ utilisateur.getEmail() }" aria-describedby="emailHelp" placeholder="nom@example.com" required>
    <small id="emailHelp" class="form-text text-muted" style="font-color:black;">We'll never share your email with anyone else.</small>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>
  <div class="form-group">
  
    <label for="password" class="fo">Mot de passe</label>
     <div class="input-icons">
    <i class="fas fa-eye icon" id="aye" onclick="toggle()"></i>
    <input type="password" class="form-control" id="password" name="password" value="${ utilisateur.getPassword() }" placeholder="******" required>
     <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Remplire ce champs !! .</div>
  </div>
  </div>
   <div><a href="reserverPalce.jsp" onmouseover="style.color='#A52A2A'" onmouseout="style.color='black'" style="color: black; font-style: italic;">Vous n'avez pas de compte? S'inscrire?</a></div>
  <div><a  href="forgetPassword.jsp" onmouseover="style.color='#A52A2A'" onmouseout="style.color='black'" style="color: black; font-style: italic;">Mot de passe oublier</a></div>
<br>
  <button type="submit" class="btn btn-secondary " >Se connecter</button>


      
</form>
</div>




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
<script >

var state= false;
function toggle(){
	if(state)
	{document.getElementById("password").setAttribute("type", "password");
	document.getElementById("aye").style.color='#7a797e';
	state= false;
	}
	else {
		
		document.getElementById("password").setAttribute("type", "text");
		document.getElementById("aye").style.color='#5887ef';
		state= true;
	}
	
}











</script>


<div class="footer">
  <p id="foot">2020 Copyright EasyFit</p>
</div>










































<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>