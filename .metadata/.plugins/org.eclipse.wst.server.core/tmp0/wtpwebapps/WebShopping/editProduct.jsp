<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
<jsp:include page="menu.jsp"/>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">상품 편집</h1>
				<!--출력문-->
			</div>
		</div>

		<div class="container">
			<div class="row" align="center">
				<%@include file="dbconn.jsp"%>
				<%
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					String sql = "select * from product";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						
					}
				%>
</body>
</html>