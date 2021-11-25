<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>상품 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">상품 수정</h1>
				<!--출력문-->
			</div>
		</div>

		<div class="container">
			<div class="row" align="center">
				<%@include file="dbconn.jsp"%>
				<%
					String productId = request.getParameter("id");
				
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					String sql = "select * from product where p_id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, productId);
					rs = pstmt.executeQuery();
					if(rs.next()){
				%>
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<img alt="" src="c:/upload/<%=rs.getString("p_fileName")%>"
						style="width: 100%" alt="image"/>
					</div>
					<div class="col-md-7">
						<form name="newProduct" action="./processUpdateProduct.jsp"
						class="form-horizontal" method="post" enctype="meltipart/form-data">
							<div class="form-group row">
								<label class="col-sm-2">상품 코드</label>
								<div class="col-sm-3">
									<input type="text" id="proudctId" name="productId" class="form-control" value='<%=rs.getString("p_id")%>'> 
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2">상품명</label>
								<div class="col-sm-3">
									<input type="text" id="name" name="name" class="form-control" value='<%=rs.getString("p_name")%>'> 
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2">가격</label>
								<div class="col-sm-3">
									<input type="text" id="unitPrice" name="unitPrice" class="form-control" value='<%=rs.getInt("p_unitPrice")%>'> 
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2">상세 설명</label>
								<div class="col-sm-5">
									<textarea name="description" class="form-control" cols="50" rows="2" value='<%=rs.getString("p_description")%>'></textarea> 
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2">제조사</label>
								<div class="col-sm-3">
									<input type="text" id="manufacture" name="manufacture" class="form-control" value='<%=rs.getString("p_manufacture")%>'> 
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2">분류</label>
								<div class="col-sm-3">
									<input type="text" id="category" name="category" class="form-control" value='<%=rs.getString("p_category")%>'> 
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2">재고 수</label>
								<div class="col-sm-3">
									<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value='<%=rs.getLong("p_unitsInStock")%>'> 
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-2">상태</label>
								<div class="col-sm-5">
									<!-- radio : 이름(name)이 같은 것중에서 1개만 선택 가능 -->
									<input type="radio" name="condition" value="New"> 신규제품
									<input type="radio" name="condition" value="Old"> 중고제품 
									<input type="radio" name="condition" value="Refurbished"> 재생제품 
								</div>
							</div>
							
							<!-- 이미지 올리는 곳-->
							<div >
								<label class="col-sm-2">이미지</label>
								<div class="col-sm-5">
									<input type="file" name="productImage" class="form-control">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-offset-2 col-sm-10">
									<input type="button" class="btn btn-primary" value="등록" onclick="CheckAddProduct()">
								</div>
							</div>	
						</form>
					</div>
				</div>
			</div>
				
				<% 	} 
					if(rs != null)
						rs.close();
					if(pstmt != null)
						pstmt.close();
					if(conn != null)
						conn.close();
				%>
		<jsp:include page="footer.jsp"/>
</body>
</html>