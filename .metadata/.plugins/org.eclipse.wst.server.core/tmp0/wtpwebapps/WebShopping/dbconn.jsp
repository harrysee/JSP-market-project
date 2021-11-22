<%@ page import="java.sql.*"%>
<%
	Connection conn = null;

// DB 연결 구문
	try{	// 다른 디비도 동일한 형태로 저장해야됨
		String url = "jdbc:mysql://localhost:3306/WebDB?serverTimezone=Asia/Seoul&useSSL=false";
		String user = "root";
		String password = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
	}catch(SQLException ex){
		out.println("데이터베이스 연결이 실패했습니다.");
		out.println("SQLException: "+ex.getMessage());
		
	}
	
%>