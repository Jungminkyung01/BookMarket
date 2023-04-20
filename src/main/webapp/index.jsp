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
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap"
	rel="stylesheet">

<title>Book Market</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="assets/css/fontawesome.css">
<link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css">
<link rel="stylesheet" href="assets/css/owl.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

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
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">
					<%
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					%>
					<!-- ***** Banner Start ***** -->
					<div class="main-banner">
						<div class="row">
							<div class="col-lg-7">
								<div class="header-text">
									<h6>Welcome BookMarket!</h6>
									<h4 style="font-family: 'Sunflower', sans-serif;">
										<em>국내/해외 </em><br> 도서를 한눈에
									</h4>
									<br>
									<div class="main-button">
										<a href="products01.jsp?country=국내">Browse Now</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ***** Banner End ***** -->

					<!-- ***** Most Popular Start ***** -->
					<div class="most-popular">
						<div class="row">
							<div class="col-lg-12">
								<div class="heading-section">
									<h4 style="font-family: 'Sunflower', sans-serif;">
										<em>Popular</em> 인기도서
									</h4>
								</div>
								<div class="row">

									<%
									String sql = "select * from book ORDER BY bookID ASC LIMIT 8";
									pstmt = conn.prepareStatement(sql);
									rs = pstmt.executeQuery();

									while (rs.next()) {
									%>
									<div class="col-lg-3 col-sm-6">
										<div class="item"
											onclick="location.href='./product1.jsp?id=<%=rs.getString("bookID")%>'">
											<img src="assets/images/<%=rs.getString("b_filename")%>"
												alt="">
											<h4>
												<%=rs.getString("bookName")%><br> <span><%=rs.getString("author")%></span>

											</h4>
											<ul>
												<li><i class="fa fa-star"></i> 4.8</li>
												<li><i class="fa fa-download"></i> 2.3M</li>
											</ul>
										</div>
									</div>
									<%
									}
									%>

									<div class="col-lg-12">
										<div class="main-button">
											<a href="products01.jsp?country=국내">더 보러가기</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ***** Most Popular End ***** -->
					<!-- ***** 이미지 효과 Start***** -->


					<!-- ***** 이미지 효과 End***** -->
					<!-- ***** Live Stream Start ***** -->
					<div class="live-stream">
						<div class="col-lg-12">
							<div class="heading-section">
								<h4 style="font-family: 'Sunflower', sans-serif;">
									<em>오늘의</em> 중학교 추천도서
								</h4>
							</div>
						</div>
						<div class="row">
							<%
							String sql2 = "select * from book where category = '중등' ORDER BY bookID DESC LIMIT 4";
							pstmt = conn.prepareStatement(sql2);
							rs = pstmt.executeQuery();

							while (rs.next()) {
							%>
							<div class="col-lg-3 col-sm-6">
								<div class="item"
									onclick="location.href='./product1.jsp?id=<%=rs.getString("bookID")%>'">
									<div class="thumb">
										<img src="assets/images/<%=rs.getString("b_filename")%>"
											alt="">
										<div class="hover-effect">
											<div class="content">
												<div class="live">
													<a href="#">HOT</a>
												</div>
												<ul>
													<li><a href="#"><i class="fa fa-eye"></i> 1.2K</a></li>
													<li><a href="#"><i class="fa fa-gamepad"></i> 중등
															도서</a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="down-content">
										<span><i class="fa fa-check"></i><%=rs.getString("author")%></span>
										<h4><%=rs.getString("bookName")%></h4>

									</div>
								</div>
							</div>
							<%
							}
							%>
							<div class="col-lg-12">
								<div class="main-button">
									<a href="products01.jsp?country=국내">더보러 가기</a>
								</div>
							</div>
						</div>
					</div>
					<!-- ***** Live Stream End ***** -->

				</div>
				<%
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
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<p>&copy; BookMarket</p>

				</div>
			</div>
		</div>
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