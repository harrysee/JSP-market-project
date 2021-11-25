<%@page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%	
	String productId = request.getParameter("id");

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "insert into product values(?,?,?,?,?,?,?,?,?);";	//밑의 쿼리문 미리 준비
	pstmt = conn.prepareStatement(sql);	// 연결유지한 conn에 인설트문 완성해서 넘길거다 
	rs = pstmt.executeQuery();
	if(rs.next()){
		sql = "delete from product where p_id =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		pstmt.executeUpdate();
	}else{
		out.println("일치하는 상품이 없습니다.");
	}
	
	if(rs != null)
		rs.close();
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	
	response.sendRedirect("editProduct.jsp?edit=delete");
%>
</body>
</html>