<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">

<%
String cartId = session.getId();
%>
<title>��ٱ���</title>
</head>
<body>
	<jsp:include page="menu.jsp" />

	<div class="jumbotron">
		<div class="container">
			<h1 class="display list-title">��ٱ���</h1>
			<!--��¹�-->
		</div>
	</div>

	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>"
						class="btn btn-danger">�����ϱ�</a></td>

					<td align="right"><a href="./shippingInfo.jsp?cartId=<%=cartId %>" class="btn btn-success ">�ֹ��ϱ�</a></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<!-- ���� ���̺� �ʵ� ���� ���� -->
			<table class="table table-hover">
				<tr>
					<th>��ǰ</th>
					<th>����</th>
					<th>����</th>
					<th>�Ұ�</th>
					<th>���</th>
				</tr>
				<%
				int sum = 0;
				ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
				if (cartList == null)
					cartList = new ArrayList<Product>();
				// ��ٱ��Ͽ� ���� ��� ��������
				for (int i = 0; i < cartList.size(); i++) {
					//��ٱ��Ͽ� ��� ��ǰ ���
					Product product = cartList.get(i);
					int total = product.getUnitPrice() * product.getQuantity();
					sum = sum + total;
				%>
				<tr>
					<td><%=product.getProductId()%>- <%=product.getPname()%></td>
					<td><%=product.getUnitPrice()%></td>
					<td><%=product.getQuantity()%></td>
					<td><%=total%></td>
					<td><a href="./removecart.jsp?id=<%=product.getProductId()%>"
						class="badge badge-danger">����</a></td>
				</tr>
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>�Ѿ�</th>
					<th><%=sum %></th>
					<th></th>
				</tr>
			</table>
			<a href="./products.jsp" class="btn btn-secondary">&laquo;���� ����ϱ�</a>
		</div>
	</div>

	<jsp:include page="footer.jsp" />

</body>
</html>
