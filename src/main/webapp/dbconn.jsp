<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;

	try {
		String dbURL = "jdbc:mysql://localhost:3306/bookdb";
		String dbID = "root";
		String dbPassword = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	} catch (Exception e) {
		e.printStackTrace();
	}
%>