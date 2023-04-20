<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="book.Product" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String b_filename="";
	//String directory = application.getRealPath("/upload/");
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
	String condition = multi.getParameter("b_condition");

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
	
	String sql = "insert into book values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,bookID);
	pstmt.setString(2,bookName);
	pstmt.setInt(3,price);
	pstmt.setString(4,author);
	pstmt.setString(5,publisher);
	pstmt.setString(6,description);
	pstmt.setString(7,category);
	pstmt.setLong(8,stock);
	pstmt.setLong(9,pages);
	pstmt.setString(10,releaseDate);
	pstmt.setString(11,country);
	pstmt.setString(12,condition);
	pstmt.setString(13,b_filename);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	//페이지 이동
	response.sendRedirect("index.jsp");
	
%>
	
