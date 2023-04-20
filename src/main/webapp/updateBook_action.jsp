<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%
String b_filename="";
String realFolder="C:\\upload";	//웹애플리케이션상의 절대 경로
int maxSize = 5* 1024* 1024;	//최대 업로드 파일의 크기 5MG
String encType = "UTF-8";	//인코딩 유형

MultipartRequest multi = new MultipartRequest(request, realFolder,
		maxSize, encType, new DefaultFileRenamePolicy());

String bookID = multi.getParameter("bookID");
String bookName = multi.getParameter("bookName");
String unitPrice = multi.getParameter("unitPrice");
String author = multi.getParameter("author");
String publisher = multi.getParameter("publisher");
String description = multi.getParameter("description");
String category = multi.getParameter("category");
String unitsInStock = multi.getParameter("unitsInStock");
String totalpages = multi.getParameter("totalpages");
String releaseDate = multi.getParameter("releaseDate");
String country = multi.getParameter("country");
String b_condition = multi.getParameter("b_condition");

Integer price;

if (unitPrice.isEmpty())
	price = 0;
else
	//문자로 들어오는 것을 숫자로 바꾸어라.
	price = Integer.valueOf(unitPrice);

//unitsInStock
long stock;

if (unitsInStock.isEmpty())
	stock = 0;
else
	stock = Long.valueOf(unitsInStock);

//totalpages
long pages;

if (totalpages.isEmpty())
	pages = 0;
else
	pages = Long.valueOf(totalpages);

Enumeration files = multi.getFileNames();
String fname = (String) files.nextElement();
String fileName = multi.getFilesystemName(fname);

PreparedStatement pstmt = null;
ResultSet rs = null;

	
		String sql = "select * from book where bookID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookID);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			if (fileName != null) {
				sql = "UPDATE book SET bookName=?, unitPrice=?, author=?, description=?, publisher=?, category=?, unitsInStock=?, totalpages=?, releaseDate=?, country=?, b_condition=?, b_filename=? WHERE bookID=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,bookName);
				pstmt.setInt(2,price); //
				pstmt.setString(3,author);
				pstmt.setString(4,description);
				pstmt.setString(5,publisher);
				pstmt.setString(6,category);
				pstmt.setLong(7,stock); //
				pstmt.setLong(8,pages); //
				pstmt.setString(9,releaseDate);
				pstmt.setString(10,country);
				pstmt.setString(11,b_condition);
				pstmt.setString(12,b_filename);
				pstmt.setString(13,bookID);
				pstmt.executeUpdate();
			} else {
				sql = "UPDATE book SET bookName=?, unitPrice=?, author=?, description=?, publisher=?, category=?, unitsInStock=?, totalpages=?, releaseDate=?, country=?, b_condition=? WHERE bookID=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,bookName);
				pstmt.setInt(2,price); //
				pstmt.setString(3,author);
				pstmt.setString(4,description);
				pstmt.setString(5,publisher);
				pstmt.setString(6,category);
				pstmt.setLong(7,stock); //
				pstmt.setLong(8,pages); //
				pstmt.setString(9,releaseDate);
				pstmt.setString(10,country);
				pstmt.setString(11,b_condition);
				pstmt.setString(12,bookID);
				pstmt.executeUpdate();
			}
		}
	if (rs != null)
		rs.close();
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();

	response.sendRedirect("editBook.jsp?edit=update");
%>
