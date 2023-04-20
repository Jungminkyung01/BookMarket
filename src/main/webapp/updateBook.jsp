<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>도서 등록페이지</title>

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

					<!-- ***** Banner Start ***** -->

					<!-- ***** Banner End ***** -->

					<!-- ***** Add Book Start ***** -->
					<div class="banner">
						<div class="row">
							<div class="col-lg-7">
								<div class="header-text">
									<h6>도서를 수정해 보세요!</h6>
									<h4>
										<em>[Update]</em> 도서 수정
									</h4>
								</div>
							</div>
						</div>
					</div>
					<%@ include file="dbconn.jsp"%>
					<%
					String bookID = request.getParameter("id");

					PreparedStatement pstmt = null;
					ResultSet rs = null;

					String sql = "select * from book where bookID = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, bookID);
					rs = pstmt.executeQuery();
					if (rs.next()) {
					%>
					<div class="gaming-library">
					<div class="row">
						<div class="col-md-5">
							<!-- 이미지 업로드: width:100%으로 설정했지만 사이즈를 확인하면서 적당하게 변경 -->
							<img src="assets/images/<%=rs.getString("b_filename")%>"
								style="width: 100%">
						</div>
						<!-- form -->
						<div class="col">
						<form name="newProduct" action="./updateBook_action.jsp"
							class="form-horizontal" method="post"
							enctype="multipart/form-data">
							<div class="border-group">
								<div class="form-group row">
									<label class="col-sm-3">도서 코드</label>
									<div class="col-sm-5">
										<input type="text" id="bookID" name="bookID"
											class="form-control">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3">도서명</label>
									<div class="col-sm-5">
										<input type="text" id="bookName" name="bookName"
											class="form-control">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3">가격</label>
									<div class="col-sm-5">
										<input type="text" id="unitPrice" name="unitPrice"
											class="form-control">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3">저자</label>
									<div class="col-sm-5">
										<input type="text" name="author" class="form-control">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3">설명</label>
									<div class="col-sm-7">
										<textarea name="description" cols="60" rows="2"
											class="form-control"></textarea>
									</div>
								</div>

								<div class="form-group row">
									<label class="col-sm-3">출판사</label>
									<div class="col-sm-5">
										<input type="text" name="publisher" class="form-control">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3">카테고리</label>
									<div class="col-sm-7" style="color: white;">
										<input type="radio" name="category" value="초등 "> 초등 <input
											type="radio" name="category" value="중등"> 중등 <input
											type="radio" name="category" value="고등"> 고등
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3">가격</label>
									<div class="col-sm-5">
										<input type="text" id="unitsInStock" name="unitsInStock"
											class="form-control">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3">총 페이지</label>
									<div class="col-sm-5">
										<input type="text" id="totalpages" name="totalpages"
											class="form-control">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3">출판일</label>
									<div class="col-sm-5">
										<input type="text" id="releaseDate" name="releaseDate"
											class="form-control">
									</div>
								</div>
								<!-- 국내 / 해외 -->
								<div class="form-group row">
									<label class="col-sm-3">국내 도서 | 해외 도서</label>
									<div class="col-sm-7" style="color: white;">
										<input type="radio" name="country" value="국내 "> 국내 <input
											type="radio" name="country" value="해외"> 해외

									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3">도서 상태</label>
									<div class="col-sm-7" style="color: white;">
										<input type="radio" name="b_condition" value="New ">
										신규 <input type="radio" name="b_condition" value="Old">
										중고 <input type="radio" name="b_condition" value="E-Book">
										E-Book
									</div>
								</div>
								<!-- 이미지 등록 -->
								<div class="form-group row">
									<label class="col-sm-3">이미지</label>
									<div class="col-sm-7">
										<input type="file" name="b_filename" class="form-control">
									</div>
								</div>
							</div>
							<!-- 등록하기 -->
							<div class="col-lg-12">
								<div class="main-button">
									<input type="button" class="btn btn-danger"
										style="background-color: #ec6090" value="등록하기"
										onclick="CheckAddProduct()">
								</div>
							</div>
						</form>
						</div>
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
					<!-- ***** Add Book End ***** -->
					</div>
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