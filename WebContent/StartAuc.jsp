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
	width: 100%;
	height: 100%;
	padding: 0px;
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
	margin: 0 auto;
	text-align: right;
	width: 100%;
}

.out{
	float: right;
}

.outbutton{
	background-color: white !important;
    border: none !important;
    padding: 15px 25px !important;
    color: #063E53 !important;
    text-decoration: none !important;
    margin: 1px 2px !important;
    cursor: pointer !important;
    width: 100px !important;
    height: 70px !important;
    white-space: normal !important;
}

.outbutton:hover{
	color: white !important;
	background: url("file:///E:/Users/MKLO/workspace/Ebay/WebContent/HeaderWp2.jpg") repeat center center !important;
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
   	border: 2px solid grey;
}

input[type=file] {
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

textarea{
	box-sizing: border-box;
    border-radius: 4px;
   	border: 2px solid grey;
}

label{

}
</style>
<title>Start Auc</title>
</head>
<body>
	<div id="heading">
	</div>
	<div id="head">
		<img id=logo1 src="file:///E:/Users/MKLO/workspace/Ebay/WebContent/logoExp3.png" width=70px>
		<h1>
			-BAY
		</h1>
		<%int unreadMessages =(int) session.getAttribute("unreadMessageCount");
				
				if (unreadMessages != 0)
				{
					%><form class=out action=MessageServlet  method=get>
						<input type="hidden" name="function" value="Inbox">
						<input class=outbutton type="submit" value="New Messages: <%= unreadMessages  %> ">
						</form>
				<% }
				%>
		<div id=outcontainer>
			
			<form class=out action=UserServlet method=get>
				<input class=outbutton type="submit" value="<%= session.getAttribute("savedUsername") %>">
			</form>
			<form class=out action=LogoutServlet  method=get>
				<input class=outbutton type="submit" value="Logout">
			</form>
			<form class=out action=MainNavigation.jsp  method=get>
				<input class=outbutton type="submit" value="Go Back">
			</form>
			<form class=out action=UserServlet  method=get>
				<input class=outbutton type="submit" value="New Messages: <%= unreadMessages %>">
			</form>
		</div>
	</div>
	<div id="main">	
		<h2>
			Please enter the info to start the auction:
		</h2>
		<h2>
			(date format should be Month(number)/Day(number) Hour:Minutes) <br>
			(example 04/13 13:50)
		</h2>

		<form name=infoinput action="AucManipulate" method="get" >
			<input type="hidden" name="auc" value= "<%= request.getParameter("AucID") %>" >
			<input type="hidden" name="function" value="Start">
			End date:<br>
			<input type="text" name="dateEnds" >
			<br>
			<input type="submit" value="Register">
		</form>
	</div>  
</body>
</html>