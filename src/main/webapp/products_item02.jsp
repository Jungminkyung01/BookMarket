<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ include file="dbconn.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Item</title>
</head>

<body>
	<div class="col-lg-8">
		<div class="featured-games header-text">
			<div class="heading-section">
				<h4>
					<em>NEW</em> Books
				</h4>
			</div>
			<div class="owl-features owl-carousel">
				<!-- item -->
				<%
				String country = request.getParameter("country");
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from book WHERE country = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, country);
				rs = pstmt.executeQuery();
				while (rs.next()) {
				%>
				<div class="item"
					onclick="location.href='./product1.jsp?id=<%=rs.getString("bookID")%>'">
					<div class="thumb">
						<img alt="" src="assets/images/<%=rs.getString("b_filename")%>"
							style="height: 270px;">
						<div class="hover-effect">
							<h6><%=rs.getString("publisher")%></h6>
						</div>
					</div>
					<h4><%=rs.getString("bookName")%><br> <span><%=rs.getString("author")%></span>
					</h4>
					<ul>
						<li><i class="fa fa-star"></i> 4.8</li>
					</ul>
				</div>
				<%
				}

				if (rs != null)
				rs.close();
				if (pstmt != null)
				pstmt.close();
				if (conn != null)
				conn.close();
				%>
			</div>
		</div>
	</div>
</body>

</html>
