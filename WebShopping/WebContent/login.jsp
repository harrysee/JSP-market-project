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
			<h1 class="display-3">�α���</h1> <!--��¹�-->
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signing-heading">Please sign in</h3>
			<%
				String error = request.getParameter("error");
				//�α��� failed�� ���ٿ��� �� 1�� ������´� �׷��� null�� �ƴϹǷ� ���Ȯ�� ���� ���
				if(error != null){
					out.println("<div class ='alert alert-danger'>");
					out.println("���̵�� ��й�ȣ�� Ȯ���غ�����");
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
				<button class="btn- btn btn-lg btn-success btn-block" type="submit">�α���</button>			
			</form>
		</div>
	</div>
	
	<%@include file="footer.jsp" %>
</body>
</html>
