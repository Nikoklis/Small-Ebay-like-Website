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
<title>Create Auc</title>
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
				<input class=outbutton type="submit" value="<%= session.getAttribute("savedUsername") %>">
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
				<input class=outbutton type="submit" value="New Messages <%=session.getAttribute("unreadMessageCount") %>">
			</form>
		</div>
	</div>
	<div id="main">	
		<h2>
			Please enter the info about the auction:
		</h2>
		<h2>
			Don't leave anything blank 
		</h2>
		<form name=infoinput action=CreateAuction method="post">
			<label>Name:</label><br>
			<input type="text" name="AucName"><br>
			<label>First Bid:</label><br>
			<input type="text" name="AucFirstBid"><br>
			<label>Buy Price:</label><br>
			<input type="text" name="AucBuyPrice"><br>
			<label>Country:</label><br>
			<input type="text" name="AucCoun"><br>
			<label>Location:</label><br>
			<input type="text" name="AucLoc"><br>
			<label>Longtitude:</label><br>
			<input type="text" name="AucLong"><br>
			<label>Latitude:</label><br>
			<input type="text" name="AucLat"><br>
			Please check the appropriate categories:<br><br>
			<label>Art:</label>
			<input type="checkbox" name="category" value="Art">
			<label>Collectibles:</label>
			<input type="checkbox" name="category" value="Collectibles">
			<label>Food:</label>
			<input type="checkbox" name="category" value="Food"><br>
			<label>Clothing:</label>
			<input type="checkbox" name="category" value="Clothing">
			<label>Literature:</label>
			<input type="checkbox" name="category" value="Literature">
			<label>Health:</label>
			<input type="checkbox" name="category" value="Health"><br>
			<label>Electronics:</label>
			<input type="checkbox" name="category" value="Electronics">
			<label>Gaming:</label>
			<input type="checkbox" name="category" value="Gaming">
			<label>Decor:</label>
			<input type="checkbox" name="category" value="Decor">
			<br><br>
			<label>Optional:Pictures of the item</label><br>
			<input type="file" name="Aucpics" accept="image/*" multiple>
			<br><br>
			<label>Description:</label><br>
			<textarea name="AucDesc" rows="10" cols="50"> </textarea><br><br>
			<input type="submit" value="Register">
		</form>
	</div>  
</body>
</html>