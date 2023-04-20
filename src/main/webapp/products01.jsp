<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
	
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">

<title>국내 도서</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="assets/css/fontawesome.css">
<link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css">
<link rel="stylesheet" href="assets/css/owl.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<style>
.banner {
	background-image:
		url("https://images.unsplash.com/photo-1516676839530-135a545cce02?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1073&q=80");
	background-position: center center;
	background-size: cover;
	min-height: 200px;
	border-radius: 23px;
	padding: 80px 60px;
}

.banner h6 {
	font-size: 20px;
	color: #111;
	font-weight: 400;
	margin-bottom: 25px;
}

.banner h4 {
	font-size: 45px;
	color: #111;
	text-transform: uppercase;
	margin-bottom: 25px;
}

.banner h4 em {
	font-style: normal;
	color: #ec6090;
}
</style>
</head>

<body>
	<!-- ***** Preloader Start ***** -->
	<div id="js-preloader" class="js-preloader">
		<div class="preloader-inner">
			<span class="dot"></span>
			<div class="dots">
				<span></span> <span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->

	<!-- ***** Header Area Start ***** -->
	<jsp:include page="menu.jsp"></jsp:include>
	<!-- ***** Header Area End ***** -->
	<!-- ***** Content ***** -->
	<div class="container">
		<div class="row">

			<div class="col-lg-12">
				<div class="page-content">
					<!-- Banner -->
					<div class="banner">
						<div class="row">
							<div class="col-lg-7">
								<div class="header-text">
									<h6 style="font-family: 'Sunflower', sans-serif;">다양한 도서들을 알아보세요!</h6>
									<h4 style="font-family: 'Sunflower', sans-serif;">
										<em>Welcome</em> 국내 도서
									</h4>
								</div>
							</div>
						</div>
					</div>
					<br>
					<!-- Banner End -->
					<!-- ***** New Book Start ***** -->
					<div class="row">


						<!-- ***** item_NEW BOOKS ***** -->
						<jsp:include page="products_item01.jsp"></jsp:include>

						<!-- ***** item_NEW BOOKS ***** -->
						<jsp:include page="products_Top01.jsp"></jsp:include>


					</div>

					<!-- ***** Featured Games End ***** -->

					
					
					<!-- ***** Gaming Library Start ***** -->
					<div class="gaming-library">
						<div class="col-lg-12">
							<div class="heading-section">
								<h4>
									<em>도서</em> 전체보기
								</h4>
							</div>
							<br>
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
							<div class="item">
								<ul>
									<li><img src="assets/images/<%=rs.getString("b_filename")%>" alt=""
										class="templatemo-item01"></li>
									<li style="padding-left: 20px;"><h4><%=rs.getString("bookName")%></h4> 
									<span><%=rs.getString("author")%></span></li>
									<li><h4>출판사</h4> <span><%=rs.getString("publisher")%></span></li>
									<li><h4>출판일</h4> <span><%=rs.getString("releaseDate")%></span></li>
									<li><h4><%=rs.getString("unitPrice")%> 원</h4></li>
									<li><div class="main-border-button">
											<a href="./product1.jsp?id=<%=rs.getString("bookID")%>"
													class="btn btn-secondary" role="button" style="font-family: 'Sunflower', sans-serif;">상세정보 &raquo;</a>
										</div></li>
								</ul>
								<br>
								<p><%=rs.getString("description")%></p>
							</div>
							<hr>
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
					<!-- ***** Gaming Library End ***** -->
					
					

				</div>
			</div>
		</div>
	</div>
	<!-- ***** Content End ***** -->

	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>


	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<script src="assets/js/isotope.min.js"></script>
	<script src="assets/js/owl-carousel.js"></script>
	<script src="assets/js/tabs.js"></script>
	<script src="assets/js/popup.js"></script>
	<script src="assets/js/custom.js"></script>


</body>

</html>
