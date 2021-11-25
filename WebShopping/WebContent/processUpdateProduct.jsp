<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String filename="";
	String realFolder ="c:\\upload"; // 웹 애플리케이션상의 절대 경로
	int maxSize = 5 *1024*1024;
	String encType ="utf-8"; // 인코딩 유형
	
	//여러개 받기,요청 - 각각 설정해놓은 변수 넣기
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize,encType, new DefaultFileRenamePolicy());

	//request가 어차피 multi에 있기때문에 multi.을 써도 괜찮다.
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice= multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacture = multi.getParameter("menufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Integer price;
	
	if(unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);
	
	long stock;
	
	if(unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	
	//배열과 같은 컬렉션 - 바구니에 담는것
	Enumeration files = multi.getFileNames();
	String fname =(String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from product where p_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(fileName != null){
			sql = "update product set p_name = ?, p_unitsPrice=?,p_description=?,p_manufacture=?,p_category=?,p_condition=?, p_fileName=? where p_id=?";	//밑의 쿼리문 미리 준비
			pstmt = conn.prepareStatement(sql);	// 연결유지한 conn에 인설트문 완성해서 넘길거다 
			pstmt.setString(1, name);	
			pstmt.setInt(2, price);	
			pstmt.setString(3, description);	
			pstmt.setString(4, manufacture);	
			pstmt.setString(5, category);	
			pstmt.setLong(6, stock);	
			pstmt.setString(7, condition);	
			pstmt.setString(8, fileName);	
			pstmt.setString(9, productId);	// 물음표의 위치에 productId 넣기
			pstmt.executeUpdate();
		}else{ 	// file name이 null일 경우
			sql = "update product set p_name = ?, p_unitsPrice=?,p_description=?,p_manufacture=?,p_category=?,p_condition=? where p_id=?";	//밑의 쿼리문 미리 준비
			pstmt = conn.prepareStatement(sql);	// 연결유지한 conn에 인설트문 완성해서 넘길거다 
			pstmt.setString(1, name);	
			pstmt.setInt(2, price);	
			pstmt.setString(3, description);	
			pstmt.setString(4, manufacture);	
			pstmt.setString(5, category);	
			pstmt.setLong(6, stock);	
			pstmt.setString(7, condition);	
			pstmt.setString(8, productId);	// 물음표의 위치에 productId 넣기
			pstmt.executeUpdate();
		}
	}
	
	if(rs != null)
		rs.close();
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	
	response.sendRedirect("editProduct.jsp?edit=update");
	
%>
</body>
</html>