<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >
<title>Login</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	 
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1> <!--출력문-->
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signing-heading">Please sign in</h3>
			<%
				String error = request.getParameter("error");
				//로그인 failed로 갔다왔을 때 1을 가지고온다 그러면 null이 아니므로 비번확인 글이 뜬다
				if(error != null){
					out.println("<div class ='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해보세요");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="j_security_check" method="post">
				<div class="form-goup">
					<label for="inputUserName" class="sr-only">
						User Name
					</label>
					<input type="text" class="form-control" placeholder="ID" name="j_username" required autofocus">
				</div>			
				<div class="form-goup">
					<label for="inputPassword" class="sr-only">
						Password
					</label>
					<input type="password" class="form-control" placeholder="password" name="j_password" required">
				</div>
				<button class="btn- btn btn-lg btn-success btn-block" type="submit">로그인</button>			
			</form>
		</div>
	</div>
	
	<%@include file="footer.jsp" %>
</body>
</html>
