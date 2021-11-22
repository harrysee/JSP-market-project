<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
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
	
	
	ProductRepository dao = ProductRepository.getInstance();
	
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacture);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	newProduct.setFilename(fileName);
	
	dao.addProduct(newProduct);
	
	response.sendRedirect("products.jsp");
%>
</body>
</html>