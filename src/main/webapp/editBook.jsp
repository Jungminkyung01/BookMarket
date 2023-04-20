<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<title>도서 편집</title>

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
		url("https://i.pinimg.com/564x/d0/96/2b/d0962be3d8ebfd9153c03b81f59783a9.jpg");
	background-position: center center;
	background-size: cover;
	min-height: 200px;
	border-radius: 23px;
	padding: 80px 60px;
}

.banner h6 {
	font-size: 20px;
	color: #fff;
	font-weight: 400;
	margin-bottom: 25px;
}

.banner h4 {
	font-size: 45px;
	text-transform: uppercase;
	margin-bottom: 25px;
}

.banner h4 em {
	font-style: normal;
	color: #ec6090;
}

label {
	color: white;
}

.border-group {
	padding: 15px;
}

.form-group {
	margin: 10px;
}
</style>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 도서를 삭제합니다!") == true)
			location.href = "./deleteBook.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<%
String edit = request.getParameter("edit");
%>
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
	<%@ include file="dbconn.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">

					<!-- ***** Banner Start ***** -->

					<!-- ***** Banner End ***** -->

					<!-- ***** Add Book Start ***** -->
					<div class="banner">
						<div class="row">
							<div class="col-lg-7">
								<div class="header-text">
									<h6>도서 데이터 편집 페이지 입니다!</h6>
									<h4>
										<em>[Edit]</em> 도서 편집
									</h4>
								</div>
							</div>
						</div>
					</div>
					<div class="gaming-library">
						<div class="col-lg-12">
							<div class="heading-section">
								<h4>
									<em>도서</em> 전체보기
								</h4>
							</div>
							<br>
							<%
						PreparedStatement pstmt = null;
						ResultSet rs = null;

						String sql = "select * from book";
						pstmt = conn.prepareStatement(sql);
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
											<%
								if (edit.equals("update")) {
								%>
								<a href="./updateBook.jsp?id=<%=rs.getString("bookID")%>"
									class="btn btn-secondary" role="button">수정하기 &raquo;</a>
								<%
								} else if (edit.equals("delete")) {
								%>
								<a href="#"
									onclick="deleteConfirm('<%=rs.getString("bookID")%>')"
									class="btn btn-danger" role="button">삭제하기 &raquo;</a>
								<%
								}
								%>
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
					<!-- ***** Add Book End ***** -->
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<script src="assets/js/isotope.min.js"></script>
	<script src="assets/js/owl-carousel.js"></script>
	<script src="assets/js/tabs.js"></script>
	<script src="assets/js/popup.js"></script>
	<script src="assets/js/custom.js"></script>
	<!-- Validation_유효성 체크 -->
	<script src="assets/js/validation.js"></script>
</body>

</html>
