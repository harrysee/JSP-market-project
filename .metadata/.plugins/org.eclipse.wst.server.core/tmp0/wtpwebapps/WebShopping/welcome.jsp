<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >
<title>Welcome</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	
	<%!	String greeting = "Welcome to Web Shopping Mall"; 
		String tagline ="Welcome to Web Market!"; %>
		
	<div class="jumbotron">
		<div class="container">
			<h1><%=greeting %></h1> <!--출력문-->
		</div>
	</div>
	
	<main>
		<div class="container">
			<div class="text-center">
				<h3><%=tagline %></h3>	<%--출력문 --%>
			</div>
			<hr>
		</div>
	</main>
	
	<%@include file="footer.jsp" %>
</body>
</html>
