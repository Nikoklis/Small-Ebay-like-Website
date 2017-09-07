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
	background-image: url("file:///E:/Users/MKLO/workspace/Ebay/WebContent/ExpBack.jpg");
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
	background-image: url("file:///E:/Users/MKLO/workspace/Ebay/WebContent/HeaderWp2.jpg");
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

#outcontainer{
	overflow: hidden;
	width: 100%;
	display: inline-flex;
	float: right;
}
.out{
	float:right;
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
   	border: 2px solid grey;
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

.outbutton{
	background-color: white;
    border: none;
    padding: 15px 25px;
    color: #063E53;
    text-decoration: none;
    margin: 1px 2px;
    cursor: pointer;
    width: 100%;
    height: 70px;
}

.outbutton:hover{
	color: white;
	background: url("/Ebay/HeaderWp2.jpg") repeat center center;
}

label{

}

.outbutton{
	background-color: white;
    border: none;
    padding: 15px 25px;
    color: #063E53;
    text-decoration: none;
    margin: 1px 2px;
    cursor: pointer;
    width: 100%;
    height: 70px;
}

.outbutton:hover{
	color: white;
	background: url("/Ebay/HeaderWp2.jpg") repeat center center;
}

#mailmess{
	width: 30%;
    padding: 12px 18px;
    margin: 3px 4px;
    box-sizing: border-box;
    border-radius: 4px;
   	border: 2px solid grey;]
}


	
</style>
<title>New message</title>
</head>
<body>
	<div id="heading">
	</div>
	<div id="head">
		<img id=logo1 src="file:///E:/Users/MKLO/workspace/Ebay/WebContent/logoExp3.png" width=70px>
		<h1>
			-BAY
		</h1>
		<div id=outcontainer>
			<form class=out action=UserServlet method=get>
				<input class=outbutton type="submit" value=<%= session.getAttribute("savedUsername") %>>
			</form>
			<form class=out action=LogoutServlet  method=get>
				<input class=outbutton type="submit" value="Logout">
			</form>
			<form class=out action=MainNavigation.jsp  method=get>
				<input type="hidden" name="unreadMessageCount" value="<%= session.getAttribute("unreadMessageCount") %>">
				<input class=outbutton type="submit" value="Go Back">
			</form>
			<form class=out action=MessageServlet  method=get>
					<input type="hidden" name="function" value="Inbox">
				<input class=outbutton type="submit" value="New Messages: <%= session.getAttribute("unreadMessageCount")%>">
			</form>
		</div>
	</div>
	<div id="main">	
		<h2>
			We strongly urge to put the ID of the item you are talking about in the subject of the message:
		</h2>
		<form action="CreateNewMessage" method="get" >
			<label>Recipient:</label><br>
			<input type="text" name="username"><br>
			<label>Subject:</label><br>
			<input type="text" name="subject"><br>
			<label>Message:</label><br>
			<textarea name="comment" id=mailmess rows="10" ></textarea><br>
			<input type="submit" value="Register">
		</form>
	</div>  
</body>
</html>