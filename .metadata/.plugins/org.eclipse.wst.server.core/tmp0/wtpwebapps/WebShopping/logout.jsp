<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 로그인 유지 기능 : session - 무효화 시키기 : invalidate()
	session.invalidate();
	response.sendRedirect("addProduct.jsp");
%>