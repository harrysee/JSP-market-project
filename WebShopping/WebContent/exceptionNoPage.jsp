<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>������ ����</title>
</head>
<body>
	<jsp:include page="menu.jsp" />

	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">��û�Ͻ� �������� ã�� �� �����ϴ�</h2>
		</div>
	</div>

	<div class="container">
		<p><%= request.getRequestURL() %></p>
		<p><a href="projects.jsp" class="btn btn-secuondary">��ǰ ��� &raquo;</a></p>
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>
