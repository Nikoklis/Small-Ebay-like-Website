<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

body{
	margin: 0;
	padding: 0;
	background-color: #fffff;
	background-image: url("file:///C:/Users/Nikoklis/workspace/Ted2/WebContent/WEB-INF/pictures/ExpBack.jpg");
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
	background-image: url("file:///C:/Users/Nikoklis/workspace/Ted2/WebContent/WEB-INF/pictures/HeaderWp2.jpg");
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
	letter-spacing: 3px;
	vertical-align: top;
	font-size: 40px;
	line-height: 0.50;
}

input[type=text] {
    width: 30%;
    padding: 12px 18px;
    margin: 3px 4px;
    box-sizing: border-box;
    border-radius: 4px;
   	border: 2px solid grey;
}

input[type=password] {
    width: 30%;
    padding: 12px 18px;
    margin: 3px 4px;
    box-sizing: border-box;
    border-radius: 4px;
   	border: 2px solid grey;
}

input[type=submit] {
	background-color: #063E53;
    border: none;
    padding: 15px 25px;
    color: white;
    text-decoration: none;
    margin: 1px 2px;
    cursor: pointer;
    width: 30%;
}
</style>
<title>Login</title>
</head>
<body>
	

	<div id="heading">
	</div>
	<div id="head">
		<img id=logo1 src="file:///C:/Users/Nikoklis/workspace/Ted2/WebContent/WEB-INF/pictures/logoExp3.png" width=70px>
		<h1>
			-BAY
		</h1>
	</div>
	<div id="main">	
		<img src="file:///C:/Users/Nikoklis/workspace/Ted2/WebContent/WEB-INF/pictures/logoExp3.png" width=212px height=190px>
			<form action="LoginCheck" method="post">
				Username:<br>
				<input type="text" name="username"><br>
				Password:<br>
				<input type="password" name="password"><br><br>
				<input type="submit" value="Login">
			</form>
			<hr>
			<form action="RegisterPage.jsp" method="post">
				<input type="submit" value="Register">
			</form>
			<br>
			<form action="LoginCheck" method="get">
				<input type="hidden" name = "visitor" value="visitor">
				<input type="submit" value="Continue without an account">
			</form>
	</div>  
</body>
</html>