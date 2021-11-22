<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	// 상품목록 접근
	Product product = dao.getProductById(id);
	
	if(product == null){
		response.sendRedirect("exceptionNoProductId.jsp");
	}

	ArrayList<Product> goodsList = dao.getAllProducts();
	Product goods = new Product();
	
	for(int i =0; i<goodsList.size(); i++){
		goods= goodsList.get(i);
		if(goods.getProductId().equals(id)){
			break;
		}
	}// 상품목록 중에서 사용자가 선택한 상품과 일치하는 id의 상품을 goods로 리턴
	
	ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
	if(list == null){
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list);
	}// 장바구니를 위한 세션 생성
	
	int cnt=0;
	Product goodsQnt = new Product();
	for(int i=0; i<list.size(); i++){
		goodsQnt = list.get(i);	// 리스트 값 가져오기
		if(goodsQnt.getProductId().equals(id)){
			cnt++; 
			int orderQuantity = goodsQnt.getQuantity()+1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}// 상품을 장바구니 리스트에 추가 기존 장바구니가 존재할 경우 거기에 추가
	
	if(cnt == 0){
		goods.setQuantity(1);
		list.add(goods);
	}
	
	response.sendRedirect("product.jsp?id="+id);
%>