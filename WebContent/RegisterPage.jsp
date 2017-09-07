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

input[type=text] {
    width: 30%;
    padding: 12px 18px;
    margin: 3px 4px;
    box-sizing: border-box;
    border-radius: 4px;
   	border: 2px solid grey;]
}

input[type=password] {
    width: 30%;
    padding: 12px 18px;
    margin: 3px 4px;
    box-sizing: border-box;
    border-radius: 4px;
   	border: 2px solid grey;]
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

label{
display: inline-block;
  width: 120px;
  text-align: right;
}
</style>
<title>Register here</title>
</head>
<body>
	<div id="heading">
	</div>
	<div id="head">
		<img id=logo1 src="file:///C:/Users/Nikoklis/Ted2/WebContent/WEB-INF/pictures/logoExp3.png" width=70px>
		<h1>
			-BAY
		</h1>
		<div id=outcontainer>
			<form class=out action=LoginPage.jsp  method=get>
				<input class=outbutton type="submit" value="Go Back">
			</form>
		</div>
	</div>
	<div id="main">	
		<img src="file:///C:/Users/Nikoklis/Ted2/WebContent/WEB-INF/pictures/logoExp3.png" width=212px height=190px>
		<h2>
			To register please enter your info here:
		</h2>
		<form action=RegisterCheck method=post >
			<label>Username:</label>
			<input type="text" name="username"><br>
			<label>Password:</label>
			<input type="password" name="password"><br>
			<label>Verify Password:</label>
			<input type="password" name="verify" title="Password must be the same as above"><br>
			<label>AFM:</label>
			<input type="text" name="afm"><br>
			<label>Country:</label>
			<input type="text" name="country"><br>
			<label>Location:</label>
			<input type="text" name="location"><br>
			<label>Address:</label>
			<input type="text" name="address"><br>
			<label>E-mail:</label>
			<input type="text" name="mail"><br>
			<label>Phone:</label>
			<input type="text" name="phone"><br>
			<input type="submit" value="Register">
		</form>
	</div>  
</body>
</html>