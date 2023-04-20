<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="book.Product"%>
<%@ page import="book.ProductDAO"%>

<%
String bookID = request.getParameter("id");
if (bookID == null || bookID.trim().equals("")) {
	response.sendRedirect("index.jsp");
	return;
}

ProductDAO dao = ProductDAO.getInstance();

Product book = dao.getProductById(bookID);
if (book == null) {
	response.sendRedirect("exceptionNoBookID.jsp");
}

ArrayList<Product> goodsList = dao.getAllProducts();
Product goods = new Product();
for (int i = 0; i < goodsList.size(); i++) {
	goods = goodsList.get(i);
	if (goods.getBookID().equals(bookID)) {
		break;
	}
}

ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
if (list == null) {
	list = new ArrayList<Product>();
	session.setAttribute("cartlist", list);
}

int cnt = 0;
Product goodsQnt = new Product();
for (int i = 0; i < list.size(); i++) {
	goodsQnt = list.get(i);
	if (goodsQnt.getBookID().equals(bookID)) {
		cnt++;
		int orderQuantity = goodsQnt.getQuantity() + 1;
		goodsQnt.setQuantity(orderQuantity);
	}
}

if (cnt == 0) {
	goods.setQuantity(1);
	list.add(goods);
}

response.sendRedirect("product1.jsp?id=" + bookID);
%>