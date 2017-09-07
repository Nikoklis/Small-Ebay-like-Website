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
	background-image: url("/Ebay/ExpBack.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center center;
	
}

#main{
	box-sizing: border-box;  
	padding: 20px;
	overflow-x: auto;
}
#heading{
	width: 100%;
	height: 30px;
	background-image: url("/Ebay/HeaderWp2.jpg");
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
table {
    border: 0px solid black;
    border-collapse: collapse;
    border-spacing: 5px;
}

th{
	border-bottom: 1px solid black;
    border-collapse: collapse;
    border-spacing: 5px;
    text-align: center;
    height: 50px;
    background-color: #303036;
    color: white;
}

td{
	border-bottom: 1px solid black;
    border-collapse: collapse;
    border-spacing: 5px;
    text-align: center;
  }
tr:nth-child(even) {
    background-color: #808080;
}

tr:hover{
	background-color: #303036;
	color: white;
	}
.control1{
	width: 100%;
	height: 100%;
	float: left;
	border: none;
	background: url("/Ebay/HeaderWp2.jpg") no-repeat center center;
	background-color: #303036;
	padding: 2px 5px;
	color: white;
	cursor: pointer;
}

#mainleft{
	float: left;
	width: 50%;
	height: 700px;
	background: linear-gradient(to top, rgba(255,0,0,0), rgba(48,48,54,1));
	color: #303036;
	text-align: center;	
    white-space: normal;	
}

#mainleft:hover{
	background-image: url("/Ebay/HeaderWp.jpg");
	color: white;
}
#mainright{
	float: right;
	width: 50%;
	height: 700px;
	background: linear-gradient(to top, rgba(255,0,0,0), rgba(48,48,54,1));
	overflow:auto;
	color: white;
	text-align: center;
	white-space: normal;
		
}

#mainright:hover{
	background-image: url("/Ebay/ExpBack.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center center;
	color: black;
}

p{
	padding: 100px;
	font-size: 400%;
}
</style>
<title>Main Nav</title>
</head>
<body>
	<%
		String visitor = (String) session.getAttribute("visitor");
		
	%>

	<div id="heading">
	</div>
	<div id="head">
		<img id=logo1 src="/Ebay/LogoExp3.png" width=70px>
		<h1>
			-BAY 
		</h1>
		<div id=outcontainer>
			<%
				if (visitor == null)
				{
					
					%>
					<form class=out action="UserServlet" method="get">
						<input class=outbutton type="submit" value=<%= session.getAttribute("savedUsername") %>>
					</form>
					
					<%
				}
			
					%>
		
			
			<form class=out action=LogoutServlet  method=get>
				<input class=outbutton type="submit" value="Logout">
			</form>
			<form class=out action=LogoutServlet  method=get>
				<input class=outbutton type="submit" value="Go Back">
			</form>
			<%
			
			if (visitor == null)
			{
				int unreadMessages =(int) session.getAttribute("unreadMessageCount");
				
				if (unreadMessages != 0)
				{
					%><form class=out action=MessageServlet  method=get>
						<input type="hidden" name="function" value="Inbox">
						<input class=outbutton type="submit" value="New Messages: <%= unreadMessages  %> ">
						</form>
				<% }
				
			}
			%>

		</div>
	</div>
	
			
		
		
		<%
		if(visitor != null)
		{
			if (visitor.equals("visitor"))
			{
				%>
				
				<div id="main">	
					<div id="mainleft">
					<p> Browse Auctions</p>
				</div>
				</div>
				<% 
			}		  
		} 
		else
		{
			 %> 
			<div id="main">	
			
				<div id="mainleft">
				<p> Browse Auctions</p>
				</div>
				
				<div id="mainright">
				<p> My Auctions</p>
				</div>
				
			</div>  
		<%
		}
		%>
		
		
		
		
	
	<script>
		document.getElementById("mainleft").onclick=function(){	
			document.location.href="/Ted2/AuctionSearch";
		}
		
		
		document.getElementById("mainright").onclick=function(){
			document.location.href="/Ted2/MyAuctionsManagement.jsp";
		}
		
	</script>
</body>
</html>