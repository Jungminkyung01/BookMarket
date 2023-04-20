<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="book.Product"%>
<%@ page import="book.ProductDAO"%>

<%
	String id = request.getParameter("cartId");
	if (id == null || id.trim().equals("")){
		response.sendRedirect("cart.jsp");
		return;
	}
	//장바구니에 등록된 모든 상품을 삭제하도록
	session.invalidate();
	
	response.sendRedirect("cart.jsp");
%>