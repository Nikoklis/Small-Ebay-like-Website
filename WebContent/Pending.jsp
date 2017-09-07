<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
    window.setTimeout(function() {
        window.location.href='http://localhost:8080/Ted2/LoginPage.jsp';
    }, 5000);
</script>
<style>

body{
	margin: 0;
	padding: 0;
	background-color: #fffff;
	background-image: url("file:///C:/Users/Nikoklis/Ted2/WebContent/WEB-INF/pictures/ExpBack.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center center;
}

#main{
	box-sizing: border-box;  
	padding: 20px;
	text-align: center;
}
#heading{
	width: 100%;
	height: 30px;
	background-image: url("file:///C:/Users/Nikoklis/Ted2/WebContent/WEB-INF/pictures/HeaderWp2.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: top top;
	position: relative;
	box-shadow: 0px 2px 5px black;
	display: flex;
	z-index: 5;
}
#head{
	width: 100%;
	height: 70px;
	background-color: #303036;
	position: relative;
	box-shadow: 0px 3px 5px black;
	display: flex;
	z-ibdex: 1;
}

#logo1{
	margin auto;
}

h1 {
	color: white;
	font-family: Aileron;
	letter-spacing: 3px;
	vertical-align: top;
	font-size: 40px;
	line-height: 0.50;
}




</style>
<title>Success!</title>
</head>
<body>
	<div id="heading">
	</div>
	<div id="head">
		<img id=logo1 src="file:///C:/Users/Nikoklis/Ted2/WebContent/WEB-INF/pictures/logoExp3.png" width=70px>
		<h1>
			-BAY
		</h1>
	</div>
	<div id="main">	
		<img src="file:///C:/Users/Nikoklis/Ted2/WebContent/WEB-INF/pictures/logoExp3.png" width=212px height=190px>
		<h2>
			Your account has been created sucesfully! Please wait for your account to be accepted by the administrator
		</h2>
		<h2>
			You will be redirected to the login screen shortly
		</h2>
	</div>  
</body>
</html>