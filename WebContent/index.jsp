<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>  
<head>  
<script>  
var request;
var user,pass;
function sendInfo(usr,pas)  
{    
	user=usr;
	pass=pas;
	var url="Autheticate.jsp?US="+user+"&PWD="+pass;  
  	if(window.XMLHttpRequest)
  	{  
		request=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject)
	{  
		request=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
  	try
  	{  
		request.onreadystatechange=getInfo;  
		request.open("GET",url,true);  
		request.send();  
	}
  	catch(e)
  	{
  		alert("Unable to connect to server");
	}
}  
  
function getInfo()
{  
	if(request.readyState==4)
	{  
		var message="";
		var val=request.responseText;
		if(val.includes("LSF"))
		{
			Myform.User.value=user;
			Myform.Pass.value=pass;
			Myform.submit();
		}else if(val.includes("INP")){
			message="Inavlid Password.!!";
		}
		else if(val.includes("UNF")){
			message="Account does'nt exists";
		}
		else{
			message="Server Error,Please check your internet connection";	
		}
		document.getElementById("ErrorMessage").style.color = "#ff2b05";
		document.getElementById('ErrorMessage').innerHTML=message;
	}  
}

function Toggle() {
	  var x = document.getElementById("PassTB");
	  if (x.type === "password") {
	    x.type = "text";
	    document.getElementById("PassVI").src = "ClosedEye.png";    
	  } else {
	    x.type = "password";
	    document.getElementById("PassVI").src = "OpenedEye.png";
	  }
	}
function resetError(){
	document.getElementById('ErrorMessage').innerHTML="";
}
</script>  
</head>  
<body align="center">
    <marquee><h1>Lets Login</h1></marquee>  
  	<input type="text" id='UserTB' placeholder="User Name" style="width:15vw;height:5vh; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);border:none; background-color:#fff; padding-left: 10px" onkeypress="resetError()"/>
  <br><br>
  
  <div style="position: relative; width:15vw;height:5vh; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); margin-left:42vw;">
  
  	<input type="password" id='PassTB'  placeholder="Password" style="border:none; background-color:#fffff; display:block;height:5vh;padding-left: 10px" onkeypress="resetError()"/>
  	
  	<img src="OpenedEye.png" id='PassVI' style="position: absolute; top: 2px; right: 5px;width:5vh;height:5vh;" onclick="Toggle()"/>
  </div>
  <br><br>
  
  	<button onclick="sendInfo(document.getElementById('UserTB').value,document.getElementById('PassTB').value)">Login</button>
  	<br><br>
  	
	<label id='ErrorMessage'></label>
	
  <form action="main.jsp" method="post" name="Myform">
  <input type="hidden" name="User" />
  <input type="hidden" name="Pass"/>
  </form>
</body>  
</html>