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
				<!-- TOP -->
				<div class="col-lg-4">
					<div class="top-downloaded">
						<div class="heading-section">
							<h4>
								<em>주간</em><br> 베스트셀러
							</h4>
						</div>

						<%
						PreparedStatement pstmt = null;
						ResultSet rs = null;
						String sql = "select * from book where bookID LIKE 'P1%2'";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						while (rs.next()) {
						%>
						<ul onclick="location.href='./product1.jsp?id=<%=rs.getString("bookID")%>'">
							<li>
							<img alt="" src="assets/images/<%=rs.getString("b_filename")%>"
							class="templatemo-item">
							
							<h4><%=rs.getString("bookName")%></h4>
							<h6><%=rs.getString("author")%></h6> <span><i class="fa fa-star"
									style="color: yellow;"></i> 4.9</span> <span><i
									class="fa fa-download" style="color: #ec6090;"></i> 2.2M</span>
								<div class="download">
									<a href="#"><i class="fa fa-download"></i></a>
								</div></li>
						</ul>
						<%
						}

						if (rs != null)
						rs.close();
						if (pstmt != null)
						pstmt.close();
						if (conn != null)
						conn.close();
						%>
						<div class="text-button">
							<a href="#">View All Books</a>
						</div>
					</div>
				</div>
</body>

</html>
